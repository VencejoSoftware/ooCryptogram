{$REGION 'documentation'}
{
  Copyright (c) 2018, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
{
  Cryptogram alphabet
  @created(21/03/2018)
  @author Vencejo Software <www.vencejosoft.com>
}
{$ENDREGION}
unit ooCryptogram.Alphabet;

interface

uses
  SysUtils,
  Generics.Collections,
  ooCryptogram.Symbol;

type
{$REGION 'documentation'}
{
  @abstract(Cryptogram alphabet interface)
  @member(
    Add Add a symbol object to the alphabet
    @param(Symbol Symbol object to add)
    @return(The index of element added)
  )
  @member(
    SymbolByIndex Get symbol from list index
    @param(Index List index)
    @return(@link(ICryptogramSymbol Symbol object))
  )
  @member(Count Amount of alphabet symbols)
  @member(Decode Replace symbol with their translations)
  @member(Key Key to use in decode)
  @member(
    Load Text to decode
    @param(Text Raw string encoded)
    @param(IgnoreLetters Array with letters to ignore)
  )
  @member(
    ChangeKey Change alphabet key
    @param(Key New text key)
  )
}
{$ENDREGION}
  ICryptogramAlphabet = interface
    ['{BCCF1FE0-A82C-4B7C-A537-74BC00326F39}']
    function Add(const Symbol: ICryptogramSymbol): Integer;
    function SymbolByIndex(const Index: Cardinal): ICryptogramSymbol;
    function Count: Integer;
    function Decode: WideString;
    function Key: WideString;
    procedure Load(const Text: WideString; const IgnoreLetters: array of WideChar);
    procedure ChangeKey(const Key: WideString);
  end;

{$REGION 'documentation'}
{
  @abstract(Implementation of @link(ICryptogramAlphabet))
  @member(Add @seealso(ICryptogramAlphabet.Add))
  @member(SymbolByIndex @seealso(ICryptogramAlphabet.SymbolByIndex))
  @member(Count @seealso(ICryptogramAlphabet.Count))
  @member(Decode @seealso(ICryptogramAlphabet.Decode))
  @member(Key @seealso(ICryptogramAlphabet.Key))
  @member(Load @seealso(ICryptogramAlphabet.Load))
  @member(ChangeKey @seealso(ICryptogramAlphabet.ChangeKey))
  @member(
    SymbolByLetter Find symbol by character
    @param(Letter Character to find)
    @return(@link(ICryptogramSymbol Symbol object))
  )
  @member(
    NeedIgnore Checks if the letter must be ignored when load
    @param(Letter Character value to check)
    @param(IgnoreLetters Array with letters to ignore)
    @return(@true if the letter must be ignore, @false if can use when load))
  )
  @member(Create Object constructor)
  @member(Destroy Object destructor)
  @member(New Create a new @classname as interface)
}
{$ENDREGION}

  TCryptogramAlphabet = class sealed(TInterfacedObject, ICryptogramAlphabet)
  strict private
    _Text: WideString;
    _List: TList<ICryptogramSymbol>;
  private
    function SymbolByLetter(const Letter: WideChar): ICryptogramSymbol;
    function NeedIgnore(const Letter: WideChar; const IgnoreLetters: array of WideChar): Boolean;
  public
    function Add(const Symbol: ICryptogramSymbol): Integer;
    function Count: Integer;
    function Decode: WideString;
    function SymbolByIndex(const Index: Cardinal): ICryptogramSymbol;
    function Key: WideString;
    procedure Load(const Text: WideString; const IgnoreLetters: array of WideChar);
    procedure ChangeKey(const Key: WideString);
    constructor Create;
    destructor Destroy; override;
    class function New: ICryptogramAlphabet;
  end;

implementation

function TCryptogramAlphabet.Add(const Symbol: ICryptogramSymbol): Integer;
begin
  Result := _List.Add(Symbol);
end;

function TCryptogramAlphabet.Count: Integer;
begin
  Result := _List.Count;
end;

function TCryptogramAlphabet.Decode: WideString;
var
  Symbol: ICryptogramSymbol;
begin
  Result := _Text;
  for Symbol in _List do
    Result := StringReplace(Result, Symbol.Letter, Symbol.Translate, [rfReplaceAll]);
end;

function TCryptogramAlphabet.SymbolByIndex(const Index: Cardinal): ICryptogramSymbol;
begin
  Result := _List.Items[Index];
end;

function TCryptogramAlphabet.SymbolByLetter(const Letter: WideChar): ICryptogramSymbol;
var
  Symbol: ICryptogramSymbol;
begin
  Result := nil;
  for Symbol in _List do
    if Letter = Symbol.Letter then
      Exit(Symbol);
end;

function TCryptogramAlphabet.NeedIgnore(const Letter: WideChar; const IgnoreLetters: array of WideChar): Boolean;
var
  IgnoreLetter: WideChar;
begin
  Result := False;
  for IgnoreLetter in IgnoreLetters do
    if Letter = IgnoreLetter then
      Exit(True);
end;

procedure TCryptogramAlphabet.Load(const Text: WideString; const IgnoreLetters: array of WideChar);
var
  Letter: WideChar;
  Symbol: ICryptogramSymbol;
begin
  _List.Clear;
  _Text := EmptyStr;
  for Letter in Text do
    if not NeedIgnore(Letter, IgnoreLetters) then
    begin
      Symbol := SymbolByLetter(Letter);
      if Assigned(Symbol) then
        Symbol.IncreaseUse
      else
        _List.Add(TCryptogramSymbol.New(Letter));
      _Text := _Text + Letter;
    end;
end;

function TCryptogramAlphabet.Key: WideString;
var
  Symbol: ICryptogramSymbol;
begin
  Result := EmptyStr;
  for Symbol in _List do
    Result := Result + Symbol.Translate;
end;

procedure TCryptogramAlphabet.ChangeKey(const Key: WideString);
var
  Symbol: ICryptogramSymbol;
  Index: Integer;
begin
  for Index := 1 to Length(Key) do
    if Index <= Count then
    begin
      Symbol := _List.Items[Pred(Index)];
      Symbol.ChangeTranslate(Key[Index]);
    end;
end;

constructor TCryptogramAlphabet.Create;
begin
  _List := TList<ICryptogramSymbol>.Create;
end;

destructor TCryptogramAlphabet.Destroy;
begin
  _List.Free;
  inherited;
end;

class function TCryptogramAlphabet.New: ICryptogramAlphabet;
begin
  Result := TCryptogramAlphabet.Create;
end;

end.
