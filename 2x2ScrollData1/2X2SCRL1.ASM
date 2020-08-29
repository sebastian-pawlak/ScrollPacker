; "2x2 scroll, example 1", Atari XL/XE Intro
;
; what it does:
; - 2x2-character scroll in ANTIC mode 2
; - supports up to 64 unique 2x2-fonts
; - fonts come from several separate input font sets
; - length of scroll is limited by available memory only
; - uses DLI to set character base address for upper and lower parts of fonts
;
; code by tr1x / Agenda
; requirements: original Atari XL/XE 64KB PAL
; version: 1.0
; date: 2020-05-24

.IF fonts0e - fonts0 > 1024
    .ERROR 'Fonts data is too big! This method supports up to 64 unique '\
           '2x2-fonts. Please, check the other example which allows you '\
           'to have more unique 2x2-fonts.'
.ENDIF

video1	equ $4000
video2	equ $4040

rtclok	equ $0012
txtptr	equ $00c0
vdslst	equ $0200
sdlstl	equ $0230
hscrol	equ $d404
chbase	equ $d409
wsync	equ $d40a
vcount	equ $d40b
nmien	equ $d40e
nmivec	equ $fffa

	org $600

	; wait one frame
	lda rtclok+2
wait	cmp rtclok+2
	beq wait

	; set DLI routine
	lda #$40
	sta nmien	; disable DLI
	lda #<dli1
	sta vdslst
	lda #>dli1
	sta vdslst+1
	lda #$c0
	sta nmien	; enable DLI

	; set display list
	lda #<dlist
	sta sdlstl
	lda #>dlist
	sta sdlstl+1

	; initialize text pointer to the first character of scroll text
	lda <text
	sta txtptr
	lda >text
	sta txtptr+1

	ldx #$07
main	stx hscrol

	; delay
	lda rtclok+2
delay	cmp rtclok+2
	beq delay

	dex
	bpl main
	ldx #$07
	stx hscrol

	; move data in viewport two characters left
	ldy #$00
move	lda video1+2,y
	sta video1,y
	lda video2+2,y
	sta video2,y
	iny
	cpy #$2a
	bne move

	; put new character of scroll text
	ldy #$00
	lda (txtptr),y
	asl
	sta video1+$2a
	sta video2+$2a
	clc
	adc #$01
	sta video1+$2b
	sta video2+$2b

	; point to the next character of scroll text
	inc txtptr
	bne skip
	inc txtptr+1
skip

	; check if it is the end of scroll text
	lda txtptr
	cmp #<textend
	bne main
	lda txtptr+1
	cmp #>textend
	bne main

	; initialize text pointer to the first character of scroll text
	lda <text
	sta txtptr
	lda >text
	sta txtptr+1

	jmp main


	; display list interrupt routines
dli1	pha
	lda #>fonts0
	sta wsync
	sta chbase
	lda #<dli2
	sta vdslst
	lda #>dli2
	sta vdslst+1
	pla
	rti

dli2	pha
	lda #>fonts1
	sta wsync
	sta chbase
	lda #<dli1
	sta vdslst
	lda #>dli1
	sta vdslst+1
	pla
	rti


	; display list
dlist	.byte $70, $70			; 16 blank lines
	.byte $70 | $80			; 8 blank lines + DLI
	.byte $02 | $80 | $40 | $10	; mode 2 + DLI + LMS + HSCROLL
	.byte $00, $40			; screen address
	.byte $02 | $40 | $10		; mode 2 + LMS + HSCROLL
	.byte $40, $40			; screen address
	.byte $41			; jump and wait for VBLANK
	.byte <dlist, >dlist		; jump to this address


	; data comes from "2x2ScrollData1.json"
	icl '2X2DTA1.ASM'