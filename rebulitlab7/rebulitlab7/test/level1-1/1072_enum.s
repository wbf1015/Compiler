	.arch armv8-a
	.arch_extension crc
	.arm
	.section .rodata
	.text
	@ 0
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #16
.L38:
	ldr r4, =0
	str r4, [fp, #-16]
	ldr r4, =0
	str r4, [fp, #-12]
	ldr r4, =0
	str r4, [fp, #-8]
	b .L43
.L43:
	ldr r4, [fp, #-16]
	cmp r4, #21
	movlt r4, #1
	movge r4, #0
	blt .L44
	b .L48
.L44:
	b .L49
.L45:
	mov r0, #0
	add sp, sp, #16
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L48:
	b .L45
.L49:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-16]
	ldr r7, =101
	sub r6, r7, r5
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L50
	b .L54
.L50:
	ldr r4, [fp, #-16]
	ldr r6, =100
	sub r5, r6, r4
	ldr r4, [fp, #-12]
	sub r6, r5, r4
	str r6, [fp, #-8]
	ldr r4, [fp, #-16]
	ldr r5, =5
	mul r6, r5, r4
	ldr r4, [fp, #-12]
	ldr r7, =1
	mul r5, r7, r4
	add r4, r6, r5
	sub r4, r6, r5
	add r4, r6, r5
	ldr r5, [fp, #-8]
	ldr r7, =2
	sdiv r6, r5, r7
	add r5, r4, r6
	sub r5, r4, r6
	add r5, r4, r6
	cmp r5, #100
	beq .L55
	b .L59
.L51:
	ldr r4, [fp, #-16]
	add r5, r4, #1
	sub r5, r4, #1
	add r5, r4, #1
	str r5, [fp, #-16]
	b .L43
.L54:
	b .L51
.L55:
	ldr r4, [fp, #-16]
	mov r0, r4
	bl putint
	ldr r4, [fp, #-12]
	mov r0, r4
	bl putint
	ldr r4, [fp, #-8]
	mov r0, r4
	bl putint
	ldr r4, =10
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putch
	b .L56
.L56:
	ldr r4, [fp, #-12]
	add r5, r4, #1
	sub r5, r4, #1
	add r5, r4, #1
	str r5, [fp, #-12]
	b .L49
.L59:
	b .L56

