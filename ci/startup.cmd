REM @echo off
set TEST_VAR=something
echo "hello world"
type c:\BuildTools\Common7\Tools\VsDevCmd.bat
REM set
if not defined DevEnvDir (CALL "C:\BuildTools\Common7\Tools\VsDevCmd.bat" -no_ext)
