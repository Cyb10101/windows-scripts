@echo off
color 1F
Title Command
setlocal

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
	rem @todo Add user input
goto exitScript

rem call:helperHeader "title/path"
:helperHeader
	echo  ==============================================================================
	echo   Command [%1]
	echo  ==============================================================================
goto:eof

:helperLine
	echo  ------------------------------------------------------------------------------
goto:eof

:exitScript
echo.
color 0F

