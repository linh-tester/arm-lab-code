;;Chuong trinh tinh x ^ n
	;AREA RESET, DATA, READONLY
		;DCD 0x20001000
		;DCD Reset_Handler
;X DCD 2
;N DCD 3
	;AREA MYCODE, CODE, READONLY
		;ENTRY
		;EXPORT Reset_Handler
;Reset_Handler
;;===================================
	;MOV R0, #1 
	;LDR R1, X
	;LDR R2, N
	;MOV R3, #1
;LOOP
	;CMP R3, R2
	;BGT STOP
	;MUL R0, R1
	;ADD R3, #1
	;B LOOP
;;===================================
;STOP
	;NOP
	;END