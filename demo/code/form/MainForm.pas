﻿unit MainForm;

interface

uses
  SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Math,
  ooCryptogram.Symbol, ooCryptogram.Alphabet;

type
  TMainForm = class(TForm)
    edSource: TMemo;
    btnResolve: TButton;
    edResult: TMemo;
    lbAlphabet: TListBox;
    edKey: TEdit;
    procedure btnResolveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lbAlphabetDblClick(Sender: TObject);
  private
    _CryptogramAlphabet: ICryptogramAlphabet;
    procedure ResolveCryptogram;
    procedure UpdateAlphabetList(const CryptogramAlphabet: ICryptogramAlphabet; const Control: TListBox);
  end;

var
  NewMainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.UpdateAlphabetList(const CryptogramAlphabet: ICryptogramAlphabet; const Control: TListBox);
var
  i: Integer;
  Symbol: ICryptogramSymbol;
  CountChars: cardinal;
begin
  Control.Clear;
  CountChars := Length(edResult.Text);
  for i := 0 to Pred(CryptogramAlphabet.Count) do
  begin
    Symbol := CryptogramAlphabet.SymbolByIndex(i);
    Control.Items.Add(Format('%s|%s|%0.2d|%f', [Symbol.Letter, Symbol.Translate, Symbol.Count,
      Symbol.Count * 100 / CountChars]));
  end;
end;

procedure TMainForm.ResolveCryptogram;
begin
  edKey.Text := _CryptogramAlphabet.Key;
  edResult.Text := _CryptogramAlphabet.Decode;
  UpdateAlphabetList(_CryptogramAlphabet, lbAlphabet);
end;

procedure TMainForm.lbAlphabetDblClick(Sender: TObject);
var
  CryptogramSymbol: ICryptogramSymbol;
  NewTranslate: WideChar;
begin
  CryptogramSymbol := _CryptogramAlphabet.SymbolByIndex(lbAlphabet.ItemIndex);
  NewTranslate := WideChar(InputBox('Map alphabet', 'New character for "' + CryptogramSymbol.Letter + '"',
    CryptogramSymbol.Translate)[1]);
  CryptogramSymbol.ChangeTranslate(NewTranslate);
  ResolveCryptogram;
end;

procedure TMainForm.btnResolveClick(Sender: TObject);
begin
  _CryptogramAlphabet.Load(edSource.Text, []);
  _CryptogramAlphabet.ChangeKey(edKey.Text);
  ResolveCryptogram;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  edSource.Text := 'A2RVJ L2I WI8ÑR2TI9_ VY9_ÑZV QA +VZÑBQ';
  edKey.Text := 'notes frcypgamxlidh';
  _CryptogramAlphabet := TCryptogramAlphabet.New;
end;

end.
