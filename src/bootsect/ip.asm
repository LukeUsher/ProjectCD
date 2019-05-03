align macro
	cnop 0,\1
	endm


; ========================================================================================
;  Security Sector
;  This is required to be bit-for-bit identical to the copy in BIOS, otherwise the
;  disc is rejected
; ========================================================================================

SecurityCode:	; Uncomment the correct one for your target region
;		incbin "security\jap.bin"
;		incbin "security\eur.bin"
		incbin "security\usa.bin"

		; All Security sectors differ in size, the main-cpu bios jumps to the code and then falls through after
		; the SEGA logo. In order to prevent issues with using region-change patches after the fact,
		; we jump to the actual entry point, and pad it out to $600 bytes (big enough for the largest security sector)
		;
		bra IP_Start
		align $600

IP_Start:
    move.l	#$C0000000, $C00004
    move.l  #64, d0
SetPaletteLoop:
    move.w	#$0F00, $C00000
    dbf	d0, SetPaletteLoop

Loop:
	bra Loop