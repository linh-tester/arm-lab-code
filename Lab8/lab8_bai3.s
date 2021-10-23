;; Ma hoa chuyen vi toan cuc
	;AREA RESET, DATA, READONLY
		;DCD 0x20001000
		;DCD Reset_Handler
;XauRo DCB "THISWASUSEDINWAR",0
;K DCB 11,12,4,17,0,3,5,22,1,24,20,10,25,8,6,21,7,9,18,14,15,13,16,19,23,2
	;AREA STORE, DATA, READWRITE
;XauMa SPACE 0
	;AREA MYCODE, CODE, READONLY
		;EXPORT Reset_Handler
	;ENTRY
;Reset_Handler
	;LDR R0, =XauRo
	;LDR R1, =K
	;LDR R2, =XauMa
;Loop
	;LDRB R3, [R0], #1
	;CMP R3, #0
	;BEQ Thoat
	;SUB R3, #0x41 ; A
	;CMP R3, #0
	;BLT Loop ; Chi luu A -> Z
	;CMP R3, #26; 26 chu cai
	;BGE Loop ; 0-25
	;LDRB R4, [R1, R3]
	;ADD R5, R4, #0x41 ; R3 = R4 + A
	;CMP R5, #0x61; Z
	;SUBGT R5, #26
	;STRB R5, [R2], #1
	;B Loop
;Thoat
	;NOP
	;END