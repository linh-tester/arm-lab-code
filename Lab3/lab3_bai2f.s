;; Tinh 1 + x + x^2 + x^n su dung ngan xep
	;AREA RESET, DATA, READONLY
		;DCD 0x20001000
		;DCD Reset_Handler
	;ALIGN
;X DCD 2
;N DCD 3
	;AREA MYCODE, CODE, READONLY
	;EXPORT Reset_Handler
;;Ham tinh x^k
;LUYTHUA PROC
	;POP {R4, R5} ; x, k
	;MOV R6, #1 ; ket qua
	;MOV R7, #1 ; i
;LUYTHUALOOP
	;CMP R7, R5
	;BGT ENDLOOP
	;MUL R6, R4
	;ADD R7, #1
	;B LUYTHUALOOP
;ENDLOOP
	;PUSH {R6}
	;BX LR
	;ENDP
	
	;ENTRY
;Reset_Handler
	;MOV R0, #0
	;LDR R1, X
	;LDR R2, N
	;MOV R3, #0
;loop
	;CMP R3, R2
	;BGT thoat
	;PUSH {R1, R3} ; x, k
	;BL LUYTHUA
	;POP {R4}
	;ADD R0, R4
	;ADD R3, #1; tang k
	;B loop
	
;thoat
	;SWI &11
	;END