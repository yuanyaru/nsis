@echo off
set file=dynas.ini

%1 %2

ver|find "5.">nul&&goto :Admin

mshta vbscript:createobject("shell.application").shellexecute("%~s0","goto :Admin","","runas",1)(window.close)&goto :eof

:Admin

:: �������·��
:: mysql 
call:readini %file% mysql mysql mysql
call:readini %file% mysql MYSQL_HOME MYSQL_HOME

::1.remove mysql
%mysql%
cd %MYSQL_HOME%\bin
net stop mysql
.\mysqld --remove mysql

:: 2. remove xshell
del /q %userprofile%\Desktop\xshell*.lnk
echo xshell�Ƴ��ɹ�

:: 3. remove tomcat
del /q %userprofile%\Desktop\tomcat*.lnk
echo tomcat�Ƴ��ɹ�

::exit
pause

:: ��ȡini����. %~1:�ļ�����%~2:��%~3:key %~4:���ص�valueֵ
:readini 
@setlocal enableextensions enabledelayedexpansion
@echo off
set file=%~1
set area=[%~2]
set key=%~3
set currarea=
for /f "usebackq delims=" %%a in ("!file!") do (
    set ln=%%a
    if "x!ln:~0,1!"=="x[" (
        set currarea=!ln!
    ) else (
        for /f "tokens=1,2 delims==" %%b in ("!ln!") do (
            set currkey=%%b
            set currval=%%c
            if "x!area!"=="x!currarea!" (
                if "x!key!"=="x!currkey!" (
                    set var=!currval!
                )
            )
        )
    )
)
(endlocal
    set "%~4=%var%"
)
goto:eof