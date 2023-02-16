	.arch armv8-a
	.arch_extension crc
	.arm
	.section .rodata
	.text
	@ 0
	.global uniquePaths
	.type uniquePaths , %function
uniquePaths:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #52
.L83:
	str r0, [fp, #-52]
	str r1, [fp, #-48]
	ldr r4, [fp, #-52]
	cmp r4, #1
	beq .L86
	b .L91
.L86:
	mov r0, #1
	add sp, sp, #52
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
	b .L87
.L87:
	ldr r4, =0
	str r4, [fp, #-8]
	b .L98
.L88:
	ldr r4, [fp, #-48]
	cmp r4, #1
	beq .L86
	b .L94
.L91:
	b .L88
.L94:
	b .L87
.L98:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-52]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L99
	b .L103
.L99:
	ldr r4, [fp, #-8]
	ldr r6, =3
	mul r5, r4, r6
	ldr r4, [fp, #-48]
	add r6, r5, r4
	sub r6, r5, r4
	add r6, r5, r4
	sub r4, r6, #1
	mov r5, #-44
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =1
	str r4, [r5]
	ldr r4, [fp, #-8]
	add r5, r4, #1
	sub r5, r4, #1
	add r5, r4, #1
	str r5, [fp, #-8]
	b .L98
.L100:
	ldr r4, =0
	str r4, [fp, #-8]
	b .L104
.L103:
	b .L100
.L104:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-48]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L105
	b .L109
.L105:
	ldr r4, [fp, #-52]
	sub r5, r4, #1
	ldr r6, =3
	mul r4, r5, r6
	ldr r5, [fp, #-8]
	add r6, r4, r5
	sub r6, r4, r5
	add r6, r4, r5
	mov r4, #-44
	mov r5, #4
	mul r7, r6, r5
	add r5, r4, r7
	add r4, fp, r5
	ldr r5, =1
	str r5, [r4]
	ldr r4, [fp, #-8]
	add r5, r4, #1
	sub r5, r4, #1
	add r5, r4, #1
	str r5, [fp, #-8]
	b .L104
.L106:
	ldr r4, [fp, #-52]
	sub r5, r4, #2
	str r5, [fp, #-8]
	b .L110
.L109:
	b .L106
.L110:
	ldr r4, [fp, #-8]
	ldr r6, =0
	sub r5, r6, #1
	cmp r4, r5
	movgt r4, #1
	movle r4, #0
	bgt .L111
	b .L115
.L111:
	ldr r4, [fp, #-48]
	sub r5, r4, #2
	str r5, [fp, #-4]
	b .L116
.L112:
	mov r4, #0
	mov r5, #-44
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, [r5]
	mov r0, r4
	add sp, sp, #52
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L115:
	b .L112
.L116:
	ldr r4, [fp, #-4]
	ldr r6, =0
	sub r5, r6, #1
	cmp r4, r5
	movgt r4, #1
	movle r4, #0
	bgt .L117
	b .L121
.L117:
	ldr r4, [fp, #-8]
	add r5, r4, #1
	sub r5, r4, #1
	add r5, r4, #1
	ldr r6, =3
	mul r4, r5, r6
	ldr r5, [fp, #-4]
	add r6, r4, r5
	sub r6, r4, r5
	add r6, r4, r5
	mov r4, #-44
	mov r5, #4
	mul r7, r6, r5
	add r5, r4, r7
	add r4, fp, r5
	ldr r5, [r4]
	ldr r4, [fp, #-8]
	ldr r7, =3
	mul r6, r4, r7
	ldr r4, [fp, #-4]
	add r7, r6, r4
	sub r7, r6, r4
	add r7, r6, r4
	add r4, r7, #1
	sub r4, r7, #1
	add r4, r7, #1
	mov r6, #-44
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	add r6, fp, r4
	ldr r4, [r6]
	add r6, r5, r4
	sub r6, r5, r4
	add r6, r5, r4
	ldr r4, [fp, #-8]
	ldr r5, =3
	mul r7, r4, r5
	ldr r4, [fp, #-4]
	add r5, r7, r4
	sub r5, r7, r4
	add r5, r7, r4
	mov r4, #-44
	mov r7, #4
	mul r8, r5, r7
	add r5, r4, r8
	add r4, fp, r5
	str r6, [r4]
	ldr r4, [fp, #-4]
	sub r5, r4, #1
	str r5, [fp, #-4]
	b .L116
	b .F0
.LTORG
.F0:
.L118:
	ldr r4, [fp, #-8]
	sub r5, r4, #1
	str r5, [fp, #-8]
	b .L110
.L121:
	b .L118

	.global main
	.type main , %function
main:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L125:
	ldr r4, =3
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-4]
	mov r0, r4
	mov r1, r5
	bl uniquePaths
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	mov r0, r4
	add sp, sp, #8
	pop {r4, r5, fp, lr}
	bx lr

