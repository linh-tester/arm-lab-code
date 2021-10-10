;;Tinh giai thua N dung thanh ghi chung
	;AREA RESET, DATA, READONLY
		;DCD 0x20001000
		;DCD Reset_Handler
	;ALIGN
;N DCD 5
	;AREA MYCODE, CODE, READONLY
	;EXPORT Reset_Handler
;GIAITHUA PROC
	;MUL R0, R1
	;BX LR
	;;MOV PC, LR
	;ENDP
	
	;ENTRY
;Reset_Handler
	;MOV R0, #1
	;LDR R1, N
;loop
	;CMP R1, #1
	;BLE thoat
	;BL GIAITHUA
	;SUB R1, #1
	;B loop
;thoat
	;SWI &11
	;END