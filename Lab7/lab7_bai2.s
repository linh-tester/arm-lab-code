	;AREA RESET, DATA, READONLY
		;DCD 0x20001000
		;DCD Reset_Handler
	;ALIGN
	;AREA MYDATA, DATA, READONLY
;MATRIXA DCD 1, 2, 3
	;DCD -2, 1, 1
	;DCD 2, 1, 3
;COL_A EQU 3
;ROW_A EQU 3
;MATRIXB DCD 1, 0, 1
	;DCD 1, -1, 2
	;DCD 2, 0, 1
;COL_B EQU 3
;ROW_B EQU 3
	;AREA STORE, DATA, READWRITE
;RESULT SPACE 0	
	;AREA MYCODE, CODE, READONLY
	;EXPORT Reset_Handler
;;==================================
;ADDMATRIX PROC
	;LDR R1, =COL_A
	;LDR R2, =COL_B
	;CMP R1, R2
	;BNE Thoat
	;LDR R1, =ROW_A
	;LDR R2, =ROW_B
	;CMP R1, R2
	;BNE Thoat
	;LDR R2, =COL_A
	;MUL R0, R1, R2 ; Kich thuoc ma tran
	
	;LDR R1, =MATRIXA
	;LDR R2, =MATRIXB
	;LDR R3, =RESULT
;Loop_1
	;CMP R0, #0
	;BEQ DONEADD
	;LDR R4, [R1], #4
	;LDR R5, [R2], #4
	;ADD R4, R5
	;STR R4, [R3], #4
	;SUB R0, #1
	;B Loop_1
;DONEADD
	;BX LR
	;ENDP
;;==================================
;SUBMATRIX PROC
	;LDR R1, =COL_A
	;LDR R2, =COL_B
	;CMP R1, R2
	;BNE Thoat
	;LDR R1, =ROW_A
	;LDR R2, =ROW_B
	;CMP R1, R2
	;BNE Thoat
	;LDR R2, =COL_A
	;MUL R0, R1, R2 ; Kich thuoc ma tran
	
	;LDR R1, =MATRIXA
	;LDR R2, =MATRIXB
	;LDR R3, =RESULT
;Loop_2
	;CMP R0, #0
	;BEQ DONESUB
	;LDR R4, [R1], #4
	;LDR R5, [R2], #4
	;SUB R4, R5
	;STR R4, [R3], #4
	;SUB R0, #1
	;B Loop_2
;DONESUB
	;BX LR
	;ENDP
;;==================================
;MULTIPLYMATRIX PROC
	;LDR R1, =COL_A
	;LDR R2, =ROW_B
	;CMP R1, R2
	;BNE Thoat
	;MOV R3, R1
	;LDR R0, =RESULT
	;LDR R1, =MATRIXA
	;LDR R2, =MATRIXB
	;LDR R4, =ROW_A
	;LDR R5, =COL_B
	;MOV R6, #0 ; i
	;MOV R7, #0 ; j
;Loop_3
	;CMP R6, ROW_A
	;BEQ DONEMUL
;Loop_4
	;CMP R7, COL_B
	;BEQ EndLoop_4
	;MOV R8, #0 ; Gia tri
	;MOV 
;Loop_5
	;; R6 * R4 + R7
	;MUL R9, R6, R4
	;ADD R9, R7
	;MOV R12, #4
	;MUL R9, R12
	;LDR R10, [R1, R9]
	;; R7 * R5 + R6
	;MUL R9, R7, R5
	;ADD R9, R6
	;MOV R12, #4
	;MUL R9, R12
	;LDR R11, [R2, R9]
;EndLoop_5
	;STR R8, [R0], #4
	;ADD Loop_4
	;B Loop_4
;EndLoop_4
	;MOV R7, #0
	;ADD R6, #1
	;B Loop_3
;DONEMUL
	;BX LR
	;ENDP
;;==================================
	;ENTRY
;Reset_Handler
	;;BL ADDMATRIX
	;BL SUBMATRIX
;Thoat
	;NOP
	;END