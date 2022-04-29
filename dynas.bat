@ echo off

%1 %2

ver|find "5.">nul&&goto :Admin

mshta vbscript:createobject("shell.application").shellexecute("%~s0","goto :Admin","","runas",1)(window.close)&goto :eof

:Admin

::1. install mysql
e:
cd mysql\mysql-5.7.16-winx64\bin
.\mysqld install
net start mysql

:: 2. install xshell
::设置文件路径
set Program=D:\git-workspace\nsis\soft\ha_Xshell_25206\Xshell+Xftp\Xshell.exe
 
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
D:\git-workspace\nsis\soft\navicat150_premium_cs_x64.exe

pause