;;Tim ucln dung thanh ghi chung
	;AREA RESET, DATA, READONLY
		;DCD 0x20001000
		;DCD Reset_Handler
	;ALIGN
;M DCD 15
;N DCD 20
	;AREA MYCODE, CODE, READONLY
	;EXPORT Reset_Handler
	
;UCLN PROC
;LOOPUCLN	
	;CMP R1, R2
	;BXEQ LR
	;BGT CONTINUE
;SWAP 
	;MOV R3, R1
	;MOV R1, R2
	;MOV R2, R3
;CONTINUE
	;SUB R1, R1, R2 ; m = m - n
	;B LOOPUCLN
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
	;BL UCLN
;ketqua
	;MOV R0, R2 ; Ket qua luu trong R0
;thoat
	;SWI &11
	;END