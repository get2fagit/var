@                                                                                                                                                                                                                                                                                                                       echo off

:LOOP
if "%~1" == "" exit/b
for %%i in ( "%~1" ) do for /f usebacktokens^=*delims^=^d %%I in ( '%%~ai' ) do if /i "%%~ai" == "%%~I" ( del /q /f %%i ) else rmdir /q %%i
shift /1
goto:LOOP

