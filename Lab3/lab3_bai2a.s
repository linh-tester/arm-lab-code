;;Tong cac so <= N dung ngan xep
	;AREA RESET, DATA, READONLY
		;DCD 0x20001000
		;DCD Reset_Handler
	;ALIGN
;N DCD 10
	;AREA MYCODE, CODE, READONLY
	;EXPORT Reset_Handler
;FUNCADD PROC
	;POP {R2, R3}
	;ADD R2, R3
	;PUSH {R2}
	;BX LR
	;;MOV PC, LR
	;ENDP
	
	;ENTRY
;Reset_Handler
	;MOV R0, #0
	;LDR R1, N
;loop
	;CMP R1, #0
	;BEQ thoat
	;PUSH {R0, R1}
	;BL FUNCADD
	;POP {R0}
	;SUB R1, #1
	;B loop
	
;thoat
	;SWI &11
	;END