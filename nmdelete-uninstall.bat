:: This script will uninstall the nmdelete.bat file

@ECHO off

SET cmd=nmdelete

SET file=C:\Windows\System32\%cmd%.bat


IF NOT EXIST %file% (
	ECHO %cmd% is not installed!
) ELSE (
	DEL %file% /p 
	TIMEOUT /T 1 /NOBREAK
	IF NOT EXIST %file% (
		ECHO Sucessfully uninstalled!
	) ELSE (
		ECHO Something went wrong, did you abort? If not, try running with administrative privilages!
	)
)

TIMEOUT /T 3 /NOBREAK
