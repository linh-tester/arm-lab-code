;;Chuyen co so 8 sang 2 -> 1 bit 8 = 3 bit 2
	;AREA RESET, DATA, READONLY
		;DCD 0x20001000
		;DCD Reset_Handler
;DauVao DCB 1, 7, 1, 0
;DoDai DCD 4
	;AREA STORE, DATA,READWRITE 
;DauRa SPACE 100
	;AREA MYCODE, CODE, READONLY
	;EXPORT Reset_Handler
	;ENTRY
;Reset_Handler
	;LDR R0, =DauVao
	;LDR R1, DoDai
	;LDR R2, =DauRa
	;MOV R4, #3
	;MUL R4, R1 ; dich ve sau 3 * n - 1 o
	;SUB R4, #1
	;ADD R2, R4
	;ADD R0, R1 ; Dich ve sau n -1
	;SUB R0, #1
;Loop
	;CMP R1, #0
	;BEQ Thoat
	;LDRB R3, [R0], #-1
	;; Ghi bo 3 bit
	;AND R4, R3, #1
	;STRB R4, [R2], #-1
	
	;LSR R3, #1
	;AND R4, R3, #1
	;STRB R4, [R2], #-1
	
	;LSR R3, #1
	;AND R4, R3, #1
	;STRB R4, [R2], #-1
	;SUB R1, #1
	;B Loop
;Thoat
	;SWI &11
	;END