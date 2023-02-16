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
	sub sp, sp, #8
.L24:
	ldr r4, =56
	str r4, [fp, #-8]
	ldr r4, =4
	str r4, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r6, =0
	sub r5, r6, #4
	sub r6, r4, r5
	ldr r4, [fp, #-4]
	add r5, r6, r4
	sub r5, r6, r4
	add r5, r6, r4
	str r5, [fp, #-8]
	ldr r4, [fp, #-8]
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
	bne .L27
	b .L33
.L27:
	ldr r5, =0
	sub r4, r5, #1
	ldr r6, =0
	sub r5, r6, r4
	ldr r6, =0
	sub r4, r6, r5
	str r4, [fp, #-8]
	b .L29
.L28:
	ldr r4, [fp, #-4]
	ldr r6, =0
	add r5, r6, r4
	sub r5, r6, r4
	add r5, r6, r4
	str r5, [fp, #-8]
	b .L29
.L29:
	ldr r4, [fp, #-8]
	mov r0, r4
	bl putint
	mov r0, #0
	add sp, sp, #8
	pop {r4, r5, r6, fp, lr}
	bx lr
.L33:
	b .L28

