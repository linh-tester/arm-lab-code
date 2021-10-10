;;Tong cac so chan, le <= N dung ngan xep
	;AREA RESET, DATA, READONLY
		;DCD 0x20001000
		;DCD Reset_Handler
	;ALIGN
;N DCD 10
	;AREA MYCODE, CODE, READONLY
	;EXPORT Reset_Handler
;FUNCADD PROC
	;POP {R4, R5}
	;ADD R4, R5
	;PUSH {R4}
	;BX LR
	;ENDP
;Reset_Handler
	;MOV R0, #0 ; Chan
	;MOV R1, #0 ; Le
	;LDR R2, N
;loop
	;CMP R2, #0
	;BEQ thoat	
	;LSRS R3, R2, 1;
	;PUSHCC {R0, R2}
	;PUSHCS {R1, R2}
	;BL FUNCADD 
	;POPCC {R0}
	;POPCS {R1}
	;SUB R2, #1
	;B loop
	
;thoat
	;SWI &11
	;END