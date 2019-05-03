@echo off

PATH=%CD%\bin;%PATH%
SET ROOT_DIR=%CD%
SET SRC_DIR=%ROOT_DIR%\src
SET BUILD_DIR=%ROOT_DIR%\build

ECHO Building Boot Sector IP.BIN
cd %SRC_DIR%\bootsect
asm68k /p ip.asm, ip.bin

ECHO Building Boot Sector SP.BIN
asm68k /p sp.asm, sp.bin

ECHO Building Boot Sector Binary
asm68k /p bootsect.asm, %BUILD_DIR%\bootsect.bin
del *.bin
cd %ROOT_DIR%

ECHO Building ISO
mkisofs -iso-level 1 -G  %BUILD_DIR%\bootsect.bin -o out.iso -pad filesystem

pause

