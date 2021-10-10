;; Tinh x^n su dung thanh ghi chung
	;AREA RESET, DATA, READONLY
		;DCD 0x20001000
		;DCD Reset_Handler
	;ALIGN
;X DCD 2
;N DCD 3
	;AREA MYCODE, CODE, READONLY
	;EXPORT Reset_Handler

;LUYTHUA PROC
	;MUL R0, R1
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
	;BL LUYTHUA
	;SUB R2, #1
	;B loop
	
;thoat
	;SWI &11
	;END