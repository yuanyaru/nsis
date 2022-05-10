@ echo off

:: 配置软件路径
set mysql=d:
set mdfmysql=D:\nsis\soft\modifySqlPas.exe
set Xshell=D:\nsis\soft\ha_Xshell_25206\Xshell+Xftp\Xshell.exe
set navicat=D:\nsis\soft\navicat150_premium_cs_x64.exe
set jdk=D:\nsis\soft\jdk-8u66-windows-x64.exe
set tomcat=D:\nsis\soft\apache-tomcat-8.0.35\bin\startup.bat
set sunClient=D:\nsis\soft\SunloginClient_12.5.1.45098_x64.exe

:: 配置环境变量
setx MYSQL_HOME D:\nsis\soft\mysql\mysql-5.7.16-winx64
setx JAVA_HOME D:\java\jdk1.8
setx CATALINA_HOME D:\nsis\soft\apache-tomcat-8.0.35

setx /m CLASSPATH .;%JAVA_HOME%\lib\dt.jar;%JAVA_HOME%\lib\tools.jar
setx /m Path "%Path%;%MYSQL_HOME%\bin;%JAVA_HOME%\bin;%JAVA_HOME%\jre\bin;%CATALINA_HOME%\bin"

::1. install mysql
%mysql%
cd d:\nsis\\soft\\mysql\\mysql-5.7.16-winx64\\bin
.\mysqld install
net start mysql
::set password
%mdfmysql%

:: 2. install xshell
::设置文件路径
set Program=%Xshell%
 
::设置快捷方式名称
set LnkName=Xshell
 
(echo Set WshShell=CreateObject("WScript.Shell"^)
echo strDesKtop=WshShell.SpecialFolders("DesKtop"^)
echo Set oShellLink=WshShell.CreateShortcut(strDesKtop^&"\%LnkName%.lnk"^)
echo oShellLink.TargetPath="%Program%"
 
echo oShellLink.WindowStyle=1
echo oShellLink.Save)>makelnk.vbs
 
echo xshell创建成功
makelnk.vbs
del /f /q makelnk.vbs

:: 3. install navicat
echo start install navicat
%navicat%

:: 4. install jdk
echo start install jdk
%jdk%

:: 5. tomcat
::设置文件路径
set Program=%tomcat%
 
::设置快捷方式名称
set LnkName=tomcat
 
(echo Set WshShell=CreateObject("WScript.Shell"^)
echo strDesKtop=WshShell.SpecialFolders("DesKtop"^)
echo Set oShellLink=WshShell.CreateShortcut(strDesKtop^&"\%LnkName%.lnk"^)
echo oShellLink.TargetPath="%Program%"
 
echo oShellLink.WindowStyle=1
echo oShellLink.Save)>makelnk.vbs
 
echo tomcat创建成功
makelnk.vbs
del /f /q makelnk.vbs

:: 6. sunClient
echo start install sunClient
%sunClient%

pause