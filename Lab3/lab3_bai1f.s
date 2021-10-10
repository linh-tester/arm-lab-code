;; Tinh 1 + x + x^2 + x^n su dung thanh ghi chung
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
	;;k luu trong R3
	;MOV R4, #1
	;MOV R5, #1
;LUYTHUALOOP
	;CMP R4, R3
	;BGT ENDLOOP
	;MUL R5, R1
	;ADD R4, #1
	;B LUYTHUALOOP
;ENDLOOP
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
	;BL LUYTHUA
	;ADD R0, R5
	;ADD R3, #1
	;B loop
	
;thoat
	;SWI &11
	;END