:: This script will install a batch file that'll be used to delete all node_modules folders, from the directory you're in with CMD

@ECHO off

:: This is the command that will be used in CMD
SET cmd=nmdelete

:: This will create the batch file in the system32 folder. Gets rid of the need to add it to the environment path
SET file=C:\Windows\System32\%cmd%.bat

IF NOT EXIST %cmd%.bat (
	ECHO Installing %cmd%...
	
:: This is the content of the file that will be created
	ECHO @ECHO off > %file%
	ECHO SET /A count^=0 >> %file%
	ECHO 	FOR /D /R . %%%%F IN ^(node_modules^) DO ^( >> %file%
	ECHO 		IF EXIST "%%%%F" ^( >> %file%
	ECHO 			ECHO "%%%%F" >> %file%
	ECHO 			SET /A count+=1 >> %file%
	ECHO 		^) >> %file%
	ECHO 	^) >> %file%
	ECHO ECHO %%count%% folders found. >> %file%
	ECHO IF %%count%% == 0 ^( ECHO no node_modules folders found! >> %file%
	ECHO 	EXIT /B >> %file%
	ECHO ^) >> %file%
	ECHO SET /P ans=Are you sure you want to delete all of the above? [y - accept, anything else - abort] >> %file%
	ECHO IF /I %%ans%% == y ^( >> %file%
	ECHO 	FOR /D /R . %%%%F IN ^(node_modules^) DO ^( >> %file%
	ECHO 		IF EXIST "%%%%F" ^( >> %file%
	ECHO 			RD "%%%%F" /S /Q >> %file%
	ECHO 		^) >> %file%
	ECHO 	^) >> %file%
	ECHO ^) ELSE ^( >> %file%
	ECHO 	ECHO Aborted! >> %file%
	ECHO 	EXIT /B >> %file%
	ECHO ^) >> %file%
	ECHO IF %%count%% GTR 0 ^(ECHO Successfully removed %%count%% node_modules!^) ELSE ^( ECHO no node_modules folders found! ^)>> %file%


	SLEEP 2
	
	IF NOT EXIST %cmd%.bat ( 
		GOTO failed 
	) ELSE (
		GOTO success
	)

) ELSE (
	ECHO %cmd% is already installed!
	ECHO If you want to uninstall it, run nmdelete-uninstall
	SLEEP 4
	EXIT
)

:failed
	ECHO Failed to install, try running with administrative privileges!
	SLEEP 4
	EXIT
	
:success
	ECHO Successfully installed! Enjoy :^)
	SLEEP 4
	EXIT
