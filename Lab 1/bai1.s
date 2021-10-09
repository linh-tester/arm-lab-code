;;;tinh tong tu 1 den n
;;;khai bao doan du lieu
	;AREA RESET, DATA, READONLY	
		;DCD 0x20000000
		;DCD Main ; vector reset
;N DCD 10

;;;doan ma lenh
	;AREA MYCODE, CODE, READONLY
	;ENTRY; diem vao chuong trinh
;Main
	;MOV R2, #1; i=1
	;MOV R3, #0; tong =0
	;LDR R4, N; R4 = 5
;LOOP
	;CMP R2, R4 ;so sanh 
	;BGT STOP; nhay den STOP neu R2>R4 (i>N)
	;ADD R3, R2; r3=r3+r2
	;ADD R2, #1; tang i len
	;B LOOP; 
;STOP	
	;NOP
	;END