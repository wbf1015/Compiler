	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.section .rodata
	.global len
	.align 4
	.size len, 32
len:
	.word 20
	.text
	@ 0
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, r9, fp, lr}
	mov fp, sp
	ldr r4, =548
	sub sp, sp, r4
.L129:
	mov r4, #0
	ldr r5, =-528
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
	ldr r4, =3
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =4
	str r5, [r4]
	add r5, r4, #4
	ldr r4, =5
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =6
	str r5, [r4]
	add r5, r4, #4
	ldr r4, =7
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =8
	str r5, [r4]
	add r5, r4, #4
	ldr r4, =9
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add r5, r4, #4
	ldr r4, =1
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =2
	str r5, [r4]
	add r5, r4, #4
	ldr r4, =3
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =4
	str r5, [r4]
	add r5, r4, #4
	ldr r4, =5
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =6
	str r5, [r4]
	add r5, r4, #4
	ldr r4, =7
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =8
	str r5, [r4]
	add r5, r4, #4
	ldr r4, =9
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	mov r4, #0
	ldr r5, =-448
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =2
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =3
	str r5, [r4]
	add r5, r4, #4
	ldr r4, =4
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =2
	str r5, [r4]
	add r5, r4, #4
	ldr r4, =5
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =7
	str r5, [r4]
	add r5, r4, #4
	ldr r4, =9
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =9
	str r5, [r4]
	add r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =1
	str r5, [r4]
	add r5, r4, #4
	ldr r4, =9
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =8
	str r5, [r4]
	add r5, r4, #4
	ldr r4, =7
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =6
	str r5, [r4]
	add r5, r4, #4
	ldr r4, =4
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =3
	str r5, [r4]
	add r5, r4, #4
	ldr r4, =2
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =1
	str r5, [r4]
	add r5, r4, #4
	ldr r4, =2
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =2
	str r5, [r4]
	ldr r5, addr_len0
	ldr r4, [r5]
	ldr r5, =-368
	str r4, [fp, r5]
	ldr r5, addr_len0
	ldr r4, [r5]
	ldr r5, =-364
	str r4, [fp, r5]
	mov r4, #0
	mov r5, #-160
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
	ldr r5, =0
	ldr r4, =-548
	str r5, [fp, r4]
	b .L222
	b .F0
.LTORG
addr_len0:
	.word len
.F0:
.L222:
	ldr r5, =-548
	ldr r4, [fp, r5]
	ldr r6, =-368
	ldr r5, [fp, r6]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L223
	b .L227
.L223:
	ldr r5, =-548
	ldr r4, [fp, r5]
	ldr r5, =-528
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, [r5]
	ldr r6, =-548
	ldr r5, [fp, r6]
	ldr r6, =-360
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	add r6, fp, r5
	str r4, [r6]
	ldr r4, =-548
	ldr r5, [fp, r4]
	add r4, r5, #1
	sub r4, r5, #1
	add r4, r5, #1
	ldr r5, =-548
	str r4, [fp, r5]
	b .L222
.L224:
	ldr r4, =0
	ldr r5, =-548
	str r4, [fp, r5]
	b .L229
.L227:
	b .L224
.L229:
	ldr r5, =-548
	ldr r4, [fp, r5]
	ldr r6, =-364
	ldr r5, [fp, r6]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L230
	b .L234
.L230:
	ldr r5, =-548
	ldr r4, [fp, r5]
	ldr r5, =-448
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, [r5]
	ldr r6, =-548
	ldr r5, [fp, r6]
	ldr r6, =-260
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	add r6, fp, r5
	str r4, [r6]
	ldr r5, =-548
	ldr r4, [fp, r5]
	add r5, r4, #1
	sub r5, r4, #1
	add r5, r4, #1
	ldr r4, =-548
	str r5, [fp, r4]
	b .L229
.L231:
	ldr r4, =-368
	ldr r5, [fp, r4]
	ldr r6, =-364
	ldr r4, [fp, r6]
	add r6, r5, r4
	sub r6, r5, r4
	add r6, r5, r4
	sub r4, r6, #1
	ldr r5, =-536
	str r4, [fp, r5]
	ldr r4, =0
	ldr r5, =-548
	str r4, [fp, r5]
	b .L236
.L234:
	b .L231
.L236:
	ldr r5, =-548
	ldr r4, [fp, r5]
	ldr r6, =-536
	ldr r5, [fp, r6]
	cmp r4, r5
	movle r4, #1
	movgt r4, #0
	ble .L237
	b .L241
.L237:
	ldr r5, =-548
	ldr r4, [fp, r5]
	mov r5, #-160
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =0
	str r4, [r5]
	ldr r4, =-548
	ldr r5, [fp, r4]
	add r4, r5, #1
	sub r4, r5, #1
	add r4, r5, #1
	ldr r5, =-548
	str r4, [fp, r5]
	b .L236
.L238:
	ldr r4, =0
	ldr r5, =-532
	str r4, [fp, r5]
	ldr r5, =-364
	ldr r4, [fp, r5]
	sub r5, r4, #1
	ldr r4, =-548
	str r5, [fp, r4]
	b .L242
.L241:
	b .L238
.L242:
	ldr r5, =-548
	ldr r4, [fp, r5]
	ldr r6, =0
	sub r5, r6, #1
	cmp r4, r5
	movgt r4, #1
	movle r4, #0
	bgt .L243
	b .L247
.L243:
	ldr r5, =-548
	ldr r4, [fp, r5]
	ldr r5, =-260
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, [r5]
	ldr r5, =-540
	str r4, [fp, r5]
	ldr r5, =-368
	ldr r4, [fp, r5]
	sub r5, r4, #1
	ldr r4, =-544
	str r5, [fp, r4]
	b .L249
.L244:
	mov r4, #0
	mov r5, #-160
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, [r5]
	cmp r4, #0
	bne .L264
	b .L269
.L247:
	b .L244
.L249:
	ldr r5, =-544
	ldr r4, [fp, r5]
	ldr r6, =0
	sub r5, r6, #1
	cmp r4, r5
	movgt r4, #1
	movle r4, #0
	bgt .L250
	b .L254
	b .F1
.LTORG
addr_len1:
	.word len
.F1:
.L250:
	ldr r5, =-536
	ldr r4, [fp, r5]
	mov r5, #-160
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, [r5]
	ldr r6, =-540
	ldr r5, [fp, r6]
	ldr r6, =-544
	ldr r7, [fp, r6]
	ldr r6, =-360
	mov r8, #4
	mul r9, r7, r8
	add r7, r6, r9
	add r6, fp, r7
	ldr r7, [r6]
	mul r6, r5, r7
	add r5, r4, r6
	sub r5, r4, r6
	add r5, r4, r6
	ldr r4, =-532
	str r5, [fp, r4]
	ldr r5, =-532
	ldr r4, [fp, r5]
	cmp r4, #10
	movge r4, #1
	movlt r4, #0
	bge .L257
	b .L262
.L251:
	ldr r5, =-536
	ldr r4, [fp, r5]
	ldr r6, =-368
	ldr r5, [fp, r6]
	add r6, r4, r5
	sub r6, r4, r5
	add r6, r4, r5
	sub r4, r6, #1
	ldr r5, =-536
	str r4, [fp, r5]
	ldr r5, =-548
	ldr r4, [fp, r5]
	sub r5, r4, #1
	ldr r4, =-548
	str r5, [fp, r4]
	b .L242
.L254:
	b .L251
.L257:
	ldr r5, =-532
	ldr r4, [fp, r5]
	ldr r6, =-536
	ldr r5, [fp, r6]
	mov r6, #-160
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	add r6, fp, r5
	str r4, [r6]
	ldr r4, =-536
	ldr r5, [fp, r4]
	sub r4, r5, #1
	mov r5, #-160
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, [r5]
	ldr r6, =-532
	ldr r5, [fp, r6]
	ldr r7, =10
	sdiv r6, r5, r7
	add r5, r4, r6
	sub r5, r4, r6
	add r5, r4, r6
	ldr r6, =-536
	ldr r4, [fp, r6]
	sub r6, r4, #1
	mov r4, #-160
	mov r7, #4
	mul r8, r6, r7
	add r6, r4, r8
	add r4, fp, r6
	str r5, [r4]
	b .L259
.L258:
	ldr r5, =-532
	ldr r4, [fp, r5]
	ldr r6, =-536
	ldr r5, [fp, r6]
	mov r6, #-160
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	add r6, fp, r5
	str r4, [r6]
	b .L259
.L259:
	ldr r5, =-544
	ldr r4, [fp, r5]
	sub r5, r4, #1
	ldr r4, =-544
	str r5, [fp, r4]
	ldr r5, =-536
	ldr r4, [fp, r5]
	sub r5, r4, #1
	ldr r4, =-536
	str r5, [fp, r4]
	b .L249
.L262:
	b .L258
.L264:
	mov r4, #0
	mov r5, #-160
	mov r7, #4
	mul r6, r4, r7
	add r4, r5, r6
	add r5, fp, r4
	ldr r4, [r5]
	mov r0, r4
	bl putint
	b .L265
.L265:
	ldr r4, =1
	ldr r5, =-548
	str r4, [fp, r5]
	b .L271
.L269:
	b .L265
.L271:
	ldr r5, =-548
	ldr r4, [fp, r5]
	ldr r6, =-368
	ldr r5, [fp, r6]
	ldr r7, =-364
	ldr r6, [fp, r7]
	add r7, r5, r6
	sub r7, r5, r6
	add r7, r5, r6
	sub r5, r7, #1
	cmp r4, r5
	movle r4, #1
	movgt r4, #0
	ble .L272
	b .L276
.L272:
	ldr r5, =-548
	ldr r4, [fp, r5]
	mov r5, #-160
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, [r5]
	mov r0, r4
	bl putint
	ldr r5, =-548
	ldr r4, [fp, r5]
	add r5, r4, #1
	sub r5, r4, #1
	add r5, r4, #1
	ldr r4, =-548
	str r5, [fp, r4]
	b .L271
.L273:
	mov r0, #0
	ldr r1, =548
	add sp, sp, r1
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr
.L276:
	b .L273

addr_len2:
	.word len
