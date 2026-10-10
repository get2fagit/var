@                                                                                                                                                                                                                                                                                                                       echo off


if "%~1" == "" ( exit/b ) else ( chcp | find /i "65001" || chcp 65001 ) >NUL & for %%$ in ( "HKLM\Software\0\Colorcon" ) do for /f usebacktokens^=3* %%A in ( ` 2^>NUL reg query %%$ ^|^| echo one two 2 3 6 8 9 A B E` ) do  for /f usebacktokens^=* %%^^; in ( ` reg add %%$ -d "%%B %%A" -f ` ) do color %%A



     set photourl=i.redd.it l3n.co imgur.com
     set videourl=v.redd.it redgifs.com tiktok.com


     set basePath=





     if not defined useragent ( 
         set "useragent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36"
     ) 
     if not defined param_curl ( 
         set param_curl= --silent --location --user-agent "%USERAGENT%" --url 
     ) 
     if not defined param_rclone ( 
         set param_rclone= --retries 1 --contimeout "13s" --fast-list --copy-links --ignore-case --no-traverse  --drive-server-side-across-configs --drive-acknowledge-abuse --drive-skip-shortcuts --user-agent "%USERAGENT%" --no-clobber  
     ) 
     if not defined param_ytdlp ( 
         set param_ytdlp= --break-on-existing --hls-use-mpegts --no-overwrites --mtime --merge-output-format "mp4" --remux-video "mp4" --embed-thumbnail --embed-metadata --embed-chapters --user-agent "%USERAGENT%" --lazy-playlist 
     ) 











rem              Clean up quotes 
rem                  and / or 
rem            trailing whitespace

    if defined basepath ( 
        for /f usebacktokens^=* %%I in ( ` cmd/q/v/c echo !basepath!` ) do for /f usebacktokens^=* %%I in ( '%%~I' ) do for /f usebacktokens^=* %%J in ( '%%~dpI' ) do for /f usebacktokens^=* %%K in ( ' %%~nxI' 
        ) do if /i "%%~nxI" == "" ( for /f usebacktokens^=* %%J in ( '%%J.' ) do set "basepath=%%~dpnxJ" ) else set "basepath=%%J%%K"
    ) 

:LOOP
if "%~1" == "" exit/b


rem              Extract SubReddit

    for %%i in ( "%~1" ) do for /f usebacktokens^=* %%I in ( ` 2^>NUL jq " first(.data.children[].data.subreddit) " ^< %%i ` 
    ) do if defined subreddit ( if /i not "%SUBREDDIT%" == "%%~I" set "subreddit=%%~I") else set "subreddit=%%~I"



set "savepath=%BASEPATH%\%SUBREDDIT%"

for %%i in ( "%SAVEPATH%\yt.dlp" ) do ( if not exist "%%~dpi" md "%%~dpi" 
               if not exist %%i echo off >> %%i
    set param_ytdlp= --download-archive %%i %PARAM_YTDLP% 
) 


for %%i in ( "Video" "Photo" ) do set %%~i=%SAVEPATH%\%%~i
    set gallery=%PHOTO%\Gallery






echo:
echo [%SUBREDDIT%] 
echo %~n1
echo %1
title %SUBREDDIT% // %~n1
echo:


for /f usebacktokens^=* %%* in ( ` cmd/q/c for %%i in ^( "%~1" ^) do echo %%i` ) do for /f usebacktokens^=* %%0 in ( ` jq " .data.children[].data | .url_overridden_by_dest + \" \" + .title " ^< %%* ` ) do for /f usebacktokens^=* %%0 in ( '%%~0' ) do (  
    for /f usebacktokens^=1* %%1 in ( '%%0' ) do ( 
        echo:
        echo %%1
    ) & for /f usebacktokens^=1*delims^=^# %%3 in ( '%%1' ) do for /f usebacktokens^=1*delims^=^? %%3 in ( '%%3') do for /f usebacktokens^=* %%0 in ( '"%%0"' ) do for /f usebacktokens^=* %%1 in ( '"%%1"' ) do for /f usebacktokens^=* %%2 in ( '"%%2"' ) do for /f usebacktokens^=* %%3 in ( '"%%3"' ) do ( 


        
        for /f usebacktokens^=* %%I in ( '%%3' ) do ( 
        
            for %%@ in ( "Video" ) do echo %%I | findstr /i "%videourl:.=\.%" 2>NUL >NUL && ( 
                type "%SAVEPATH%\yt.dlp" | find /i "%%~nxI" 2>NUL >NUL || ( 
               rem  echo %%@
                    for /f usebacktokens^=* %%J in ( `cmd/q/v/c echo "!%%~@!\.etc\%DATE:~-4%-%DATE:~4,2%-%DATE:~7,2%\%%~nxI"` ) do ( 
                        if not exist %%J md %%J 
                        start "%TIME%" /newwindow /wait /min /D %%J yt-dlp %%I %param_ytdlp% 
                        start "" /D %%J /newwindow /min /wait cmd /q /s /c " for %%? in ( * ) do for %%a in ( "%%~?" ) do for %%b in ( "%%~dp?." ) do for %%b in ( "%%~dpnxb" ) do for %%c in ( "%%~dpb." ) do for %%c in ( "%%~dpnxc" ) do for %%e in ( "%%~dpc." ) do for %%e in ( "%%~dpnxe" ) do for %%g in ( "%%~dpe." ) do for %%g in ( "%%~dpnxg" ) do mklink "%%~c\%%~?" "%%~nxb\%%~?" & mklink "%%~e\%%~?" "%%~nxc\%%~nxb\%%~?" & mklink "%%~g\%%~?" "%%~nxe\%%~nxc\%%~nxb\%%~?" & echo: " 
            ))) 

            for %%@ in ( "Photo" ) do echo %%I | findstr /i "%photourl:.=\.%" 2>NUL >NUL && ( 
                for /f usebacktokens^=* %%J in ( `cmd/q/v/c if not exist "!%%~@!\* %%~nxI" echo "!%%~@!\%%~2 - %%~nxI"` ) do ( 
                    if not exist %%J (                echo %%~nxJ
                                           2>NUL  rclone copyurl %%I %%J --progress --stats-one-line %param_rclone% 
            ))) 

            for %%@ in ( "Gallery" ) do echo %%I | findstr /i "www\.reddit\.com" 2>NUL >NUL && ( 
                for /f usebacktokens^=* %%? in ( ` cmd/q/v/c if not exist "!%%~@!\* %%~nxI *" echo "!%%~@!\%%~2 - %%~nxI"^^^& exit/b ` 
                ) do for /f usebacktokens^=* %%+ in ( ' " .data.children[].data | select(.name==\"t3_%%~nxI\").gallery_data.items[]?.media_id " ' 
                ) do for /f usebacktokens^=* %%? in ( ` jq %%+ ^< %%* ` ) do for /f usebacktokens^=* %%I in ( ` cmd/q/c for %%i in ^( "/%%~?." "preview.redd.it/%%~?" ^) do for /f usebacktokens^^^^^=1* %%G in ( ` jq ^^^^^^^< %%* ^^^^^^^| find /i %%i ` ^) do for /f usebacktokens^^^^^=1*delims^^^^^=^^^^^? %%G in ^( '%%~H' ^) do echo "https://i.redd.it/%%~nxG"^^^& exit/b ` ) do ( 
                    for /f usebacktokens^=* %%J in ( `cmd/q/v/c if not exist "!%%~@!\* %%~nx3 *" echo "!%%~@!\%%~2 - %%~nx3 - %%~nxI"` ) do ( 
                                                        echo:
                                                     echo %%~nxJ
                              2>NUL   rclone copyurl %%I %%J --progress --stats-one-line %param_rclone% 

                              if not exist "%%~dpJ* %%~nx3 * " ( 
                                  for /f usebacktokens^=* %%K in ( ` call "%~dp0faggot" %%2 ` ) do ( 
                                      for /f usebacktokens^=* %%M in ( `cmd/q/v/c echo "!%%~@!\%%~nxK - %%~nx3 - %%~nxI"` ) do ( 
                                          rclone copyurl %%I %%M --progress --stats-one-line %param_rclone% 
                               ))) 

            ))) 

        ) 
    ) 
) 


    echo "%~n1" | find /i "%SUBREDDIT%" 2>NUL >NUL && goto:S/1 


for %%i in ( "%~1" ) do if exist %%i echo %%i | find /i /v "%SUBREDDIT%" && ( 
    for /f usebacktokens^=1-3* %%A in ( ` rclone lsf -Fhtp --separator " " --fast-list --copy-links --ignore-case %%i ` ) do for /f usebacktokens^=1-3*delims^=^: %%D in ( '%%C' ) do ren %%i "json - %SUBREDDIT% - %%BM%%D%%E%%F - %%A%%~xi" 
) 









:S/1
shift /1
if "%~1" == "" exit/b
goto:LOOP
exit/b

