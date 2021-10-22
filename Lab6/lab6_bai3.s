;; Dao chuoi cai dat theo do dai
	;AREA RESET, DATA, READONLY
		;DCD 0x20001000
		;DCD Reset_Handler
	;ALIGN
	;AREA DATA1, DATA, READONLY
;CHUOI DCD 11
	;DCB "Hello world"	
	;AREA DATA2, DATA, READWRITE
;KETQUA SPACE 100
	;AREA MYCODE, CODE, READONLY
	;EXPORT Reset_Handler
	
;Reset_Handler
	;LDR R1, =CHUOI
	;LDR R2, =KETQUA
	;LDR R3, [R1], #4 ;Doc do dai chuoi
	;STR R3, [R2], #4 ;Luu do dai chuoi
	;SUB R3, #1 ; 0 -> n-1
;LOOP
	;CMP R3, #0; Kiem tra xem da duyet het chua
	;BLT EXIT
	;LDRB R4, [R1, R3]
	;STRB R4, [R2], #1
	;SUB R3, #1
	;B LOOP
;EXIT
	;SWI &11
	;END