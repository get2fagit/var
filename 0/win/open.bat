@                                                                                                                                                                                                                                                                                                                       echo off

if "%~1" == "" explorer .

:LOOP
if "%~1" == "" exit/b
for %%i in ( "%~1" ) do for /f usebacktokens^=*delims^=^d %%I in ( '%%~ai' ) do if /i "%%~ai" == "%%~I" ( explorer /select,%%i ) else explorer %%i
shift /1
goto:LOOP
