;;Tong so nguyen to trong chuoi so
	;AREA RESET, DATA, READONLY
		;DCD 0x20001000
		;DCD Reset_Handler
;nums DCD 1, 3, 2, 5, 11, 9
;SPT DCD 6
	;AREA MYCODE, CODE, READONLY
	;EXPORT Reset_Handler

	;ENTRY
;Reset_Handler
	;LDR R0, =nums
	;LDR R1, SPT
	;MOV R2, #0
;Loop
	;CMP R1, #0
	;BEQ thoat
	;LDR R3, [R0], #4
	;PUSH {R3}
	;BL CHECK_SNT
	;POP {R4}
	;CMP R4, #1
	;ADDEQ R2, R3
	;SUB R1, #1
	;B Loop
;;============================
;CHIADU PROC
	;POP {R7, R8}
;Loop_2
	;CMP R7, R8
	;BLT Done_CHIADU
	;SUB R7, R8
	;B Loop_2
;Done_CHIADU
	;PUSH {R7}
	;BX LR
	;ENDP
;;============================
;CHECK_SNT PROC
	;MOV R10, LR
	;POP {R5}
	;CMP R5, #2
	;BLT NOT_SNT
	;BEQ SNT
	;MOV R6, #2
;Loop_1
	;CMP R6, R5
	;BEQ SNT
	;PUSH {R5, R6}
	;BL CHIADU
	;POP {R7}
	;CMP R7, #0
	;BEQ NOT_SNT
	;ADD R6, #1
	;B Loop_1
;SNT
	;MOV R5, #1
	;PUSH {R5}
	;B DONE
;NOT_SNT
	;MOV R5, #0
	;PUSH {R5}
;DONE
	;BX R10
	;ENDP
;;=======================
;thoat
	;NOP
	;END