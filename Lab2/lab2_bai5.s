	;AREA RESET, DATA, READONLY
		;DCD 0x20001000
		;DCD Reset_Handler
	;ALIGN
;nums DCD 1, -2, -3
	;DCD 4, -3, 6
	;DCD -7, 9, 8
	
;MAX EQU 9
	;AREA MYCODE, CODE, READONLY
		;ENTRY
		;EXPORT Reset_Handler
		
;Reset_Handler
;;====================================
;start
	;MOV R0,#0 ; duong
	;MOV R1,#0 ; am
	;LDR R2,=nums ;Nap dia chi nums vao R1
	;LDR R3,=MAX
;do
	;CMP R3, #0
	;BLE thoat
	;LDR R4, [R2], #4 ; Dia chi R4 gan bang dia chi R1  + offset(R2)
	
	;CMP R4, #0
	;BLT so_am
	;BGT so_duong
	;B continue
;so_am
	;ADD R1, #1
	;B continue
;so_duong
	;ADD R0, #1
;continue
	;SUB R3, #1 ;Giam so phan tu
	;B do
;thoat
	;SWI &11
;;====================================
;STOP B STOP
	;END