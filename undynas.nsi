# name installer
OutFile "undynas.exe"
 
# default section start
Section
	# 创建一个弹出框
	MessageBox  MB_OK  "Now We are uninstalling soft in your computer!"
	
	# 卸载
	ExecWait "undynas.bat"
	#nsExec::Exec "$INSTDIR\nsis.bat" 
 
# default section end
SectionEnd