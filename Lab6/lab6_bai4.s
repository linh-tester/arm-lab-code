;; Chuan hoa xau
	;AREA RESET, DATA, READONLY
		;DCD 0x20001000
		;DCD Reset_Handler
	;ALIGN
	;AREA DATA1, DATA, READONLY
;CHUOI DCB "xAu chuAn HoA",0		
	;AREA STORE, DATA, READWRITE
;KETQUA DCB 0	
	;AREA MYCODE, CODE, READONLY
	;EXPORT Reset_Handler
;IN_HOA PROC
	;CMP R2, #0x61
	;SUBGE R2, #0x20 ; >= a
	;BX LR
	;ENDP
;IN_THUONG PROC
	;CMP R2, #0x5A
	;ADDLE R2, #32 ; <= Z
	;BX LR
	;ENDP
	;ENTRY
;Reset_Handler
	;LDR R0, =CHUOI	
	;LDR R1, =KETQUA
	;LDRB R2, [R0], #1
	;CMP R2, #0
	;BEQ EXIT
	;;CMP R2, #0x61 ; Kiem tra xem ky tu tiep theo la thuong hay in hoa
	;BL IN_HOA	
	;STRB R2, [R1], #1
;LOOP
	;LDRB R2, [R0], #1
	;CMP R2, #0
	;BEQ EXIT	
	;CMP R2, #0x20 ; Kiem tra ky tu khoang 
	;BEQ READ_SPACE ; Gap ky tu khoang tran
	;BL IN_THUONG ; <= Z
	;STRB R2, [R1], #1	
	;B LOOP
;READ_SPACE	
	;STRB R2, [R1], #1	
;REMOVE_SPACE
	;LDRB R2, [R0], #1
	;CMP R2, #20
	;BEQ REMOVE_SPACE
	;BL IN_HOA
	;STRB R2, [R1], #1
	;B LOOP
;EXIT
	;MOV R2, #0	
	;STRB R2, [R1]
	;SWI &11
	;END