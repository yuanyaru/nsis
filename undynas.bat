@ echo off

%1 %2

ver|find "5.">nul&&goto :Admin

mshta vbscript:createobject("shell.application").shellexecute("%~s0","goto :Admin","","runas",1)(window.close)&goto :eof

:Admin

set mysql=d:

::1.remove mysql
%mysql%
cd d:\\nsis\\soft\\mysql\\mysql-5.7.16-winx64\\bin
net stop mysql
.\mysqld --remove mysql

:: 2. remove xshell
del /q %userprofile%\Desktop\xshell*.lnk
echo xshell移除成功

:: 3. remove tomcat
del /q %userprofile%\Desktop\tomcat*.lnk
echo tomcat移除成功

::exit
pause