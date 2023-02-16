	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.section .rodata
	.global INF
	.align 4
	.size INF, 32
INF:
	.word 1879048192
	.comm size, 320, 4
	.comm to, 3200, 4
	.comm cap, 3200, 4
	.comm rev, 3200, 4
	.comm used, 320, 4
	.text
	@ 0
	.global my_memset
	.type my_memset , %function
my_memset:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #16
.L194:
	str r0, [fp, #-16]
	str r1, [fp, #-12]
	str r2, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L199
.L199:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-8]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L200
	b .L204
.L200:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-16]
	ldr r6, [fp, #-4]
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-4]
	add r5, r4, #1
	sub r5, r4, #1
	add r5, r4, #1
	str r5, [fp, #-4]
	b .L199
.L201:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L202:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L203:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L204:
	b .L201

	.global add_node
	.type add_node , %function
add_node:
	push {r4, r5, r6, r7, r8, r9, fp, lr}
	mov fp, sp
	sub sp, sp, #12
.L206:
	str r0, [fp, #-12]
	str r1, [fp, #-8]
	str r2, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-12]
	ldr r6, addr_to0
	mov r7, #40
	mul r8, r5, r7
	add r5, r6, r8
	mov r6, r5
	ldr r5, [fp, #-12]
	ldr r7, addr_size0
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	mov r7, r5
	ldr r5, [r7]
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	str r4, [r5]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-12]
	ldr r6, addr_cap0
	mov r7, #40
	mul r8, r5, r7
	add r5, r6, r8
	mov r6, r5
	ldr r5, [fp, #-12]
	ldr r7, addr_size0
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	mov r7, r5
	ldr r5, [r7]
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	str r4, [r5]
	ldr r4, [fp, #-8]
	ldr r5, addr_size0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	ldr r5, [fp, #-12]
	ldr r6, addr_rev0
	mov r7, #40
	mul r8, r5, r7
	add r5, r6, r8
	mov r6, r5
	ldr r5, [fp, #-12]
	ldr r7, addr_size0
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	mov r7, r5
	ldr r5, [r7]
	mov r8, #4
	mul r7, r5, r8
	add r5, r6, r7
	str r4, [r5]
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-8]
	ldr r6, addr_to0
	mov r7, #40
	mul r8, r5, r7
	add r5, r6, r8
	mov r6, r5
	ldr r5, [fp, #-8]
	ldr r7, addr_size0
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	mov r7, r5
	ldr r5, [r7]
	mov r8, #4
	mul r7, r5, r8
	add r5, r6, r7
	str r4, [r5]
	ldr r4, [fp, #-8]
	ldr r5, addr_cap0
	mov r6, #40
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [fp, #-8]
	ldr r6, addr_size0
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	mov r6, r4
	ldr r4, [r6]
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, =0
	str r5, [r4]
	ldr r4, [fp, #-12]
	ldr r5, addr_size0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	ldr r5, [fp, #-8]
	ldr r6, addr_rev0
	mov r7, #40
	mul r8, r5, r7
	add r5, r6, r8
	mov r6, r5
	ldr r5, [fp, #-8]
	ldr r7, addr_size0
	mov r9, #4
	mul r8, r5, r9
	add r5, r7, r8
	mov r7, r5
	ldr r5, [r7]
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	str r4, [r5]
	ldr r4, [fp, #-12]
	ldr r5, addr_size0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	add r5, r4, #1
	sub r5, r4, #1
	add r5, r4, #1
	ldr r4, [fp, #-12]
	ldr r6, addr_size0
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	mov r6, r4
	str r5, [r6]
	ldr r4, [fp, #-8]
	ldr r5, addr_size0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	add r5, r4, #1
	sub r5, r4, #1
	add r5, r4, #1
	ldr r4, [fp, #-8]
	ldr r6, addr_size0
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	mov r6, r4
	str r5, [r6]
	add sp, sp, #12
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr

	.global dfs
	.type dfs , %function
dfs:
	push {r4, r5, r6, r7, r8, r9, fp, lr}
	mov fp, sp
	sub sp, sp, #24
.L226:
	str r0, [fp, #-24]
	str r1, [fp, #-20]
	str r2, [fp, #-16]
	ldr r4, [fp, #-24]
	ldr r5, [fp, #-20]
	cmp r4, r5
	beq .L230
	b .L234
.L230:
	ldr r4, [fp, #-16]
	mov r0, r4
	add sp, sp, #24
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr
	b .L231
.L231:
	ldr r4, [fp, #-24]
	ldr r5, addr_used0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, =1
	str r4, [r5]
	ldr r4, =0
	str r4, [fp, #-12]
	b .L236
.L234:
	b .L231
.L236:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-24]
	ldr r6, addr_size0
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	mov r6, r5
	ldr r5, [r6]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L237
	b .L242
.L237:
	ldr r4, [fp, #-24]
	ldr r5, addr_to0
	mov r6, #40
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [fp, #-12]
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [r4]
	ldr r4, addr_used0
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #0
	bne .L243
	b .L249
.L238:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr
.L242:
	b .L238
.L243:
	ldr r4, [fp, #-12]
	add r5, r4, #1
	sub r5, r4, #1
	add r5, r4, #1
	str r5, [fp, #-12]
	b .L236
.L244:
	ldr r4, [fp, #-24]
	ldr r5, addr_cap0
	mov r6, #40
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [fp, #-12]
	mov r7, #4
	mul r6, r4, r7
	add r4, r5, r6
	ldr r5, [r4]
	cmp r5, #0
	movle r4, #1
	movgt r4, #0
	ble .L252
	b .L258
.L249:
	b .L244
.L251:
	b .L244
.L252:
	ldr r4, [fp, #-12]
	add r5, r4, #1
	sub r5, r4, #1
	add r5, r4, #1
	str r5, [fp, #-12]
	b .L236
.L253:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-24]
	ldr r6, addr_cap0
	mov r7, #40
	mul r8, r5, r7
	add r5, r6, r8
	mov r6, r5
	ldr r5, [fp, #-12]
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L261
	b .L268
.L258:
	b .L253
.L259:
	b .L253
.L261:
	ldr r4, [fp, #-16]
	str r4, [fp, #-8]
	b .L263
.L262:
	ldr r4, [fp, #-24]
	ldr r5, addr_cap0
	mov r7, #40
	mul r6, r4, r7
	add r4, r5, r6
	mov r5, r4
	ldr r4, [fp, #-12]
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [r4]
	str r5, [fp, #-8]
	b .L263
.L263:
	ldr r4, [fp, #-24]
	ldr r5, addr_to0
	mov r6, #40
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [fp, #-12]
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [r4]
	ldr r4, [fp, #-20]
	ldr r6, [fp, #-8]
	mov r0, r5
	mov r1, r4
	mov r2, r6
	bl dfs
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	cmp r4, #0
	movgt r4, #1
	movle r4, #0
	bgt .L274
	b .L278
.L268:
	b .L262
.L274:
	ldr r4, [fp, #-24]
	ldr r5, addr_cap0
	mov r6, #40
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [fp, #-12]
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [r4]
	ldr r4, [fp, #-4]
	sub r6, r5, r4
	ldr r4, [fp, #-24]
	ldr r5, addr_cap0
	mov r7, #40
	mul r8, r4, r7
	add r4, r5, r8
	mov r5, r4
	ldr r4, [fp, #-12]
	mov r7, #4
	mul r8, r4, r7
	add r4, r5, r8
	str r6, [r4]
	ldr r4, [fp, #-24]
	ldr r5, addr_to0
	mov r6, #40
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [fp, #-12]
	mov r7, #4
	mul r6, r4, r7
	add r4, r5, r6
	ldr r5, [r4]
	ldr r4, addr_cap0
	mov r6, #40
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [fp, #-24]
	ldr r6, addr_rev0
	mov r8, #40
	mul r7, r5, r8
	add r5, r6, r7
	mov r6, r5
	ldr r5, [fp, #-12]
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	ldr r6, [r5]
	mov r5, #4
	mul r7, r6, r5
	add r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-4]
	add r6, r4, r5
	sub r6, r4, r5
	add r6, r4, r5
	ldr r4, [fp, #-24]
	ldr r5, addr_to0
	mov r7, #40
	mul r8, r4, r7
	add r4, r5, r8
	mov r5, r4
	ldr r4, [fp, #-12]
	mov r8, #4
	mul r7, r4, r8
	add r4, r5, r7
	ldr r5, [r4]
	ldr r4, addr_cap0
	mov r7, #40
	mul r8, r5, r7
	add r5, r4, r8
	mov r4, r5
	ldr r5, [fp, #-24]
	ldr r7, addr_rev0
	mov r9, #40
	mul r8, r5, r9
	add r5, r7, r8
	mov r7, r5
	ldr r5, [fp, #-12]
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	mov r5, #4
	mul r8, r7, r5
	add r5, r4, r8
	str r6, [r5]
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #24
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr
	b .L275
	b .F0
.LTORG
addr_INF0:
	.word INF
addr_size0:
	.word size
addr_to0:
	.word to
addr_cap0:
	.word cap
addr_rev0:
	.word rev
addr_used0:
	.word used
.F0:
.L275:
	ldr r4, [fp, #-12]
	add r5, r4, #1
	sub r5, r4, #1
	add r5, r4, #1
	str r5, [fp, #-12]
	b .L236
.L278:
	b .L275

	.global max_flow
	.type max_flow , %function
max_flow:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #16
.L293:
	str r0, [fp, #-16]
	str r1, [fp, #-12]
	ldr r4, =0
	str r4, [fp, #-8]
	b .L297
.L297:
	ldr r4, =1
	cmp r4, #0
	bne .L298
	b .L301
.L298:
	mov r4, #0
	ldr r5, addr_used1
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	mov r0, r5
	mov r1, #0
	mov r2, #10
	bl my_memset
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	ldr r7, addr_INF1
	ldr r6, [r7]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl dfs
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	cmp r4, #0
	beq .L304
	b .L308
.L299:
	mov r0, #0
	add sp, sp, #16
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L301:
	b .L299
.L304:
	ldr r4, [fp, #-8]
	mov r0, r4
	add sp, sp, #16
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
	b .L305
.L305:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	add r6, r4, r5
	sub r6, r4, r5
	add r6, r4, r5
	str r6, [fp, #-8]
	b .L297
.L308:
	b .L305

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #20
.L309:
	bl getint
	mov r4, r0
	str r4, [fp, #-20]
	bl getint
	mov r4, r0
	str r4, [fp, #-16]
	mov r4, #0
	ldr r5, addr_size1
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	mov r0, r5
	mov r1, #0
	mov r2, #10
	bl my_memset
	b .L312
.L312:
	ldr r4, [fp, #-16]
	cmp r4, #0
	movgt r4, #1
	movle r4, #0
	bgt .L313
	b .L317
.L313:
	bl getint
	mov r4, r0
	str r4, [fp, #-12]
	bl getint
	mov r4, r0
	str r4, [fp, #-8]
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-8]
	ldr r6, [fp, #-4]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl add_node
	ldr r4, [fp, #-16]
	sub r5, r4, #1
	str r5, [fp, #-16]
	b .L312
.L314:
	ldr r4, [fp, #-20]
	mov r0, #1
	mov r1, r4
	bl max_flow
	mov r4, r0
	mov r0, r4
	bl putint
	mov r0, #10
	bl putch
	mov r0, #0
	add sp, sp, #20
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L317:
	b .L314

addr_INF1:
	.word INF
addr_size1:
	.word size
addr_to1:
	.word to
addr_cap1:
	.word cap
addr_rev1:
	.word rev
addr_used1:
	.word used
