@echo off
set dirname=%~n1
title �u%dirname%�vTIFtoPDF

set im=C:\Progra~1\ImageMagick-7.0.8-Q8
set basedir=.
if not '%1'=='' set basedir=%1

timeout /t 1 > nul

md "C:\IMtemp\%dirname%"

for %%f in (%basedir%\*.tif) do (
%im%\convert.exe "%%f" -limit Thread 1 -limit Memory 512MiB -compress LZW "C:\IMtemp\%dirname%\%%~nf.pdf" > nul 2>&1
echo [%%~nxf]
)

cd C:\IMtemp\%dirname%

pdftk *.pdf cat output "C:\IMtemp\%dirname%.pdf"

cd C:\IMtemp

rem ��������PDF�̈ړ�����p�X�Ŏw��
move "%dirname%.pdf" "C:\Users\USER_NAME\Desktop\out1" > nul

rd /s /q "C:\IMtemp\%dirname%"

rem pause

goto :EOF