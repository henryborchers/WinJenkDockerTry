@echo off
set TEST_VAR=something
echo "hello world"
REM type c:\BuildTools\Common7\Tools\VsDevCmd.bat
cd c:\BuildTools\Common7\Tools
if not defined DevEnvDir (CALL "VsDevCmd.bat")
