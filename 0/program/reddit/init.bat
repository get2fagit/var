@                                                                                                                                                                                                                                                                                                                       echo off


if "%~1" == "" exit/b 
( chcp | find /i "65001" || chcp 65001 ) >NUL
for %%$ in ( "HKLM\Software\0\Colorcon" ) do for /f usebacktokens^=3* %%A in ( ` 2^>NUL reg query %%$ ^|^| echo one two 2 3 6 8 9 A B E` ) do  for /f usebacktokens^=* %%^^; in ( ` reg add %%$ -d "%%B %%A" -f ` ) do color %%A
for %%$ in ( "HKLM\Software\0\Reddit" ) do ( 
    for %%v in ( "SavePath" ) do ( 
        2>NUL >NUL reg query %%$ -v %%v || ( 
            echo:
            echo Set save path for subreddit first
            set /p %%~v=%%~v: 
            if not defined %%~v exit/b ; 
            for /f usebacktokens^=* %%I in ( 
            ` cmd/q/c 
                for %%i in ^( %%v ^) do 
                for /f usebacktokens^^^^^=* %%I in ^( '!%%~i!' ^) do 
                for /f usebacktokens^^^^^=* %%I in ^( '%%~I' ^) do 
                for /f usebacktokens^^^^^=* %%J in ^( '%%~dpI' ^) do 
                for /f usebacktokens^^^^^=* %%K in ^( ' %%~nxI' ^) do 
                for /f usebacktokens^^^^^=* %%I in ^( '"%%J%%K"' ^) do 
                for /f usebacktokens^^^^^=* %%J in ^( '"%%J%%K"' ^) do 
                for /f usebacktokens^^^^^=* %%K in ^( '%%~dpJ.' ^) do 
                for /f usebacktokens^^^^^=* %%K in ^( '"%%~dpnxK"' ^) do 
                for /f usebacktokens^^^^^=* %%J in ^( `cmd/q/c for %%j in ^^^^^^^( %%J ^^^^^^^) do for %%k in ^^^^^^^( %%K ^^^^^^^) do if /i "%%~nxj" ^^^^^^^=^^^^^^^= "" ^^^^^^^( echo %%k^^^^^^^) else echo %%j` ^) do 
                for %%i in ^( "%~1" ^) do 
                for /f usebacktokens^^^^^=* %%K in ^( ` 2^^^^^^^> NUL jq " first(.data.children[].data.subreddit) " ^^^^^^^< %%i ` ^) do 
                echo "%%~J\%%~K"^^^& exit/b 
            ` 
            ) do echo %%I
        ) 
    ) 
) 
:P
pause
exit/b


                for /f usebacktokens^^^^^=* %%J in ^( '%%~dpI.' ^) do 
                for /f usebacktokens^^^^^=* %%J in ^( '"%%~dpnxJ"' ^) do 
                
                if /i "%%~nxI" ^^^=^^^= "" ^( echo %%J^) else echo %%I^^^& exit/b 
            ` ) do reg add %%$ -v %%v -t "REG_SZ" -d %%I 2>NUL >NUL
        ) 
    ) 
) 

                
                
                %%j in ( 
            
            echo !%%~v!` ) do for /f usebacktokens^=* %%I in ( '%%~I' ) do 
            reg add %%$ -v
        

if not defined _savepath

















