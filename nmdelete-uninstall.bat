:: This script will uninstall the nmdelete.bat file

@ECHO off

SET cmd=nmdelete

SET file=C:\Windows\System32\%cmd%.bat


IF NOT EXIST %file% (
	ECHO %cmd% is not installed!
) ELSE (
	DEL %file% /p 
	SLEEP 1
	IF NOT EXIST %file% (
		ECHO Sucessfully uninstalled!
	) ELSE (
		ECHO Something went wrong, did you abort? If not, try running with administrative privilages!
	)
)

SLEEP 3
