;;Tinh tong so chan le
	;AREA RESET, DATA, READONLY
		;DCD 0x20001000
		;DCD Reset_Handler
	;ALIGN
;nums    DCD 4,-2,3
	;DCD 3,-2,4
	;DCD 4,3,-8
;n EQU 9
	;AREA MYCODE, CODE, READONLY
		;ENTRY
		;EXPORT Reset_Handler
		
;Reset_Handler
;;====================================
;start
	;MOV R0, #0 ;Tong chan
	;MOV R1, #0 ;Tong le
	;LDR R2, =nums
	;LDR R3, =n
;loop
	;CMP R3, #0
	;BLE thoat
	;LDR R4, [R2], #4
	;LSRS R5, R4, #1 ; Dich phai 1 bit va Update flag
	;BCS add_le ; Co C duoc dat thanh bit cuoi cung dich ra khoi bit ban dau (neu = 1 thi la le)
	;BCC add_chan; C = 0
	
	
;;====================================
;add_chan
	;ADD R0, R4
	;B continue
;;====================================
;add_le
	;ADD R1, R4
	;B continue
;;====================================
;continue
	;SUB R3, #1
	;B loop
;thoat
	;SWI &11
;STOP B STOP
	;END