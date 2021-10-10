;;Tong cac so <= N chia het cho 5 dung ngan xep
	;AREA RESET, DATA, READONLY
		;DCD 0x20001000
		;DCD Reset_Handler
	;ALIGN
;N DCD 10
	;AREA MYCODE, CODE, READONLY
	;EXPORT Reset_Handler
;FUNCADD PROC
	;POP {R3, R4}
	;ADD R3, R4
	;PUSH {R3}
	;BX LR
	;;MOV PC, LR
	;ENDP
	
	;ENTRY
;Reset_Handler
	;MOV R0, #0
	;LDR R1, N
	;MOV R2, #5
;loop
	;CMP R2, R1
	;BGT thoat
	;PUSH {R0, R2}
	;BL FUNCADD
	;POP {R0}
	;ADD R2, #5
	;B loop
	
;thoat
	;SWI &11
	;END