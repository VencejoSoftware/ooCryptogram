{
  Copyright (c) 2018, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
program test;

uses
  ooRunTest,
  ooCryptogram.Alphabet_test in '..\code\ooCryptogram.Alphabet_test.pas',
  ooCryptogram.Symbol_test in '..\code\ooCryptogram.Symbol_test.pas',
  ooCryptogram.Alphabet in '..\..\code\ooCryptogram.Alphabet.pas',
  ooCryptogram.Symbol in '..\..\code\ooCryptogram.Symbol.pas';

{R *.RES}

begin
  Run;

end.
