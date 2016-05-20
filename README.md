# ProjectCD
Sega/Mega CD Boot Loader

Requires mkisofs and SN Systems asm68k to either be in PATH or a 'bin' sub-folder of this project

The bootloader expects a raw 68000 binary with base address and entry point of $200000 to be placed at filesystem\M_INIT.PRG
The payload is loaded into Word-RAM and has a maximum filesize of 256KB

Projects using this boot loader:
  - [240p Test Suite (Sega/Mega CD Version)](http://junkerhq.net/xrgb/index.php/240p_test_suite)
  - [Sonic The Hedgehog 1 for Sega CD](http://info.sonicretro.org/Sonic_the_Hedgehog_1_for_SegaCD)
  - Probably more that I don't know about
  
