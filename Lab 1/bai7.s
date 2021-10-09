;; TIM UCLN
	;AREA RESET, DATA, READONLY
		;DCD 0x20001000
		;DCD Reset_Handler
	;ALIGN
;N DCD 14
;M DCD 15
	;AREA MYCODE, CODE, READONLY
		;ENTRY
		;EXPORT Reset_Handler
;Reset_Handler
;;===================================
	;MOV R0, #0
	;LDR R1, M
	;LDR R2, N
	
	;CMP R1, #0
	;BLE STOP
	
	;CMP R2, #0
	;BLE STOP

;LOOP 
	;CMP R1, R2 ; m ? n
	;BLT SWAP ; m < n -> doi vi tri
;CONTINUE
	;SUB R1, R2 ; lay m tru n 
	;CMP R1, #0 ; xem co am hay ko
	;BEQ RESULT
	;B LOOP
	
;SWAP
	;MOV R3, R1
	;MOV R1, R2
	;MOV R2, R3
	;B CONTINUE
;;===================================
;RESULT
	;MOV R0, R2
;STOP
	;NOP
	;END