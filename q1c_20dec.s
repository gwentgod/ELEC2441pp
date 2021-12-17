; File: pt.s

.data
row_sums: .word 0, 0, 0, 0, 0, 0, 0
pT_rows: .word 0, 1, 0, -1

.text
.global main
main:
	LDR r0, =pT_rows
	MOV r1, #0 ; pointer
	MOV r2, #16 ; end of pT_rows
	MOV r3, #1 ; completed rows

	STR r1, [r0, r2]
	ADD r2, r2, #4

mypasTRI:
	LDR r4, [r0, r1]
	ADD r1, r1, #4
	LDR r5, [r0, r1]

	CMP r5, #-1
	BNE append

	STR r4, [r0, r2]
	ADD r2, r2, #4
	STR r5, [r0, r2]
	ADD r2, r2, #4
	STR r4, [r0, r2]
	ADD r2, r2, #4
	
	ADD r3, r3, #1
	CMP r3, #7
	BEQ myRowSumsInit

	ADD r1, r1, #4
	B mypasTRI

append:
	ADD r4, r4, r5
	STR r4, [r0, r2]
	ADD r2, r2, #4

	B mypasTRI

myRowSumsInit:
	LDR r1 ,=row_sums
	MOV r2, #0 ; counter
	MOV r3, #0 ; sum

myRowSums:
	LDR r4, [r0, #0]
	ADD r0, r0, #4

	CMP r4, #-1
	BEQ writeSum

	ADD r3, r3, r4
	B myRowSums

writeSum:
	STR r3, [r1, #0]
	ADD r1, r1, #4
	ADD r2, r2, #1

	CMP r2, #7
	BEQ exit

	MOV r3, #0
	B myRowSums

exit:
	SWI 0x11

.end

