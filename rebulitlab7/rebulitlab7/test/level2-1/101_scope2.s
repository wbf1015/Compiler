	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global k
	.align 4
	.size k, 32
k:
	.word 0
	.section .rodata
	.text
	@ 0
	.global main
	.type main , %function
main:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #16
.L31:
	ldr r5, =3389
	ldr r4, addr_k0
	str r5, [r4]
	ldr r5, addr_k0
	ldr r4, [r5]
	ldr r5, =10000
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L32
	b .L36
.L32:
	ldr r5, addr_k0
	ldr r4, [r5]
	add r5, r4, #1
	sub r5, r4, #1
	add r5, r4, #1
	ldr r4, addr_k0
	str r5, [r4]
	ldr r4, =112
	str r4, [fp, #-16]
	b .L38
.L33:
	ldr r5, addr_k0
	ldr r4, [r5]
	mov r0, r4
	add sp, sp, #16
	pop {r4, r5, r6, fp, lr}
	bx lr
.L36:
	b .L33
.L38:
	ldr r4, [fp, #-16]
	cmp r4, #10
	movgt r4, #1
	movle r4, #0
	bgt .L39
	b .L43
.L39:
	ldr r4, [fp, #-16]
	sub r5, r4, #88
	str r5, [fp, #-16]
	ldr r4, [fp, #-16]
	ldr r5, =1000
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L44
	b .L48
.L40:
	ldr r4, [fp, #-16]
	mov r0, r4
	bl putint
	b .L33
.L43:
	b .L40
.L44:
	ldr r4, =9
	str r4, [fp, #-12]
	ldr r4, =11
	str r4, [fp, #-8]
	ldr r4, =10
	str r4, [fp, #-12]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	sub r6, r4, r5
	str r6, [fp, #-16]
	ldr r4, =11
	str r4, [fp, #-4]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-4]
	add r6, r4, r5
	sub r6, r4, r5
	add r6, r4, r5
	ldr r4, [fp, #-8]
	add r5, r6, r4
	sub r5, r6, r4
	add r5, r6, r4
	str r5, [fp, #-16]
	b .L45
.L45:
	b .L38
.L48:
	b .L45

addr_k0:
	.word k
