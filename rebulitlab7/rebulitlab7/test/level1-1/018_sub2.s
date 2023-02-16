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
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L6:
	ldr r4, =2
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r6, addr_a0
	ldr r5, [r6]
	sub r6, r4, r5
	mov r0, r6
	add sp, sp, #4
	pop {r4, r5, r6, fp, lr}
	bx lr

addr_a0:
	.word a
