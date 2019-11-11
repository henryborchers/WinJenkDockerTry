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
    --includeRecommended `
    --add Microsoft.VisualStudio.Component.VC.Tools.x86.x64 `
    --add Microsoft.VisualStudio.Component.Windows10SDK.18362 `
    --installPath C:\\BuildTools `
 || IF "%ERRORLEVEL%"=="3010" EXIT 0

RUN @"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" `
    && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

RUN choco install -y nsis`
#    && choco install -y cmake --installargs 'ADD_CMAKE_TO_PATH=System' `
    && del /S /F /Q %ChocolateyInstall% `
    && setx path "%path%;C:\Program Files (x86)\NSIS"


RUN REG ADD "HKLM\Software\Microsoft\Command Processor" /v AutoRun /t REG_SZ /d c:\temp\startup.cmd
ADD ci/startup.cmd c:\temp\startup.cmd
SHELL ["powershell", "-command"]
#

RUN Invoke-WebRequest 'https://github.com/git-for-windows/git/releases/download/v2.12.2.windows.2/MinGit-2.12.2.2-64-bit.zip' -OutFile MinGit.zip ;`
    Expand-Archive c:\MinGit.zip -DestinationPath c:\MinGit; `
    Remove-Item c:\MinGit.zip -Force ;`
    $env:PATH = $env:PATH + ';C:\MinGit\cmd\;C:\MinGit\cmd'; `
    Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment\' -Name Path -Value $env:PATH

RUN $ErrorActionPreference = 'Stop'; `
    Invoke-WebRequest https://github.com/Kitware/CMake/releases/download/v3.15.5/cmake-3.15.5-win64-x64.zip -OutFile c:\cmake-win.zip; `
    Expand-Archive -LiteralPath c:\cmake-win.zip -DestinationPath C:\cmake ; `
    Remove-Item c:\cmake-win.zip -Force ; `
    $env:PATH = $env:PATH + ';C:\cmake\cmake-3.15.5-win64-x64\bin;C:\cmake'; `
    Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment\' -Name Path -Value $env:PATH

RUN $ErrorActionPreference = 'Stop'; `
    Invoke-WebRequest https://github.com/ninja-build/ninja/releases/download/v1.9.0/ninja-win.zip -OutFile c:\ninja-win.zip; `
    Expand-Archive -LiteralPath c:\ninja-win.zip -DestinationPath C:\ninja ; `
    Remove-Item c:\ninja-win.zip -Force ; `
    $env:PATH = $env:PATH + ';C:\ninja\;C:\ninja'; `
    Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment\' -Name Path -Value $env:PATH
