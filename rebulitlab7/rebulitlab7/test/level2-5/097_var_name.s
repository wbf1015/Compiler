	.arch armv8-a
	.arch_extension crc
	.arm
	.section .rodata
	.text
	@ 0
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #92
.L31:
	ldr r4, =2
	str r4, [fp, #-92]
	ldr r4, =20
	str r4, [fp, #-88]
	mov r4, #0
	mov r5, #-84
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =1
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =2
	str r5, [r4]
	add r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L56
.L56:
	ldr r4, [fp, #-92]
	ldr r5, [fp, #-88]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L57
	b .L61
.L57:
	ldr r4, [fp, #-92]
	mov r5, #-84
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, [r5]
	ldr r5, [fp, #-92]
	sub r6, r5, #1
	mov r5, #-84
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	add r5, fp, r6
	ldr r6, [r5]
	add r5, r4, r6
	sub r5, r4, r6
	add r5, r4, r6
	ldr r4, [fp, #-92]
	sub r6, r4, #2
	mov r4, #-84
	mov r7, #4
	mul r8, r6, r7
	add r6, r4, r8
	add r4, fp, r6
	ldr r6, [r4]
	add r4, r5, r6
	sub r4, r5, r6
	add r4, r5, r6
	ldr r5, [fp, #-92]
	mov r6, #-84
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	add r6, fp, r5
	str r4, [r6]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-92]
	mov r6, #-84
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	add r6, fp, r5
	ldr r5, [r6]
	add r6, r4, r5
	sub r6, r4, r5
	add r6, r4, r5
	str r6, [fp, #-4]
	ldr r4, [fp, #-92]
	mov r5, #-84
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, [r5]
	mov r0, r4
	bl putint
	mov r0, #10
	bl putch
	ldr r4, [fp, #-92]
	add r5, r4, #1
	sub r5, r4, #1
	add r5, r4, #1
	str r5, [fp, #-92]
	b .L56
.L58:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #92
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L61:
	b .L58

