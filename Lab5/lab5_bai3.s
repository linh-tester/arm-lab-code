;;Dem cac snt <= N
	;AREA RESET, DATA, READONLY
		;DCD 0x20001000
		;DCD Reset_Handler
	;ALIGN
;N DCD 10
	;AREA MYCODE, CODE, READONLY
	;EXPORT Reset_Handler
;;===========================
;;Lay thuong 
;Lay_Thuong PROC
	;POP {R6, R7}
	;MOV R8, #0
;Loop_1
	;CMP R6, R7
	;BLT End_Loop_1
	;ADD R8, #1
	;SUB R6, R6, R7
	;B Loop_1
;End_Loop_1
	;PUSH {R8}
	;BX LR
	;ENDP
;;Lay du
;Lay_Du PROC
	;POP {R6, R7}
;Loop_2
	;CMP R6, R7
	;BLT End_Loop_2
	;SUB R6, R6, R7
	;B Loop_2
;End_Loop_2
	;PUSH {R6}
	;BX LR
	;ENDP
;;===========================
;;Ham kiem tra so nguyen to
;Check_SNT PROC
	;MOV R10, LR ; Luu tam LR de quay lai ham chinh
	;POP {R5}
	;CMP R5, #2
	;BLT IsNot_SNT
	;BEQ Is_SNT
	;;Ta duyet tu 2 den n/2 
	;MOV R7, #2
	;PUSH {R5, R7}
	;BL Lay_Thuong
	;POP {R8} ; R8 luu n/2, R7 luu so du
	;MOV R7, #2
;Loop_3
	;CMP R7, R8
	;BGT Is_SNT ; Duyet het ma k chia het so nao thi la snt
	;PUSH {R5, R7}
	;BL Lay_Du
	;POP {R9} ;Lay moi so du R9
	;CMP R9, #0
	;BEQ IsNot_SNT
	;ADD R7, #1 
	;B Loop_3
;Is_SNT
	;MOV R9, #1
	;PUSH {R9}
	;B End_SNT
;IsNot_SNT
	;MOV R9, #0
	;PUSH {R9}
;End_SNT
	;;MOV PC, R10
	;BX R10
	;ENDP
;;===========================
	;ENTRY
;Reset_Handler
	;MOV R0, #0
	;MOV R1, #2 
	;LDR R2, N
;Loop
	;CMP R1, R2
	;BGT THOAT
	;PUSH {R1}
	;BL Check_SNT
	;POP {R3}
	;CMP R3, #1
	;ADDEQ R0, #1
	;ADD R1, #1
	;B Loop
;THOAT
	;SWI &11
	;END