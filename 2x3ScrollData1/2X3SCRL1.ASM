; "2x3 scroll, example 1", Atari XL/XE Intro
;
; what it does:
; - 2x3-character scroll in ANTIC mode 2
; - supports up to 64 unique 2x3-fonts
; - fonts come from several separate input font sets
; - length of scroll is limited by available memory only
; - uses DLI to set character base address for upper, middle
;   and lower parts of fonts
;
; code by tr1x / Agenda
; requirements: original Atari XL/XE 64KB PAL
; version: 1.0
; date: 2020-07-02

.IF fonts0e - fonts0 > 1024
    .ERROR 'Fonts data is too big!'
.ENDIF

video1	equ $4000
video2	equ $4040
video3	equ $4080

rtclok	equ $0012
txtptr	equ $00c0
vdslst	equ $0200
sdlstl	equ $0230
color0	equ $02c4
color1	equ $02c5
color2	equ $02c6
color3	equ $02c7
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

	; set colors
	lda #$88
	sta color0
	lda #$86
	sta color2
	lda #$84
	sta color1
	lda #$82
	sta color3

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
	lda video3+2,y
	sta video3,y
	iny
	cpy #$2a
	bne move

	; put new character of scroll text
	ldy #$00
	lda (txtptr),y
	asl
	sta video1+$2a
	sta video2+$2a
	sta video3+$2a
	clc
	adc #$01
	sta video1+$2b
	sta video2+$2b
	sta video3+$2b

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
	lda #<dli3
	sta vdslst
	lda #>dli3
	sta vdslst+1
	pla
	rti
	
dli3	pha
	lda #>fonts2
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
	.byte $04 | $80 | $40 | $10	; mode 4 + DLI + LMS + HSCROLL
	.byte $00, $40			; screen address
	.byte $04 | $80 | $40 | $10	; mode 4 + DLI + LMS + HSCROLL
	.byte $40, $40			; screen address
	.byte $04 | $40 | $10		; mode 4 + LMS + HSCROLL
	.byte $80, $40			; screen address
	.byte $41			; jump and wait for VBLANK
	.byte <dlist, >dlist		; jump to this address

	; data comes from "2x3ScrollData1.json"
	icl '2X3DTA1.ASM'