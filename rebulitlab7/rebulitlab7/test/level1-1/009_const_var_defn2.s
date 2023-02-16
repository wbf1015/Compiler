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
	.global b
	.align 4
	.size b, 32
b:
	.word 5
	.text
	@ 0
	.global main
	.type main , %function
main:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub sp, sp, #0
.L3:
	ldr r5, addr_b0
	ldr r4, [r5]
	mov r0, r4
	add sp, sp, #0
	pop {r4, r5, fp, lr}
	bx lr

addr_a0:
	.word a
addr_b0:
	.word b
