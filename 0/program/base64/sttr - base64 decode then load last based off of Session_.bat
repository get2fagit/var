@                                                                                                                                                                                                                                                                                                                       echo off


if not exist "%~dp0.etc" ( 
    md "%~dp0.etc" 
) 


for /f usebacktokens^=* %%* in ( '"%CMDCMDLINE:*" =%' ) do for /f usebacktokens^=1*delims^=^= %%0 in ( '%%~*' ) do for /f usebacktokens^=1*delims^=^& %%0 in ( '%%1' ) do for /f usebacktokens^=* %%2 in ( ` sttr base64-decode "%%0" --raw ` ) do for /f usebacktokens^=* %%1 in ( '"%%2"' ) do (  
    for /f usebacktokens^=* %%0 in ( `cmd/q/v/c for /f usebacktokens^^^^^=* %%@ in ^( ` es "Session_*" -sort-date-modified-descending -double-quote -max-results 1 ` ^) do for %%@ in ^( "%%~dp@..\..\..\*.exe" ^) do for %%@ in ^( "%%~dpnx@" ^) do for %%# in ^( "%%~dp@." ^) do set ver^=%%~pnx#^^^& for /f usebacktokens^^^^^=1*delims^^^^^=^^^^^/ %%A in ^( '!ver:\ver\^^^^^=/!' ^) do for /f usebacktokens^^^^^=3* %%I in ^( ` dir /a:dl "%%~d@%%A" ^^^^^^^| find /i "%%B"` ^) do for /f usebacktokens^^^^^=1* %%I in ^( '%%J' ^) do for /f usebacktokens^^^^^=1*delims^^^^^=^^^^^[^^^^^] %%I in ^( '%%J' ^) do echo "%%~d@%%A\%%~nxI\%%~nx@"` ) do ( 
        echo %%2             %%0
        %%0 %%1
    ) >> "%~dp0.etc\%~n0.log"
) 

exit/b



