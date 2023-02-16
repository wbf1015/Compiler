	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global a
	.align 4
	.size a, 32
a:
	.word 0
	.section .rodata
	.text
	@ 0
	.global main
	.type main , %function
main:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub sp, sp, #0
.L4:
	ldr r4, =10
	ldr r5, addr_a0
	str r4, [r5]
	ldr r5, addr_a0
	ldr r4, [r5]
	cmp r4, #0
	movgt r4, #1
	movle r4, #0
	bgt .L5
	b .L9
.L5:
	mov r0, #1
	add sp, sp, #0
	pop {r4, r5, fp, lr}
	bx lr
	b .L6
.L6:
	mov r0, #0
	add sp, sp, #0
	pop {r4, r5, fp, lr}
	bx lr
.L9:
	b .L6

addr_a0:
	.word a
