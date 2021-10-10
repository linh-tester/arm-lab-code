;; Tinh x^n su dung ngan xep
	;AREA RESET, DATA, READONLY
		;DCD 0x20001000
		;DCD Reset_Handler
	;ALIGN
;X DCD 2
;N DCD 3
	;AREA MYCODE, CODE, READONLY
	;EXPORT Reset_Handler

;LUYTHUA PROC
	;POP {R3, R4}
	;MUL R3, R4
	;PUSH {R3}
	;BX LR
	;;MOV PC, LR
	;ENDP
	
	;ENTRY
;Reset_Handler
	;MOV R0, #1
	;LDR R1, X
	;LDR R2, N
;loop
	;CMP R2, #0
	;BEQ thoat
	;PUSH {R0, R1}
	;BL LUYTHUA
	;POP {R0}
	;SUB R2, #1
	;B loop
	
;thoat
	;SWI &11
	;END