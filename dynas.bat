@echo off
set file=dynas.ini

:: �������·��
:: mysql 
call:readini %file% mysql mysql mysql
call:readini %file% mysql mdfmysql mdfmysql
call:readini %file% mysql MYSQL_HOME MYSQL_HOME

:: xshell
call:readini %file% xshell xshell xshell

:: jdk
call:readini %file% jdk jdk jdk
call:readini %file% jdk JAVA_HOME JAVA_HOME

:: navicat
call:readini %file% navicat navicat navicat

:: tomcat
call:readini %file% tomcat tomcat tomcat
call:readini %file% tomcat CATALINA_HOME CATALINA_HOME

:: sunClient
call:readini %file% sunClient sunClient sunClient


:: ���û�������
setx MYSQL_HOME %MYSQL_HOME%
setx JAVA_HOME %JAVA_HOME%
setx CATALINA_HOME %CATALINA_HOME%

setx /m CLASSPATH .;%JAVA_HOME%\lib\dt.jar;%JAVA_HOME%\lib\tools.jar
setx /m Path "%Path%;%MYSQL_HOME%\bin;%JAVA_HOME%\bin;%JAVA_HOME%\jre\bin;%CATALINA_HOME%\bin"

::1. install mysql
%mysql%
cd %MYSQL_HOME%\bin
.\mysqld install
net start mysql
::set password
%mdfmysql%

:: 2. install xshell
::�����ļ�·��
set Program=%xshell%
 
::���ÿ�ݷ�ʽ����
set LnkName=Xshell
 
(echo Set WshShell=CreateObject("WScript.Shell"^)
echo strDesKtop=WshShell.SpecialFolders("DesKtop"^)
echo Set oShellLink=WshShell.CreateShortcut(strDesKtop^&"\%LnkName%.lnk"^)
echo oShellLink.TargetPath="%Program%"
 
echo oShellLink.WindowStyle=1
echo oShellLink.Save)>makelnk.vbs
 
echo xshell�����ɹ�
makelnk.vbs
del /f /q makelnk.vbs

:: 3. install navicat
echo start install navicat
%navicat%

:: 4. install jdk
echo start install jdk
%jdk%

:: 5. tomcat
::�����ļ�·��
set Program=%tomcat%
 
::���ÿ�ݷ�ʽ����
set LnkName=tomcat
 
(echo Set WshShell=CreateObject("WScript.Shell"^)
echo strDesKtop=WshShell.SpecialFolders("DesKtop"^)
echo Set oShellLink=WshShell.CreateShortcut(strDesKtop^&"\%LnkName%.lnk"^)
echo oShellLink.TargetPath="%Program%"
 
echo oShellLink.WindowStyle=1
echo oShellLink.Save)>makelnk.vbs
 
echo tomcat�����ɹ�
makelnk.vbs
del /f /q makelnk.vbs

:: 6. sunClient
echo start install sunClient
%sunClient%

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