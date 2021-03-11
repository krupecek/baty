

@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:-------------------------------------- 
@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"


:: Wybier co chces instalowac
:::: 
	
	@echo off
		color 0a
		echo Serwus
		ping localhost -n 5 >nul
@echo off
echo Co chcesz zainstalowac/zmienic? 1-TightVNC, 2-Google Chrome, 3-7zip,
echo 4-LibreOffice, 5-Zmien nazwe komputera, 6-Zmien IP, 7-Zainstaluj 1-4
set /P N=Wybierz numer: 
:switch-case-example
  :: Call and mask out invalid call targets
  goto :switch-case-N-%N% 2>nul || (
    :: Default case
    echo Cos innego
  )
  goto :switch-case-end
  
  :switch-case-N-1
    choco install tightvnc -fy
    goto :switch-case-end
  :switch-case-N-2
    choco install googlechrome -fy
    goto :switch-case-end
  :switch-case-N-3
    choco install 7zip -fy
    goto :switch-case-end
 :switch-case-N-4
    choco install libreoffice-fresh -fy
    goto :switch-case-end

:switch-case-N-5

  start demo.bat
exit
goto :switch-case-end
:switch-case-N-6
start demo2.bat
exit
	goto :switch-case-end
:switch-case-N-7
  					  choco install tightvnc googlechrome 7zip libreoffice-fresh -fy
   					 goto :switch-case-end


:switch-case-end
		echo Co chcesz zainstalowac/zmienic? 1-TightVNC, 2-Google Chrome, 3-7zip,
		echo 4-LibreOffice, 5-Zmien nazwe komputera, 6-Zmien IP, 7-Zainstaluj 1-4
			set /P N=Wybierz numer: 
			:switch-case-example
 			 :: Call and mask out invalid call targets
 				 goto :switch-case-N-%N% 2>nul || (
   				 :: Default case
  				  echo Cos innego
 			 )
  				goto :switch-case-end
  
  					:switch-case-N-1
  					  choco install tightvnc -fy
   					 goto :switch-case-end
 						 :switch-case-N-2
  						  choco install googlechrome -fy
  						  goto :switch-case-end
 						 :switch-case-N-3
    						choco install 7zip -fy
 						   goto :switch-case-end
						:switch-case-N-4
   						 choco install libreoffice-fresh -fy
   						 goto :switch-case-end
						:switch-case-N-5
   						  start demo.bat
								exit	
					 goto :switch-case-end
						:switch-case-N-6
   						  start demo2.bat
exit
					 goto :switch-case-end
						:switch-case-N-7
  					  choco install tightvnc googlechrome 7zip libreoffice-fresh -fy
   					 goto :switch-case-end
						
	Pause