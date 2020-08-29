; "1x1 scroll, example 4", Atari XL/XE Intro
;
; what it does:
; - 1x1-character scroll in ANTIC mode 2
; - supports up to 256 unique 1x1-fonts
; - fonts come from several separate input font sets
; - length of scroll is limited by available memory only
;
; code by tr1x / Agenda
; requirements: original Atari XL/XE 64KB PAL
; version: 1.0
; date: 2020-05-24

video	equ $4000
charset	equ $8000

rtclok	equ $0012
txtptr	equ $00c0
srcaddr	equ $00c2
dstaddr	equ $00c4
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
	lda #>charset
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

	; source address of character look data
	lda #$00
	sta srcaddr+1
	ldy #$00
	lda (txtptr),y
	asl
	rol srcaddr+1
	asl
	rol srcaddr+1
	asl
	sta srcaddr
	rol srcaddr+1

	lda #<fonts
	clc
	adc srcaddr
	sta srcaddr
	lda #>fonts
	adc srcaddr+1
	sta srcaddr+1

	; destination address to copy character look data to
	; (it can be optimized greatly)
	lda #$00
	sta dstaddr+1
	ldy #$00
	lda video+$2c
	asl
	rol dstaddr+1
	asl
	rol dstaddr+1
	asl
	sta dstaddr
	rol dstaddr+1

	lda #>charset
	clc
	adc dstaddr+1
	sta dstaddr+1

	; copy 8 bytes of character look data from source to destination
	ldy #$07
loop	lda (srcaddr),y
	sta (dstaddr),y
	dey
	bpl loop

	; move data in viewport one character left
	ldy #$00
move	lda video+1,y
	sta video,y
	iny
	cpy #$2c
	bne move

	; put new spare character
	lda video+$2b
	clc
	adc #$01
	and #$7f
	sta video+$2c

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


	; data comes from "1x1ScrollData4.json"
	icl '1X1DTA4.ASM'