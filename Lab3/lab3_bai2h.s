;;Tim bcnn dung ngan xep
	;AREA RESET, DATA, READONLY
		;DCD 0x20001000
		;DCD Reset_Handler
	;ALIGN
;M DCD 15
;N DCD 10
	;AREA MYCODE, CODE, READONLY
	;EXPORT Reset_Handler
	
;UCLN PROC
	;POP {R3, R4}
;LOOPUCLN	
	;CMP R3, R4
	;BEQ ENDUCLN
	;BGT CONTINUE
;SWAP	
	;;PUSH {R3, R4}
	;;POP {R4}
	;;POP {R3}	
	;MOV R5, R3
	;MOV R3, R4
	;MOV R4, R5
;CONTINUE
	;SUB R3, R4
	;B LOOPUCLN
;ENDUCLN	
	;PUSH {R4}
	;BX LR
	;ENDP
;BCNN PROC
	;;POP {R5}
	;POP {R3, R4, R6}
	;MUL R3, R4
	;UDIV R6, R3, R6
	;PUSH {R6}
	;BX LR
	;ENDP
	
	
	;ENTRY
;Reset_Handler
	;MOV R0, #0
	;LDR R1, N
	;LDR R2, M
	
	;CMP R1, #0
	;BEQ thoat
	;CMP R2, #0
	;BEQ thoat
	;PUSH {R1, R2}
	;BL UCLN
	;PUSH {R1, R2}
	;BL BCNN
	;POP {R0} ; Ket qua luu trong R0
;thoat
	;SWI &11
	;END