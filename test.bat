@echo off
set file=test.ini

set user1=
set pwd1=
set user2=
set pwd2=

call:readini %file% test1 user user1
call:readini %file% test1 pwd pwd1
call:readini %file% test2 user user2
call:readini %file% test2 pwd pwd2
call:readini %file% test3 user user3
call:readini %file% test3 pwd pwd3

echo %user1%:%pwd1%
echo %user2%:%pwd2%
echo %user3%:%pwd3%

pause
exit

:: 读取ini配置. %~1:文件名，%~2:域，%~3:key %~4:返回的value值
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