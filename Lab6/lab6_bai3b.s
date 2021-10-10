;; Dao chuoi cai dat theo ky tu ket thuc
	;AREA RESET, DATA, READONLY
		;DCD 0x20001000
		;DCD Reset_Handler
	;ALIGN
	;AREA DATA1, DATA, READONLY
;CHUOI DCB "Hello world",0
	;AREA DATA2, DATA, READWRITE
;KETQUA DCB 0
	;AREA MYCODE, CODE, READONLY
	;EXPORT Reset_Handler
;Reset_Handler
	;LDR R1, =CHUOI
	;LDR R2, =KETQUA
	;MOV R0, R1 ; Sao cheo dia chi ban dau
	;MOV R4, #0
;GET_LENGTH
	;LDR R3, [R1], #1
	;CMP R3, #0
	;BEQ CONTINUE
	;ADD R4, #1
	;B GET_LENGTH
;CONTINUE
	;SUB R4, #1
;LOOP
	;CMP R4, #0; Kiem tra xem da duyet het chua
	;BLT EXIT
	;LDRB R5, [R0, R4]
	;STRB R5, [R2], #1
	;SUB R4, #1
	;B LOOP
;EXIT
	;MOV R0, #0
	;STRB R0, [R2]
	;SWI &11
	;END