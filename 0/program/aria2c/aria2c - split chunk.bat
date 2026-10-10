@                                                                                                                                                                                                                                                                                                                       echo off

if "%~1" == "" exit/b

call codepage




for %%i in ( "%~dp0.etc\aria2c.log" ) do if exist %%i for /f usebacktokens^=1-3* %%A in ( ` rclone lsf -Fhtp --separator " " --copy-links %%i ` ) do for /f usebacktokens^=1-3*delims^=^: %%D in ( '%%C' ) do for %%j in ( "%%~dpi%%~ni - %%BM%%D%%E%%F - %%A%%~xi" ) do for %%k in ( "%%~nxj" ) do ( 
    ren %%i %%k & for %%k in ( "%%~dpnj.7z" ) do ( "%PROGRAMFILES%\7-zip\7z.exe" a -ssp -stl %%k %%j 
        if exist %%k del /q /f %%j
    ) 
)


for %%/ in ( "%~dp0..\..\..\..\..\..\..\..\..\..\..\..\..\0\0 A\Output\Download\aria2c" ) do for %%/ in ( "%%~dpnx/" ) do for /f usebacktokens^=* %%- in ( ' --log^="%~dp0.etc\aria2c.log" --continue^=true --remote-time^=true --max-concurrent-downloads^=16 --max-connection-per-server^=16 --min-split-size^=1M --split^=16 --user-agent^="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36" ' ) do for /f usebacktokens^=* %%* in ( '"%CMDCMDLINE:*" =%' ) do for /f usebacktokens^=1*delims^=^# %%0 in ( '%%~*' ) do for /f usebacktokens^=1*delims^=^? %%1 in ( '%%0' ) do for /f usebacktokens^=* %%1 in ( '"%%1"' ) do for /f usebacktokens^=* %%. in ( ` cmd/q/c for %%i in ^( %%1 ^) do for /f usebacktokens^^^^^=1*delims^^^^^=^^^^^. %%I in ^( '%%~i' ^) do for /f usebacktokens^^^^^=1*delims^^^^^=^^^^^/ %%J in ^( '%%J' ^) do if "%%~xJ" ^^^=^^^= "" ^( echo %%~nI^) else echo %%~nJ` ) do ( 
           (( echo %%*) >> "%~dp0.etc\urls.log" ) 
    aria2c --out="%%~nx1" --dir="%%~dpnx/\%%~." %%- %%* 
) 


echo:
echo Done
echo WAIT [ %TIME:~6,2%%TIME:~9,2% ] 
ping 127.0.0.1 -n %TIME:~6,2%%TIME:~9,2% >NUL
exit/b

