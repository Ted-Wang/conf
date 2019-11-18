@echo off
cd /d %~dp0
set WINRAR="C:\Program Files\WinRAR\WinRAR.exe"
set SZIP="C:\Program Files\7-Zip\7z.exe"
set ZIP=%SZIP%


rem set minipad2_path=D:\Program\daily_notes
set minipad2_path=D:\A_notes\minipad2_2016-07-07
set target_path=D:\Backup\Back_Notes\minipad2

set DAY=%date%
set TIM=%time%
set TIM=%TIM: =0%
set DATE_SUFFIX=%DAY:~0,4%-%DAY:~5,2%-%DAY:~8,2%_%TIM:~0,2%-%TIM:~3,2%-%TIM:~6,2%

rem echo %DATE_SUFFIX%
set "arg1=%1"
rem if %arg1%==storage goto sub_full_back
set ARG_EXCLUDE="-xr!backup"
if "%arg1%"=="full" (
	set "ARG_EXCLUDE="
) else if "%arg1%"=="all" (
	set "ARG_EXCLUDE="
) else (
	set ARG_EXCLUDE="-xr!backup"
)

rem set back_file=dailyNotes_%today_str%.rar
rem %WINRAR% a %back_file% %minipad2_path%
set back_file=DailyNotes_%DATE_SUFFIX%.zip
rem echo %back_file%

%ZIP% a %ARG_EXCLUDE% %back_file% %minipad2_path%
xcopy %back_file% %target_path%\ /Y
del %back_file% /q
REM echo %~f0
rem @pause