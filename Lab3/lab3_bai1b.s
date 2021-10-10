;;Tong cac so chan, le <= N dung thanh ghi chung
	;AREA RESET, DATA, READONLY
		;DCD 0x20001000
		;DCD Reset_Handler
	;ALIGN
;N DCD 10
	;AREA MYCODE, CODE, READONLY
	;EXPORT Reset_Handler
;ADDCHAN PROC
	;ADD R0, R2
	;BX LR
	;ENDP
;ADDLE PROC
	;ADD R1, R2
	;BX LR
	;ENDP
;FUNCADD PROC
	;LSRS R3, R2, 1 ; Dich phat update flag
	;BCS ADDLE
	;BCC ADDCHAN	
	;BX LR
	;ENDP
	;ENTRY
;Reset_Handler
	;MOV R0, #0 ; Chan
	;MOV R1, #0 ; Le
	;LDR R2, N
;loop
	;CMP R2, #0
	;BEQ thoat
	;BL FUNCADD
	;SUB R2, #1
	;B loop
	
;thoat
	;SWI &11
	;END