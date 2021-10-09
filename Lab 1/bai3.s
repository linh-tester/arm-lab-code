;; Tinh giai thua cua n
	;AREA RESET, DATA, READONLY
		;DCD 0x20001000
		;DCD Reset_Handler
;N DCD 3
	;AREA MYCODE, CODE, READONLY
		;ENTRY
		;EXPORT Reset_Handler
;Reset_Handler
;;===================================
	;MOV R0, #1; // giai thua
	;MOV R1, #2; // i
	;LDR R2, N;
;LOOP
	;CMP R1, R2
	;BGT STOP
	;MUL R0, R1
	;ADD R1, #1
	;B LOOP
;;===================================
;STOP
	;NOP
	;END