	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global last_char
	.align 4
	.size last_char, 32
last_char:
	.word 32
	.global num
	.align 4
	.size num, 32
num:
	.word 0
	.global other
	.align 4
	.size other, 32
other:
	.word 0
	.global cur_token
	.align 4
	.size cur_token, 32
cur_token:
	.word 0
	.section .rodata
	.global TOKEN_NUM
	.align 4
	.size TOKEN_NUM, 32
TOKEN_NUM:
	.word 0
	.global TOKEN_OTHER
	.align 4
	.size TOKEN_OTHER, 32
TOKEN_OTHER:
	.word 1
	.text
	@ 0
	.global next_char
	.type next_char , %function
next_char:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub sp, sp, #0
.L205:
	bl getch
	mov r4, r0
	ldr r5, addr_last_char0
	str r4, [r5]
	ldr r5, addr_last_char0
	ldr r4, [r5]
	mov r0, r4
	add sp, sp, #0
	pop {r4, r5, fp, lr}
	bx lr

	.global is_space
	.type is_space , %function
is_space:
	push {r4, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L206:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	cmp r4, #32
	beq .L208
	b .L214
.L208:
	mov r0, #1
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr
	b .L210
.L209:
	mov r0, #0
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr
	b .L210
.L210:
	mov r0, #0
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr
.L211:
	ldr r4, [fp, #-4]
	cmp r4, #10
	beq .L208
	b .L217
.L214:
	b .L211
.L217:
	b .L209

	.global is_num
	.type is_num , %function
is_num:
	push {r4, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L218:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	cmp r4, #48
	movge r4, #1
	movlt r4, #0
	bge .L223
	b .L226
.L220:
	mov r0, #1
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr
	b .L222
.L221:
	mov r0, #0
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr
	b .L222
.L222:
	mov r0, #0
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr
.L223:
	ldr r4, [fp, #-4]
	cmp r4, #57
	movle r4, #1
	movgt r4, #0
	ble .L220
	b .L229
.L226:
	b .L221
.L229:
	b .L221

	.global next_token
	.type next_token , %function
next_token:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #0
.L230:
	b .L231
.L231:
	ldr r5, addr_last_char0
	ldr r4, [r5]
	mov r0, r4
	bl is_space
	mov r4, r0
	cmp r4, #0
	bne .L232
	b .L235
.L232:
	bl next_char
	mov r4, r0
	b .L231
.L233:
	ldr r5, addr_last_char0
	ldr r4, [r5]
	mov r0, r4
	bl is_num
	mov r4, r0
	cmp r4, #0
	bne .L237
	b .L241
.L235:
	b .L233
.L237:
	ldr r5, addr_last_char0
	ldr r4, [r5]
	sub r5, r4, #48
	ldr r4, addr_num0
	str r5, [r4]
	b .L243
.L238:
	ldr r5, addr_last_char0
	ldr r4, [r5]
	ldr r5, addr_other0
	str r4, [r5]
	bl next_char
	mov r4, r0
	ldr r5, addr_TOKEN_OTHER0
	ldr r4, [r5]
	ldr r5, addr_cur_token0
	str r4, [r5]
	b .L239
.L239:
	ldr r5, addr_cur_token0
	ldr r4, [r5]
	mov r0, r4
	add sp, sp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr
.L241:
	b .L238
.L243:
	bl next_char
	mov r4, r0
	mov r0, r4
	bl is_num
	mov r4, r0
	cmp r4, #0
	bne .L244
	b .L247
.L244:
	ldr r5, addr_num0
	ldr r4, [r5]
	ldr r6, =10
	mul r5, r4, r6
	ldr r6, addr_last_char0
	ldr r4, [r6]
	add r6, r5, r4
	sub r6, r5, r4
	add r6, r5, r4
	sub r4, r6, #48
	ldr r5, addr_num0
	str r4, [r5]
	b .L243
.L245:
	ldr r5, addr_TOKEN_NUM0
	ldr r4, [r5]
	ldr r5, addr_cur_token0
	str r4, [r5]
	b .L239
.L247:
	b .L245

	.global panic
	.type panic , %function
panic:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub sp, sp, #0
.L249:
	mov r0, #112
	bl putch
	mov r0, #97
	bl putch
	mov r0, #110
	bl putch
	mov r0, #105
	bl putch
	mov r0, #99
	bl putch
	mov r0, #33
	bl putch
	mov r0, #10
	bl putch
	ldr r5, =0
	sub r4, r5, #1
	mov r0, r4
	add sp, sp, #0
	pop {r4, r5, fp, lr}
	bx lr

	.global get_op_prec
	.type get_op_prec , %function
get_op_prec:
	push {r4, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L250:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	cmp r4, #43
	beq .L252
	b .L257
.L252:
	mov r0, #10
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr
	b .L253
.L253:
	ldr r4, [fp, #-4]
	cmp r4, #42
	beq .L261
	b .L267
.L254:
	ldr r4, [fp, #-4]
	cmp r4, #45
	beq .L252
	b .L260
.L257:
	b .L254
.L260:
	b .L253
.L261:
	mov r0, #20
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr
	b .L262
.L262:
	mov r0, #0
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr
.L263:
	ldr r4, [fp, #-4]
	cmp r4, #37
	beq .L261
	b .L273
.L264:
	ldr r4, [fp, #-4]
	cmp r4, #47
	beq .L261
	b .L270
.L267:
	b .L264
.L270:
	b .L263
.L273:
	b .L262

	.global stack_push
	.type stack_push , %function
stack_push:
	push {r4, r5, r6, r7, r8, r9, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L274:
	str r0, [fp, #-8]
	str r1, [fp, #-4]
	ldr r4, [fp, #-8]
	mov r5, #0
	mov r7, #4
	mul r6, r5, r7
	add r5, r4, r6
	ldr r4, [r5]
	add r5, r4, #1
	sub r5, r4, #1
	add r5, r4, #1
	ldr r4, [fp, #-8]
	mov r6, #0
	mov r8, #4
	mul r7, r6, r8
	add r6, r4, r7
	str r5, [r6]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-8]
	ldr r6, [fp, #-8]
	mov r7, #0
	mov r8, #4
	mul r9, r7, r8
	add r7, r6, r9
	ldr r6, [r7]
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	str r4, [r6]
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr

	.global stack_pop
	.type stack_pop , %function
stack_pop:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L283:
	str r0, [fp, #-8]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	mov r6, #0
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	ldr r5, [r6]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	str r4, [fp, #-4]
	ldr r4, [fp, #-8]
	mov r5, #0
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	sub r5, r4, #1
	ldr r4, [fp, #-8]
	mov r6, #0
	mov r7, #4
	mul r8, r6, r7
	add r6, r4, r8
	str r5, [r6]
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

	.global stack_peek
	.type stack_peek , %function
stack_peek:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L293:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-4]
	mov r6, #0
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	ldr r5, [r6]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	mov r0, r4
	add sp, sp, #4
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

	.global stack_size
	.type stack_size , %function
stack_size:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L299:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r5, #0
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	mov r0, r4
	add sp, sp, #4
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

	.global eval_op
	.type eval_op , %function
eval_op:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #12
.L303:
	str r0, [fp, #-12]
	str r1, [fp, #-8]
	str r2, [fp, #-4]
	ldr r4, [fp, #-12]
	cmp r4, #43
	beq .L307
	b .L311
.L307:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	add r6, r4, r5
	sub r6, r4, r5
	add r6, r4, r5
	mov r0, r6
	add sp, sp, #12
	pop {r4, r5, r6, fp, lr}
	bx lr
	b .L308
.L308:
	ldr r4, [fp, #-12]
	cmp r4, #45
	beq .L312
	b .L316
.L311:
	b .L308
.L312:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	sub r6, r4, r5
	mov r0, r6
	add sp, sp, #12
	pop {r4, r5, r6, fp, lr}
	bx lr
	b .L313
.L313:
	ldr r4, [fp, #-12]
	cmp r4, #42
	beq .L317
	b .L321
.L316:
	b .L313
.L317:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	mul r6, r4, r5
	mov r0, r6
	add sp, sp, #12
	pop {r4, r5, r6, fp, lr}
	bx lr
	b .L318
.L318:
	ldr r4, [fp, #-12]
	cmp r4, #47
	beq .L322
	b .L326
.L321:
	b .L318
.L322:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	sdiv r6, r4, r5
	mov r0, r6
	add sp, sp, #12
	pop {r4, r5, r6, fp, lr}
	bx lr
	b .L323
.L323:
	ldr r4, [fp, #-12]
	cmp r4, #37
	beq .L327
	b .L331
.L326:
	b .L323
.L327:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	sdiv r6, r4, r5
	mul r5, r6, r5
	sub r6, r4, r5
	mov r0, r6
	add sp, sp, #12
	pop {r4, r5, r6, fp, lr}
	bx lr
	b .L328
.L328:
	mov r0, #0
	add sp, sp, #12
	pop {r4, r5, r6, fp, lr}
	bx lr
.L331:
	b .L328

	.global eval
	.type eval , %function
eval:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	ldr r4, =2076
	sub sp, sp, r4
.L332:
	mov r4, #0
	ldr r5, =-2076
	mov r7, #4
	mul r6, r4, r7
	add r4, r5, r6
	add r5, fp, r4
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
	add r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	b .B0
.LTORG
addr_TOKEN_NUM0:
	.word TOKEN_NUM
addr_TOKEN_OTHER0:
	.word TOKEN_OTHER
addr_last_char0:
	.word last_char
addr_num0:
	.word num
addr_other0:
	.word other
addr_cur_token0:
	.word cur_token
.B0:
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
	add r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	mov r4, #0
	ldr r5, =-1052
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
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
	add r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	b .B1
.LTORG
addr_TOKEN_NUM1:
	.word TOKEN_NUM
addr_TOKEN_OTHER1:
	.word TOKEN_OTHER
addr_last_char1:
	.word last_char
addr_num1:
	.word num
addr_other1:
	.word other
addr_cur_token1:
	.word cur_token
.B1:
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
	b .B2
.LTORG
addr_TOKEN_NUM2:
	.word TOKEN_NUM
addr_TOKEN_OTHER2:
	.word TOKEN_OTHER
addr_last_char2:
	.word last_char
addr_num2:
	.word num
addr_other2:
	.word other
addr_cur_token2:
	.word cur_token
.B2:
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
	ldr r5, addr_cur_token3
	ldr r4, [r5]
	ldr r6, addr_TOKEN_NUM3
	ldr r5, [r6]
	cmp r4, r5
	bne .L847
	b .L851
	b .F3
.LTORG
addr_TOKEN_NUM3:
	.word TOKEN_NUM
addr_TOKEN_OTHER3:
	.word TOKEN_OTHER
addr_last_char3:
	.word last_char
addr_num3:
	.word num
addr_other3:
	.word other
addr_cur_token3:
	.word cur_token
.F3:
.L847:
	bl panic
	mov r4, r0
	mov r0, r4
	ldr r1, =2076
	add sp, sp, r1
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
	b .L848
.L848:
	mov r4, #0
	ldr r5, =-2076
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r6, addr_num4
	ldr r4, [r6]
	mov r0, r5
	mov r1, r4
	bl stack_push
	bl next_token
	mov r4, r0
	b .L852
.L851:
	b .L848
.L852:
	ldr r5, addr_cur_token4
	ldr r4, [r5]
	ldr r6, addr_TOKEN_OTHER4
	ldr r5, [r6]
	cmp r4, r5
	beq .L853
	b .L857
.L853:
	ldr r4, addr_other4
	ldr r5, [r4]
	str r5, [fp, #-28]
	ldr r4, [fp, #-28]
	mov r0, r4
	bl get_op_prec
	mov r4, r0
	cmp r4, #0
	moveq r4, #1
	movne r4, #0
	cmp r4, #0
	bne .L859
	b .L863
.L854:
	bl next_token
	mov r4, r0
	b .L884
.L857:
	b .L854
.L859:
	b .L854
.L860:
	bl next_token
	mov r4, r0
	b .L866
.L863:
	b .L860
.L865:
	b .L860
.L866:
	mov r4, #0
	ldr r5, =-1052
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	mov r0, r5
	bl stack_size
	mov r4, r0
	cmp r4, #0
	bne .L869
	b .L871
.L867:
	mov r4, #0
	ldr r5, =-1052
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	mov r0, r5
	bl stack_pop
	mov r4, r0
	str r4, [fp, #-24]
	mov r4, #0
	ldr r5, =-2076
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	mov r0, r5
	bl stack_pop
	mov r4, r0
	str r4, [fp, #-20]
	mov r4, #0
	ldr r5, =-2076
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	mov r0, r5
	bl stack_pop
	mov r4, r0
	str r4, [fp, #-16]
	mov r4, #0
	ldr r5, =-2076
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, [fp, #-24]
	ldr r6, [fp, #-16]
	ldr r7, [fp, #-20]
	mov r0, r4
	mov r1, r6
	mov r2, r7
	bl eval_op
	mov r4, r0
	mov r0, r5
	mov r1, r4
	bl stack_push
	b .L866
.L868:
	mov r4, #0
	ldr r5, =-1052
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, [fp, #-28]
	mov r0, r5
	mov r1, r4
	bl stack_push
	ldr r5, addr_cur_token4
	ldr r4, [r5]
	ldr r6, addr_TOKEN_NUM4
	ldr r5, [r6]
	cmp r4, r5
	bne .L879
	b .L883
.L869:
	mov r4, #0
	ldr r5, =-1052
	mov r7, #4
	mul r6, r4, r7
	add r4, r5, r6
	add r5, fp, r4
	mov r0, r5
	bl stack_peek
	mov r4, r0
	mov r0, r4
	bl get_op_prec
	mov r4, r0
	ldr r5, [fp, #-28]
	mov r0, r5
	bl get_op_prec
	mov r5, r0
	cmp r4, r5
	movge r4, #1
	movlt r4, #0
	bge .L867
	b .L875
.L871:
	b .L868
.L875:
	b .L868
.L879:
	bl panic
	mov r4, r0
	mov r0, r4
	ldr r1, =2076
	add sp, sp, r1
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
	b .L880
.L880:
	mov r4, #0
	ldr r5, =-2076
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r6, addr_num4
	ldr r4, [r6]
	mov r0, r5
	mov r1, r4
	bl stack_push
	bl next_token
	mov r4, r0
	b .L852
	b .F4
.LTORG
addr_TOKEN_NUM4:
	.word TOKEN_NUM
addr_TOKEN_OTHER4:
	.word TOKEN_OTHER
addr_last_char4:
	.word last_char
addr_num4:
	.word num
addr_other4:
	.word other
addr_cur_token4:
	.word cur_token
.F4:
.L883:
	b .L880
.L884:
	mov r4, #0
	ldr r5, =-1052
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	mov r0, r5
	bl stack_size
	mov r4, r0
	cmp r4, #0
	bne .L885
	b .L888
.L885:
	mov r4, #0
	ldr r5, =-1052
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	mov r0, r5
	bl stack_pop
	mov r4, r0
	str r4, [fp, #-12]
	mov r4, #0
	ldr r5, =-2076
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	mov r0, r5
	bl stack_pop
	mov r4, r0
	str r4, [fp, #-8]
	mov r4, #0
	ldr r5, =-2076
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	mov r0, r5
	bl stack_pop
	mov r4, r0
	str r4, [fp, #-4]
	mov r4, #0
	ldr r5, =-2076
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, [fp, #-12]
	ldr r6, [fp, #-4]
	ldr r7, [fp, #-8]
	mov r0, r4
	mov r1, r6
	mov r2, r7
	bl eval_op
	mov r4, r0
	mov r0, r5
	mov r1, r4
	bl stack_push
	b .L884
.L886:
	mov r4, #0
	ldr r5, =-2076
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	mov r0, r5
	bl stack_peek
	mov r4, r0
	mov r0, r4
	ldr r1, =2076
	add sp, sp, r1
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L888:
	b .L886

	.global main
	.type main , %function
main:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L893:
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	bl getch
	mov r4, r0
	bl next_token
	mov r4, r0
	b .L895
.L895:
	ldr r4, [fp, #-4]
	cmp r4, #0
	bne .L896
	b .L899
.L896:
	bl eval
	mov r4, r0
	mov r0, r4
	bl putint
	mov r0, #10
	bl putch
	ldr r4, [fp, #-4]
	sub r5, r4, #1
	str r5, [fp, #-4]
	b .L895
.L897:
	mov r0, #0
	add sp, sp, #4
	pop {r4, r5, fp, lr}
	bx lr
.L899:
	b .L897

addr_TOKEN_NUM5:
	.word TOKEN_NUM
addr_TOKEN_OTHER5:
	.word TOKEN_OTHER
addr_last_char5:
	.word last_char
addr_num5:
	.word num
addr_other5:
	.word other
addr_cur_token5:
	.word cur_token
