{$REGION 'documentation'}
{
  Copyright (c) 2018, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
{
  Cryptogram symbol
  @created(21/03/2018)
  @author Vencejo Software <www.vencejosoft.com>
}
{$ENDREGION}
unit CryptogramSymbol;

interface

type
{$REGION 'documentation'}
{
  @abstract(Cryptogram symbol interface)
  @member(Letter Character symbol)
  @member(Translate Character traduction)
  @member(Count Return the amount of use)
  @member(
    ChangeTranslate Change the traduction character
    @param(Value New character value)
  )
  @member(IncreaseUse Increse the amount of use)
}
{$ENDREGION}
  ICryptogramSymbol = interface
    ['{ABC1E244-1539-4955-8FA2-413BD8ED120E}']
    function Letter: WideChar;
    function Translate: WideChar;
    function Count: Cardinal;
    procedure ChangeTranslate(const Value: WideChar);
    procedure IncreaseUse;
  end;

{$REGION 'documentation'}
{
  @abstract(Implementation of @link(ICryptogramSymbol))
  @member(Letter @seealso(ICryptogramSymbol.Letter))
  @member(Translate @seealso(ICryptogramSymbol.Translate))
  @member(Count @seealso(ICryptogramSymbol.Count))
  @member(ChangeTranslate @seealso(ICryptogramSymbol.ChangeTranslate))
  @member(IncreaseUse @seealso(ICryptogramSymbol.IncreaseUse))
  @member(
    Create Object constructor
    @param(Letter Character symbol)
  )
  @member(
    New Create a new @classname as interface
    @param(Letter Character symbol)
  )
}
{$ENDREGION}

  TCryptogramSymbol = class sealed(TInterfacedObject, ICryptogramSymbol)
  strict private
    _Symbol, _Translate: WideChar;
    _Count: Cardinal;
  public
    function Letter: WideChar;
    function Translate: WideChar;
    function Count: Cardinal;
    procedure ChangeTranslate(const Value: WideChar);
    procedure IncreaseUse;
    constructor Create(const Letter: WideChar);
    class function New(const Letter: WideChar): ICryptogramSymbol;
  end;

implementation

function TCryptogramSymbol.Letter: WideChar;
begin
  Result := _Symbol;
end;

function TCryptogramSymbol.Translate: WideChar;
begin
  Result := _Translate;
end;

procedure TCryptogramSymbol.ChangeTranslate(const Value: WideChar);
begin
  _Translate := Value;
end;

function TCryptogramSymbol.Count: Cardinal;
begin
  Result := _Count;
end;

procedure TCryptogramSymbol.IncreaseUse;
begin
  Inc(_Count);
end;

constructor TCryptogramSymbol.Create(const Letter: WideChar);
begin
  _Symbol := Letter;
  _Translate := Letter;
  _Count := 0;
end;

class function TCryptogramSymbol.New(const Letter: WideChar): ICryptogramSymbol;
begin
  Result := TCryptogramSymbol.Create(Letter);
end;

end.
