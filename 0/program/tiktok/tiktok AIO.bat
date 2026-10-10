@                                                                                                                                                                                                                                                                                                                       echo off


if "%~1" == "" exit/b


for %%$ in ( "colorcon" "codepage" ) do call %%$




for %%+ in ( "%~dp0.etc\yt.dlp" ) do for %%/ in ( "%~dp0..\..\..\..\..\..\..\..\..\..\..\..\..\0\0 A\Output\Download\yt-dlp\%DATE:~-4%-%DATE:~4,2%-%DATE:~7,2%" ) do for %%/ in ( "%%~dpnx/" ) do for /f usebacktokens^=* %%- in ( ' --download-archive %%+ --hls-use-mpegts --no-overwrites --mtime --merge-output-format "mp4" --remux-video "mp4" --embed-thumbnail --embed-metadata --embed-chapters --user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36" ' ) do for /f usebacktokens^=* %%* in ( '"%CMDCMDLINE:*" =%' ) do for /f usebacktokens^=1*delims^=^# %%0 in ( '%%~*' ) do for /f usebacktokens^=1*delims^=^? %%0 in ( '%%0' ) do for /f usebacktokens^=* %%1 in ( '"%%0"' ) do for /f usebacktokens^=* %%. in ( ` cmd/q/c for %%i in ^( %%1 ^) do for /f usebacktokens^^^^^=1*delims^^^^^=^^^^^. %%I in ^( '%%~i' ^) do for /f usebacktokens^^^^^=1*delims^^^^^=^^^^^/ %%J in ^( '%%J' ^) do if "%%~xJ" ^^^=^^^= "" ^( echo %%~nI^) else echo %%~nJ` ) do for /f usebacktokens^=* %%@ in ( ` cmd/q/c for %%i in ^( %%1 ^) do for %%j in ^( "%%~i." ^) do for %%k in ^( "%%~nxi" "%%~nxj" ^) do for /f usebacktokens^^^^^=*delims^^^^^=^^^^^@ %%I in ^( '%%~k' ^) do echo %%I^^^& exit/b ` ) do for %%\ in ( "%%~dp/%%~.\%%~@" ) do ( 
    for %%? in ( %%\ "%%~dp+" ) do if not exist %%? md %%? 
    if not exist %%+ echo off >> %%+ 
    start "%%~@ | %%~nx/ | %TIME%" /newwindow /min /D %%\ yt-dlp %%* %%- 
) 

exit/b


