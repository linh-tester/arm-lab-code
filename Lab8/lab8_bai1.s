;; Ma hoa caesar voi khoa k
	;AREA RESET, DATA, READONLY
		;DCD 0x20001000
		;DCD Reset_Handler
	;ALIGN
;K DCD 3
;XauRo DCB "HELLO FRIEND",0
	;AREA STORE, DATA, READWRITE
;XauMa SPACE 100
	;AREA MYCODE, CODE, READONLY
	;EXPORT Reset_Handler
	;ENTRY
;Reset_Handler
	;LDR R0, K
	;LDR R1,=XauRo
	;LDR R2,=XauMa
;LOOP
	;LDRB R3, [R1], #1
	;CMP R3, #0
	;BEQ STOP
	;CMP R3, #0x41 ; A
	;BLT CONTINUE ;Tu khong hop le bo qua
	;CMP R3, #0x5A ;Z
	;BLE IN_THUONG ; A-Z
	;CMP R3, #0x61 ; a
	;BLT CONTINUE ;
	;CMP R3, #0x7A ; z
	;BLE IN_HOA
	;B CONTINUE
;IN_THUONG
	;ADD R3, R0 
	;CMP R3, #0x7A ; xem co qua tu z khong
	;SUBGT R3, #26 ; quay lai tu a
	;B CONTINUE
;IN_HOA
	;ADD R3, R0 
	;CMP R3, #0x5A ; xem co qua tu Z khong
	;SUBGT R3, #26 ; quay lai tu A
	;B CONTINUE
;CONTINUE
	;STRB R3, [R2], #1 ; Luu tu vao
	;B LOOP
;STOP
	;MOV R3, #0
	;STRB R3, [R2]
	;SWI &11
	;END
	