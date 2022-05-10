# name installer
OutFile "dynas.exe"
 
# default section start
Section
	# 创建一个弹出框
	MessageBox  MB_OK  "Now We are installing soft in your computer!"
	
	# 在用户环境变量中新建MYSQL_HOME
	#WriteRegExpandStr HKCU "Environment" "MYSQL_HOME" "E:\mysql\mysql-5.6.17-winx64"
	#WriteRegExpandStr HKCU "Environment" "JAVA_HOME" "E:\java\jdk1.8"
	#WriteRegExpandStr HKCU "Environment" "TOMCAT_HOME" "D:\git-workspace\nsis\soft\apache-tomcat-8.0.35"
	# 将路径添加到系统环境变量
	#ReadRegStr $0 HKLM "SYSTEM\CurrentControlSet\Control\Session Manager\Environment" "Path"
	#WriteRegExpandStr HKLM "SYSTEM\CurrentControlSet\Control\Session Manager\Environment" "Path" "$0;%MYSQL_HOME%\bin"
	#WriteRegExpandStr HKLM "SYSTEM\CurrentControlSet\Control\Session Manager\Environment" "Path" "$0;%JAVA_HOME%\bin;%JAVA_HOME%\jre\bin"
	
	ExecWait "dynas.bat"

	#nsExec::Exec "$INSTDIR\nsis.bat" 
	
# default section end
SectionEnd