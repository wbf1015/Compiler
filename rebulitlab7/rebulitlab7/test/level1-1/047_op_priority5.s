	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global a
	.align 4
	.size a, 32
a:
	.word 1
	.global b
	.align 4
	.size b, 32
b:
	.word 0
	.global c
	.align 4
	.size c, 32
c:
	.word 1
	.global d
	.align 4
	.size d, 32
d:
	.word 2
	.global e
	.align 4
	.size e, 32
e:
	.word 4
	.section .rodata
	.text
	@ 0
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L42:
	ldr r4, =0
	str r4, [fp, #-4]
	ldr r5, addr_a0
	ldr r4, [r5]
	ldr r6, addr_b0
	ldr r5, [r6]
	mul r6, r4, r5
	ldr r5, addr_c0
	ldr r4, [r5]
	sdiv r5, r6, r4
	ldr r6, addr_e0
	ldr r4, [r6]
	ldr r7, addr_d0
	ldr r6, [r7]
	add r7, r4, r6
	sub r7, r4, r6
	add r7, r4, r6
	cmp r5, r7
	beq .L47
	b .L50
.L44:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L45
.L45:
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #4
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L46:
	ldr r5, addr_a0
	ldr r4, [r5]
	ldr r6, addr_b0
	ldr r5, [r6]
	ldr r7, addr_c0
	ldr r6, [r7]
	mul r7, r5, r6
	sub r5, r4, r7
	ldr r6, addr_d0
	ldr r4, [r6]
	ldr r7, addr_a0
	ldr r6, [r7]
	ldr r8, addr_c0
	ldr r7, [r8]
	sdiv r8, r6, r7
	sub r6, r4, r8
	cmp r5, r6
	beq .L44
	b .L56
.L47:
	ldr r5, addr_a0
	ldr r4, [r5]
	ldr r6, addr_a0
	ldr r5, [r6]
	ldr r6, addr_b0
	ldr r7, [r6]
	add r6, r5, r7
	sub r6, r5, r7
	add r6, r5, r7
	mul r5, r4, r6
	ldr r6, addr_c0
	ldr r4, [r6]
	add r6, r5, r4
	sub r6, r5, r4
	add r6, r5, r4
	ldr r5, addr_d0
	ldr r4, [r5]
	ldr r7, addr_e0
	ldr r5, [r7]
	add r7, r4, r5
	sub r7, r4, r5
	add r7, r4, r5
	cmp r6, r7
	movle r4, #1
	movgt r4, #0
	ble .L44
	b .L53
.L50:
	b .L46
.L53:
	b .L46
.L56:
	b .L45

addr_a0:
	.word a
addr_b0:
	.word b
addr_c0:
	.word c
addr_d0:
	.word d
addr_e0:
	.word e
