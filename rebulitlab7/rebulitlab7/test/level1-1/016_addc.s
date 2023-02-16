	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.section .rodata
	.global a
	.align 4
	.size a, 32
a:
	.word 10
	.text
	@ 0
	.global main
	.type main , %function
main:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub sp, sp, #0
.L3:
	ldr r5, addr_a0
	ldr r4, [r5]
	add r5, r4, #5
	sub r5, r4, #5
	add r5, r4, #5
	mov r0, r5
	add sp, sp, #0
	pop {r4, r5, fp, lr}
	bx lr

addr_a0:
	.word a
