@                                                                                                                                                                                                                                                                                                                       echo off

:LOOP
if "%~1" == "" exit/b
if exist "%~1" rmdir /q "%~1"
shift /1
goto:LOOP

