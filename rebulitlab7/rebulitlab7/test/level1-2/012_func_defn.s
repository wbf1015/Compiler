	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global a
	.align 4
	.size a, 32
a:
	.word 0
	.section .rodata
	.text
	@ 0
	.global func
	.type func , %function
func:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L13:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	sub r5, r4, #1
	str r5, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #4
	pop {r4, r5, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L15:
	ldr r4, =10
	ldr r5, addr_a0
	str r4, [r5]
	ldr r5, addr_a0
	ldr r4, [r5]
	mov r0, r4
	bl func
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #4
	pop {r4, r5, fp, lr}
	bx lr

addr_a0:
	.word a
