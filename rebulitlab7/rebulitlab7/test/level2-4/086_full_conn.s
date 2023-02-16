	.arch armv8-a
	.arch_extension crc
	.arm
	.section .rodata
	.text
	@ 0
	.global relu_reg
	.type relu_reg , %function
relu_reg:
	push {r4, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L933:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	cmp r4, #127
	movgt r4, #1
	movle r4, #0
	bgt .L935
	b .L939
.L935:
	mov r0, #127
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr
	b .L936
.L936:
	ldr r4, [fp, #-4]
	cmp r4, #0
	movlt r4, #1
	movge r4, #0
	blt .L940
	b .L944
.L939:
	b .L936
.L940:
	mov r0, #0
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr
	b .L941
.L941:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr
.L944:
	b .L941

	.global model
	.type model , %function
model:
	push {r4, r5, r6, r7, r8, r9, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L945:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r5, #0
	mov r6, #20
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, #0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [r4]
	ldr r6, =85
	mul r4, r5, r6
	ldr r5, [fp, #-4]
	mov r6, #0
	mov r7, #20
	mul r8, r6, r7
	add r6, r5, r8
	mov r5, #1
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	ldr r6, [r5]
	ldr r7, =23
	mul r5, r6, r7
	add r6, r4, r5
	sub r6, r4, r5
	add r6, r4, r5
	ldr r4, [fp, #-4]
	mov r5, #0
	mov r8, #20
	mul r7, r5, r8
	add r5, r4, r7
	mov r4, #2
	mov r7, #4
	mul r8, r4, r7
	add r4, r5, r8
	ldr r5, [r4]
	ldr r7, =0
	sub r4, r7, #82
	mul r7, r5, r4
	add r4, r6, r7
	sub r4, r6, r7
	add r4, r6, r7
	ldr r5, [fp, #-4]
	mov r6, #0
	mov r7, #20
	mul r8, r6, r7
	add r6, r5, r8
	mov r5, #3
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	ldr r6, [r5]
	ldr r5, =0
	sub r7, r5, #103
	mul r5, r6, r7
	add r6, r4, r5
	sub r6, r4, r5
	add r6, r4, r5
	ldr r4, [fp, #-4]
	mov r5, #0
	mov r7, #20
	mul r8, r5, r7
	add r5, r4, r8
	mov r4, #4
	mov r7, #4
	mul r8, r4, r7
	add r4, r5, r8
	ldr r5, [r4]
	ldr r7, =0
	sub r4, r7, #123
	mul r7, r5, r4
	add r4, r6, r7
	sub r4, r6, r7
	add r4, r6, r7
	ldr r5, [fp, #-4]
	mov r6, #1
	mov r7, #20
	mul r8, r6, r7
	add r6, r5, r8
	mov r5, #0
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	ldr r6, [r5]
	ldr r7, =64
	mul r5, r6, r7
	add r6, r4, r5
	sub r6, r4, r5
	add r6, r4, r5
	ldr r4, [fp, #-4]
	mov r5, #1
	mov r7, #20
	mul r8, r5, r7
	add r5, r4, r8
	mov r4, #1
	mov r7, #4
	mul r8, r4, r7
	add r4, r5, r8
	ldr r5, [r4]
	ldr r7, =0
	sub r4, r7, #120
	mul r7, r5, r4
	add r4, r6, r7
	sub r4, r6, r7
	add r4, r6, r7
	ldr r5, [fp, #-4]
	mov r6, #1
	mov r7, #20
	mul r8, r6, r7
	add r6, r5, r8
	mov r5, #2
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	ldr r6, [r5]
	ldr r7, =50
	mul r5, r6, r7
	add r6, r4, r5
	sub r6, r4, r5
	add r6, r4, r5
	ldr r4, [fp, #-4]
	mov r5, #1
	mov r7, #20
	mul r8, r5, r7
	add r5, r4, r8
	mov r4, #3
	mov r7, #4
	mul r8, r4, r7
	add r4, r5, r8
	ldr r5, [r4]
	ldr r7, =0
	sub r4, r7, #59
	mul r7, r5, r4
	add r4, r6, r7
	sub r4, r6, r7
	add r4, r6, r7
	ldr r5, [fp, #-4]
	mov r6, #1
	mov r8, #20
	mul r7, r6, r8
	add r6, r5, r7
	mov r5, #4
	mov r8, #4
	mul r7, r5, r8
	add r5, r6, r7
	ldr r6, [r5]
	ldr r7, =47
	mul r5, r6, r7
	add r6, r4, r5
	sub r6, r4, r5
	add r6, r4, r5
	ldr r4, [fp, #-4]
	mov r5, #2
	mov r7, #20
	mul r8, r5, r7
	add r5, r4, r8
	mov r4, #0
	mov r8, #4
	mul r7, r4, r8
	add r4, r5, r7
	ldr r5, [r4]
	ldr r4, =0
	sub r7, r4, #111
	mul r4, r5, r7
	add r5, r6, r4
	sub r5, r6, r4
	add r5, r6, r4
	ldr r4, [fp, #-4]
	mov r6, #2
	mov r7, #20
	mul r8, r6, r7
	add r6, r4, r8
	mov r4, #1
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	ldr r6, [r4]
	ldr r7, =0
	sub r4, r7, #67
	mul r7, r6, r4
	add r4, r5, r7
	sub r4, r5, r7
	add r4, r5, r7
	ldr r5, [fp, #-4]
	mov r6, #2
	mov r7, #20
	mul r8, r6, r7
	add r6, r5, r8
	mov r5, #2
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	ldr r6, [r5]
	ldr r7, =0
	sub r5, r7, #106
	mul r7, r6, r5
	add r5, r4, r7
	sub r5, r4, r7
	add r5, r4, r7
	ldr r4, [fp, #-4]
	mov r6, #2
	mov r7, #20
	mul r8, r6, r7
	add r6, r4, r8
	mov r4, #3
	mov r8, #4
	mul r7, r4, r8
	add r4, r6, r7
	ldr r6, [r4]
	ldr r4, =0
	sub r7, r4, #75
	mul r4, r6, r7
	add r6, r5, r4
	sub r6, r5, r4
	add r6, r5, r4
	ldr r4, [fp, #-4]
	mov r5, #2
	mov r7, #20
	mul r8, r5, r7
	add r5, r4, r8
	mov r4, #4
	mov r7, #4
	mul r8, r4, r7
	add r4, r5, r8
	ldr r5, [r4]
	ldr r4, =0
	sub r7, r4, #102
	mul r4, r5, r7
	add r5, r6, r4
	sub r5, r6, r4
	add r5, r6, r4
	ldr r4, [fp, #-4]
	mov r6, #3
	mov r7, #20
	mul r8, r6, r7
	add r6, r4, r8
	mov r4, #0
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	ldr r6, [r4]
	ldr r7, =34
	mul r4, r6, r7
	add r6, r5, r4
	sub r6, r5, r4
	add r6, r5, r4
	ldr r4, [fp, #-4]
	mov r5, #3
	mov r7, #20
	mul r8, r5, r7
	add r5, r4, r8
	mov r4, #1
	mov r7, #4
	mul r8, r4, r7
	add r4, r5, r8
	ldr r5, [r4]
	ldr r7, =0
	sub r4, r7, #39
	mul r7, r5, r4
	add r4, r6, r7
	sub r4, r6, r7
	add r4, r6, r7
	ldr r5, [fp, #-4]
	mov r6, #3
	mov r8, #20
	mul r7, r6, r8
	add r6, r5, r7
	mov r5, #2
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	ldr r6, [r5]
	ldr r7, =65
	mul r5, r6, r7
	add r6, r4, r5
	sub r6, r4, r5
	add r6, r4, r5
	ldr r4, [fp, #-4]
	mov r5, #3
	mov r7, #20
	mul r8, r5, r7
	add r5, r4, r8
	mov r4, #3
	mov r8, #4
	mul r7, r4, r8
	add r4, r5, r7
	ldr r5, [r4]
	ldr r7, =47
	mul r4, r5, r7
	add r5, r6, r4
	sub r5, r6, r4
	add r5, r6, r4
	ldr r4, [fp, #-4]
	mov r6, #3
	mov r8, #20
	mul r7, r6, r8
	add r6, r4, r7
	mov r4, #4
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	ldr r6, [r4]
	ldr r7, =113
	mul r4, r6, r7
	add r6, r5, r4
	sub r6, r5, r4
	add r6, r5, r4
	ldr r4, [fp, #-4]
	mov r5, #4
	mov r7, #20
	mul r8, r5, r7
	add r5, r4, r8
	mov r4, #0
	mov r8, #4
	mul r7, r4, r8
	add r4, r5, r7
	ldr r5, [r4]
	ldr r4, =110
	mul r7, r5, r4
	add r4, r6, r7
	sub r4, r6, r7
	add r4, r6, r7
	ldr r5, [fp, #-4]
	mov r6, #4
	mov r7, #20
	mul r8, r6, r7
	add r6, r5, r8
	mov r5, #1
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	ldr r6, [r5]
	ldr r7, =47
	mul r5, r6, r7
	add r6, r4, r5
	sub r6, r4, r5
	add r6, r4, r5
	ldr r4, [fp, #-4]
	mov r5, #4
	mov r7, #20
	mul r8, r5, r7
	add r5, r4, r8
	mov r4, #2
	mov r7, #4
	mul r8, r4, r7
	add r4, r5, r8
	ldr r5, [r4]
	ldr r7, =0
	sub r4, r7, #4
	mul r7, r5, r4
	add r4, r6, r7
	sub r4, r6, r7
	add r4, r6, r7
	ldr r5, [fp, #-4]
	mov r6, #4
	mov r7, #20
	mul r8, r6, r7
	add r6, r5, r8
	mov r5, #3
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	ldr r6, [r5]
	ldr r7, =80
	mul r5, r6, r7
	add r6, r4, r5
	sub r6, r4, r5
	add r6, r4, r5
	ldr r4, [fp, #-4]
	mov r5, #4
	mov r7, #20
	mul r8, r5, r7
	add r5, r4, r8
	mov r4, #4
	mov r7, #4
	mul r8, r4, r7
	add r4, r5, r8
	ldr r5, [r4]
	ldr r7, =46
	mul r4, r5, r7
	add r5, r6, r4
	sub r5, r6, r4
	add r5, r6, r4
	mov r0, r5
	bl relu_reg
	mov r4, r0
	ldr r6, =39
	mul r5, r4, r6
	ldr r4, [fp, #-4]
	mov r6, #0
	mov r7, #20
	mul r8, r6, r7
	add r6, r4, r8
	mov r4, #0
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	ldr r6, [r4]
	ldr r7, =0
	sub r4, r7, #106
	mul r7, r6, r4
	ldr r4, [fp, #-4]
	mov r6, #0
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #1
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r8, =126
	mul r4, r6, r8
	add r6, r7, r4
	sub r6, r7, r4
	add r6, r7, r4
	ldr r4, [fp, #-4]
	mov r7, #0
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #2
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r4, =0
	sub r8, r4, #18
	mul r4, r7, r8
	add r7, r6, r4
	sub r7, r6, r4
	add r7, r6, r4
	ldr r4, [fp, #-4]
	mov r6, #0
	mov r9, #20
	mul r8, r6, r9
	add r6, r4, r8
	mov r4, #3
	mov r9, #4
	mul r8, r4, r9
	add r4, r6, r8
	ldr r6, [r4]
	ldr r4, =0
	sub r8, r4, #31
	mul r4, r6, r8
	add r6, r7, r4
	sub r6, r7, r4
	add r6, r7, r4
	ldr r4, [fp, #-4]
	mov r7, #0
	mov r9, #20
	mul r8, r7, r9
	add r7, r4, r8
	mov r4, #4
	mov r9, #4
	mul r8, r4, r9
	add r4, r7, r8
	ldr r7, [r4]
	ldr r8, =0
	sub r4, r8, #8
	mul r8, r7, r4
	add r4, r6, r8
	sub r4, r6, r8
	add r4, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #0
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =47
	mul r6, r7, r8
	add r7, r4, r6
	sub r7, r4, r6
	add r7, r4, r6
	ldr r4, [fp, #-4]
	mov r6, #1
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #1
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r8, =0
	sub r4, r8, #4
	mul r8, r6, r4
	add r4, r7, r8
	sub r4, r7, r8
	add r4, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #1
	mov r8, #20
	b .B0
.LTORG
.B0:
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #2
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =67
	mul r6, r7, r8
	add r7, r4, r6
	sub r7, r4, r6
	add r7, r4, r6
	ldr r4, [fp, #-4]
	mov r6, #1
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #3
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r8, =0
	sub r4, r8, #94
	mul r8, r6, r4
	add r4, r7, r8
	sub r4, r7, r8
	add r4, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #1
	mov r9, #20
	mul r8, r7, r9
	add r7, r6, r8
	mov r6, #4
	mov r9, #4
	mul r8, r6, r9
	add r6, r7, r8
	ldr r7, [r6]
	ldr r6, =0
	sub r8, r6, #121
	mul r6, r7, r8
	add r7, r4, r6
	sub r7, r4, r6
	add r7, r4, r6
	ldr r4, [fp, #-4]
	mov r6, #2
	mov r9, #20
	mul r8, r6, r9
	add r6, r4, r8
	mov r4, #0
	mov r9, #4
	mul r8, r4, r9
	add r4, r6, r8
	ldr r6, [r4]
	ldr r8, =7
	mul r4, r6, r8
	add r6, r7, r4
	sub r6, r7, r4
	add r6, r7, r4
	ldr r4, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #1
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r8, =0
	sub r4, r8, #21
	mul r8, r7, r4
	add r4, r6, r8
	sub r4, r6, r8
	add r4, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #2
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =0
	sub r6, r8, #60
	mul r8, r7, r6
	add r6, r4, r8
	sub r6, r4, r8
	add r6, r4, r8
	ldr r4, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #3
	mov r9, #4
	mul r8, r4, r9
	add r4, r7, r8
	ldr r7, [r4]
	ldr r8, =0
	sub r4, r8, #43
	mul r8, r7, r4
	add r4, r6, r8
	sub r4, r6, r8
	add r4, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #4
	mov r9, #4
	mul r8, r6, r9
	add r6, r7, r8
	ldr r7, [r6]
	ldr r8, =105
	mul r6, r7, r8
	add r7, r4, r6
	sub r7, r4, r6
	add r7, r4, r6
	ldr r4, [fp, #-4]
	mov r6, #3
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #0
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r8, =0
	sub r4, r8, #42
	mul r8, r6, r4
	add r4, r7, r8
	sub r4, r7, r8
	add r4, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #1
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =87
	mul r6, r7, r8
	add r7, r4, r6
	sub r7, r4, r6
	add r7, r4, r6
	ldr r4, [fp, #-4]
	mov r6, #3
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #2
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r8, =29
	mul r4, r6, r8
	add r6, r7, r4
	sub r6, r7, r4
	add r6, r7, r4
	ldr r4, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #3
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r8, =0
	sub r4, r8, #106
	mul r8, r7, r4
	add r4, r6, r8
	sub r4, r6, r8
	add r4, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #4
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =0
	sub r6, r8, #31
	mul r8, r7, r6
	add r6, r4, r8
	sub r6, r4, r8
	add r6, r4, r8
	ldr r4, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #0
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r8, =0
	sub r4, r8, #110
	mul r8, r7, r4
	add r4, r6, r8
	sub r4, r6, r8
	add r4, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #1
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =0
	sub r8, r6, #100
	mul r6, r7, r8
	add r7, r4, r6
	sub r7, r4, r6
	add r7, r4, r6
	ldr r4, [fp, #-4]
	mov r6, #4
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #2
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r4, =0
	sub r8, r4, #22
	mul r4, r6, r8
	add r6, r7, r4
	sub r6, r7, r4
	add r6, r7, r4
	ldr r4, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #3
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r8, =0
	sub r4, r8, #75
	mul r8, r7, r4
	add r4, r6, r8
	sub r4, r6, r8
	add r4, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #4
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =0
	sub r6, r8, #125
	mul r8, r7, r6
	add r6, r4, r8
	sub r6, r4, r8
	add r6, r4, r8
	mov r0, r6
	bl relu_reg
	mov r4, r0
	ldr r6, =77
	mul r7, r4, r6
	add r4, r5, r7
	sub r4, r5, r7
	add r4, r5, r7
	ldr r5, [fp, #-4]
	mov r6, #0
	mov r7, #20
	mul r8, r6, r7
	add r6, r5, r8
	mov r5, #0
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	ldr r6, [r5]
	ldr r7, =26
	mul r5, r6, r7
	ldr r6, [fp, #-4]
	mov r7, #0
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #1
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =76
	mul r6, r7, r8
	add r7, r5, r6
	sub r7, r5, r6
	add r7, r5, r6
	ldr r5, [fp, #-4]
	mov r6, #0
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #2
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r8, =0
	sub r5, r8, #70
	mul r8, r6, r5
	add r5, r7, r8
	sub r5, r7, r8
	add r5, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #0
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #3
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =29
	mul r6, r7, r8
	add r7, r5, r6
	sub r7, r5, r6
	add r7, r5, r6
	ldr r5, [fp, #-4]
	mov r6, #0
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #4
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r8, =0
	sub r5, r8, #95
	mul r8, r6, r5
	add r5, r7, r8
	sub r5, r7, r8
	add r5, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #0
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =96
	mul r6, r7, r8
	add r7, r5, r6
	sub r7, r5, r6
	add r7, r5, r6
	ldr r5, [fp, #-4]
	mov r6, #1
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #1
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r8, =52
	mul r5, r6, r8
	add r6, r7, r5
	sub r6, r7, r5
	add r6, r7, r5
	ldr r5, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #2
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r8, =0
	sub r5, r8, #68
	mul r8, r7, r5
	add r5, r6, r8
	sub r5, r6, r8
	add r5, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #3
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =0
	sub r6, r8, #5
	mul r8, r7, r6
	add r6, r5, r8
	sub r6, r5, r8
	add r6, r5, r8
	ldr r5, [fp, #-4]
	mov r7, #1
	mov r9, #20
	mul r8, r7, r9
	add r7, r5, r8
	mov r5, #4
	mov r9, #4
	mul r8, r5, r9
	add r5, r7, r8
	ldr r7, [r5]
	ldr r8, =34
	mul r5, r7, r8
	add r7, r6, r5
	sub r7, r6, r5
	add r7, r6, r5
	ldr r5, [fp, #-4]
	mov r6, #2
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #0
	mov r9, #4
	mul r8, r5, r9
	add r5, r6, r8
	ldr r6, [r5]
	ldr r8, =0
	sub r5, r8, #34
	mul r8, r6, r5
	add r5, r7, r8
	sub r5, r7, r8
	add r5, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #1
	mov r9, #4
	mul r8, r6, r9
	add r6, r7, r8
	ldr r7, [r6]
	ldr r8, =102
	mul r6, r7, r8
	add r7, r5, r6
	sub r7, r5, r6
	add r7, r5, r6
	ldr r5, [fp, #-4]
	mov r6, #2
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #2
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r8, =6
	mul r5, r6, r8
	add r6, r7, r5
	sub r6, r7, r5
	add r6, r7, r5
	ldr r5, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #3
	mov r9, #4
	mul r8, r5, r9
	add r5, r7, r8
	ldr r7, [r5]
	ldr r8, =0
	sub r5, r8, #38
	mul r8, r7, r5
	add r5, r6, r8
	sub r5, r6, r8
	b .B1
.LTORG
.B1:
	add r5, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #4
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =27
	mul r6, r7, r8
	add r7, r5, r6
	sub r7, r5, r6
	add r7, r5, r6
	ldr r5, [fp, #-4]
	mov r6, #3
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #0
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r5, =110
	mul r8, r6, r5
	add r5, r7, r8
	sub r5, r7, r8
	add r5, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #1
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =116
	mul r8, r7, r6
	add r6, r5, r8
	sub r6, r5, r8
	add r6, r5, r8
	ldr r5, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #2
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r8, =39
	mul r5, r7, r8
	add r7, r6, r5
	sub r7, r6, r5
	add r7, r6, r5
	ldr r5, [fp, #-4]
	mov r6, #3
	mov r9, #20
	mul r8, r6, r9
	add r6, r5, r8
	mov r5, #3
	mov r9, #4
	mul r8, r5, r9
	add r5, r6, r8
	ldr r6, [r5]
	ldr r5, =0
	sub r8, r5, #63
	mul r5, r6, r8
	add r6, r7, r5
	sub r6, r7, r5
	add r6, r7, r5
	ldr r5, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #4
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r5, =0
	sub r8, r5, #99
	mul r5, r7, r8
	add r7, r6, r5
	sub r7, r6, r5
	add r7, r6, r5
	ldr r5, [fp, #-4]
	mov r6, #4
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #0
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r8, =65
	mul r5, r6, r8
	add r6, r7, r5
	sub r6, r7, r5
	add r6, r7, r5
	ldr r5, [fp, #-4]
	mov r7, #4
	mov r9, #20
	mul r8, r7, r9
	add r7, r5, r8
	mov r5, #1
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r8, =120
	mul r5, r7, r8
	add r7, r6, r5
	sub r7, r6, r5
	add r7, r6, r5
	ldr r5, [fp, #-4]
	mov r6, #4
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #2
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r8, =0
	sub r5, r8, #39
	mul r8, r6, r5
	add r5, r7, r8
	sub r5, r7, r8
	add r5, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #3
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =0
	sub r6, r8, #6
	mul r8, r7, r6
	add r6, r5, r8
	sub r6, r5, r8
	add r6, r5, r8
	ldr r5, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #4
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r8, =94
	mul r5, r7, r8
	add r7, r6, r5
	sub r7, r6, r5
	add r7, r6, r5
	mov r0, r7
	bl relu_reg
	mov r5, r0
	ldr r7, =127
	mul r6, r5, r7
	add r5, r4, r6
	sub r5, r4, r6
	add r5, r4, r6
	ldr r4, [fp, #-4]
	mov r6, #0
	mov r7, #20
	mul r8, r6, r7
	add r6, r4, r8
	mov r4, #0
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	ldr r6, [r4]
	ldr r7, =0
	sub r4, r7, #23
	mul r7, r6, r4
	ldr r4, [fp, #-4]
	mov r6, #0
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #1
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r8, =0
	sub r4, r8, #63
	mul r8, r6, r4
	add r4, r7, r8
	sub r4, r7, r8
	add r4, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #0
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #2
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =49
	mul r6, r7, r8
	add r7, r4, r6
	sub r7, r4, r6
	add r7, r4, r6
	ldr r4, [fp, #-4]
	mov r6, #0
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #3
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r8, =50
	mul r4, r6, r8
	add r6, r7, r4
	sub r6, r7, r4
	add r6, r7, r4
	ldr r4, [fp, #-4]
	mov r7, #0
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #4
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r8, =72
	mul r4, r7, r8
	add r7, r6, r4
	sub r7, r6, r4
	add r7, r6, r4
	ldr r4, [fp, #-4]
	mov r6, #1
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #0
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r8, =85
	mul r4, r6, r8
	add r6, r7, r4
	sub r6, r7, r4
	add r6, r7, r4
	ldr r4, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #1
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r8, =0
	sub r4, r8, #30
	mul r8, r7, r4
	add r4, r6, r8
	sub r4, r6, r8
	add r4, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #2
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =12
	mul r6, r7, r8
	add r7, r4, r6
	sub r7, r4, r6
	add r7, r4, r6
	ldr r4, [fp, #-4]
	mov r6, #1
	mov r9, #20
	mul r8, r6, r9
	add r6, r4, r8
	mov r4, #3
	mov r9, #4
	mul r8, r4, r9
	add r4, r6, r8
	ldr r6, [r4]
	ldr r4, =125
	mul r8, r6, r4
	add r4, r7, r8
	sub r4, r7, r8
	add r4, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #4
	mov r9, #4
	mul r8, r6, r9
	add r6, r7, r8
	ldr r7, [r6]
	ldr r8, =0
	sub r6, r8, #117
	mul r8, r7, r6
	add r6, r4, r8
	sub r6, r4, r8
	add r6, r4, r8
	ldr r4, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #0
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r8, =0
	sub r4, r8, #65
	mul r8, r7, r4
	add r4, r6, r8
	sub r4, r6, r8
	add r4, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #1
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =0
	sub r6, r8, #67
	mul r8, r7, r6
	add r6, r4, r8
	sub r6, r4, r8
	add r6, r4, r8
	ldr r4, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #2
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r8, =125
	mul r4, r7, r8
	add r7, r6, r4
	sub r7, r6, r4
	add r7, r6, r4
	ldr r4, [fp, #-4]
	mov r6, #2
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #3
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r8, =110
	mul r4, r6, r8
	add r6, r7, r4
	sub r6, r7, r4
	add r6, r7, r4
	ldr r4, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #4
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r8, =0
	sub r4, r8, #31
	mul r8, r7, r4
	add r4, r6, r8
	sub r4, r6, r8
	add r4, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #3
	mov r9, #20
	mul r8, r7, r9
	add r7, r6, r8
	mov r6, #0
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =0
	sub r6, r8, #123
	mul r8, r7, r6
	add r6, r4, r8
	sub r6, r4, r8
	add r6, r4, r8
	ldr r4, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #1
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r8, =83
	mul r4, r7, r8
	add r7, r6, r4
	sub r7, r6, r4
	add r7, r6, r4
	ldr r4, [fp, #-4]
	mov r6, #3
	mov r9, #20
	mul r8, r6, r9
	add r6, r4, r8
	mov r4, #2
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r4, =122
	mul r8, r6, r4
	add r4, r7, r8
	sub r4, r7, r8
	add r4, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #3
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =11
	mul r6, r7, r8
	add r7, r4, r6
	sub r7, r4, r6
	add r7, r4, r6
	ldr r4, [fp, #-4]
	mov r6, #3
	mov r9, #20
	mul r8, r6, r9
	add r6, r4, r8
	mov r4, #4
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r8, =0
	sub r4, r8, #23
	mul r8, r6, r4
	add r4, r7, r8
	sub r4, r7, r8
	add r4, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #0
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =0
	sub r6, r8, #47
	mul r8, r7, r6
	add r6, r4, r8
	sub r6, r4, r8
	add r6, r4, r8
	b .B2
.LTORG
.B2:
	ldr r4, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #1
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r8, =0
	sub r4, r8, #32
	mul r8, r7, r4
	add r4, r6, r8
	sub r4, r6, r8
	add r4, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #2
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =0
	sub r6, r8, #117
	mul r8, r7, r6
	add r6, r4, r8
	sub r6, r4, r8
	add r6, r4, r8
	ldr r4, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #3
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r4, =95
	mul r8, r7, r4
	add r4, r6, r8
	sub r4, r6, r8
	add r4, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #4
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =118
	mul r8, r7, r6
	add r6, r4, r8
	sub r6, r4, r8
	add r6, r4, r8
	mov r0, r6
	bl relu_reg
	mov r4, r0
	ldr r7, =0
	sub r6, r7, #106
	mul r7, r4, r6
	add r4, r5, r7
	sub r4, r5, r7
	add r4, r5, r7
	ldr r5, [fp, #-4]
	mov r6, #0
	mov r7, #20
	mul r8, r6, r7
	add r6, r5, r8
	mov r5, #0
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	ldr r6, [r5]
	ldr r7, =8
	mul r5, r6, r7
	ldr r6, [fp, #-4]
	mov r7, #0
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #1
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =82
	mul r6, r7, r8
	add r7, r5, r6
	sub r7, r5, r6
	add r7, r5, r6
	ldr r5, [fp, #-4]
	mov r6, #0
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #2
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r8, =0
	sub r5, r8, #104
	mul r8, r6, r5
	add r5, r7, r8
	sub r5, r7, r8
	add r5, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #0
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #3
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =101
	mul r8, r7, r6
	add r6, r5, r8
	sub r6, r5, r8
	add r6, r5, r8
	ldr r5, [fp, #-4]
	mov r7, #0
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #4
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r8, =0
	sub r5, r8, #116
	mul r8, r7, r5
	add r5, r6, r8
	sub r5, r6, r8
	add r5, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #1
	mov r9, #20
	mul r8, r7, r9
	add r7, r6, r8
	mov r6, #0
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =0
	sub r6, r8, #63
	mul r8, r7, r6
	add r6, r5, r8
	sub r6, r5, r8
	add r6, r5, r8
	ldr r5, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #1
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r8, =0
	sub r5, r8, #16
	mul r8, r7, r5
	add r5, r6, r8
	sub r5, r6, r8
	add r5, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #2
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =0
	sub r6, r8, #70
	mul r8, r7, r6
	add r6, r5, r8
	sub r6, r5, r8
	add r6, r5, r8
	ldr r5, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #3
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r8, =125
	mul r5, r7, r8
	add r7, r6, r5
	sub r7, r6, r5
	add r7, r6, r5
	ldr r5, [fp, #-4]
	mov r6, #1
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #4
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r8, =75
	mul r5, r6, r8
	add r6, r7, r5
	sub r6, r7, r5
	add r6, r7, r5
	ldr r5, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #0
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r8, =66
	mul r5, r7, r8
	add r7, r6, r5
	sub r7, r6, r5
	add r7, r6, r5
	ldr r5, [fp, #-4]
	mov r6, #2
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #1
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r8, =0
	sub r5, r8, #96
	mul r8, r6, r5
	add r5, r7, r8
	sub r5, r7, r8
	add r5, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #2
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =0
	sub r6, r8, #101
	mul r8, r7, r6
	add r6, r5, r8
	sub r6, r5, r8
	add r6, r5, r8
	ldr r5, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #3
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r8, =0
	sub r5, r8, #114
	mul r8, r7, r5
	add r5, r6, r8
	sub r5, r6, r8
	add r5, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #4
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =59
	mul r6, r7, r8
	add r7, r5, r6
	sub r7, r5, r6
	add r7, r5, r6
	ldr r5, [fp, #-4]
	mov r6, #3
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #0
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r8, =12
	mul r5, r6, r8
	add r6, r7, r5
	sub r6, r7, r5
	add r6, r7, r5
	ldr r5, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #1
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r8, =5
	mul r5, r7, r8
	add r7, r6, r5
	sub r7, r6, r5
	add r7, r6, r5
	ldr r5, [fp, #-4]
	mov r6, #3
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #2
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r8, =0
	sub r5, r8, #95
	mul r8, r6, r5
	add r5, r7, r8
	sub r5, r7, r8
	add r5, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #3
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =116
	mul r6, r7, r8
	add r7, r5, r6
	sub r7, r5, r6
	add r7, r5, r6
	ldr r5, [fp, #-4]
	mov r6, #3
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #4
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r8, =0
	sub r5, r8, #93
	mul r8, r6, r5
	add r5, r7, r8
	sub r5, r7, r8
	add r5, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #0
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =15
	mul r6, r7, r8
	add r7, r5, r6
	sub r7, r5, r6
	add r7, r5, r6
	ldr r5, [fp, #-4]
	mov r6, #4
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #1
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r5, =79
	mul r8, r6, r5
	add r5, r7, r8
	sub r5, r7, r8
	add r5, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #4
	mov r9, #20
	mul r8, r7, r9
	add r7, r6, r8
	mov r6, #2
	mov r9, #4
	mul r8, r6, r9
	add r6, r7, r8
	ldr r7, [r6]
	ldr r6, =3
	mul r8, r7, r6
	add r6, r5, r8
	sub r6, r5, r8
	add r6, r5, r8
	ldr r5, [fp, #-4]
	mov r7, #4
	mov r9, #20
	mul r8, r7, r9
	add r7, r5, r8
	mov r5, #3
	mov r9, #4
	mul r8, r5, r9
	add r5, r7, r8
	ldr r7, [r5]
	ldr r8, =49
	mul r5, r7, r8
	add r7, r6, r5
	sub r7, r6, r5
	add r7, r6, r5
	ldr r5, [fp, #-4]
	mov r6, #4
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #4
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r8, =0
	sub r5, r8, #124
	mul r8, r6, r5
	add r5, r7, r8
	sub r5, r7, r8
	add r5, r7, r8
	mov r0, r5
	bl relu_reg
	mov r5, r0
	ldr r7, =0
	sub r6, r7, #3
	mul r7, r5, r6
	add r5, r4, r7
	sub r5, r4, r7
	add r5, r4, r7
	ldr r4, [fp, #-4]
	mov r6, #0
	mov r7, #20
	mul r8, r6, r7
	add r6, r4, r8
	mov r4, #0
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	ldr r6, [r4]
	ldr r7, =81
	mul r4, r6, r7
	ldr r6, [fp, #-4]
	mov r7, #0
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #1
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =68
	mul r6, r7, r8
	add r7, r4, r6
	sub r7, r4, r6
	add r7, r4, r6
	ldr r4, [fp, #-4]
	mov r6, #0
	mov r9, #20
	mul r8, r6, r9
	add r6, r4, r8
	mov r4, #2
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	b .B3
.LTORG
.B3:
	ldr r8, =0
	sub r4, r8, #102
	mul r8, r6, r4
	add r4, r7, r8
	sub r4, r7, r8
	add r4, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #0
	mov r9, #20
	mul r8, r7, r9
	add r7, r6, r8
	mov r6, #3
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =0
	sub r6, r8, #74
	mul r8, r7, r6
	add r6, r4, r8
	sub r6, r4, r8
	add r6, r4, r8
	ldr r4, [fp, #-4]
	mov r7, #0
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #4
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r8, =121
	mul r4, r7, r8
	add r7, r6, r4
	sub r7, r6, r4
	add r7, r6, r4
	ldr r4, [fp, #-4]
	mov r6, #1
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #0
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r8, =0
	sub r4, r8, #15
	mul r8, r6, r4
	add r4, r7, r8
	sub r4, r7, r8
	add r4, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #1
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =55
	mul r6, r7, r8
	add r7, r4, r6
	sub r7, r4, r6
	add r7, r4, r6
	ldr r4, [fp, #-4]
	mov r6, #1
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #2
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r8, =101
	mul r4, r6, r8
	add r6, r7, r4
	sub r6, r7, r4
	add r6, r7, r4
	ldr r4, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #3
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r8, =0
	sub r4, r8, #13
	mul r8, r7, r4
	add r4, r6, r8
	sub r4, r6, r8
	add r4, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #4
	mov r9, #4
	mul r8, r6, r9
	add r6, r7, r8
	ldr r7, [r6]
	ldr r6, =0
	sub r8, r6, #62
	mul r6, r7, r8
	add r7, r4, r6
	sub r7, r4, r6
	add r7, r4, r6
	ldr r4, [fp, #-4]
	mov r6, #2
	mov r9, #20
	mul r8, r6, r9
	add r6, r4, r8
	mov r4, #0
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r8, =64
	mul r4, r6, r8
	add r6, r7, r4
	sub r6, r7, r4
	add r6, r7, r4
	ldr r4, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #1
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r8, =114
	mul r4, r7, r8
	add r7, r6, r4
	sub r7, r6, r4
	add r7, r6, r4
	ldr r4, [fp, #-4]
	mov r6, #2
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #2
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r8, =38
	mul r4, r6, r8
	add r6, r7, r4
	sub r6, r7, r4
	add r6, r7, r4
	ldr r4, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #3
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r8, =0
	sub r4, r8, #21
	mul r8, r7, r4
	add r4, r6, r8
	sub r4, r6, r8
	add r4, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #4
	mov r9, #4
	mul r8, r6, r9
	add r6, r7, r8
	ldr r7, [r6]
	ldr r8, =112
	mul r6, r7, r8
	add r7, r4, r6
	sub r7, r4, r6
	add r7, r4, r6
	ldr r4, [fp, #-4]
	mov r6, #3
	mov r9, #20
	mul r8, r6, r9
	add r6, r4, r8
	mov r4, #0
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r8, =114
	mul r4, r6, r8
	add r6, r7, r4
	sub r6, r7, r4
	add r6, r7, r4
	ldr r4, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #1
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r8, =112
	mul r4, r7, r8
	add r7, r6, r4
	sub r7, r6, r4
	add r7, r6, r4
	ldr r4, [fp, #-4]
	mov r6, #3
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #2
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r8, =0
	sub r4, r8, #10
	mul r8, r6, r4
	add r4, r7, r8
	sub r4, r7, r8
	add r4, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #3
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =0
	sub r6, r8, #16
	mul r8, r7, r6
	add r6, r4, r8
	sub r6, r4, r8
	add r6, r4, r8
	ldr r4, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #4
	mov r9, #4
	mul r8, r4, r9
	add r4, r7, r8
	ldr r7, [r4]
	ldr r8, =0
	sub r4, r8, #50
	mul r8, r7, r4
	add r4, r6, r8
	sub r4, r6, r8
	add r4, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #0
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =0
	sub r6, r8, #112
	mul r8, r7, r6
	add r6, r4, r8
	sub r6, r4, r8
	add r6, r4, r8
	ldr r4, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #1
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r8, =0
	sub r4, r8, #116
	mul r8, r7, r4
	add r4, r6, r8
	sub r4, r6, r8
	add r4, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #2
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =0
	sub r6, r8, #54
	mul r8, r7, r6
	add r6, r4, r8
	sub r6, r4, r8
	add r6, r4, r8
	ldr r4, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #3
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r8, =82
	mul r4, r7, r8
	add r7, r6, r4
	sub r7, r6, r4
	add r7, r6, r4
	ldr r4, [fp, #-4]
	mov r6, #4
	mov r9, #20
	mul r8, r6, r9
	add r6, r4, r8
	mov r4, #4
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r8, =0
	sub r4, r8, #72
	mul r8, r6, r4
	add r4, r7, r8
	sub r4, r7, r8
	add r4, r7, r8
	mov r0, r4
	bl relu_reg
	mov r4, r0
	ldr r7, =32
	mul r6, r4, r7
	add r4, r5, r6
	sub r4, r5, r6
	add r4, r5, r6
	ldr r5, [fp, #-4]
	mov r6, #0
	mov r7, #20
	mul r8, r6, r7
	add r6, r5, r8
	mov r5, #0
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	ldr r6, [r5]
	ldr r7, =15
	mul r5, r6, r7
	ldr r6, [fp, #-4]
	mov r7, #0
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #1
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =0
	sub r6, r8, #77
	mul r8, r7, r6
	add r6, r5, r8
	sub r6, r5, r8
	add r6, r5, r8
	ldr r5, [fp, #-4]
	mov r7, #0
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #2
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r8, =66
	mul r5, r7, r8
	add r7, r6, r5
	sub r7, r6, r5
	add r7, r6, r5
	ldr r5, [fp, #-4]
	mov r6, #0
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #3
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r8, =0
	sub r5, r8, #90
	mul r8, r6, r5
	add r5, r7, r8
	sub r5, r7, r8
	add r5, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #0
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #4
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =0
	sub r6, r8, #6
	mul r8, r7, r6
	add r6, r5, r8
	sub r6, r5, r8
	add r6, r5, r8
	ldr r5, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #0
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r8, =0
	sub r5, r8, #30
	mul r8, r7, r5
	add r5, r6, r8
	sub r5, r6, r8
	add r5, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #1
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =0
	sub r6, r8, #8
	mul r8, r7, r6
	add r6, r5, r8
	sub r6, r5, r8
	add r6, r5, r8
	ldr r5, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #2
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r8, =81
	mul r5, r7, r8
	add r7, r6, r5
	sub r7, r6, r5
	add r7, r6, r5
	ldr r5, [fp, #-4]
	mov r6, #1
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #3
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r8, =2
	mul r5, r6, r8
	add r6, r7, r5
	sub r6, r7, r5
	add r6, r7, r5
	ldr r5, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #4
	mov r8, #4
	b .B4
.LTORG
.B4:
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r8, =0
	sub r5, r8, #110
	mul r8, r7, r5
	add r5, r6, r8
	sub r5, r6, r8
	add r5, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #0
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =0
	sub r6, r8, #95
	mul r8, r7, r6
	add r6, r5, r8
	sub r6, r5, r8
	add r6, r5, r8
	ldr r5, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #1
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r5, =59
	mul r8, r7, r5
	add r5, r6, r8
	sub r5, r6, r8
	add r5, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #2
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =52
	mul r6, r7, r8
	add r7, r5, r6
	sub r7, r5, r6
	add r7, r5, r6
	ldr r5, [fp, #-4]
	mov r6, #2
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #3
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r8, =15
	mul r5, r6, r8
	add r6, r7, r5
	sub r6, r7, r5
	add r6, r7, r5
	ldr r5, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #4
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r8, =55
	mul r5, r7, r8
	add r7, r6, r5
	sub r7, r6, r5
	add r7, r6, r5
	ldr r5, [fp, #-4]
	mov r6, #3
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #0
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r8, =0
	sub r5, r8, #33
	mul r8, r6, r5
	add r5, r7, r8
	sub r5, r7, r8
	add r5, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #1
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =14
	mul r6, r7, r8
	add r7, r5, r6
	sub r7, r5, r6
	add r7, r5, r6
	ldr r5, [fp, #-4]
	mov r6, #3
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #2
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r8, =58
	mul r5, r6, r8
	add r6, r7, r5
	sub r6, r7, r5
	add r6, r7, r5
	ldr r5, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #3
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r8, =67
	mul r5, r7, r8
	add r7, r6, r5
	sub r7, r6, r5
	add r7, r6, r5
	ldr r5, [fp, #-4]
	mov r6, #3
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #4
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r8, =86
	mul r5, r6, r8
	add r6, r7, r5
	sub r6, r7, r5
	add r6, r7, r5
	ldr r5, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #0
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r8, =0
	sub r5, r8, #79
	mul r8, r7, r5
	add r5, r6, r8
	sub r5, r6, r8
	add r5, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #1
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =48
	mul r6, r7, r8
	add r7, r5, r6
	sub r7, r5, r6
	add r7, r5, r6
	ldr r5, [fp, #-4]
	mov r6, #4
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #2
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r8, =0
	sub r5, r8, #13
	mul r8, r6, r5
	add r5, r7, r8
	sub r5, r7, r8
	add r5, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #3
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =0
	sub r6, r8, #15
	mul r8, r7, r6
	add r6, r5, r8
	sub r6, r5, r8
	add r6, r5, r8
	ldr r5, [fp, #-4]
	mov r7, #4
	mov r9, #20
	mul r8, r7, r9
	add r7, r5, r8
	mov r5, #4
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r8, =66
	mul r5, r7, r8
	add r7, r6, r5
	sub r7, r6, r5
	add r7, r6, r5
	mov r0, r7
	bl relu_reg
	mov r5, r0
	ldr r7, =0
	sub r6, r7, #95
	mul r7, r5, r6
	add r5, r4, r7
	sub r5, r4, r7
	add r5, r4, r7
	ldr r4, [fp, #-4]
	mov r6, #0
	mov r7, #20
	mul r8, r6, r7
	add r6, r4, r8
	mov r4, #0
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	ldr r6, [r4]
	ldr r7, =33
	mul r4, r6, r7
	ldr r6, [fp, #-4]
	mov r7, #0
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #1
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =82
	mul r6, r7, r8
	add r7, r4, r6
	sub r7, r4, r6
	add r7, r4, r6
	ldr r4, [fp, #-4]
	mov r6, #0
	mov r9, #20
	mul r8, r6, r9
	add r6, r4, r8
	mov r4, #2
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r8, =67
	mul r4, r6, r8
	add r6, r7, r4
	sub r6, r7, r4
	add r6, r7, r4
	ldr r4, [fp, #-4]
	mov r7, #0
	mov r9, #20
	mul r8, r7, r9
	add r7, r4, r8
	mov r4, #3
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r8, =30
	mul r4, r7, r8
	add r7, r6, r4
	sub r7, r6, r4
	add r7, r6, r4
	ldr r4, [fp, #-4]
	mov r6, #0
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #4
	mov r9, #4
	mul r8, r4, r9
	add r4, r6, r8
	ldr r6, [r4]
	ldr r8, =0
	sub r4, r8, #2
	mul r8, r6, r4
	add r4, r7, r8
	sub r4, r7, r8
	add r4, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #0
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =65
	mul r6, r7, r8
	add r7, r4, r6
	sub r7, r4, r6
	add r7, r4, r6
	ldr r4, [fp, #-4]
	mov r6, #1
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #1
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r8, =120
	mul r4, r6, r8
	add r6, r7, r4
	sub r6, r7, r4
	add r6, r7, r4
	ldr r4, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #2
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r8, =0
	sub r4, r8, #13
	mul r8, r7, r4
	add r4, r6, r8
	sub r4, r6, r8
	add r4, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #3
	mov r9, #4
	mul r8, r6, r9
	add r6, r7, r8
	ldr r7, [r6]
	ldr r8, =18
	mul r6, r7, r8
	add r7, r4, r6
	sub r7, r4, r6
	add r7, r4, r6
	ldr r4, [fp, #-4]
	mov r6, #1
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #4
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r8, =5
	mul r4, r6, r8
	add r6, r7, r4
	sub r6, r7, r4
	add r6, r7, r4
	ldr r4, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #0
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r8, =104
	mul r4, r7, r8
	add r7, r6, r4
	sub r7, r6, r4
	add r7, r6, r4
	ldr r4, [fp, #-4]
	mov r6, #2
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #1
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r8, =0
	sub r4, r8, #119
	mul r8, r6, r4
	add r4, r7, r8
	sub r4, r7, r8
	add r4, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #2
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =0
	sub r6, r8, #7
	mul r8, r7, r6
	add r6, r4, r8
	sub r6, r4, r8
	add r6, r4, r8
	ldr r4, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #3
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r8, =71
	mul r4, r7, r8
	add r7, r6, r4
	sub r7, r6, r4
	add r7, r6, r4
	ldr r4, [fp, #-4]
	mov r6, #2
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #4
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r8, =107
	mul r4, r6, r8
	add r6, r7, r4
	sub r6, r7, r4
	add r6, r7, r4
	ldr r4, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #0
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r8, =24
	mul r4, r7, r8
	add r7, r6, r4
	sub r7, r6, r4
	add r7, r6, r4
	ldr r4, [fp, #-4]
	mov r6, #3
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #1
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r8, =82
	b .B5
.LTORG
.B5:
	mul r4, r6, r8
	add r6, r7, r4
	sub r6, r7, r4
	add r6, r7, r4
	ldr r4, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #2
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r8, =0
	sub r4, r8, #96
	mul r8, r7, r4
	add r4, r6, r8
	sub r4, r6, r8
	add r4, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #3
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =0
	sub r6, r8, #104
	mul r8, r7, r6
	add r6, r4, r8
	sub r6, r4, r8
	add r6, r4, r8
	ldr r4, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #4
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r8, =0
	sub r4, r8, #121
	mul r8, r7, r4
	add r4, r6, r8
	sub r4, r6, r8
	add r4, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #0
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =65
	mul r6, r7, r8
	add r7, r4, r6
	sub r7, r4, r6
	add r7, r4, r6
	ldr r4, [fp, #-4]
	mov r6, #4
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #1
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r4, =97
	mul r8, r6, r4
	add r4, r7, r8
	sub r4, r7, r8
	add r4, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #2
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =83
	mul r8, r7, r6
	add r6, r4, r8
	sub r6, r4, r8
	add r6, r4, r8
	ldr r4, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #3
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r4, =46
	mul r8, r7, r4
	add r4, r6, r8
	sub r4, r6, r8
	add r4, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #4
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =0
	sub r6, r8, #84
	mul r8, r7, r6
	add r6, r4, r8
	sub r6, r4, r8
	add r6, r4, r8
	mov r0, r6
	bl relu_reg
	mov r4, r0
	ldr r7, =0
	sub r6, r7, #50
	mul r7, r4, r6
	add r4, r5, r7
	sub r4, r5, r7
	add r4, r5, r7
	ldr r5, [fp, #-4]
	mov r6, #0
	mov r7, #20
	mul r8, r6, r7
	add r6, r5, r8
	mov r5, #0
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	ldr r6, [r5]
	ldr r7, =0
	sub r5, r7, #29
	mul r7, r6, r5
	ldr r5, [fp, #-4]
	mov r6, #0
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #1
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r8, =7
	mul r5, r6, r8
	add r6, r7, r5
	sub r6, r7, r5
	add r6, r7, r5
	ldr r5, [fp, #-4]
	mov r7, #0
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #2
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r8, =0
	sub r5, r8, #70
	mul r8, r7, r5
	add r5, r6, r8
	sub r5, r6, r8
	add r5, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #0
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #3
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =38
	mul r6, r7, r8
	add r7, r5, r6
	sub r7, r5, r6
	add r7, r5, r6
	ldr r5, [fp, #-4]
	mov r6, #0
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #4
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r8, =0
	sub r5, r8, #90
	mul r8, r6, r5
	add r5, r7, r8
	sub r5, r7, r8
	add r5, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #0
	mov r9, #4
	mul r8, r6, r9
	add r6, r7, r8
	ldr r7, [r6]
	ldr r8, =0
	sub r6, r8, #15
	mul r8, r7, r6
	add r6, r5, r8
	sub r6, r5, r8
	add r6, r5, r8
	ldr r5, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #1
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r8, =0
	sub r5, r8, #32
	mul r8, r7, r5
	add r5, r6, r8
	sub r5, r6, r8
	add r5, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #2
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =37
	mul r6, r7, r8
	add r7, r5, r6
	sub r7, r5, r6
	add r7, r5, r6
	ldr r5, [fp, #-4]
	mov r6, #1
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #3
	mov r9, #4
	mul r8, r5, r9
	add r5, r6, r8
	ldr r6, [r5]
	ldr r8, =36
	mul r5, r6, r8
	add r6, r7, r5
	sub r6, r7, r5
	add r6, r7, r5
	ldr r5, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #4
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r8, =0
	sub r5, r8, #62
	mul r8, r7, r5
	add r5, r6, r8
	sub r5, r6, r8
	add r5, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #0
	mov r9, #4
	mul r8, r6, r9
	add r6, r7, r8
	ldr r7, [r6]
	ldr r8, =0
	sub r6, r8, #125
	mul r8, r7, r6
	add r6, r5, r8
	sub r6, r5, r8
	add r6, r5, r8
	ldr r5, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #1
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r8, =0
	sub r5, r8, #46
	mul r8, r7, r5
	add r5, r6, r8
	sub r5, r6, r8
	add r5, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #2
	mov r9, #4
	mul r8, r6, r9
	add r6, r7, r8
	ldr r7, [r6]
	ldr r8, =0
	sub r6, r8, #70
	mul r8, r7, r6
	add r6, r5, r8
	sub r6, r5, r8
	add r6, r5, r8
	ldr r5, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #3
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r8, =37
	mul r5, r7, r8
	add r7, r6, r5
	sub r7, r6, r5
	add r7, r6, r5
	ldr r5, [fp, #-4]
	mov r6, #2
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #4
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r8, =0
	sub r5, r8, #73
	mul r8, r6, r5
	add r5, r7, r8
	sub r5, r7, r8
	add r5, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #3
	mov r9, #20
	mul r8, r7, r9
	add r7, r6, r8
	mov r6, #0
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =0
	sub r6, r8, #34
	mul r8, r7, r6
	add r6, r5, r8
	sub r6, r5, r8
	add r6, r5, r8
	ldr r5, [fp, #-4]
	mov r7, #3
	mov r9, #20
	mul r8, r7, r9
	add r7, r5, r8
	mov r5, #1
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r8, =0
	sub r5, r8, #87
	mul r8, r7, r5
	add r5, r6, r8
	sub r5, r6, r8
	add r5, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #2
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =0
	sub r6, r8, #75
	mul r8, r7, r6
	add r6, r5, r8
	sub r6, r5, r8
	add r6, r5, r8
	ldr r5, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #3
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r8, =71
	mul r5, r7, r8
	add r7, r6, r5
	sub r7, r6, r5
	add r7, r6, r5
	ldr r5, [fp, #-4]
	mov r6, #3
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #4
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r8, =0
	sub r5, r8, #77
	mul r8, r6, r5
	add r5, r7, r8
	sub r5, r7, r8
	add r5, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #0
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =53
	mul r6, r7, r8
	add r7, r5, r6
	sub r7, r5, r6
	add r7, r5, r6
	ldr r5, [fp, #-4]
	mov r6, #4
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #1
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r8, =37
	mul r5, r6, r8
	add r6, r7, r5
	sub r6, r7, r5
	add r6, r7, r5
	ldr r5, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #2
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r8, =0
	sub r5, r8, #103
	mul r8, r7, r5
	add r5, r6, r8
	sub r5, r6, r8
	add r5, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #3
	b .B6
.LTORG
.B6:
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =0
	sub r6, r8, #13
	mul r8, r7, r6
	add r6, r5, r8
	sub r6, r5, r8
	add r6, r5, r8
	ldr r5, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #4
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r8, =0
	sub r5, r8, #114
	mul r8, r7, r5
	add r5, r6, r8
	sub r5, r6, r8
	add r5, r6, r8
	mov r0, r5
	bl relu_reg
	mov r5, r0
	ldr r7, =0
	sub r6, r7, #23
	mul r7, r5, r6
	add r5, r4, r7
	sub r5, r4, r7
	add r5, r4, r7
	ldr r4, [fp, #-4]
	mov r6, #0
	mov r7, #20
	mul r8, r6, r7
	add r6, r4, r8
	mov r4, #0
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	ldr r6, [r4]
	ldr r7, =67
	mul r4, r6, r7
	ldr r6, [fp, #-4]
	mov r7, #0
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #1
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =42
	mul r6, r7, r8
	add r7, r4, r6
	sub r7, r4, r6
	add r7, r4, r6
	ldr r4, [fp, #-4]
	mov r6, #0
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #2
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r8, =41
	mul r4, r6, r8
	add r6, r7, r4
	sub r6, r7, r4
	add r6, r7, r4
	ldr r4, [fp, #-4]
	mov r7, #0
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #3
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r8, =0
	sub r4, r8, #123
	mul r8, r7, r4
	add r4, r6, r8
	sub r4, r6, r8
	add r4, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #0
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #4
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =0
	sub r6, r8, #92
	mul r8, r7, r6
	add r6, r4, r8
	sub r6, r4, r8
	add r6, r4, r8
	ldr r4, [fp, #-4]
	mov r7, #1
	mov r9, #20
	mul r8, r7, r9
	add r7, r4, r8
	mov r4, #0
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r8, =10
	mul r4, r7, r8
	add r7, r6, r4
	sub r7, r6, r4
	add r7, r6, r4
	ldr r4, [fp, #-4]
	mov r6, #1
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #1
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r8, =0
	sub r4, r8, #77
	mul r8, r6, r4
	add r4, r7, r8
	sub r4, r7, r8
	add r4, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #1
	mov r9, #20
	mul r8, r7, r9
	add r7, r6, r8
	mov r6, #2
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =75
	mul r6, r7, r8
	add r7, r4, r6
	sub r7, r4, r6
	add r7, r4, r6
	ldr r4, [fp, #-4]
	mov r6, #1
	mov r9, #20
	mul r8, r6, r9
	add r6, r4, r8
	mov r4, #3
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r8, =96
	mul r4, r6, r8
	add r6, r7, r4
	sub r6, r7, r4
	add r6, r7, r4
	ldr r4, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #4
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r8, =0
	sub r4, r8, #51
	mul r8, r7, r4
	add r4, r6, r8
	sub r4, r6, r8
	add r4, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #0
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =109
	mul r6, r7, r8
	add r7, r4, r6
	sub r7, r4, r6
	add r7, r4, r6
	ldr r4, [fp, #-4]
	mov r6, #2
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #1
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r8, =0
	sub r4, r8, #74
	mul r8, r6, r4
	add r4, r7, r8
	sub r4, r7, r8
	add r4, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #2
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =0
	sub r6, r8, #7
	mul r8, r7, r6
	add r6, r4, r8
	sub r6, r4, r8
	add r6, r4, r8
	ldr r4, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #3
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r8, =0
	sub r4, r8, #122
	mul r8, r7, r4
	add r4, r6, r8
	sub r4, r6, r8
	add r4, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #4
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =67
	mul r6, r7, r8
	add r7, r4, r6
	sub r7, r4, r6
	add r7, r4, r6
	ldr r4, [fp, #-4]
	mov r6, #3
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #0
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r8, =47
	mul r4, r6, r8
	add r6, r7, r4
	sub r6, r7, r4
	add r6, r7, r4
	ldr r4, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #1
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r8, =22
	mul r4, r7, r8
	add r7, r6, r4
	sub r7, r6, r4
	add r7, r6, r4
	ldr r4, [fp, #-4]
	mov r6, #3
	mov r9, #20
	mul r8, r6, r9
	add r6, r4, r8
	mov r4, #2
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r8, =0
	sub r4, r8, #68
	mul r8, r6, r4
	add r4, r7, r8
	sub r4, r7, r8
	add r4, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #3
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =38
	mul r6, r7, r8
	add r7, r4, r6
	sub r7, r4, r6
	add r7, r4, r6
	ldr r4, [fp, #-4]
	mov r6, #3
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #4
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r8, =29
	mul r4, r6, r8
	add r6, r7, r4
	sub r6, r7, r4
	add r6, r7, r4
	ldr r4, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #0
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r8, =115
	mul r4, r7, r8
	add r7, r6, r4
	sub r7, r6, r4
	add r7, r6, r4
	ldr r4, [fp, #-4]
	mov r6, #4
	mov r9, #20
	mul r8, r6, r9
	add r6, r4, r8
	mov r4, #1
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r8, =0
	sub r4, r8, #121
	mul r8, r6, r4
	add r4, r7, r8
	sub r4, r7, r8
	add r4, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #2
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =36
	mul r6, r7, r8
	add r7, r4, r6
	sub r7, r4, r6
	add r7, r4, r6
	ldr r4, [fp, #-4]
	mov r6, #4
	mov r9, #20
	mul r8, r6, r9
	add r6, r4, r8
	mov r4, #3
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r8, =0
	sub r4, r8, #49
	mul r8, r6, r4
	add r4, r7, r8
	sub r4, r7, r8
	add r4, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #4
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =85
	mul r6, r7, r8
	add r7, r4, r6
	sub r7, r4, r6
	add r7, r4, r6
	mov r0, r7
	bl relu_reg
	mov r4, r0
	ldr r7, =46
	mul r6, r4, r7
	add r4, r5, r6
	sub r4, r5, r6
	add r4, r5, r6
	cmp r4, #0
	movgt r4, #1
	movle r4, #0
	bgt .L947
	b .L1701
	b .F7
.LTORG
.F7:
.L947:
	mov r0, #1
	add sp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr
	b .L948
.L948:
	mov r0, #0
	add sp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr
.L1701:
	b .L948

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #112
.L1702:
	bl getint
	mov r4, r0
	str r4, [fp, #-112]
	b .L1705
.L1705:
	ldr r4, [fp, #-112]
	cmp r4, #0
	movgt r4, #1
	movle r4, #0
	bgt .L1706
	b .L1710
.L1706:
	ldr r4, =0
	str r4, [fp, #-8]
	b .L1712
.L1707:
	mov r0, #0
	add sp, sp, #112
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L1710:
	b .L1707
.L1712:
	ldr r4, [fp, #-8]
	cmp r4, #5
	movlt r4, #1
	movge r4, #0
	blt .L1713
	b .L1717
.L1713:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L1719
.L1714:
	mov r4, #0
	mov r5, #-108
	mov r6, #20
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	mov r0, r5
	bl model
	mov r4, r0
	cmp r4, #0
	bne .L1726
	b .L1730
.L1717:
	b .L1714
.L1719:
	ldr r4, [fp, #-4]
	cmp r4, #5
	movlt r4, #1
	movge r4, #0
	blt .L1720
	b .L1724
.L1720:
	bl getint
	mov r4, r0
	ldr r5, [fp, #-8]
	mov r6, #-108
	mov r7, #20
	mul r8, r5, r7
	add r5, r6, r8
	add r6, fp, r5
	ldr r5, [fp, #-4]
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	str r4, [r5]
	ldr r4, [fp, #-4]
	add r5, r4, #1
	sub r5, r4, #1
	add r5, r4, #1
	str r5, [fp, #-4]
	b .L1719
.L1721:
	ldr r4, [fp, #-8]
	add r5, r4, #1
	sub r5, r4, #1
	add r5, r4, #1
	str r5, [fp, #-8]
	b .L1712
.L1724:
	b .L1721
.L1726:
	mov r0, #99
	bl putch
	mov r0, #97
	bl putch
	mov r0, #116
	bl putch
	mov r0, #10
	bl putch
	b .L1728
.L1727:
	mov r0, #100
	bl putch
	mov r0, #111
	bl putch
	mov r0, #103
	bl putch
	mov r0, #10
	bl putch
	b .L1728
.L1728:
	ldr r4, [fp, #-112]
	sub r5, r4, #1
	str r5, [fp, #-112]
	b .L1705
.L1730:
	b .L1727

