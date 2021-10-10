;;Tinh giai thua N dung ngan xep
	;AREA RESET, DATA, READONLY
		;DCD 0x20001000
		;DCD Reset_Handler
	;ALIGN
;N DCD 5
	;AREA MYCODE, CODE, READONLY
	;EXPORT Reset_Handler
;GIAITHUA PROC
	;POP {R3,R4}
	;MUL R3, R4
	;PUSH {R3}
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
	;PUSH {R0, R1}
	;BL GIAITHUA
	;POP {R0}
	;SUB R1, #1
	;B loop
;thoat
	;SWI &11
	;END