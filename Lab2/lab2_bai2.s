	;AREA RESET, DATA, READONLY
		;DCD 0x20001000
		;DCD Reset_Handler
	;ALIGN
;nums DCD 6,2,9,3,5,8,7,4,1,3
;MAX EQU 10
	;AREA MYCODE, CODE, READONLY
		;ENTRY
		;EXPORT Reset_Handler
		
;Reset_Handler
;;====================================
;start
	;LDR R2,=nums ;Nap dia chi nums
	;MOV R3, #0   ; Offset
	;LDR R4,=MAX
	;LDR R5, [R1, R2]
	;MOV R0, R5 ; Min
	;MOV R1, R5 ; Max
;do
	;CMP R4, #0
	;BLE stop
	;LDR R5, [R2, R3] ; Dia chi R4 gan bang dia chi nums  + offset
	;;ADD R0, R0, R4
	;CMP R5, R0
	;BLT set_min
	;CMP R5, R1
	;BGT set_max
	;B continue
;set_min
	;MOV R0, R5
	;B continue
;set_max
	;MOV R1, R5
;continue
	;ADD R3, R3, #4
	;SUB R4, #1 ;Giam so phan tu
	;B do

;;====================================
;stop B stop
	;END