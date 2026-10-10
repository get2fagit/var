@                                                                                                                                                                                                                                                                                                                       echo off


if "%~1" == "" exit/b 
( chcp | find /i "65001" || chcp 65001 ) >NUL
for %%$ in ( "HKLM\Software\0\Colorcon" ) do for /f usebacktokens^=3* %%A in ( ` 2^>NUL reg query %%$ ^|^| echo one two 2 3 6 8 9 A B E` ) do  for /f usebacktokens^=* %%^^; in ( ` reg add %%$ -d "%%B %%A" -f ` ) do color %%A



for /L %%l in ( 0 1 3 ) do echo:
if "%~1" == "" ( exit/b ) else echo %~n1

for /f usebacktokens^=1* %%0 in ( ` cmd/q/c for /f usebacktokens^^^^^=* %%I in ^( `cmd/q/c if "%~1" ^^^^^^^=^^^^^^^= "" ^^^^^( for %%i in ^^^^^( "*.json" ^^^^^) do for %%i in ^^^^^( "%%~i" ^^^^^) do echo %%i^^^^^) else if "%~9" ^^^^^^^=^^^^^^^= "" ^^^^^( for %%i in ^^^^^( "%~1" "%~2" "%~3" "%~4" "%~5" "%~6" "%~7" "%~8" "%~9"  ^^^^^) do if exist %%i echo %%i^^^^^) else for %%i in ^^^^^( %* ^^^^^) do if exist %%i echo %%i` ^) do for /f usebacktokens^^^^^=* %%J in ^( ` 2^^^^^^^> NUL jq " first(.data.children[].data.subreddit) " ^^^^^^^< %%I ` ^) do echo %%J %%I` ) do for /f usebacktokens^=* %%T in ( ` cmd/q/c if %TIME:~,2% GEQ 10 ^( echo %DATE:~-4%-%DATE:~4,2%-%DATE:~7,2%T%TIME:~,2%_%TIME:~3,2%_%TIME:~6,2%^) else echo %DATE:~-4%-%DATE:~4,2%-%DATE:~7,2%T0%TIME:~1,1%_%TIME:~3,2%_%TIME:~6,2%` 
) do for %%/ in ( "%~dp0.etc\._at\Subreddit\%DATE:~-4%-%DATE:~4,2%-%DATE:~7,2%" 
) do for %%\ in ( "%%~dp/.log\%%~0" ) do for %%/ in ( "%%~dp/%%~0\%%~nx/" 
) do for %%` in ( "%%~\\rclone.rcl" 
) do for %%! in ( "%%~\\json.log" 
) do for %%@ in ( "%%~\\yt.dlp" 
) do ( 
  echo [ %%~0 ]{ "%~n1" }[ %%1 ] 

  for /f usebacktokens^=* %%2 in ( ` jq " .data.children[].data | .url_overridden_by_dest + \" \" + .title " ^< %%1 ` ) do ( 
    for /f usebacktokens^=1* %%3 in ( '%%~2' ) do for /f usebacktokens^=1*delims^=^# %%5 in ( '%%3' ) do for /f usebacktokens^=1*delims^=^? %%5 in ( '%%5') do ( 

                                                        echo:     &     echo %%5 

        for %%^< in ( "Video" ) do for /f usebacktokens^=* %%I in ( '"%%5"' ) do echo %%I | >NUL findstr /i "v\.redd\.it redgifs\.com" && ( for %%i in ( "%%~dp/%%~<\.etc\%%~nx/\%%~nxI" ) do for %%j in ( "%%~dp/%%~<\.etc\%%~4" ) do (( for %%? in ( %%i "%%~dp@" ) do if not exist %%? md %%? ) & if not exist %%@ echo off >> %%@ 
          for /f usebacktokens^=* %%- in ( ' --download-archive %%@ --break-on-existing --hls-use-mpegts --no-overwrites --mtime --merge-output-format "mp4" --remux-video "mp4" --embed-thumbnail --embed-metadata --embed-chapters --user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36" --lazy-playlist ' ) do ( 
            type %%@ | find /i "%%~nxI" >NUL || (                               start "%%T : %%~nxj" /newwindow /min /wait /D %%i yt-dlp %%I %%- 
              for %%k in ( "%%~i\*" ) do for %%k in ( "%%~k" ) do for /f usebacktokens^=1*delims^=^[^] %%J in ( '%%~nk' ) do for /f usebacktokens^=* %%M in ( '%%~nxJ' ) do for /f usebacktokens^=* %%M in ( ` echo "%%~nxM" ^| findstr /i "%%~4" ^>NUL ^&^& echo "%%~dpj%%~nxk"^|^| echo "%%~j - %%~nxk"` ) do ( 
                echo %%~nxM&                                             if not exist %%M if exist %%k rclone copyto %%k %%M --progress --fast-list --copy-links --ignore-case 
        )))),); 



        for %%^< in ( "Video" ) do for /f usebacktokens^=* %%I in ( '"%%5"' ) do echo %%I | >NUL findstr /i "tiktok\.com" && ( for /f usebacktokens^=1-3*delims^=^/^:^\ %%A in ( '%%~I' ) do for %%i in ( "%%~dp/%%~<\.etc\%%~nx/\%%~C\%%~nxI" ) do for %%j in ( "%%~dp/%%~<\.etc\%%~4" ) do (( for %%? in ( %%i "%%~dp@" ) do if not exist %%? md %%? ) & if not exist %%@ echo off >> %%@ 
          for /f usebacktokens^=* %%- in ( ' --download-archive %%@ --break-on-existing --hls-use-mpegts --no-overwrites --mtime --merge-output-format "mp4" --remux-video "mp4" --embed-thumbnail --embed-metadata --embed-chapters --user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36" --lazy-playlist ' ) do ( 
            type %%@ | find /i "%%~nxI" >NUL || (                               start "%%T : %%~nxj" /newwindow /min /wait /D %%i yt-dlp %%I %%- 
              for %%k in ( "%%~i\*" ) do for %%k in ( "%%~k" ) do for /f usebacktokens^=1*delims^=^[^] %%J in ( '%%~nk' ) do for /f usebacktokens^=* %%M in ( '%%~nxJ' ) do for /f usebacktokens^=* %%M in ( ` echo "%%~nxM" ^| findstr /i "%%~4" ^>NUL ^&^& echo "%%~dpj%%~nxk"^|^| echo "%%~j - %%~nxk"` ) do ( 
                echo %%~nxM&                                             if not exist %%M if exist %%k rclone copyto %%k %%M --progress --fast-list --copy-links --ignore-case 
        )))),); 






        for %%^< in ( "Photo" ) do for %%^> in ( "Gallery" ) do for /f usebacktokens^=* %%I in ( '"%%5"' ) do for /f usebacktokens^=* %%- in ( ' --contimeout "13s" --retries 1 --progress --stats-one-line --fast-list --copy-links --no-traverse --ignore-case --drive-server-side-across-configs --drive-acknowledge-abuse --drive-skip-shortcuts --user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36" --no-clobber ' ) do ( 

          echo %%I | >NUL findstr /i "i\.redd\.it l3n\.co imgur\.com" && ( 
            for %%i in ( "%%~dp/%%~<\%%~4 - %%~nxI" ) do if not exist %%i ( 
              echo %%~nxi& rclone copyurl %%I %%i %%- 
          )) 

          echo %%I | >NUL findstr /i "www\.reddit\.com" && ( echo Gallery without download == crosspost >NUL
            for %%^& in ( "%%~dp/%%~<\%%~>\%%~4 - %%~nxI" ) do for /f usebacktokens^=* %%7 in ( ' " .data.children[].data | select(.name==\"t3_%%~nxI\").gallery_data.items[]?.media_id " ' ) do for /f usebacktokens^=* %%7 in ( ` jq %%7 ^< %%1 ` ) do for /f usebacktokens^=* %%I in ( ` cmd/q/c for %%i in ^( "/%%~7." "preview.redd.it/%%~7" ^) do for /f usebacktokens^^^^^=1* %%G in ( ` jq ^^^^^^^< %%1 ^^^^^^^| find /i %%i ` ^) do for /f usebacktokens^^^^^=1*delims^^^^^=^^^^^? %%G in ^( '%%~H' ^) do echo "https://i.redd.it/%%~nxG"^^^& exit/b ` ) do ( 
              for %%i in ( "%%~& - %%~nxI" ) do if not exist %%i ( 
                echo %%~nxi& rclone copyurl %%I %%i %%- 
          ))) 
      )) 
  ) 
  for /f usebacktokens^=1-3* %%A in ( ` rclone lsf -Fhtp --separator " " --fast-list --copy-links --ignore-case %%1 ` ) do for /f usebacktokens^=1-3*delims^=^: %%D in ( '%%C' 
  ) do for /f usebacktokens^=* %%I in ( ` 2^>NUL jq " first(.data.children[].data.subreddit) " ^< %%1 ` ) do ( 
    echo ren %%1 "json - %%~0 - %%BM%%D_%%E_%%F - %%A.json"
    (( echo ren %%1 "json - %%~0 - %%BM%%D_%%E_%%F - %%A.json" ) >> "%%~dp1json.log" ) 
    ren %%1 "json - %%~0 - %%BM%%D_%%E_%%F - %%A.json"
  ) 
) 
exit/b
