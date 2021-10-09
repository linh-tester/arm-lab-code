;; Chuong trinh tinh tong 1 + x^n
	;AREA RESET, DATA, READONLY
		;DCD 0x20001000
		;DCD Reset_Handler
	;ALIGN
;X DCD 2
;N DCD 3
	;AREA MYCODE, CODE, READONLY
		;ENTRY
		;EXPORT Reset_Handler
;Reset_Handler
;;===================================
	;MOV R0, #0 ; Tong
	;LDR R1, X
	;LDR R2, N 
	;MOV R3, #0 ; bien i duyet tung x^k
;LOOP
	;CMP R3, R2
	;BGT STOP
	;BL LUYTHUA
;;===================================
;LUYTHUA PROC
	;MOV R4, #1 ; Gia tri luy thua
	;MOV R5, #1 ; i
;LOOPLUYTHUA
	;CMP R5, R3
	;BGT ENDLUYTHUA
	;MUL R4, R1
	;ADD R5, #1
	;B LOOPLUYTHUA
;ENDLUYTHUA
	;ADD R0, R4
	;ADD R3, #1
	;B LOOP
	;ENDP
;;===================================
;STOP
	;NOP
	;END