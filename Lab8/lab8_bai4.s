;; Ma hoa chuyen vi cuc bo
	;AREA RESET, DATA, READONLY
		;DCD 0x20001000
		;DCD Reset_Handler
	;ALIGN
;XauRo DCB "WEAREDISCOVEREDSAVEYOURSELF",0
;K DCB 1,6,5,2,3,4
	;AREA MYDATA, DATA, READWRITE
	;AREA STORE, DATA, READWRITE
;IndexK SPACE 10
;XauMa SPACE 100
	
	;AREA MYCODE, CODE, READONLY
	;EXPORT Reset_Handler
;;==========================
;;Ham dem do dai xau
;DEM_XAU PROC
	;POP {R6} ;Dia chi phan tu dau
	;MOV R7, #0
;LOOP_DEM_XAU
	;LDRB R8, [R6], #1
	;CMP R8, #0
	;BEQ END_DEM_XAU
	;ADD R7, #1
	;B LOOP_DEM_XAU
;END_DEM_XAU
	;PUSH {R7}
	;BX LR
	;ENDP
;;==========================
;;Lay vi tri cua cac so trong khoa k
;FILL_INDEX PROC
	;POP {R6, R7} ;Dia chi khoa K va index K
	;MOV R8, #1; so can tim vi tri
;LOOP_FILL_INDEX
	;CMP R8, #6
	;BXGT LR ; tim den so 6 thi dung
	;MOV R9, #0 ; tim tu vi tri dau
;FIND_INDEX
	;LDRB R10, [R6, R9] ; lay tai vi tri nao day
	;CMP R10, R8
	;BEQ END_FIND_INDEX
	;ADD R9, #1 ; Nhay vi tri tiep
	;B FIND_INDEX
;END_FIND_INDEX
	;STRB R9, [R7], #1; Luu vi tri vao
	;ADD R8, #1 ; Tim so tiep theo
	;B LOOP_FILL_INDEX
	;ENDP
;;==========================
;MAX_INDEX_TO_FILL
	;POP {R7}
	;MOV R8, #0
;LOOP_2
	;CMP R8, R7
	;BGE END_LOOP_2
	;ADD R8, #6
;END_LOOP_2
	;PUSH {R8}
	;BX LR
	;ENDP
;;==========================
	;ENTRY
;Reset_Handler
	;LDR R0, =K
	;LDR R1, =XauRo
	;LDR R2, =XauMa
	;LDR R3, =IndexK
	;PUSH {R1}
	;BL DEM_XAU
	;POP {R4}
	;CMP R4, #0
	;BEQ THOAT
	;PUSH {R4}
	;BL MAX_INDEX_TO_FILL
	;POP {R5}
	;MOV R7, #0x4A ;Ky tu J
	;PUSH {R0, R3}
	;BL FILL_INDEX
	;MOV R0, #0 ; R0 khong can su dung nua
				;; Ta dung no de luu cac vi tri da lay (1-6)
;LOOP
	;CMP R0, #6
	;BGE THOAT ; Lay du vi tri thi thoat
	;LDRB R6, [R3, R0] ; R5 la index can lay trong xau ro
;GET_CHAR_BY_INDEX
	;CMP R6, R4 ; So sanh vi tri dang duyet voi do dai chuoi
	;BGE CONTINUE ; Neu duyet qua chuoi thi chen them j
	;LDRB R8, [R1, R6]; Lay tu day ra
	;STRB R8, [R2], #1; Luu ky tu vao
	;ADD R6, #6 ; Nhay 6 ky tu
	;B GET_CHAR_BY_INDEX
;CONTINUE
	;ADD R0, #1 ; Xet vi tri khác
	;CMP R6, R5 ; xem co qua so ky tu toi da de chen
	;BGE LOOP
	;STRB R7, [R2], #1; Chen ky tu J
	;B LOOP
;THOAT
	;SWI &11
	;END
;;Ket qua: 5749524545524F53554A455641524A444556534A4143444F46455345594C