;;Tong cac so <= N dung thanh ghi chung
	;AREA RESET, DATA, READONLY
		;DCD 0x20001000
		;DCD Reset_Handler
	;ALIGN
;N DCD 10
	;AREA MYCODE, CODE, READONLY
	;EXPORT Reset_Handler
;FUNCADD PROC
	;ADD R0, R1
	;BX LR
	;ENDP
	
	;ENTRY
;Reset_Handler
	;MOV R0, #0
	;LDR R1, N
;loop
	;CMP R1, #0
	;BEQ thoat
	;BL FUNCADD
	;SUB R1, #1
	;B loop
	
;thoat
	;SWI &11
	;END