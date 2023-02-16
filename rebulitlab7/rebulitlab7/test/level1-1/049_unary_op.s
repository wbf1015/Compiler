	.arch armv8-a
	.arch_extension crc
	.arm
	.section .rodata
	.text
	@ 0
	.global main
	.type main , %function
main:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L14:
	ldr r4, =10
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	cmp r4, #0
	moveq r4, #1
	movne r4, #0
	moveq r4, #1
	movne r4, #0
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r6, =0
	sub r4, r6, r5
	cmp r4, #0
	bne .L16
	b .L22
.L16:
	ldr r5, =0
	sub r4, r5, #1
	ldr r6, =0
	sub r5, r6, r4
	ldr r6, =0
	sub r4, r6, r5
	str r4, [fp, #-4]
	b .L18
.L17:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L18
.L18:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #4
	pop {r4, r5, r6, fp, lr}
	bx lr
.L22:
	b .L17

