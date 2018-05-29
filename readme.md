[![License](https://img.shields.io/badge/License-BSD%203--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)
[![Build Status](https://travis-ci.org/VencejoSoftware/ooCryptogram.svg?branch=master)](https://travis-ci.org/VencejoSoftware/ooCryptogram)

# ooCryptogram - Object pascal cryptogram tools
Tool to use simple cryptogram solver

### Documentation
If not exists folder "code-documentation" then run the batch "build_doc". The main entry is ./doc/index.html

### Example
```pascal
var
  CryptogramAlphabet: ICryptogramAlphabet;
begin
  CryptogramAlphabet := TCryptogramAlphabet.New;
  CryptogramAlphabet.Load('A2RVJ L2I WI8ÑR2TI9_ VY9_ÑZV QA +VZÑBQ', []);
  CryptogramAlphabet.ChangeKey('notes frcypgamxlidh');
  ShowMessage(CryptogramAlphabet.Decode);
end;
```

### Demo
Before all, run the batch "build_demo" to build proyect. Then go to the folder "demo\build\release\" and run the executable.

## Dependencies
* [ooGeneric](https://github.com/VencejoSoftware/ooGeneric.git) - Generic object oriented list

## Built With
* [Delphi&reg;](https://www.embarcadero.com/products/rad-studio) - Embarcadero&trade; commercial IDE
* [Lazarus](https://www.lazarus-ide.org/) - The Lazarus project

## Contribute
This are an open-source project, and they need your help to go on growing and improving.
You can even fork the project on GitHub, maintain your own version and send us pull requests periodically to merge your work.

## Authors
* **Alejandro Polti** (Vencejo Software team lead) - *Initial work*