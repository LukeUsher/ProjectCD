@echo off

ECHO Building Filesystem image stage 1:

mkisofs -iso-level 1 -o filesystem.img -pad _filesystem

ECHO Building Filesystem image stage 2:

REM trimfsimage removes the first 8000 bytes of an ISO, leaving just the filesystem behind

trimfsimage filesystem.img filesystem.bin
del filesystem.img

ECHO Building IP
cd _boot
..\asm68k /p ip.asm, ip.bin

ECHO Building sub-cpu program
..\asm68k /p sp.asm, sp.bin

ECHO Building final ISO
cd ..\
asm68k /p main.asm, out.iso

del filesystem.bin

pause

