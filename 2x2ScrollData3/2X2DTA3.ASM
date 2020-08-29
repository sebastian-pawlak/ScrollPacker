; "Scroll Packer" v0.1, 2020-07-16 22:28:43, "2x2ScrollData3\2x2ScrollData3.json"

	org $900

; scroll text, length: 194, unique characters: 103
text	.byte $00, $01, $02, $03, $00, $04, $05, $03	;  Hey guy
	.byte $06, $07, $00, $08, $09, $0a, $06, $00	; s! It's 
	.byte $09, $0b, $02, $00, $0c, $02, $0d, $0e	; the demo
	.byte $00, $0e, $0f, $00, $10, $11, $12, $13	;  of SCRO
	.byte $14, $14, $00, $15, $16, $11, $17, $18	; LL PACKE
	.byte $12, $19, $00, $1a, $1b, $00, $08, $10	; R[...] [Atari left][Atari right] IS
	.byte $00, $1c, $01, $18, $00, $1d, $18, $10	;  THE BES
	.byte $1c, $07, $00, $1e, $02, $00, $1f, $00	; T! We [heart] 
	.byte $03, $0e, $05, $07, $00, $20, $21, $02	; you! Gże
	.byte $04, $21, $22, $23, $24, $25, $00, $20	; gżółka G
	.byte $26, $18, $20, $26, $27, $28, $17, $16	; ŻEGŻÓŁKA
	.byte $00, $00, $00, $16, $1d, $11, $29, $18	;    ABCDE
	.byte $2a, $20, $01, $08, $2b, $17, $14, $2c	; FGHIJKLM
	.byte $2d, $13, $15, $2e, $12, $10, $1c, $2f	; NOPQRSTU
	.byte $30, $1e, $31, $32, $33, $25, $34, $35	; VWXYZabc
	.byte $0c, $02, $0f, $04, $0b, $36, $37, $24	; defghijk
	.byte $38, $0d, $39, $0e, $3a, $3b, $3c, $06	; lmnopqrs
	.byte $09, $05, $3d, $3e, $3f, $03, $40, $41	; tuvwxyz0
	.byte $42, $43, $44, $45, $46, $47, $48, $49	; 12345678
	.byte $4a, $4b, $4c, $4d, $28, $4e, $27, $4f	; 9ĄĆĘŁŃÓŚ
	.byte $50, $26, $51, $52, $53, $54, $22, $55	; ŹŻąćęńóś
	.byte $56, $21, $57, $58, $59, $5a, $07, $5b	; źż.,:_!?
	.byte $5c, $5d, $0a, $5e, $5f, $60, $61, $62	; \/'()%&+
	.byte $63, $64, $00, $65, $00, $66, $00, $00	; -= [happy face] [sad face]  
	.byte $00, $00	;   
textend

	org $7000

; fonts data
fonts	.byte $00, $00, $00, $00, $00, $00, $00, $00	; " " {uppercase} 0_0
	.byte $00, $00, $00, $00, $00, $00, $00, $00	; " " {uppercase} 1_0
	.byte $00, $00, $00, $00, $00, $00, $00, $00	; " " {uppercase} 0_1
	.byte $00, $00, $00, $00, $00, $00, $00, $00	; " " {uppercase} 1_1
	.byte $50, $50, $50, $f0, $f0, $f0, $f0, $aa	; "H" {uppercase} 0_0
	.byte $04, $04, $04, $0c, $0c, $0c, $0c, $a8	; "H" {uppercase} 1_0
	.byte $a0, $a0, $a0, $f0, $f0, $f0, $f0, $00	; "H" {uppercase} 0_1
	.byte $08, $08, $08, $0c, $0c, $0c, $0c, $00	; "H" {uppercase} 1_1
	.byte $00, $00, $00, $03, $0c, $30, $f0, $a0	; "e" {lowercase} 0_0
	.byte $00, $00, $00, $c0, $30, $0c, $0c, $08	; "e" {lowercase} 1_0
	.byte $aa, $a0, $a0, $f0, $30, $0c, $03, $00	; "e" {lowercase} 0_1
	.byte $a0, $00, $00, $00, $0c, $30, $c0, $00	; "e" {lowercase} 1_1
	.byte $00, $00, $00, $c0, $c0, $c0, $c0, $80	; "y" {lowercase} 0_0
	.byte $00, $00, $00, $3c, $3c, $3c, $3c, $28	; "y" {lowercase} 1_0
	.byte $20, $20, $0a, $00, $00, $30, $0f, $00	; "y" {lowercase} 0_1
	.byte $28, $28, $a8, $3c, $3c, $30, $c0, $00	; "y" {lowercase} 1_1
	.byte $00, $00, $00, $0f, $30, $c0, $c0, $80	; "g" {lowercase} 0_0
	.byte $00, $00, $00, $00, $c0, $30, $3c, $28	; "g" {lowercase} 1_0
	.byte $80, $20, $0a, $00, $00, $30, $0f, $00	; "g" {lowercase} 0_1
	.byte $28, $28, $a8, $3c, $3c, $30, $c0, $00	; "g" {lowercase} 1_1
	.byte $00, $00, $00, $f0, $f0, $f0, $f0, $a0	; "u" {lowercase} 0_0
	.byte $00, $00, $00, $0c, $0c, $0c, $0c, $08	; "u" {lowercase} 1_0
	.byte $a0, $a0, $a0, $f0, $30, $0c, $03, $00	; "u" {lowercase} 0_1
	.byte $08, $08, $08, $0c, $0c, $30, $c0, $00	; "u" {lowercase} 1_1
	.byte $00, $00, $00, $0f, $30, $f0, $f0, $a0	; "s" {lowercase} 0_0
	.byte $00, $00, $00, $c0, $30, $0c, $0c, $00	; "s" {lowercase} 1_0
	.byte $20, $0a, $00, $00, $c0, $30, $0f, $00	; "s" {lowercase} 0_1
	.byte $00, $80, $20, $0c, $0c, $30, $c0, $00	; "s" {lowercase} 1_1
	.byte $05, $05, $05, $0f, $0f, $0f, $0f, $0a	; "!" {specialcharacters} 0_0
	.byte $00, $00, $00, $00, $00, $00, $00, $00	; "!" {specialcharacters} 1_0
	.byte $0a, $0a, $00, $00, $0f, $0f, $0f, $00	; "!" {specialcharacters} 0_1
	.byte $00, $00, $00, $00, $00, $00, $00, $00	; "!" {specialcharacters} 1_1
	.byte $05, $01, $01, $03, $03, $03, $03, $02	; "I" {uppercase} 0_0
	.byte $50, $40, $40, $c0, $c0, $c0, $c0, $80	; "I" {uppercase} 1_0
	.byte $02, $02, $02, $03, $03, $03, $0f, $00	; "I" {uppercase} 0_1
	.byte $80, $80, $80, $c0, $c0, $c0, $f0, $00	; "I" {uppercase} 1_1
	.byte $01, $01, $01, $3f, $03, $03, $03, $02	; "t" {lowercase} 0_0
	.byte $40, $40, $40, $fc, $c0, $c0, $c0, $80	; "t" {lowercase} 1_0
	.byte $02, $02, $02, $03, $03, $00, $00, $00	; "t" {lowercase} 0_1
	.byte $80, $80, $80, $c0, $cc, $cc, $30, $00	; "t" {lowercase} 1_1
	.byte $01, $01, $01, $03, $03, $00, $00, $00	; "'" {specialcharacters} 0_0
	.byte $40, $40, $40, $c0, $c0, $00, $00, $00	; "'" {specialcharacters} 1_0
	.byte $00, $00, $00, $00, $00, $00, $00, $00	; "'" {specialcharacters} 0_1
	.byte $00, $00, $00, $00, $00, $00, $00, $00	; "'" {specialcharacters} 1_1
	.byte $50, $50, $50, $f3, $fc, $f0, $f0, $a0	; "h" {lowercase} 0_0
	.byte $00, $00, $00, $c0, $30, $0c, $0c, $08	; "h" {lowercase} 1_0
	.byte $a0, $a0, $a0, $f0, $f0, $f0, $f0, $00	; "h" {lowercase} 0_1
	.byte $08, $08, $08, $0c, $0c, $0c, $0c, $00	; "h" {lowercase} 1_1
	.byte $00, $00, $00, $0f, $30, $c0, $c0, $80	; "d" {lowercase} 0_0
	.byte $14, $14, $14, $3c, $fc, $3c, $3c, $28	; "d" {lowercase} 1_0
	.byte $c0, $c0, $c0, $c0, $c0, $30, $0f, $00	; "d" {lowercase} 0_1
	.byte $28, $28, $28, $3c, $3c, $fc, $3c, $00	; "d" {lowercase} 1_1
	.byte $00, $00, $00, $f0, $f0, $fc, $fc, $a2	; "m" {lowercase} 0_0
	.byte $00, $00, $00, $0c, $0c, $3c, $3c, $88	; "m" {lowercase} 1_0
	.byte $a2, $a0, $a0, $f0, $f0, $f0, $f0, $00	; "m" {lowercase} 0_1
	.byte $88, $08, $08, $0c, $0c, $0c, $0c, $00	; "m" {lowercase} 1_1
	.byte $00, $00, $00, $03, $0c, $30, $f0, $a0	; "o" {lowercase} 0_0
	.byte $00, $00, $00, $c0, $30, $0c, $0c, $08	; "o" {lowercase} 1_0
	.byte $a0, $a0, $a0, $f0, $30, $0c, $03, $00	; "o" {lowercase} 0_1
	.byte $08, $08, $08, $0c, $0c, $30, $c0, $00	; "o" {lowercase} 1_1
	.byte $00, $01, $05, $0f, $0f, $0f, $0f, $0a	; "f" {lowercase} 0_0
	.byte $50, $00, $00, $00, $00, $00, $00, $00	; "f" {lowercase} 1_0
	.byte $aa, $0a, $0a, $0f, $0f, $0f, $0f, $00	; "f" {lowercase} 0_1
	.byte $a0, $00, $00, $00, $00, $00, $00, $00	; "f" {lowercase} 1_1
	.byte $01, $04, $10, $f0, $f0, $f0, $30, $08	; "S" {uppercase} 0_0
	.byte $40, $10, $04, $0c, $00, $00, $00, $00	; "S" {uppercase} 1_0
	.byte $02, $00, $00, $00, $c0, $30, $0f, $00	; "S" {uppercase} 0_1
	.byte $80, $20, $08, $0c, $0c, $30, $c0, $00	; "S" {uppercase} 1_1
	.byte $01, $04, $10, $f0, $f0, $f0, $f0, $a0	; "C" {uppercase} 0_0
	.byte $40, $10, $04, $0c, $00, $00, $00, $00	; "C" {uppercase} 1_0
	.byte $a0, $a0, $a0, $f0, $30, $0c, $03, $00	; "C" {uppercase} 0_1
	.byte $00, $00, $00, $0c, $0c, $30, $c0, $00	; "C" {uppercase} 1_1
	.byte $55, $50, $50, $f0, $f0, $f0, $f0, $aa	; "R" {uppercase} 0_0
	.byte $40, $10, $04, $0c, $0c, $0c, $30, $80	; "R" {uppercase} 1_0
	.byte $a2, $a0, $a0, $f0, $f0, $f0, $f0, $00	; "R" {uppercase} 0_1
	.byte $00, $80, $80, $30, $30, $0c, $0c, $00	; "R" {uppercase} 1_1
	.byte $01, $04, $10, $f0, $f0, $f0, $f0, $a0	; "O" {uppercase} 0_0
	.byte $40, $10, $04, $0c, $0c, $0c, $0c, $08	; "O" {uppercase} 1_0
	.byte $a0, $a0, $a0, $f0, $30, $0c, $03, $00	; "O" {uppercase} 0_1
	.byte $08, $08, $08, $0c, $0c, $30, $c0, $00	; "O" {uppercase} 1_1
	.byte $50, $50, $50, $f0, $f0, $f0, $f0, $a0	; "L" {uppercase} 0_0
	.byte $00, $00, $00, $00, $00, $00, $00, $00	; "L" {uppercase} 1_0
	.byte $a0, $a0, $a0, $f0, $f0, $f0, $ff, $00	; "L" {uppercase} 0_1
	.byte $00, $00, $00, $00, $00, $00, $fc, $00	; "L" {uppercase} 1_1
	.byte $55, $50, $50, $f0, $f0, $f0, $f0, $aa	; "P" {uppercase} 0_0
	.byte $00, $40, $10, $0c, $0c, $0c, $30, $80	; "P" {uppercase} 1_0
	.byte $a0, $a0, $a0, $f0, $f0, $f0, $f0, $00	; "P" {uppercase} 0_1
	.byte $00, $00, $00, $00, $00, $00, $00, $00	; "P" {uppercase} 1_1
	.byte $01, $04, $10, $f0, $f0, $f0, $f0, $aa	; "A" {uppercase} 0_0
	.byte $40, $10, $04, $0c, $0c, $0c, $0c, $a8	; "A" {uppercase} 1_0
	.byte $a0, $a0, $a0, $f0, $f0, $f0, $f0, $00	; "A" {uppercase} 0_1
	.byte $08, $08, $08, $0c, $0c, $0c, $0c, $00	; "A" {uppercase} 1_1
	.byte $50, $50, $50, $f0, $f0, $f0, $f0, $aa	; "K" {uppercase} 0_0
	.byte $04, $04, $04, $30, $30, $30, $c0, $00	; "K" {uppercase} 1_0
	.byte $a0, $a0, $a0, $f0, $f0, $f0, $f0, $00	; "K" {uppercase} 0_1
	.byte $80, $20, $20, $30, $0c, $0c, $0c, $00	; "K" {uppercase} 1_1
	.byte $55, $50, $50, $f0, $f0, $f0, $f0, $aa	; "E" {uppercase} 0_0
	.byte $54, $00, $00, $00, $00, $00, $00, $a0	; "E" {uppercase} 1_0
	.byte $a0, $a0, $a0, $f0, $f0, $f0, $ff, $00	; "E" {uppercase} 0_1
	.byte $00, $00, $00, $00, $00, $00, $fc, $00	; "E" {uppercase} 1_1
	.byte $00, $00, $00, $00, $00, $00, $00, $00	; "[...]" {specialcharacters} 0_0
	.byte $00, $00, $00, $00, $00, $00, $00, $00	; "[...]" {specialcharacters} 1_0
	.byte $00, $00, $00, $00, $f3, $f3, $f3, $00	; "[...]" {specialcharacters} 0_1
	.byte $00, $00, $00, $00, $cf, $cf, $cf, $00	; "[...]" {specialcharacters} 1_1
	.byte $00, $00, $00, $00, $00, $00, $00, $00	; "[Atari left]" {specialcharacters} 0_0
	.byte $11, $11, $11, $33, $33, $33, $33, $82	; "[Atari left]" {specialcharacters} 1_0
	.byte $00, $00, $00, $03, $03, $0c, $30, $00	; "[Atari left]" {specialcharacters} 0_1
	.byte $82, $82, $82, $03, $03, $03, $03, $00	; "[Atari left]" {specialcharacters} 1_1
	.byte $10, $10, $10, $30, $30, $30, $30, $08	; "[Atari right]" {specialcharacters} 0_0
	.byte $00, $00, $00, $00, $00, $00, $00, $00	; "[Atari right]" {specialcharacters} 1_0
	.byte $08, $08, $08, $03, $03, $00, $00, $00	; "[Atari right]" {specialcharacters} 0_1
	.byte $00, $00, $00, $00, $00, $c0, $30, $00	; "[Atari right]" {specialcharacters} 1_1
	.byte $15, $01, $01, $03, $03, $03, $03, $02	; "T" {uppercase} 0_0
	.byte $54, $40, $40, $c0, $c0, $c0, $c0, $80	; "T" {uppercase} 1_0
	.byte $02, $02, $02, $03, $03, $03, $03, $00	; "T" {uppercase} 0_1
	.byte $80, $80, $80, $c0, $c0, $c0, $c0, $00	; "T" {uppercase} 1_1
	.byte $55, $50, $50, $f0, $f0, $f0, $f0, $aa	; "B" {uppercase} 0_0
	.byte $40, $10, $04, $0c, $0c, $0c, $30, $80	; "B" {uppercase} 1_0
	.byte $a0, $a0, $a0, $f0, $f0, $f0, $ff, $00	; "B" {uppercase} 0_1
	.byte $20, $08, $08, $0c, $0c, $30, $c0, $00	; "B" {uppercase} 1_1
	.byte $50, $50, $50, $f0, $f0, $f0, $f0, $a0	; "W" {uppercase} 0_0
	.byte $04, $04, $04, $0c, $0c, $0c, $0c, $08	; "W" {uppercase} 1_0
	.byte $a2, $a2, $fc, $fc, $fc, $f0, $f0, $00	; "W" {uppercase} 0_1
	.byte $88, $88, $28, $3c, $3c, $0c, $0c, $00	; "W" {uppercase} 1_1
	.byte $00, $14, $14, $ff, $ff, $ff, $ff, $aa	; "[heart]" {specialcharacters} 0_0
	.byte $00, $50, $50, $fc, $fc, $fc, $fc, $a8	; "[heart]" {specialcharacters} 1_0
	.byte $2a, $2a, $0a, $0f, $03, $03, $00, $00	; "[heart]" {specialcharacters} 0_1
	.byte $a0, $a0, $80, $c0, $00, $00, $00, $00	; "[heart]" {specialcharacters} 1_1
	.byte $01, $04, $10, $f0, $f0, $f0, $f0, $a0	; "G" {uppercase} 0_0
	.byte $40, $10, $04, $08, $00, $00, $00, $a8	; "G" {uppercase} 1_0
	.byte $a0, $a0, $a0, $f0, $30, $0c, $03, $00	; "G" {uppercase} 0_1
	.byte $0c, $0c, $0c, $0c, $0c, $30, $c0, $00	; "G" {uppercase} 1_1
	.byte $01, $01, $00, $ff, $00, $00, $00, $00	; "ż" {Polish} 0_0
	.byte $40, $40, $00, $fc, $3c, $3c, $3c, $a0	; "ż" {Polish} 1_0
	.byte $02, $0a, $28, $f0, $f0, $f0, $ff, $00	; "ż" {Polish} 0_1
	.byte $80, $00, $00, $00, $00, $00, $fc, $00	; "ż" {Polish} 1_1
	.byte $00, $01, $00, $03, $0c, $30, $f0, $a0	; "ó" {Polish} 0_0
	.byte $40, $00, $00, $c0, $30, $0c, $0c, $08	; "ó" {Polish} 1_0
	.byte $a0, $a0, $a0, $f0, $30, $0c, $03, $00	; "ó" {Polish} 0_1
	.byte $08, $08, $08, $0c, $0c, $30, $c0, $00	; "ó" {Polish} 1_1
	.byte $05, $05, $05, $0f, $0f, $0f, $0f, $0a	; "ł" {Polish} 0_0
	.byte $00, $00, $00, $00, $00, $30, $c0, $00	; "ł" {Polish} 1_0
	.byte $2a, $8a, $0a, $0f, $0f, $03, $00, $00	; "ł" {Polish} 0_1
	.byte $00, $00, $00, $00, $0c, $30, $c0, $00	; "ł" {Polish} 1_1
	.byte $50, $50, $50, $f0, $f0, $f0, $f0, $a0	; "k" {lowercase} 0_0
	.byte $00, $00, $00, $0c, $0c, $0c, $30, $30	; "k" {lowercase} 1_0
	.byte $a0, $aa, $a0, $f0, $f0, $f0, $f0, $00	; "k" {lowercase} 0_1
	.byte $80, $00, $80, $30, $30, $0c, $0c, $00	; "k" {lowercase} 1_1
	.byte $00, $00, $00, $0f, $30, $00, $00, $0a	; "a" {lowercase} 0_0
	.byte $00, $00, $00, $c0, $30, $3c, $3c, $28	; "a" {lowercase} 1_0
	.byte $20, $80, $80, $c0, $c0, $30, $0f, $00	; "a" {lowercase} 0_1
	.byte $a8, $28, $28, $3c, $3c, $30, $c0, $00	; "a" {lowercase} 1_1
	.byte $05, $05, $55, $00, $00, $00, $00, $02	; "Ż" {Polish} 0_0
	.byte $00, $00, $54, $3c, $3c, $f0, $f0, $80	; "Ż" {Polish} 1_0
	.byte $02, $0a, $0a, $3c, $3c, $f0, $ff, $00	; "Ż" {Polish} 0_1
	.byte $80, $00, $00, $00, $00, $00, $fc, $00	; "Ż" {Polish} 1_1
	.byte $00, $00, $01, $0c, $30, $f0, $f0, $a0	; "Ó" {Polish} 0_0
	.byte $10, $40, $40, $30, $0c, $0c, $0c, $08	; "Ó" {Polish} 1_0
	.byte $a0, $a0, $a0, $f0, $30, $0c, $03, $00	; "Ó" {Polish} 0_1
	.byte $08, $08, $08, $0c, $0c, $30, $c0, $00	; "Ó" {Polish} 1_1
	.byte $50, $50, $50, $f0, $f0, $f0, $f0, $a2	; "Ł" {Polish} 0_0
	.byte $00, $00, $00, $00, $00, $30, $c0, $00	; "Ł" {Polish} 1_0
	.byte $a8, $a0, $a0, $f0, $f0, $f0, $ff, $00	; "Ł" {Polish} 0_1
	.byte $00, $00, $00, $00, $00, $00, $fc, $00	; "Ł" {Polish} 1_1
	.byte $55, $50, $50, $f0, $f0, $f0, $f0, $a0	; "D" {uppercase} 0_0
	.byte $00, $40, $10, $30, $0c, $0c, $0c, $08	; "D" {uppercase} 1_0
	.byte $a0, $a0, $a0, $f0, $f0, $f0, $ff, $00	; "D" {uppercase} 0_1
	.byte $08, $08, $08, $30, $30, $c0, $00, $00	; "D" {uppercase} 1_1
	.byte $55, $50, $50, $f0, $f0, $f0, $f0, $aa	; "F" {uppercase} 0_0
	.byte $54, $00, $00, $00, $00, $00, $00, $a0	; "F" {uppercase} 1_0
	.byte $a0, $a0, $a0, $f0, $f0, $f0, $f0, $00	; "F" {uppercase} 0_1
	.byte $00, $00, $00, $00, $00, $00, $00, $00	; "F" {uppercase} 1_1
	.byte $55, $00, $00, $00, $00, $00, $00, $00	; "J" {uppercase} 0_0
	.byte $54, $14, $14, $3c, $3c, $3c, $3c, $28	; "J" {uppercase} 1_0
	.byte $00, $00, $00, $00, $c0, $30, $0f, $00	; "J" {uppercase} 0_1
	.byte $28, $28, $28, $3c, $30, $c0, $00, $00	; "J" {uppercase} 1_1
	.byte $50, $50, $54, $fc, $f3, $f3, $f0, $a0	; "M" {uppercase} 0_0
	.byte $04, $04, $14, $3c, $cc, $cc, $0c, $08	; "M" {uppercase} 1_0
	.byte $a0, $a0, $a0, $f0, $f0, $f0, $f0, $00	; "M" {uppercase} 0_1
	.byte $08, $08, $08, $0c, $0c, $0c, $0c, $00	; "M" {uppercase} 1_1
	.byte $50, $50, $54, $fc, $f3, $f3, $f3, $a2	; "N" {uppercase} 0_0
	.byte $04, $04, $04, $0c, $0c, $0c, $0c, $08	; "N" {uppercase} 1_0
	.byte $a0, $a0, $a0, $f0, $f0, $f0, $f0, $00	; "N" {uppercase} 0_1
	.byte $88, $88, $88, $3c, $3c, $0c, $0c, $00	; "N" {uppercase} 1_1
	.byte $01, $04, $10, $f0, $f0, $f0, $f0, $a0	; "Q" {uppercase} 0_0
	.byte $40, $10, $04, $0c, $0c, $0c, $0c, $08	; "Q" {uppercase} 1_0
	.byte $a0, $a0, $a0, $f0, $f0, $30, $0f, $00	; "Q" {uppercase} 0_1
	.byte $08, $88, $88, $30, $30, $cc, $0c, $00	; "Q" {uppercase} 1_1
	.byte $50, $50, $50, $f0, $f0, $f0, $f0, $a0	; "U" {uppercase} 0_0
	.byte $04, $04, $04, $0c, $0c, $0c, $0c, $08	; "U" {uppercase} 1_0
	.byte $a0, $a0, $a0, $f0, $30, $0c, $03, $00	; "U" {uppercase} 0_1
	.byte $08, $08, $08, $0c, $0c, $30, $c0, $00	; "U" {uppercase} 1_1
	.byte $50, $50, $50, $f0, $f0, $f0, $3c, $28	; "V" {uppercase} 0_0
	.byte $04, $04, $04, $30, $30, $30, $30, $80	; "V" {uppercase} 1_0
	.byte $28, $28, $28, $0f, $0f, $0f, $0f, $00	; "V" {uppercase} 0_1
	.byte $80, $80, $80, $00, $00, $00, $00, $00	; "V" {uppercase} 1_1
	.byte $50, $50, $50, $f0, $3c, $3c, $0f, $0a	; "X" {uppercase} 0_0
	.byte $04, $04, $04, $0c, $30, $30, $c0, $80	; "X" {uppercase} 1_0
	.byte $08, $28, $28, $f0, $f0, $f0, $f0, $00	; "X" {uppercase} 0_1
	.byte $20, $20, $20, $0c, $0c, $0c, $0c, $00	; "X" {uppercase} 1_1
	.byte $50, $50, $50, $f0, $3c, $3c, $0f, $0a	; "Y" {uppercase} 0_0
	.byte $04, $04, $04, $0c, $30, $30, $f0, $80	; "Y" {uppercase} 1_0
	.byte $02, $02, $02, $03, $03, $03, $03, $00	; "Y" {uppercase} 0_1
	.byte $80, $80, $80, $c0, $c0, $c0, $c0, $00	; "Y" {uppercase} 1_1
	.byte $55, $00, $00, $00, $00, $00, $03, $02	; "Z" {uppercase} 0_0
	.byte $54, $14, $14, $3c, $f0, $f0, $c0, $80	; "Z" {uppercase} 1_0
	.byte $0a, $0a, $28, $3c, $f0, $f0, $ff, $00	; "Z" {uppercase} 0_1
	.byte $00, $00, $00, $00, $00, $00, $fc, $00	; "Z" {uppercase} 1_1
	.byte $50, $50, $50, $f3, $fc, $f0, $f0, $a0	; "b" {lowercase} 0_0
	.byte $00, $00, $00, $c0, $30, $0c, $0c, $08	; "b" {lowercase} 1_0
	.byte $a0, $a0, $a0, $f0, $f0, $f0, $ff, $00	; "b" {lowercase} 0_1
	.byte $08, $08, $08, $0c, $0c, $30, $c0, $00	; "b" {lowercase} 1_1
	.byte $00, $00, $00, $03, $0c, $30, $f0, $a0	; "c" {lowercase} 0_0
	.byte $00, $00, $00, $c0, $30, $0c, $0c, $00	; "c" {lowercase} 1_0
	.byte $a0, $a0, $a0, $f0, $30, $0c, $03, $00	; "c" {lowercase} 0_1
	.byte $00, $00, $00, $0c, $0c, $30, $c0, $00	; "c" {lowercase} 1_1
	.byte $01, $01, $01, $00, $00, $0f, $03, $02	; "i" {lowercase} 0_0
	.byte $40, $40, $40, $00, $00, $c0, $c0, $80	; "i" {lowercase} 1_0
	.byte $02, $02, $02, $03, $03, $03, $0f, $00	; "i" {lowercase} 0_1
	.byte $80, $80, $80, $c0, $c0, $c0, $f0, $00	; "i" {lowercase} 1_1
	.byte $01, $01, $01, $00, $00, $03, $03, $02	; "j" {lowercase} 0_0
	.byte $40, $40, $40, $00, $00, $c0, $c0, $80	; "j" {lowercase} 1_0
	.byte $02, $02, $02, $03, $c3, $c3, $3c, $00	; "j" {lowercase} 0_1
	.byte $80, $80, $80, $c0, $c0, $00, $00, $00	; "j" {lowercase} 1_1
	.byte $14, $14, $14, $3c, $3c, $3c, $3c, $28	; "l" {lowercase} 0_0
	.byte $00, $00, $00, $00, $00, $00, $00, $00	; "l" {lowercase} 1_0
	.byte $28, $28, $28, $3c, $3c, $0c, $03, $00	; "l" {lowercase} 0_1
	.byte $00, $00, $00, $00, $30, $30, $c0, $00	; "l" {lowercase} 1_1
	.byte $00, $00, $00, $ff, $f0, $f0, $f0, $a0	; "n" {lowercase} 0_0
	.byte $00, $00, $00, $00, $c0, $30, $30, $08	; "n" {lowercase} 1_0
	.byte $a0, $a0, $a0, $f0, $f0, $f0, $f0, $00	; "n" {lowercase} 0_1
	.byte $08, $08, $08, $0c, $0c, $0c, $0c, $00	; "n" {lowercase} 1_1
	.byte $00, $00, $00, $ff, $f0, $f0, $f0, $a0	; "p" {lowercase} 0_0
	.byte $00, $00, $00, $c0, $30, $0c, $0c, $08	; "p" {lowercase} 1_0
	.byte $a0, $a0, $aa, $f0, $f0, $f0, $f0, $00	; "p" {lowercase} 0_1
	.byte $20, $80, $00, $00, $00, $00, $00, $00	; "p" {lowercase} 1_1
	.byte $00, $00, $00, $03, $0c, $30, $c0, $80	; "q" {lowercase} 0_0
	.byte $00, $00, $00, $fc, $3c, $3c, $3c, $28	; "q" {lowercase} 1_0
	.byte $80, $20, $0a, $00, $00, $00, $00, $00	; "q" {lowercase} 0_1
	.byte $28, $28, $a8, $3c, $3c, $3c, $3c, $00	; "q" {lowercase} 1_1
	.byte $00, $00, $00, $ff, $f0, $f0, $f0, $a0	; "r" {lowercase} 0_0
	.byte $00, $00, $00, $c0, $30, $0c, $0c, $00	; "r" {lowercase} 1_0
	.byte $a0, $a0, $a0, $f0, $f0, $f0, $f0, $00	; "r" {lowercase} 0_1
	.byte $00, $00, $00, $00, $00, $00, $00, $00	; "r" {lowercase} 1_1
	.byte $00, $00, $00, $f0, $f0, $f0, $3c, $28	; "v" {lowercase} 0_0
	.byte $00, $00, $00, $30, $30, $30, $30, $80	; "v" {lowercase} 1_0
	.byte $28, $28, $28, $0f, $0f, $0f, $0f, $00	; "v" {lowercase} 0_1
	.byte $80, $80, $80, $00, $00, $00, $00, $00	; "v" {lowercase} 1_1
	.byte $00, $00, $00, $f0, $f0, $f0, $f0, $a0	; "w" {lowercase} 0_0
	.byte $00, $00, $00, $0c, $0c, $0c, $0c, $08	; "w" {lowercase} 1_0
	.byte $a2, $a2, $fc, $fc, $fc, $f0, $f0, $00	; "w" {lowercase} 0_1
	.byte $88, $88, $28, $3c, $3c, $0c, $0c, $00	; "w" {lowercase} 1_1
	.byte $00, $00, $00, $f0, $f0, $3c, $3c, $08	; "x" {lowercase} 0_0
	.byte $00, $00, $00, $0c, $0c, $3c, $30, $20	; "x" {lowercase} 1_0
	.byte $0a, $0a, $28, $3c, $f0, $f0, $f0, $00	; "x" {lowercase} 0_1
	.byte $a0, $a0, $20, $3c, $0c, $0c, $0c, $00	; "x" {lowercase} 1_1
	.byte $00, $00, $00, $ff, $00, $00, $00, $00	; "z" {lowercase} 0_0
	.byte $00, $00, $00, $fc, $3c, $3c, $3c, $a0	; "z" {lowercase} 1_0
	.byte $02, $0a, $28, $f0, $f0, $f0, $ff, $00	; "z" {lowercase} 0_1
	.byte $80, $00, $00, $00, $00, $00, $fc, $00	; "z" {lowercase} 1_1
	.byte $01, $04, $10, $f0, $f0, $f0, $f0, $a0	; "0" {digits} 0_0
	.byte $40, $10, $04, $0c, $0c, $0c, $0c, $88	; "0" {digits} 1_0
	.byte $a2, $a0, $a0, $f0, $30, $0c, $03, $00	; "0" {digits} 0_1
	.byte $08, $08, $08, $0c, $0c, $30, $c0, $00	; "0" {digits} 1_1
	.byte $05, $11, $01, $03, $03, $03, $03, $02	; "1" {digits} 0_0
	.byte $40, $40, $40, $c0, $c0, $c0, $c0, $80	; "1" {digits} 1_0
	.byte $02, $02, $02, $03, $03, $03, $3f, $00	; "1" {digits} 0_1
	.byte $80, $80, $80, $c0, $c0, $c0, $fc, $00	; "1" {digits} 1_1
	.byte $05, $10, $40, $c0, $00, $00, $00, $00	; "2" {digits} 0_0
	.byte $00, $40, $10, $3c, $3c, $3c, $30, $80	; "2" {digits} 1_0
	.byte $02, $08, $20, $f0, $f0, $f0, $ff, $00	; "2" {digits} 0_1
	.byte $00, $00, $00, $00, $00, $0c, $fc, $00	; "2" {digits} 1_1
	.byte $05, $10, $40, $c0, $00, $00, $00, $02	; "3" {digits} 0_0
	.byte $00, $40, $10, $3c, $3c, $3c, $f0, $80	; "3" {digits} 1_0
	.byte $00, $00, $00, $c0, $c0, $30, $0f, $00	; "3" {digits} 0_1
	.byte $a0, $28, $28, $3c, $30, $c0, $00, $00	; "3" {digits} 1_1
	.byte $00, $01, $04, $30, $c0, $c0, $c0, $aa	; "4" {digits} 0_0
	.byte $54, $14, $14, $3c, $3c, $3c, $3c, $a8	; "4" {digits} 1_0
	.byte $00, $00, $00, $00, $00, $00, $00, $00	; "4" {digits} 0_1
	.byte $28, $28, $28, $3c, $3c, $3c, $3c, $00	; "4" {digits} 1_1
	.byte $55, $50, $50, $f0, $f0, $f0, $f0, $aa	; "5" {digits} 0_0
	.byte $54, $00, $00, $00, $00, $00, $00, $80	; "5" {digits} 1_0
	.byte $00, $00, $00, $c0, $c0, $30, $0f, $00	; "5" {digits} 0_1
	.byte $20, $08, $08, $0c, $0c, $30, $c0, $00	; "5" {digits} 1_1
	.byte $01, $04, $10, $f0, $f0, $f0, $f0, $aa	; "6" {digits} 0_0
	.byte $40, $10, $04, $08, $00, $00, $00, $80	; "6" {digits} 1_0
	.byte $a0, $a0, $a0, $f0, $30, $0c, $03, $00	; "6" {digits} 0_1
	.byte $20, $08, $08, $0c, $0c, $30, $c0, $00	; "6" {digits} 1_1
	.byte $55, $00, $00, $00, $00, $00, $00, $00	; "7" {digits} 0_0
	.byte $54, $14, $14, $3c, $3c, $f0, $f0, $a0	; "7" {digits} 1_0
	.byte $00, $02, $02, $03, $03, $03, $03, $00	; "7" {digits} 0_1
	.byte $a0, $80, $80, $c0, $c0, $c0, $c0, $00	; "7" {digits} 1_1
	.byte $01, $04, $10, $f0, $f0, $f0, $30, $0a	; "8" {digits} 0_0
	.byte $40, $10, $04, $0c, $0c, $0c, $30, $80	; "8" {digits} 1_0
	.byte $20, $a0, $a0, $f0, $f0, $30, $0f, $00	; "8" {digits} 0_1
	.byte $20, $08, $08, $0c, $0c, $30, $c0, $00	; "8" {digits} 1_1
	.byte $05, $10, $40, $c0, $c0, $c0, $30, $0a	; "9" {digits} 0_0
	.byte $00, $40, $10, $3c, $3c, $3c, $3c, $a8	; "9" {digits} 1_0
	.byte $00, $00, $00, $c0, $c0, $30, $0f, $00	; "9" {digits} 0_1
	.byte $28, $28, $28, $3c, $30, $c0, $00, $00	; "9" {digits} 1_1
	.byte $01, $04, $10, $f0, $f0, $f0, $f0, $aa	; "Ą" {Polish} 0_0
	.byte $40, $10, $04, $0c, $0c, $0c, $0c, $a8	; "Ą" {Polish} 1_0
	.byte $a0, $a0, $a0, $f0, $f0, $f0, $f0, $00	; "Ą" {Polish} 0_1
	.byte $08, $08, $08, $0c, $30, $30, $c0, $00	; "Ą" {Polish} 1_1
	.byte $00, $00, $01, $0c, $30, $f0, $f0, $a0	; "Ć" {Polish} 0_0
	.byte $10, $40, $40, $30, $0c, $0c, $00, $00	; "Ć" {Polish} 1_0
	.byte $a0, $a0, $a0, $f0, $30, $0c, $03, $00	; "Ć" {Polish} 0_1
	.byte $00, $00, $00, $0c, $0c, $30, $c0, $00	; "Ć" {Polish} 1_1
	.byte $55, $50, $50, $f0, $f0, $f0, $ff, $a0	; "Ę" {Polish} 0_0
	.byte $54, $00, $00, $00, $00, $00, $f0, $00	; "Ę" {Polish} 1_0
	.byte $a0, $a0, $a0, $ff, $00, $00, $00, $00	; "Ę" {Polish} 0_1
	.byte $00, $00, $00, $fc, $0c, $0c, $30, $00	; "Ę" {Polish} 1_1
	.byte $00, $01, $50, $f0, $fc, $fc, $f3, $a2	; "Ń" {Polish} 0_0
	.byte $40, $00, $04, $0c, $0c, $0c, $0c, $08	; "Ń" {Polish} 1_0
	.byte $a0, $a0, $a0, $f0, $f0, $f0, $f0, $00	; "Ń" {Polish} 0_1
	.byte $88, $88, $88, $3c, $3c, $0c, $0c, $00	; "Ń" {Polish} 1_1
	.byte $00, $00, $01, $0c, $30, $f0, $f0, $20	; "Ś" {Polish} 0_0
	.byte $10, $40, $40, $30, $0c, $0c, $00, $00	; "Ś" {Polish} 1_0
	.byte $0a, $00, $00, $c0, $c0, $30, $0f, $00	; "Ś" {Polish} 0_1
	.byte $80, $20, $08, $0c, $0c, $30, $c0, $00	; "Ś" {Polish} 1_1
	.byte $00, $01, $55, $00, $00, $00, $00, $02	; "Ź" {Polish} 0_0
	.byte $40, $00, $54, $3c, $3c, $f0, $f0, $80	; "Ź" {Polish} 1_0
	.byte $02, $0a, $0a, $3c, $3c, $f0, $ff, $00	; "Ź" {Polish} 0_1
	.byte $80, $00, $00, $00, $00, $00, $fc, $00	; "Ź" {Polish} 1_1
	.byte $00, $00, $00, $0f, $30, $00, $00, $0a	; "ą" {Polish} 0_0
	.byte $00, $00, $00, $c0, $30, $3c, $3c, $28	; "ą" {Polish} 1_0
	.byte $20, $80, $80, $c0, $30, $0f, $00, $00	; "ą" {Polish} 0_1
	.byte $a8, $28, $28, $30, $f0, $30, $0c, $00	; "ą" {Polish} 1_1
	.byte $00, $01, $00, $03, $0c, $30, $f0, $a0	; "ć" {Polish} 0_0
	.byte $40, $00, $00, $c0, $30, $0c, $0c, $00	; "ć" {Polish} 1_0
	.byte $a0, $a0, $a0, $f0, $30, $0c, $03, $00	; "ć" {Polish} 0_1
	.byte $00, $00, $00, $0c, $0c, $30, $c0, $00	; "ć" {Polish} 1_1
	.byte $00, $00, $00, $03, $0c, $30, $f0, $a0	; "ę" {Polish} 0_0
	.byte $00, $00, $00, $c0, $30, $0c, $0c, $08	; "ę" {Polish} 1_0
	.byte $aa, $a0, $20, $0c, $03, $00, $00, $00	; "ę" {Polish} 0_1
	.byte $a0, $00, $00, $0c, $f0, $30, $c0, $00	; "ę" {Polish} 1_1
	.byte $01, $04, $00, $ff, $f0, $f0, $f0, $a0	; "ń" {Polish} 0_0
	.byte $00, $00, $00, $00, $c0, $30, $30, $08	; "ń" {Polish} 1_0
	.byte $a0, $a0, $a0, $f0, $f0, $f0, $f0, $00	; "ń" {Polish} 0_1
	.byte $08, $08, $08, $0c, $0c, $0c, $0c, $00	; "ń" {Polish} 1_1
	.byte $00, $01, $00, $0f, $30, $f0, $f0, $a0	; "ś" {Polish} 0_0
	.byte $40, $00, $00, $c0, $30, $0c, $0c, $00	; "ś" {Polish} 1_0
	.byte $20, $0a, $00, $00, $c0, $30, $0f, $00	; "ś" {Polish} 0_1
	.byte $00, $80, $20, $0c, $0c, $30, $c0, $00	; "ś" {Polish} 1_1
	.byte $00, $01, $00, $ff, $00, $00, $00, $00	; "ź" {Polish} 0_0
	.byte $40, $00, $00, $fc, $3c, $3c, $3c, $a0	; "ź" {Polish} 1_0
	.byte $02, $0a, $28, $f0, $f0, $f0, $ff, $00	; "ź" {Polish} 0_1
	.byte $80, $00, $00, $00, $00, $00, $fc, $00	; "ź" {Polish} 1_1
	.byte $00, $00, $00, $00, $00, $00, $00, $00	; "." {specialcharacters} 0_0
	.byte $00, $00, $00, $00, $00, $00, $00, $00	; "." {specialcharacters} 1_0
	.byte $00, $00, $00, $00, $0f, $0f, $0f, $00	; "." {specialcharacters} 0_1
	.byte $00, $00, $00, $00, $00, $00, $00, $00	; "." {specialcharacters} 1_1
	.byte $00, $00, $00, $00, $00, $00, $00, $00	; "," {specialcharacters} 0_0
	.byte $00, $00, $00, $00, $00, $00, $00, $00	; "," {specialcharacters} 1_0
	.byte $00, $02, $02, $0f, $0f, $3c, $3c, $00	; "," {specialcharacters} 0_1
	.byte $00, $80, $80, $00, $00, $00, $00, $00	; "," {specialcharacters} 1_1
	.byte $00, $00, $00, $00, $00, $00, $0f, $0a	; ":" {specialcharacters} 0_0
	.byte $00, $00, $00, $00, $00, $00, $00, $00	; ":" {specialcharacters} 1_0
	.byte $0a, $00, $00, $00, $0f, $0f, $0f, $00	; ":" {specialcharacters} 0_1
	.byte $00, $00, $00, $00, $00, $00, $00, $00	; ":" {specialcharacters} 1_1
	.byte $00, $00, $00, $00, $00, $00, $00, $00	; "_" {specialcharacters} 0_0
	.byte $00, $00, $00, $00, $00, $00, $00, $00	; "_" {specialcharacters} 1_0
	.byte $00, $00, $00, $00, $00, $3f, $3f, $00	; "_" {specialcharacters} 0_1
	.byte $00, $00, $00, $00, $00, $f0, $f0, $00	; "_" {specialcharacters} 1_1
	.byte $05, $10, $40, $c0, $00, $00, $00, $02	; "?" {specialcharacters} 0_0
	.byte $40, $10, $04, $0c, $0c, $30, $c0, $80	; "?" {specialcharacters} 1_0
	.byte $02, $02, $00, $00, $03, $03, $03, $00	; "?" {specialcharacters} 0_1
	.byte $80, $80, $00, $00, $c0, $c0, $c0, $00	; "?" {specialcharacters} 1_1
	.byte $50, $50, $50, $fc, $3c, $3f, $0f, $0a	; "\" {specialcharacters} 0_0
	.byte $00, $00, $00, $00, $00, $00, $00, $80	; "\" {specialcharacters} 1_0
	.byte $02, $02, $00, $00, $00, $00, $00, $00	; "\" {specialcharacters} 0_1
	.byte $80, $a0, $a0, $fc, $3c, $3c, $3c, $00	; "\" {specialcharacters} 1_1
	.byte $00, $00, $00, $00, $00, $03, $03, $0a	; "/" {specialcharacters} 0_0
	.byte $14, $14, $14, $fc, $f0, $f0, $c0, $80	; "/" {specialcharacters} 1_0
	.byte $0a, $2a, $28, $fc, $f0, $f0, $f0, $00	; "/" {specialcharacters} 0_1
	.byte $00, $00, $00, $00, $00, $00, $00, $00	; "/" {specialcharacters} 1_1
	.byte $00, $00, $01, $03, $0f, $0f, $0f, $0a	; "(" {specialcharacters} 0_0
	.byte $10, $40, $00, $00, $00, $00, $00, $00	; "(" {specialcharacters} 1_0
	.byte $0a, $0a, $0a, $03, $03, $00, $00, $00	; "(" {specialcharacters} 0_1
	.byte $00, $00, $00, $00, $00, $c0, $30, $00	; "(" {specialcharacters} 1_1
	.byte $04, $01, $00, $00, $00, $00, $00, $00	; ")" {specialcharacters} 0_0
	.byte $00, $00, $40, $c0, $f0, $f0, $f0, $a0	; ")" {specialcharacters} 1_0
	.byte $00, $00, $00, $00, $00, $03, $0c, $00	; ")" {specialcharacters} 0_1
	.byte $a0, $a0, $a0, $c0, $c0, $00, $00, $00	; ")" {specialcharacters} 1_1
	.byte $50, $50, $50, $00, $00, $00, $03, $02	; "%" {specialcharacters} 0_0
	.byte $04, $04, $10, $30, $c0, $c0, $00, $00	; "%" {specialcharacters} 1_0
	.byte $08, $08, $20, $30, $c0, $c0, $00, $00	; "%" {specialcharacters} 0_1
	.byte $00, $00, $00, $00, $3c, $3c, $3c, $00	; "%" {specialcharacters} 1_1
	.byte $05, $10, $50, $f0, $f0, $30, $0c, $02	; "&" {specialcharacters} 0_0
	.byte $00, $40, $10, $30, $30, $30, $c0, $00	; "&" {specialcharacters} 1_0
	.byte $2a, $a0, $a0, $f0, $f0, $30, $0f, $00	; "&" {specialcharacters} 0_1
	.byte $00, $88, $88, $30, $30, $3c, $cc, $00	; "&" {specialcharacters} 1_1
	.byte $00, $00, $00, $00, $03, $03, $03, $2a	; "+" {specialcharacters} 0_0
	.byte $00, $00, $00, $00, $c0, $c0, $c0, $a8	; "+" {specialcharacters} 1_0
	.byte $2a, $02, $02, $03, $03, $00, $00, $00	; "+" {specialcharacters} 0_1
	.byte $a8, $80, $80, $c0, $c0, $00, $00, $00	; "+" {specialcharacters} 1_1
	.byte $00, $00, $00, $00, $00, $00, $00, $2a	; "-" {specialcharacters} 0_0
	.byte $00, $00, $00, $00, $00, $00, $00, $a0	; "-" {specialcharacters} 1_0
	.byte $2a, $00, $00, $00, $00, $00, $00, $00	; "-" {specialcharacters} 0_1
	.byte $a0, $00, $00, $00, $00, $00, $00, $00	; "-" {specialcharacters} 1_1
	.byte $00, $00, $00, $00, $00, $3f, $3f, $00	; "=" {specialcharacters} 0_0
	.byte $00, $00, $00, $00, $00, $f0, $f0, $00	; "=" {specialcharacters} 1_0
	.byte $00, $2a, $2a, $00, $00, $00, $00, $00	; "=" {specialcharacters} 0_1
	.byte $00, $a0, $a0, $00, $00, $00, $00, $00	; "=" {specialcharacters} 1_1
	.byte $00, $01, $04, $30, $c0, $c0, $cc, $80	; "[happy face]" {specialcharacters} 0_0
	.byte $00, $40, $10, $0c, $03, $03, $33, $02	; "[happy face]" {specialcharacters} 1_0
	.byte $80, $88, $82, $c0, $30, $0c, $03, $00	; "[happy face]" {specialcharacters} 0_1
	.byte $02, $22, $82, $03, $0c, $30, $c0, $00	; "[happy face]" {specialcharacters} 1_1
	.byte $01, $04, $10, $c0, $c0, $c0, $cc, $80	; "[sad face]" {specialcharacters} 0_0
	.byte $40, $10, $04, $03, $03, $03, $33, $02	; "[sad face]" {specialcharacters} 1_0
	.byte $80, $82, $88, $c0, $30, $0c, $03, $00	; "[sad face]" {specialcharacters} 0_1
	.byte $02, $82, $22, $03, $0c, $30, $c0, $00	; "[sad face]" {specialcharacters} 1_1
fontsen
