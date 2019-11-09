@echo off
set TEST_VAR=something
echo "hello world"
REM type c:\BuildTools\Common7\Tools\VsDevCmd.bat
cd c:\BuildTools\Common7\Tools
CALL "VsDevCmd.bat"
REM if not defined DevEnvDir (
REM )
