echo off
echo delete server map-info...
del "..\..\javaServer\GameServer\maps\*" /s /q
del "..\..\Client\Assets\StreamingAssets\MapInfo\Minimap\*.bytes" /s /q
del "..\..\Client\Assets\StreamingAssets\MapInfo\Minimap\*.bytes.r*" /s /q

XCOPY "..\..\Client\Assets\ToolOutput\PathGrid" "..\..\javaServer\GameServer\maps" /s /c /i /d /y /EXCLUDE:EXCLUDE_ServerMapOnly.txt
XCOPY "..\..\Client\Assets\ToolOutput\ForServer\MapInfo" "..\..\javaServer\GameServer\maps" /s /c /i /d /y /EXCLUDE:EXCLUDE_ServerMapOnly.txt
XCOPY "..\..\Client\Assets\ToolOutput\ForServer\MapInfo" "..\..\Client\Assets\StreamingAssets\MapInfo\Minimap" /s /c /i /d /y /EXCLUDE:EXCLUDE_All_ExceptMapInfoBytes.txt
