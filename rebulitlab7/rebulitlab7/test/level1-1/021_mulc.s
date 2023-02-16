	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.section .rodata
	.global a
	.align 4
	.size a, 32
a:
	.word 5
	.text
	@ 0
	.global main
	.type main , %function
main:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #0
.L3:
	ldr r5, addr_a0
	ldr r4, [r5]
	ldr r6, =5
	mul r5, r4, r6
	mov r0, r5
	add sp, sp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr

addr_a0:
	.word a
