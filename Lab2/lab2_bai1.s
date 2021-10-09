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
	;LDR R1,=nums ;Nap dia chi nums vao R1
	;MOV R2, #0   ; Offset
	;LDR R3,=MAX
;do
	;CMP R3, #0
	;BLE STOP
	;LDR R4, [R1, R2] ; Dia chi R4 gan bang dia chi R1  + offset(R2)
	;ADD R0, R0, R4
	;ADD R2, R2, #4
	;SUB R3, #1
	;B do
;;====================================
;STOP B STOP
	;END