{
  Copyright (c) 2016, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
program test;

uses
  ooRunTest,
  ooBytes.StringOfBytes_test in '..\code\ooBytes.StringOfBytes_test.pas',
  ooBytes.Scale_test in '..\code\ooBytes.Scale_test.pas',
  ooBytes.ByteFromInteger_test in '..\code\ooBytes.ByteFromInteger_test.pas';

{R *.RES}

begin
  Run;

end.
