;;He 2 sang 8
	;AREA RESET, DATA, READONLY
		;DCD 0x20001000
		;DCD Reset_Handler
;DauVao DCB 1,0,1,1,0,1,0,1
;DoDai DCD 8
	;AREA STORE, DATA, READWRITE
;DauRa SPACE 100
	;AREA MYCODE, CODE, READONLY
		;EXPORT Reset_Handler
	;ENTRY
;Reset_Handler
	;LDR R0, =DauVao
	;LDR R1, DoDai
	;LDR R2, =DauRa
	;ADD R2, R1
	;ADD R0, R1
	;SUB R0, #1 ; Dich n - 1
;Loop
	;CMP R1, #0 
	;BLE Thoat	
	;MOV R3, #0
	;LDRB R4, [R0], #-1; Doc roi dich nguoc ve truoc
	;;MOV R5, #1
	;;MUL R4, R5
	;;ADD R3, R4
	;CMP R4, #1 ; Vi nhi phan nen chi co the la 0 hoac 1 nen ta cong truc tiep
	;ADDEQ R3, #1
	;CMP R1, #1
	;BEQ Done ; Chi con 1 so thi ghi ket qua luon
	;;Neu con so thi doc so tiep theo
	;LDRB R4, [R0], #-1 ; Doc tuong tu
	;CMP R4, #1
	;ADDEQ R3, #2
	;CMP R1, #2
	;BEQ Done; Chi con 2 so
	
	;LDRB R4, [R0], #-1
	;CMP R4, #1
	;ADDEQ R3, #4
	;; Ghi ket qua
;Done
	;STRB R3, [R2], #-1
	;SUB R1, #3
	;B Loop
;Thoat 
	;NOP
	;END