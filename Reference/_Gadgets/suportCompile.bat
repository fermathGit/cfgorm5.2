@echo off
cd ..\..\server\gameserver
echo (a)build_log_define (b)quit (c) build_mapcfg (d)commit_svn
choice /C abcd
if errorlevel 4 goto commitsvn
if errorlevel 3 goto buildmapcfg
if errorlevel 2 goto end
if errorlevel 1 goto buildlogdefine

:buildlogdefine
escript support\build_log_define.ers
goto end

:buildmapcfg
escript support\build_mapcfg.ers
goto end

:commitsvn
escript support\mapcfgs.erl
goto end

:end
pause