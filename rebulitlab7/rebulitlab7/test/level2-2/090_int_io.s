	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.section .rodata
	.global ascii_0
	.align 4
	.size ascii_0, 32
ascii_0:
	.word 48
	.text
	@ 0
	.global my_getint
	.type my_getint , %function
my_getint:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L66:
	ldr r4, =0
	str r4, [fp, #-8]
	b .L69
.L69:
	ldr r4, =1
	cmp r4, #0
	bne .L70
	b .L73
.L70:
	bl getch
	mov r4, r0
	ldr r6, addr_ascii_00
	ldr r5, [r6]
	sub r6, r4, r5
	str r6, [fp, #-4]
	ldr r4, [fp, #-4]
	cmp r4, #0
	movlt r4, #1
	movge r4, #0
	blt .L75
	b .L81
.L71:
	ldr r4, [fp, #-4]
	str r4, [fp, #-8]
	b .L87
.L73:
	b .L71
.L75:
	b .L69
.L76:
	b .L71
.L77:
	b .L69
.L78:
	ldr r4, [fp, #-4]
	cmp r4, #9
	movgt r4, #1
	movle r4, #0
	bgt .L75
	b .L84
.L81:
	b .L78
.L84:
	b .L76
.L85:
	b .L77
.L86:
	b .L77
.L87:
	ldr r4, =1
	cmp r4, #0
	bne .L88
	b .L91
.L88:
	bl getch
	mov r4, r0
	ldr r6, addr_ascii_00
	ldr r5, [r6]
	sub r6, r4, r5
	str r6, [fp, #-4]
	ldr r4, [fp, #-4]
	cmp r4, #0
	movge r4, #1
	movlt r4, #0
	bge .L96
	b .L99
.L89:
	ldr r4, [fp, #-8]
	mov r0, r4
	add sp, sp, #8
	pop {r4, r5, r6, fp, lr}
	bx lr
.L91:
	b .L89
.L93:
	ldr r4, [fp, #-8]
	ldr r6, =10
	mul r5, r4, r6
	ldr r4, [fp, #-4]
	add r6, r5, r4
	sub r6, r5, r4
	add r6, r5, r4
	str r6, [fp, #-8]
	b .L95
.L94:
	b .L89
.L95:
	b .L87
.L96:
	ldr r4, [fp, #-4]
	cmp r4, #9
	movle r4, #1
	movgt r4, #0
	ble .L93
	b .L102
.L99:
	b .L94
.L102:
	b .L94
.L103:
	b .L95

	.global my_putint
	.type my_putint , %function
my_putint:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #72
.L104:
	str r0, [fp, #-72]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L108
.L108:
	ldr r4, [fp, #-72]
	cmp r4, #0
	movgt r4, #1
	movle r4, #0
	bgt .L109
	b .L113
.L109:
	ldr r4, [fp, #-72]
	ldr r5, =10
	sdiv r6, r4, r5
	mul r5, r6, r5
	sub r6, r4, r5
	ldr r5, addr_ascii_00
	ldr r4, [r5]
	add r5, r6, r4
	sub r5, r6, r4
	add r5, r6, r4
	ldr r4, [fp, #-4]
	mov r6, #-68
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	add r6, fp, r4
	str r5, [r6]
	ldr r4, [fp, #-72]
	ldr r6, =10
	sdiv r5, r4, r6
	str r5, [fp, #-72]
	ldr r4, [fp, #-4]
	add r5, r4, #1
	sub r5, r4, #1
	add r5, r4, #1
	str r5, [fp, #-4]
	b .L108
.L110:
	b .L114
.L111:
	add sp, sp, #72
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L112:
	add sp, sp, #72
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L113:
	b .L110
.L114:
	ldr r4, [fp, #-4]
	cmp r4, #0
	movgt r4, #1
	movle r4, #0
	bgt .L115
	b .L119
.L115:
	ldr r4, [fp, #-4]
	sub r5, r4, #1
	str r5, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r5, #-68
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, [r5]
	mov r0, r4
	bl putch
	b .L114
.L116:
	add sp, sp, #72
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L117:
	add sp, sp, #72
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L118:
	add sp, sp, #72
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L119:
	b .L116

	.global main
	.type main , %function
main:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L121:
	bl my_getint
	mov r4, r0
	str r4, [fp, #-8]
	b .L123
.L123:
	ldr r4, [fp, #-8]
	cmp r4, #0
	movgt r4, #1
	movle r4, #0
	bgt .L124
	b .L128
.L124:
	bl my_getint
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl my_putint
	mov r0, #10
	bl putch
	ldr r4, [fp, #-8]
	sub r5, r4, #1
	str r5, [fp, #-8]
	b .L123
.L125:
	mov r0, #0
	add sp, sp, #8
	pop {r4, r5, fp, lr}
	bx lr
.L128:
	b .L125

addr_ascii_00:
	.word ascii_0
