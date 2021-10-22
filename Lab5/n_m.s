;; Chuyen co so bat ky n sang m
	;AREA RESET, DATA, READONLY
		;DCD 0x20001000
		;DCD Reset_Handler
;DauVao DCB &0A, &0, &0, &0A, &0F
;DoDai EQU 5
;HeSoVao EQU 16
;HeSoRa EQU 10
	;AREA STORE, DATA, READWRITE
;DauRa SPACE 100
	;AREA MYCODE, CODE, READONLY
		;EXPORT Reset_Handler
	;ENTRY
;Reset_Handler
	;LDR R0, =DauVao
	;LDR R1, =DoDai
	;LDR R2, =HeSoVao
;;Dau tien ta tinh so dau vao 
	;MOV R3, #0 ; Ket qua luu vao day
	;MOV R4, #1 ; He so de nhan 1 -> n -> n^2
	;SUB R1, #1 ; offset bat dau tu 0->n-1
;;Ta doc tu so cuoi len dau, nhan voi he so xong nhan hs vs n
;Nhan
	;CMP R1, #0
	;BLT TinhToan
	;LDRB R5, [R0, R1]
	;MUL R5, R4 ; x.n^k
	;ADD R3, R5 ; Cong vao so ban dau
	;SUB R1, #1
	;MUL R4, R2 ; Nhan he so voi n
	;B Nhan
;;Luc nay ket qua luu o R3
;TinhToan
	;LDR R0, =DauRa
	;LDR R1, =HeSoRa
	;ADD R0, #100; Lui ve cuoi ghi nguoc lai
;;Chia lay du xong luu va dich ve truoc
;;Lam tiep voi thuong
;Loop
	;CMP R3, #0
	;BEQ Thoat
	;MOV R4, R3 ; R4 la du
	;MOV R5, #0
;Chia
	;CMP R4, R1
	;BLT Luu
	;ADD R5, #1
	;SUB R4, R1
	;B Chia
;Luu
	;STRB R4, [R0], #-1; Luu du va dich truoc
	;MOV R3, R5; Lam tiep voi thuong
	;B Loop
;Thoat
	;NOP
	;END