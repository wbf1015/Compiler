	.arch armv8-a
	.arch_extension crc
	.arm
	.section .rodata
	.text
	@ 0
	.global if_ifElse_
	.type if_ifElse_ , %function
if_ifElse_:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L14:
	ldr r4, =5
	str r4, [fp, #-8]
	ldr r4, =10
	str r4, [fp, #-4]
	ldr r4, [fp, #-8]
	cmp r4, #5
	beq .L17
	b .L21
.L17:
	ldr r4, [fp, #-4]
	cmp r4, #10
	beq .L22
	b .L27
.L18:
	ldr r4, [fp, #-8]
	mov r0, r4
	add sp, sp, #8
	pop {r4, r5, fp, lr}
	bx lr
.L21:
	b .L18
.L22:
	ldr r4, =25
	str r4, [fp, #-8]
	b .L24
.L23:
	ldr r4, [fp, #-8]
	add r5, r4, #15
	sub r5, r4, #15
	add r5, r4, #15
	str r5, [fp, #-8]
	b .L24
.L24:
	b .L18
.L27:
	b .L23

	.global main
	.type main , %function
main:
	push {r4, fp, lr}
	mov fp, sp
	sub sp, sp, #0
.L28:
	bl if_ifElse_
	mov r4, r0
	mov r0, r4
	add sp, sp, #0
	pop {r4, fp, lr}
	bx lr

