	;AREA RESET, DATA, READONLY
		;DCD 0x20001000
		;DCD Reset_Handler
	;ALIGN
	;AREA MYDATA, DATA, READONLY
;MATRIXA DCD 1,2,3
	;DCD -2, 1, 1
	;DCD 2, 1, 3
;COL_A EQU 3
;ROW_A EQU 3
;MATRIXB DCD 1, 0, 1
	;DCD 1, -1, 2
	;DCD 2, 0, 1
;COL_B EQU 3
;ROW_B EQU 3
	;AREA STORE, DATA, READWRITE
;RESULT DCD 0	
	;AREA MYCODE, CODE, READONLY
	;EXPORT Reset_Handler
;;==================================
;FUNCADD
	;MOV R3, #0
;LOOPADD
	;CMP R3, #9
	;BXGE LR
	;LDR R4, [R0], #4
	;LDR R5, [R1], #4
	;ADD R4, R5
	;STR R4, [R2], #4
	;B LOOPADD
	;ENDP
;;===================================
;FUNCSUB
	;MOV R3, #0
;LOOPSUB
	;CMP R3, #9
	;BXGE LR
	;LDR R4, [R0], #4
	;LDR R5, [R1], #4
	;SUB R4, R5
	;STR R4, [R2], #4
	;B LOOPSUB
	;ENDP
;;===================================
;FUNCMUL
	
;;===================================
	;ENTRY
;Reset_Handler
	;LDR R0,=MATRIXA
	;LDR R1,=MATRIXB
	;LDR R2, =RESULT
	
	;;BL FUNCADD
	;BL FUNCSUB
	;END