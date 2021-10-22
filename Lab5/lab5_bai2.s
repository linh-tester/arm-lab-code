;; Bit chan le
	;AREA RESET, DATA, READONLY
		;DCD 0x20001000
		;DCD Reset_Handler
;chuoibit DCB 1,0,1,1,0,0,0,1
;dodai DCD 8
	;AREA STORE, DATA, READWRITE
;kq SPACE 10
	;AREA MYCODE, CODE, READONLY
	;EXPORT Reset_Handler
	;ENTRY
;Reset_Handler
	;LDR R0, =chuoibit
	;LDR R1, dodai
	;LDR R2, =kq
	;MOV R3, #0 ; so bit 1
;Loop
	;CMP R1, #0
	;BEQ Result
	;LDRB R4, [R0], #1
	;CMP R4, #1
	;ADDEQ R3, #1
	;SUB R1, #1
	;B Loop
;Result
	;AND R3, #1 ; 1 neu chan 0 neu le
	;STRB R3, [R2]
	;END