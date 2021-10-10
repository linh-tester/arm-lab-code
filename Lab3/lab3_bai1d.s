;;Tong cac so <= N chia het cho 5 dung thanh ghi chung
	;AREA RESET, DATA, READONLY
		;DCD 0x20001000
		;DCD Reset_Handler
	;ALIGN
;N DCD 10
	;AREA MYCODE, CODE, READONLY
	;EXPORT Reset_Handler
;FUNCADD PROC
	;ADD R0, R2
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
	;BL FUNCADD
	;ADD R2, #5
	;B loop
	
;thoat
	;SWI &11
	;END