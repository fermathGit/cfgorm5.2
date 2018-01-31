@echo off

pushd ..\\UpdateText\\ReadExcel\\bin\\Release
start /wait ReadExcel.exe ..\\..\\..\\..\\..\\Gamedata\\LocalizedSourceFile\\UpdateText.xls ..\\..\\..\\..\\..\\Client\\Assets\\Code\\UniLib\\Resource\\UpdateText.cs Korean
popd

exit