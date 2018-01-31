echo off

echo Generate luaTable

echo %1

pushd ..\\ReadExcel\\ReadExcel\\bin\\Release
start /wait ReadExcel.exe ..\\..\\..\\..\\_Gadgets\\keyConfig.ini ..\\..\\..\\..\\..\\Gamedata\\%1 ..\\..\\..\\..\\_Gadgets\\WriteLuaTableLog.txt ..\\..\\..\\..\\..\\Client\\Assets\\StreamingAssets\\Database\\%1 ..\\..\\..\\..\\..\\server\\gameserver\\src\\config true
popd


