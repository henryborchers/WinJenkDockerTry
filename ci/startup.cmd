@echo off
set TEST_VAR=something
echo "hello world"
dir c:\BuildTools\Common7\Tools
REM type c:\BuildTools\Common7\Tools\VsDevCmd.bat
if not defined DevEnvDir (
    call c:\BuildTools\Common7\Tools\VsDevCmd.bat /?
)
