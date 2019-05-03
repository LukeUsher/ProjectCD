align macro
	cnop 0,\1
	endm
	
; =======================================================================================
;  Sega CD Sub Program
; =======================================================================================
		org $6000

; =======================================================================================
;  Sub Module Header
; =======================================================================================
ModuleName:	dc.b 'MAIN-SUBCPU',0
ModuleVersion:	dc.w 0, 0
NextModule:	dc.l 0
ModuleSize:	dc.l 0
ModuleStartAddr:dc.l $20
ModuleWorkRAM:	dc.l 0
JumpTable:
        dc.w SP_Init-JumpTable      ; Offset to Init Function, called by the BIOS
		dc.w SP_Main-JumpTable      ; Offset to main Function, called by the BIOS after Init
		dc.w SP_IRQ-JumpTable       ; Offset to Sub-CPU IRQ2 Routine, called by BIOS on INT2
		dc.w 0


; =======================================================================================
;  SP_Init
;  Called once on initial boot, as soon as it is loaded by the Sega CD, *must* return
; =======================================================================================
SP_Init:
		rts				; Return to BIOS (which will then call SP_Main)

; =======================================================================================
;  SP_Main
;  Main routine
; =======================================================================================
SP_Main:
		bne	SP_Main

; =======================================================================================
;  SP_IRQ
;  Interrupt Request, Level 2 Interrupt routine
; =======================================================================================
SP_IRQ:
		rts
