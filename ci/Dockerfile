# escape=`

# Use the latest Windows Server Core image with .NET Framework 4.8.
FROM mcr.microsoft.com/dotnet/framework/sdk:4.8-windowsservercore-ltsc2019

# Restore the default Windows shell for correct batch processing.
SHELL ["cmd", "/S", "/C"]
ADD https://aka.ms/vscollect.exe C:/TEMP/collect.exe
# Download channel for fixed install.
ARG CHANNEL_URL=https://aka.ms/vs/16/release/channel
ADD ${CHANNEL_URL} C:/TEMP/VisualStudio.chman

# Download the Build Tools bootstrapper.
ADD https://aka.ms/vs/16/release/vs_buildtools.exe C:\TEMP\vs_buildtools.exe

# Install Build Tools excluding workloads and components with known issues.
RUN C:\\TEMP\\vs_buildtools.exe --quiet --wait --norestart --nocache `
    --channelUri C:\\TEMP\\VisualStudio.chman `
    --installChannelUri C:\\TEMP\\VisualStudio.chman `
    --add Microsoft.VisualStudio.Workload.VCTools `
    --add Microsoft.VisualStudio.Component.VC.Tools.x86.x64 `
    --add Microsoft.VisualStudio.Component.Windows10SDK.18362 `
    --add Microsoft.VisualStudio.Component.VC.CMake.Project `
    --includeRecommended `
    --installPath C:\\BuildTools `
 || IF "%ERRORLEVEL%"=="3010" EXIT 0
RUN REG ADD "HKLM\Software\Microsoft\Command Processor" /v AutoRun /t REG_SZ /d c:\temp\startup.cmd
ADD ci/startup.cmd c:\temp\startup.cmd

RUN @"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" `
    && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

RUN choco install -y git nsis`
    && choco install -y cmake --installargs 'ADD_CMAKE_TO_PATH=System' `
    && del /S /F /Q %ChocolateyInstall% `
    && setx path "%path%;C:\Program Files (x86)\NSIS"
