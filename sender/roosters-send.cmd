@echo off
REM Roostersynchronisatie naar hq-web-20
REM
REM Gemaakt:     1 maart 2012 door Jan Bouma
REM Gewijzigd:   1 maart 2012 door Jan Bouma
REM
setlocal
set SB_KEY=d:\scripts\roosters\keys\hq-fs-20.ppk
set SB_PSCP=d:\apps\putty\pscp.exe
set SB_SERVER=hq-web-20
set SB_DATAFILE=d:\scripts\roosters\roosters.tar.bz2
set SB_LOGFILE=d:\scripts\roosters\log\roosters.log

:start
REM Logbestand rouleren
if exist %SB_LOGFILE%.5 del %SB_LOGFILE%.5
if exist %SB_LOGFILE%.4 ren %SB_LOGFILE%.4 %SB_SERVER%.log.5
if exist %SB_LOGFILE%.3 ren %SB_LOGFILE%.3 %SB_SERVER%.log.4
if exist %SB_LOGFILE%.2 ren %SB_LOGFILE%.2 %SB_SERVER%.log.3
if exist %SB_LOGFILE%.1 ren %SB_LOGFILE%.1 %SB_SERVER%.log.2
if exist %SB_LOGFILE%.0 ren %SB_LOGFILE%.0 %SB_SERVER%.log.1
if exist %SB_LOGFILE% ren %SB_LOGFILE% %SB_SERVER%.log.0
echo ========================================================== >> %SB_LOGFILE%
echo ==========================================================
echo Roostersynchonisatie naar server %SB_SERVER% >> %SB_LOGFILE%
echo Roostersynchonisatie naar server %SB_SERVER%
date /T >> %SB_LOGFILE%
time /T >> %SB_LOGFILE%
echo ========================================================== >> %SB_LOGFILE%
echo ==========================================================

:inpakken
REM Roosters inpakken voor transport naar webserver
echo Roosters inpakken >> %SB_LOGFILE%
echo Roosters inpakken
D:
cd D:\scripts\roosters\
D:\apps\GnuWin32\bin\bsdtar.exe -cjf roosters.tar.bz2 E:\shares\data\werkmappen\Afdelingen\DR_Website\* >> %SB_LOGFILE%

:uploaden
echo Databestand uploaden naar server %SB_SERVER%... >> %SB_LOGFILE%
echo Databestand uploaden naar server %SB_SERVER%...
%SB_PSCP% -i %SB_KEY% %SB_DATAFILE% hq-fs-20@%SB_SERVER%:/var/sync/roosters.tar.bz2

:exit
echo Script afgesloten >> %SB_LOGFILE%
echo Script afgesloten
REM EOF
