REM @echo off
set TEST_VAR=something
echo "hello world"
REM type c:\BuildTools\Common7\Tools\VsDevCmd.bat
set
if not defined DevEnvDir (CALL "C:\BuildTools\Common7\Tools\VsDevCmd.bat" -no_logo)
