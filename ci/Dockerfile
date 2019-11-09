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
    --installPath C:\\BuildTools `
 || IF "%ERRORLEVEL%"=="3010" EXIT 0
ADD ci/startup.cmd c:\temp\startup.cmd
# TODO SET "HKLM\SOFTWARE\Microsoft\Command Processor" property "AutoRun" to value "c:\temp\startup.cmd"
#ENV AUTORUN=c:\temp\startup.cmd
RUN REG ADD "HKLM\Software\Microsoft\Command Processor" /v AutoRun /t REG_SZ /d c:\temp\startup.cmd

RUN dir
#RUN REG ADD "HKEY_LOCAL_MACHINE\Software\Microsoft\Command Processor" /v AutoRun /t REG_SZ /d c:\temp\startup.cmd
#SHELL ["powershell", "-Command"]

#RUN Set-ItemProperty -Path "HKLM\SOFTWARE\Microsoft\Command Processor" -Name AutoRun -Value "c:\temp\startup.cmd"