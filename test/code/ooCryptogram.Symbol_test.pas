{
  Copyright (c) 2018, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit ooCryptogram.Symbol_test;

interface

uses
  SysUtils,
  ooCryptogram.Symbol,
{$IFDEF FPC}
  fpcunit, testregistry
{$ELSE}
  TestFramework
{$ENDIF};

type
  TCryptogramSymbolTest = class sealed(TTestCase)
  strict private
    _CryptogramSymbol: ICryptogramSymbol;
  public
    procedure SetUp; override;
  published
    procedure LetterIsA;
    procedure TranslateIsSame;
    procedure CountInitialIsZero;
    procedure ChangeTranslateIs2;
    procedure IncreaseUseChangeCount;
  end;

implementation

procedure TCryptogramSymbolTest.ChangeTranslateIs2;
begin
  _CryptogramSymbol.ChangeTranslate('2');
  CheckEquals('2', _CryptogramSymbol.Translate);
end;

procedure TCryptogramSymbolTest.CountInitialIsZero;
begin
  CheckEquals(0, _CryptogramSymbol.Count);
end;

procedure TCryptogramSymbolTest.IncreaseUseChangeCount;
begin
  _CryptogramSymbol.IncreaseUse;
  CheckEquals(1, _CryptogramSymbol.Count);
  _CryptogramSymbol.IncreaseUse;
  CheckEquals(2, _CryptogramSymbol.Count);
end;

procedure TCryptogramSymbolTest.LetterIsA;
begin
  CheckEquals('A', _CryptogramSymbol.Letter);
end;

procedure TCryptogramSymbolTest.TranslateIsSame;
begin
  CheckEquals('A', _CryptogramSymbol.Translate);
end;

procedure TCryptogramSymbolTest.SetUp;
begin
  inherited;
  _CryptogramSymbol := TCryptogramSymbol.New('A');
end;

initialization

RegisterTest(TCryptogramSymbolTest {$IFNDEF FPC}.Suite {$ENDIF});

end.
