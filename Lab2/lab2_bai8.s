;;Tinh tong so chia het cho 5
	;AREA RESET, DATA, READONLY
		;DCD 0x20001000
		;DCD Reset_Handler
	;ALIGN
;nums    DCD 5,-5,3
	;DCD 3,-2,10
	;DCD 4,-5,-8
;n EQU 9
	;AREA MYCODE, CODE, READONLY
		;ENTRY
		;EXPORT Reset_Handler
		
;Reset_Handler
;;====================================
;start
	;MOV R0, #0 ;Tong
	;LDR R1, =nums
	;LDR R2, =n
;loop
	;CMP R2, #0
	;BLE thoat
	;LDR R3, [R1], #4
	;MOV R4, R3	
	;CMP R4, #0
	;BLT check_negative
	;BGT check_postive
	;B continue
;;====================================
;check_postive
	;CMP R4, #5
	;BLT end_check ; 0-4
	;SUB R4, #5
	;B check_postive
;;====================================
;check_negative
	;CMP R4, #-5
	;BGT end_check ; -4 - 0
	;ADD R4, #5
	;B check_postive
;end_check
	;CMP R4, #0
	;ADDEQ R0, R3
	;B continue
;;====================================
;continue
	;SUB R2, #1
	;B loop
;thoat
	;SWI &11
;STOP B STOP
	;END