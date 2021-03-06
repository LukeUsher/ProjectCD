align macro
	cnop 0,\1
	endm
; =======================================================================================
;  Sega CD Header (Based on Sonic CD's header)
; =======================================================================================
DiscType:	dc.b 'SEGADISCSYSTEM  '		; Disc Type (Must be SEGADISCSYSTEM)
VolumeName:	dc.b 'SEGACDGAME ',0		; Disc ID
VolumeSystem:	dc.w $100, $1			; System ID, Type
SystemName:	dc.b 'SEGACDGAME ',0		; System Name
SystemVersion:	dc.w 0,0			; System Version, Type
IP_Addr:	dc.l $800			; IP Start Address (Must be $800)
IP_Size:	dc.l $800			; IP End Address (Must be $800)
IP_Entry:	dc.l 0
IP_WorkRAM:	dc.l 0
SP_Addr:	dc.l $1000			; SP Start Address (Must be $1000)
SP_Size:	dc.l $7000			; SP End Address (Must be $7000)
SP_Entry:	dc.l 0
SP_WorkRAM:	dc.l 0
		align $100			; Pad to $100
		
; =======================================================================================
;  Game Header
; =======================================================================================	
HardwareType:	dc.b 'SEGA MEGA DRIVE '
Copyright:	dc.b '(C)LUKE 2010.OCT'
NativeName:	dc.b 'SEGA CD TEST GAME                               '
OverseasName:	dc.b 'SEGA CD TEST GAME                               '
DiscID:		dc.b 'GM 00-0000-00   '
IO:		dc.b 'J               '
		; Modem information, notes, and padding, left undefined as it is not used
		; Padded to $1F0 instead (Start of Region Code)
		align $1F0
Region:		dc.b 'E               '
; ========================================================================================
;  IP (Includes security sector)
; ========================================================================================	
		incbin "ip.bin";
; =======================================================================================
;  Sub CPU Program (SP)
; =======================================================================================
		align	$1000
		incbin	"sp.bin"
; =======================================================================================
;  Padding, to $8000 (Size of boot area of iso)
; =======================================================================================	
		align	$8000
