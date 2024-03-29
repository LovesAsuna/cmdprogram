@echo off & setlocal enabledelayedexpansion & color 0a
title 图片捆绑程序By忘却的旋律
rem 确定压缩文件后缀
:suffix
choice /c zr /n /m "请输入压缩文件的后缀(z[zip] or r[rar]):"
if /i "%errorlevel%" equ "1" set d=zip & goto photosuffix
if /i "%errorlevel%" equ "2" set d=rar & goto photosuffix
cls 
ping /n 2 127>nul & cls
goto suffix


rem 确定图片后缀
:photosuffix
choice /c jp /n /m "请输入压缩文件的后缀(j[jpg] or p[png]):"
if /i "%errorlevel%" equ "1" set f=jpg & goto repare
if /i "%errorlevel%" equ "2" set f=png & goto repare
cls 
ping /n 2 127>nul & cls
goto photosuffix


:repare
::图片寻找
dir /b|findstr /i "%f%">图片名字.txt
for /f "delims=" %%i in (图片名字.txt) do (
  set a=%%i
  )
::压缩文件寻找
dir /b|findstr /i "%d%">压缩名字.txt
for /f "delims=" %%i in (压缩名字.txt) do (
  set b=%%i
  )
 cls
 echo 已帮您自动搜寻到结果 
 echo 图片寻找结果:%a%
 echo 压缩文件寻找结果:%b%
del 图片名字.txt & del 压缩名字.txt
rem 检测自动搜索
set arepair=%a:~-3%
set brepair=%b:~-3%
if /i %arepair% neq %f% goto input
if /i %brepair% neq %d% goto input
goto run

:input
cls
echo                              自动检索失败请手动输入
ping/n 2 127>nul & cls
echo 手动输入压缩文件与图片名称:
set /p b=压缩文件：
set /p a=图片：
goto run

:run
echo 请按任意键确认压缩
pause>nul
cls
set /p c=请输入制得图片名字(不带后缀):
copy /b %a%+%b% %c%.jpg>nul
for /l %%i in (5,-1,0) do (
  echo 制作完成，将在 %%i 内自动退出
  ping -n 2 127.0.0.1>nul
  cls
  )
