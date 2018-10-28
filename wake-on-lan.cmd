@echo off
rem wol.exe Download: https://www.gammadyne.com/cmdline.htm
set ScriptPath=%~dp0.

for /f "skip=1 delims={}, " %%A in ('wmic nicconfig get ipaddress') do 	(
	for /f "tokens=1" %%B in ("%%~A") do (
		start %ScriptPath%\bin\wol.exe 80:ee:73:a6:74:20 %%~B
	)
)
