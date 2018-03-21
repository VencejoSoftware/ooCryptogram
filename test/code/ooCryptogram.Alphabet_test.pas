{
  Copyright (c) 2018, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit ooCryptogram.Alphabet_test;

interface

uses
  SysUtils,
  ooCryptogram.Symbol,
  ooCryptogram.Alphabet,
{$IFDEF FPC}
  fpcunit, testregistry
{$ELSE}
  TestFramework
{$ENDIF};

type
  TCryptogramAlphabetTest = class sealed(TTestCase)
  strict private
    _CryptogramAlphabet: ICryptogramAlphabet;
  public
    procedure SetUp; override;
  published
    procedure AddItemReturnIndex8;
    procedure SymbolByIndexOf2IsT;
    procedure CountIs8;
    procedure DecodeWithOutKeyReturnSXTJLNPPNLJTXS;
    procedure DecodeWithKeyReturn1234567887654321;
    procedure KeyInitialIsSame;
    procedure LoadStringIgnoringSpaces;
    procedure ChangeKeySetNewKey;
  end;

implementation

procedure TCryptogramAlphabetTest.AddItemReturnIndex8;
begin
  CheckEquals(8, _CryptogramAlphabet.Add(TCryptogramSymbol.New('E')));
end;

procedure TCryptogramAlphabetTest.ChangeKeySetNewKey;
begin
  _CryptogramAlphabet.ChangeKey('12345678');
  CheckEquals('12345678', _CryptogramAlphabet.Key);
end;

procedure TCryptogramAlphabetTest.CountIs8;
begin
  CheckEquals(8, _CryptogramAlphabet.Count);
end;

procedure TCryptogramAlphabetTest.DecodeWithKeyReturn1234567887654321;
begin
  _CryptogramAlphabet.Load('SXTJLÑ PP ÑLJTXS', []);
  _CryptogramAlphabet.ChangeKey('12345678');
  CheckEquals('1234567887654321', _CryptogramAlphabet.Decode);
end;

procedure TCryptogramAlphabetTest.DecodeWithOutKeyReturnSXTJLNPPNLJTXS;
begin
  _CryptogramAlphabet.Load('SXTJLÑ PP ÑLJTXS', []);
  CheckEquals('SXTJLÑ PP ÑLJTXS', _CryptogramAlphabet.Decode);
end;

procedure TCryptogramAlphabetTest.KeyInitialIsSame;
begin
  CheckEquals('SXTJLÑ P', _CryptogramAlphabet.Key);
end;

procedure TCryptogramAlphabetTest.LoadStringIgnoringSpaces;
begin
  _CryptogramAlphabet.Load('SXTJLÑ PP ÑLJTXS', [' ']);
  _CryptogramAlphabet.ChangeKey('12345678');
  CheckEquals('12345677654321', _CryptogramAlphabet.Decode);
end;

procedure TCryptogramAlphabetTest.SymbolByIndexOf2IsT;
begin
  CheckEquals('T', _CryptogramAlphabet.SymbolByIndex(2).Letter);
end;

procedure TCryptogramAlphabetTest.SetUp;
begin
  inherited;
  _CryptogramAlphabet := TCryptogramAlphabet.New;
  _CryptogramAlphabet.Add(TCryptogramSymbol.New('S'));
  _CryptogramAlphabet.Add(TCryptogramSymbol.New('X'));
  _CryptogramAlphabet.Add(TCryptogramSymbol.New('T'));
  _CryptogramAlphabet.Add(TCryptogramSymbol.New('J'));
  _CryptogramAlphabet.Add(TCryptogramSymbol.New('L'));
  _CryptogramAlphabet.Add(TCryptogramSymbol.New('Ñ'));
  _CryptogramAlphabet.Add(TCryptogramSymbol.New(' '));
  _CryptogramAlphabet.Add(TCryptogramSymbol.New('P'));
end;

initialization

RegisterTest(TCryptogramAlphabetTest {$IFNDEF FPC}.Suite {$ENDIF});

end.
