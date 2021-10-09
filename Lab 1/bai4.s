;;Viet chuong trinh tong cac so <= N va chia het cho 5
	;AREA RESET, DATA, READONLY
		;DCD 0x20001000
		;DCD Reset_Handler
;N DCD 10
	;AREA MYCODE, CODE, READONLY
		;ENTRY
		;EXPORT Reset_Handler
;Reset_Handler
;;===================================
	;MOV R0, #0
	;MOV R1, #5 ;So chia het cho 5 be nhat
	;LDR R2, N
;LOOP
	;CMP R1, R2
	;BGT STOP
	;ADD R0, R1
	;ADD R1, #5
	;B LOOP
;;===================================
;STOP
	;NOP
	;END