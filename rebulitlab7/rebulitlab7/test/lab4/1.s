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
	sub sp, sp, #4
.L6:
	ldr r5, =1
	add r4, r5, #2
	sub r4, r5, #2
	add r4, r5, #2
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	cmp r4, #5
	movlt r4, #1
	movge r4, #0
	blt .L8
	b .L12
.L8:
	mov r0, #1
	add sp, sp, #4
	pop {r4, r5, fp, lr}
	bx lr
	b .L9
.L9:
	mov r0, #0
	add sp, sp, #4
	pop {r4, r5, fp, lr}
	bx lr
.L12:
	b .L9

addr_a0:
	.word a
