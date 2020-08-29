; "2x2 scroll, example 3", Atari XL/XE Intro
;
; what it does:
; - 2x2-character scroll in ANTIC mode 4 (4 colors + background)
; - supports up to 128 unique color 2x2-fonts
; - fonts come from several separate input font sets
; - length of scroll is limited by available memory only
;
; code by tr1x / Agenda
; requirements: original Atari XL/XE 64KB PAL
; version: 1.0
; date: 2020-06-10

video1	equ $4000
video2	equ $4040
charset	equ $8000

rtclok	equ $0012
txtptr	equ $00c0
srcaddr	equ $00c2
dstaddr	equ $00c4
chcntr	equ $00c6
vdslst	equ $0200
sdlstl	equ $0230
color0	equ $02c4
color1	equ $02c5
color2	equ $02c6
color3	equ $02c7
chbas	equ $02f4
hscrol	equ $d404
chbase	equ $d409
wsync	equ $d40a
vcount	equ $d40b
nmien	equ $d40e
nmivec	equ $fffa

	org $600

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

	; set character set
	lda #>charset
	sta chbas

	lda #$04
	sta chcntr

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
	rol srcaddr+1
	asl
	rol srcaddr+1
	asl
	rol srcaddr+1
	sta srcaddr

	lda #<fonts
	clc
	adc srcaddr
	sta srcaddr
	lda #>fonts
	adc srcaddr+1
	sta srcaddr+1

	; destination address to copy character look data to
	; (it can be optimized at least a little bit)
	lda #$00
	sta dstaddr+1
	lda video1+$2c
	asl
	rol dstaddr+1
	asl
	rol dstaddr+1
	asl
	rol dstaddr+1
	sta dstaddr

	lda #>charset
	clc
	adc dstaddr+1
	sta dstaddr+1

	; copy 32 bytes of character look data from source to destination
	ldy #$20
loop	lda (srcaddr),y
	sta (dstaddr),y
	dey
	bpl loop

	; move data in viewport two characters left
	ldy #$00
move	lda video1+2,y
	sta video1,y
	lda video2+2,y
	sta video2,y
	iny
	cpy #$2c
	bne move

	; put new spare characters
	lda chcntr
	sta video1+$2c
	clc
	adc #$01
	sta video1+$2d
	adc #$01
	ora #$80
	sta video2+$2c
	adc #$01
	sta video2+$2d
	adc #$01
	and #$7f
	sta chcntr

	; point to the next character of scroll text
	inc txtptr
	bne skip1
	inc txtptr+1
skip1

	; check if it is the end of scroll text
	lda txtptr
	cmp #<textend
	bne skip2
	lda txtptr+1
	cmp #>textend
	bne skip2

	; initialize text pointer to the first character of scroll text
	lda <text
	sta txtptr
	lda >text
	sta txtptr+1

skip2	jmp main


	; display list
dlist	.byte $70, $70, $70		; 24 blank lines
	.byte $04 | $40 | $10		; mode 4 + LMS + HSCROLL
	.byte $00, $40			; screen address
	.byte $04 | $40 | $10		; mode 4 + LMS + HSCROLL
	.byte $40, $40			; screen address
	.byte $41			; jump and wait for VBLANK
	.byte <dlist, >dlist		; jump to this address


	; data comes from "2x2ScrollData3.json"
	icl '2X2DTA3.ASM'