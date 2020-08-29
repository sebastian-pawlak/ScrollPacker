; "1x1 scroll, example 1", Atari XL/XE Intro
;
; what it does:
; - 1x1-character scroll in ANTIC mode 2
; - supports up to 128 unique 1x1-fonts
; - fonts come from several separate input font sets
; - length of scroll is limited by available memory only
;
; code by tr1x / Agenda
; requirements: original Atari XL/XE 64KB PAL
; version: 1.0
; date: 2020-05-24

video	equ $4000

rtclok	equ $0012
txtptr	equ $00c0
vdslst	equ $0200
sdlstl	equ $0230
chbas	equ $02f4
hscrol	equ $d404
wsync	equ $d40a
vcount	equ $d40b

	org $600

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

	; set character set
	lda #>fonts
	sta chbas

	ldx #$03
main	stx hscrol

	; delay
	lda rtclok+2
delay	cmp rtclok+2
	beq delay

	dex
	bpl main
	ldx #$03
	stx hscrol

	; move data in viewport one character left
	ldy #$00
move	lda video+1,y
	sta video,y
	iny
	cpy #$2b
	bne move

	; put new character of scroll text
	ldy #$00
	lda (txtptr),y
	sta video+$2b

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


	; display list
dlist	.byte $70, $70, $70		; 24 blank lines
	.byte $02 | $40 | $10		; mode 2 + LMS + HSCROLL
	.byte $00, $40			; screen address
	.byte $41			; jump and wait for VBLANK
	.byte <dlist, >dlist		; jump to this address


	; data comes from "1x1ScrollData1.json"
	icl '1X1DTA1.ASM'