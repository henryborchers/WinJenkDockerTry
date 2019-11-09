@echo off
set TEST_VAR=something
echo "hello world"
REM type c:\BuildTools\Common7\Tools\VsDevCmd.bat
if not defined DevEnvDir (CALL "c:\BuildTools\Common7\Tools\VsDevCmd.bat" -help)
dir