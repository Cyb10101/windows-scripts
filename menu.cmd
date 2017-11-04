@echo off
color 1F
Title Command
setlocal

rem Convert german date dd.mm.yyyy to yyyy-mm-dd
for /f "delims=. tokens=1,2,3" %%a in ('echo %date%') do set varDate=%%c-%%b-%%a

:start
set option=%1%
rem Run in terminal: Script.cmd jumper
if "%option%"=="jumper" goto runJumper

:menu
	cls
	call:helperHeader /
	echo   [1] MenuCommand
	echo   [2]
	echo   [3]
	echo.
	echo   [4]
	echo   [5]
	echo   [6]
	echo.
	echo   [7]
	echo   [8]
	echo   [9]
	echo.
	echo   [0] Exit
	call:helperLine
	set tmpKey=null
	set /P tmpKey="  Choose: "
	echo.
	if "%tmpKey%"=="1" goto runMenuCommand
	if "%tmpKey%"=="0" goto exitScript
	if "%tmpKey%"=="$e" goto exitScript
goto menu

:runJumper
	cls
	call:helperHeader /Jumper
	echo   [%varDate%] Jumper running...
	call:helperLine
	echo   One moment...
	call:helperSleep 5
goto exitScript

:runMenuCommand
	cls
	call:helperHeader /MenuCommand
	echo   [%varDate%] MenuCommand running...
	call:helperLine
	echo   One moment...
	call:helperSleep 5
goto exitScript

rem call:helperWindowsTaskkill "outlook.exe" "Outlook"
:helperWindowsTaskkill
	set find=%SystemRoot%\System32\find.exe
	tasklist | %find% /I %1 > NUL
	if errorlevel 1 (echo > NUL) else (
		echo   Terminate program: %2
		taskkill /IM %1 > NUL
	)
goto:eof

rem call:helperWindowsTaskkill "outlook.exe" "Outlook"
:helperWindowsTaskkillForce
	set find=%SystemRoot%\System32\find.exe
	tasklist | %find% /I %1 > NUL
	if errorlevel 1 (echo > NUL) else (
		echo   Kill program: %2
		taskkill /IM %1 /F > NUL
	)
goto:eof

rem call:helperLinkCreate "C:\folder\destination" "C:\folder\source"
:helperLinkCreate
	if not exist %1 (
		mklink /J %1 %2 > NUL
	)
goto:eof

rem call:helperLinkRemove "C:\folder\destination"
:helperLinkRemove
	if exist %1 (
		rmdir /s /q %1 > NUL
	)
goto:eof

rem call:helperHeader "title/path"
:helperHeader
	echo  ==============================================================================
	echo   Command [%1]
	echo  ==============================================================================
goto:eof

:helperLine
	echo  ------------------------------------------------------------------------------
goto:eof

rem call:helperSleep 5
:helperSleep
	ping -n %1 localhost > nul
goto:eof

rem call:helperPauseText 5
:helperPauseText
	for /L %%i IN (%1,-1,1) DO (
		echo   Still %%i seconds
		choice /c:x /d:x /t:1 > NUL
	)
	echo.
goto:eof

:exitScript
echo.
color 0F
cls
