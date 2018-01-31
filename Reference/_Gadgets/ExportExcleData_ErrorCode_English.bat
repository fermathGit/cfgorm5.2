@echo off

pushd ..\\ErrorCodeGen\\ReadExcel\\bin\\Release
start /wait ReadExcel.exe CreateCode ..\\..\\..\\..\\NetProtor\\ErrorCode\\ErrorCode.h ..\\..\\..\\..\\..\\Client\\Assets\\Plugins\\Client\\Game\\ErrorCode.cs ..\\..\\..\\..\\..\\Gamedata\\LocalizedSourceFile\\ErrorCodeString.xls English
popd

pushd ..\\NetProtor\\ErrorCode
start /wait python ErrorCodeMaker.py TempErrorCode.h
popd

exit

