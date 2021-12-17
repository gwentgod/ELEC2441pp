.data
v_seq: .word 1, 1

.text
.global main
main:
	LDR r1, =v_seq
	MOV r0, #17
	BL iFunc
	SWI 0x11

iFunc:
	CMP r0, #2
	BLE Exit
	LDR r2, [r1, #0]
	LDR r3, [r1, #4]
	ADD r4, r2, r3
	STR r4, [r1, #8]
	ADD r1, r1, #4
	SUB r0, r0, #1
	B iFunc

Exit:
MOV pc, lr

.end

