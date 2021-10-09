	;AREA RESET, DATA, READONLY
		;DCD 0x20001000
		;DCD Main 
;N DCD 10

	;AREA MYCODE, CODE, READONLY
	;ENTRY ;Khai bao diem vao chuong trinh

;Main
;;=================================
	;MOV R0, #0 ; Tong chan
	;MOV R1, #0 ; Tong le
	;LDR R2, N
	;MOV R3, #2 ; so chan hien tai
	;MOV R4, #1 ; so le hien tai
;LOOPCHAN
	;CMP R2, R3
	;BLT ENDLOOPCHAN ; R2 < R3 thi ket thuc
	;ADD R0, R3 
	;ADD R3, #2
	;B LOOPCHAN
;ENDLOOPCHAN
;LOOPLE
	;CMP R2, R4
	;BLT STOP ; R2 < R4 thi ket thuc
	;ADD R1, R4
	;ADD R4, #2
	;B LOOPLE	
;;=================================
;STOP
	;NOP
	;END
