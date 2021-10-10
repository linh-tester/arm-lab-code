;; Tinh do dai chuoi
	;AREA RESET, DATA, READONLY
		;DCD 0x20001000
		;DCD Reset_Handler
	;ALIGN
	;AREA DATA1, DATA, READONLY
;CHUOI DCB "Hello world",0	
	;AREA MYCODE, CODE, READONLY
	;EXPORT Reset_Handler
	
;Reset_Handler
	;MOV R0, #0
	;LDR R1, =CHUOI
;LOOP
	;LDRB R2, [R1], #1
	;CMP R2, #0
	;BEQ EXIT
	;ADD R0, #1
	;B LOOP
;EXIT
	;SWI &11
	;END