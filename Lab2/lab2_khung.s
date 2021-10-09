	;AREA RESET, DATA, READONLY
		;DCD 0x20001000
		;DCD Reset_Handler
	;ALIGN
;nums DCD 1,2,3,4,5,6,7,8,9,10
;MAX EQU 10
	;AREA MYCODE, CODE, READONLY
		;ENTRY
		;EXPORT Reset_Handler
		
;Reset_Handler
;;====================================
;start
	;MOV R0,#0 
	;LDR R2,=nums
	;LDR R3,=MAX
;do
	;CMP R3, #0
	;BLE STOP
	;LDR R4, [R2], #4
	
	;SUB R3, #1 ;Giam so phan tu
	;B do
;;====================================
;STOP B STOP
	;END