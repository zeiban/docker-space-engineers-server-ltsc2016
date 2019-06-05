FROM zeiban/steamcmd-ltsc2016

# Directory for server instance
RUN if not exist "C:\data" mkdir C:\data
#RUN copy NUL c:\data\empty.log /y

# Download Space Engineers Dedicated Server.  For some reason it often fails the first time
RUN powershell $(steamcmd.exe +login anonymous +force_install_dir C:/server/ +app_update 298740 +quit; powershell exit 0)

# Executable to start the Dedicated Server.
RUN if not exist "C:\app" mkdir C:\app
COPY app C:/app

CMD powershell.exe c:\app\serverstart.ps1 

EXPOSE 27016/udp
EXPOSE 8080