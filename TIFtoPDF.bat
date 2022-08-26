@echo off
set dirname=%~n1
title 「%dirname%」TIFtoPDF

set im=C:\Progra~1\ImageMagick-7.0.8-Q8
set basedir=.
if not '%1'=='' set basedir=%1

timeout /t 1 > nul

md "C:\IMtemp\%dirname%"

rem tifを１つずつPDFに変換し作業フォルダに書き出し
for %%f in (%basedir%\*.tif) do (
%im%\convert.exe "%%f" -limit Thread 1 -limit Memory 512MiB -compress LZW "C:\IMtemp\%dirname%\%%~nf.pdf" > nul 2>&1
echo [%%~nxf]
)

cd C:\IMtemp\%dirname%

rem PDFを結合しフォルダ名と同じ名前で生成
pdftk *.pdf cat output "C:\IMtemp\%dirname%.pdf"

cd C:\IMtemp

rem 完成したPDFの移動先をパスで指定
move "%dirname%.pdf" "C:\Users\USER_NAME\Desktop\out1" > nul

rd /s /q "C:\IMtemp\%dirname%"

rem pause

goto :EOF
