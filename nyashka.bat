del /Q %1.*
copy "C:\Program Files (x86)\kurava\include\io.inc" io.inc
"C:\Program Files (x86)\kurava\NASM\nasm.exe" -g -f win32 ..\%1.asm -o .\%1.obj -i ../
"C:/Program Files (x86)/kurava/MinGW/bin/gcc.exe" .\%1.obj -g -o .\%1.exe -m32
