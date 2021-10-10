;;Chia 2 so nguyen
	;AREA RESET, DATA, READONLY
		;DCD 0x20001000
		;DCD Reset_Handler
	;ALIGN
;M DCD 15
;N DCD 3
	;AREA MYCODE, CODE, READONLY
	;EXPORT Reset_Handler

	;ENTRY
;Reset_Handler
	;MOV R0, #0
	;LDR R1, M
	;LDR R2, N
	
	;CMP R2, #0
	;BEQ thoat
	;CMP R1, #0
	
	;;SUBLT R2, #0, R2 ; so chia < 0 doi dau ca 2
	;;SUBLT R1, #0, R1
	;BGT loop_positive
	;;BLT loop_negative
	;BEQ result
;loop_positive
	;CMP R1, R2
	;BLT result
	;SUB R1, R2
	;ADD R0, #1 ; 
	;B loop_positive
;;loop_negative
	;;CMP R1, #0
	;;BGT result
	;;ADD R1, R2
	;;SUB R0, #1 ; 
	;;B loop_positive
;result
	;MOV R3, R0 ;thuong
	;MOV R4, R1 ;du
;thoat
	;SWI &11
	;END