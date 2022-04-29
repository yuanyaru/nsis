@ echo off

%1 %2

ver|find "5.">nul&&goto :Admin

mshta vbscript:createobject("shell.application").shellexecute("%~s0","goto :Admin","","runas",1)(window.close)&goto :eof

:Admin

::1.remove mysql
::e:
::cd mysql\mysql-5.6.17-winx64\bin
::net stop mysql
::mysqld --remove mysql

:: 2. remove xshell
del /q %userprofile%\Desktop\xshell*.lnk
::exit
pause