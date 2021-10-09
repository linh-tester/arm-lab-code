	;AREA RESET, DATA, READONLY
		;DCD 0x20001000
		;DCD Reset_Handler
	;ALIGN
;nums    DCD 1,-2,3,4,5
	;DCD 3,-2,4,2,3
	;DCD 4,3,-8,-9,3
	;DCD 1,-3,5,6,2
	;DCD 4,9,0,1,-9
;columns EQU 5
	;AREA MYCODE, CODE, READONLY
		;ENTRY
		;EXPORT Reset_Handler
		
;Reset_Handler
;;====================================
;start
	;;BL CheoChinh
	;BL CheoPhu
;;====================================
;CheoChinh PROC
	;LDR R2, =nums
	;LDR R3, =columns
	;LDR R4, [R2], #24 ;Tu vi tri [0][0] sang [1][1] ([0] ->[6]) 24 = 4 * 6
	;MOV R0, R4 ; Gan min bang phan tu dau tien
	;MOV R1, R4 ; Gan max bang phan tu dau tien
	;SUB R3, #1 ; Bat dau tu hang thu 2
;loopCC
    ;CMP R3, #0 ; Duyet den han cuoi cung hay chua
	;BLE thoat 
	;LDR R4, [R2], #24 ;Lay gia tri 	
	;CMP R4, R0
	;BLT minCC ;  R4 < R0	
	;CMP R4, R1
	;BGT maxCC ; R4 > R1	
	;B continueCC	
	
;maxCC
	;MOV R1, R4
	;B continueCC
;minCC
	;MOV R0, R4
;continueCC
	;SUB R3, #1 ; Nhay den hang tiep
	;B loopCC
	;ENDP
;;====================================
;CheoPhu PROC
	;LDR R2, =nums
	;ADD R2, #16 ; Lay dia chi cua phan tu [0][4] = dia chi phan tu dau tien + 4 * 4
	;LDR R3, =columns
	;LDR R4, [R2], #16 ;Tu vi tri [0][4] sang [1][3] ([4] ->[8]) 16 = 4 * 4
	;MOV R0, R4 ; Gan min bang phan tu [0][4]
	;MOV R1, R4 ; Gan max bang phan tu [0][4]
	;SUB R3, #1 ; Bat dau tu hang thu 2
;loopCP
    ;CMP R3, #0 ; Duyet den han cuoi cung hay chua
	;BLE thoat 
	;LDR R4, [R2], #16 ;Lay gia tri 	
	;CMP R4, R0
	;BLT minCP ;  R4 < R0	
	;CMP R4, R1
	;BGT maxCP ; R4 > R1	
	;B continueCP	
	
;maxCP
	;MOV R1, R4
	;B continueCP
;minCP
	;MOV R0, R4

;continueCP
	;SUB R3, #1 ; Nhay den hang tiep
	;B loopCP
	;ENDP
;;====================================
;thoat
	;SWI &11
;STOP B STOP
	;END