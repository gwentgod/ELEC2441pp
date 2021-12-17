.data
fac_tab: .word 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

.text
.global main
main:
LDR r1, =fac_tab
MOV r0, #10
MOV r2, #1
BL myFact
SWI 0x11

myFact:
CMP r2, r0
BGT Exit

LDR r3, [r1, #0]
MUL r3, r2, r3
ADD r1, r1, #4
STR r3, [r1, #0]
ADD r2, r2, #1

B myFact

Exit:
MOV pc, lr

.end

