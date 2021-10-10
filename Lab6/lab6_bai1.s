;; So sanh chuoi
	;AREA RESET, DATA, READONLY
		;DCD 0x20001000
		;DCD Reset_Handler
	;ALIGN
	;AREA DATA1, DATA, READONLY
;CHUOIA DCD 11
	;DCB "Hello world"	
	;AREA DATA2, DATA, READONLY
;CHUOIB DCD 11
	;DCB "Hello world"
	;AREA MYCODE, CODE, READONLY
	;EXPORT Reset_Handler
	
;Reset_Handler
	;LDR R1, =CHUOIA
	;LDR R2, =CHUOIB
	;LDR R3, [R1], #4 ;Doc do dai chuoi A
	;LDR R4, [R2], #4 ;Doc do dai chuoi B
	;CMP R3, R4
	;BNE NOT_MATCH ; Do dai khac nhau
;LOOP
	;CMP R3, #0; Kiem tra xem da duyet het chua
	;BEQ MATCH
	;LDRB R5, [R1], #1 ; Lay tung ky tu
	;LDRB R6, [R2], #1
	;CMP R5, R6
	;BNE NOT_MATCH ; Khac ky tu
	;SUB R3, #1
	;SUB R4, #1	
	;B LOOP
;MATCH
	;MOV R0, #1
	;B EXIT
;NOT_MATCH
	;MOV R0, #0
	;B EXIT
;EXIT
	;SWI &11
	;END