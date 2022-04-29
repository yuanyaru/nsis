@ echo off

%1 %2

ver|find "5.">nul&&goto :Admin

mshta vbscript:createobject("shell.application").shellexecute("%~s0","goto :Admin","","runas",1)(window.close)&goto :eof

:Admin

::1. install mysql
::e:
::cd mysql\mysql-5.6.17-winx64
::mysqld install
::net start mysql

:: 2. install xshell
::设置文件路径
@echo off
set Program=D:\install_package\ha_Xshell_25206\Xshell+Xftp\Xshell.exe
 
::设置快捷方式名称
set LnkName=Xshell
 
::设置快捷方式的备注
set Desc=测试
 
(echo Set WshShell=CreateObject("WScript.Shell"^)
echo strDesKtop=WshShell.SpecialFolders("DesKtop"^)
echo Set oShellLink=WshShell.CreateShortcut(strDesKtop^&"\%LnkName%.lnk"^)
echo oShellLink.TargetPath="%Program%"
 
echo oShellLink.WindowStyle=1
echo oShellLink.Description="%Desc%"
echo oShellLink.Save)>makelnk.vbs
 
echo 桌面快捷方式创建成功
makelnk.vbs
del /f /q makelnk.vbs
::exit

pause