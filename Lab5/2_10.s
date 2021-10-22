;;Co so 2 sang co so 10
	;AREA RESET, DATA, READONLY
		;DCD 0x20001000
		;DCD Reset_Handler
;DauVao DCB 1,0,1,0,1,1,0,0,1,1
;DoDai DCD 10
	;AREA STORE, DATA, READWRITE
;DauRa SPACE 100
	;AREA MYCODE, CODE, READONLY
		;EXPORT Reset_Handler
;;===============================
	;ENTRY
;Reset_Handler
	;LDR R0, =DauVao
	;LDR R1, DoDai
	;LDR R2, =DauRa
	;SUB R1, #1 ; offset bat dau tu 0
	;MOV R3, #0; So he 10
	;MOV R4, #1; He so de nhan
;Nhan
	;CMP R1, #0
	;BLT TinhToan
	;LDRB R5, [R0, R1]
	;MUL R5, R4
	;ADD R3, R5 
	;ADD R4, R4 ; Nhan 2
	;SUB R1, #1
	;B Nhan
;TinhToan
	;; R3 luu ket qua ta can tinh toan de luu lai
	;ADD R2, #10 ; lui lai de ghi 
	;MOV R0, #10 ; so de chia
;Loop
	;CMP R3, #0
	;BEQ Thoat
	;MOV R4, R3
	;MOV R5, #0
;ChiaDu
	;CMP R4, R0
	;BLT Luu
	;SUB R4, R0
	;ADD R5, #1
	;B ChiaDu
;Luu
	;; R4 luu so du; R5 la thuong
	;STRB R4, [R2], #-1
	;MOV R3, R5
	;B Loop
;Thoat
	;NOP
	;END