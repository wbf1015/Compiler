	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.section .rodata
	.comm a, 3200, 4
	.text
	@ 0
	.global main
	.type main , %function
main:
	push {fp, lr}
	mov fp, sp
	sub sp, sp, #0
.L1:
	mov r0, #0
	add sp, sp, #0
	pop {fp, lr}
	bx lr

addr_a0:
	.word a
