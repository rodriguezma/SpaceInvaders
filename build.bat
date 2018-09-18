@ECHO OFF
SET INPUT=%1
SET OUTPUT_D=%INPUT:.cc=_debug.exe%
SET OUTPUT_R=%INPUT:.cc=_release.exe%
call "%VS120COMNTOOLS%\..\..\VC\vcvarsall.bat" x86
:loop
	echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
  echo Choose Option:
	echo   1: Compile
	echo   2: Execute
	echo   3: Launch DevEnv
	echo   4: Compile -RELEASE-
	echo   5: Execute -RELEASE-
	echo   6: Exit
	CHOICE /C:123456  /M "Option"
	goto case_%ERRORLEVEL%
:case_1
  cls
	echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	echo xx BUILD                                                      xx
	echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	cl /nologo /Zi /GR /EHs /MDd -DWIN32 %INPUT% -I ../include ../bin/ESAT_d.lib opengl32.lib user32.lib gdi32.lib shell32.lib /link /OUT:%OUTPUT_D%
	goto loop
:case_2
  cls
	echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	echo xx EXECUTE                                                    xx
	echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	%OUTPUT_D%
	goto loop
:case_3
	echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	echo xx DEV ENV                                                    xx
	echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	devenv %OUTPUT_D% %INPUT%
	goto loop
:case_4
  cls
	echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	echo xx BUILD -RELEASE-                                            xx
	echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	cl /nologo /GR /EHs /MD -DWIN32 %INPUT% -I ../include ../bin/ESAT.lib opengl32.lib user32.lib gdi32.lib shell32.lib /link /OUT:%OUTPUT_R%
	goto loop
:case_5
  cls
	echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	echo xx EXECUTE -RELEASE-                                          xx
	echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	%OUTPUT_R%
	goto loop
:case_6
