REM @echo off
if not defined DevEnvDir (
    set VSCMD_DEBUG=2
    CALL C:\BuildTools\Common7\Tools\VsDevCmd.bat  -arch=amd64
    )
set