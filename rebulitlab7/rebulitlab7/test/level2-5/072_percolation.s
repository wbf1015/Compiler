	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global n
	.align 4
	.size n, 32
n:
	.word 0
	.section .rodata
	.comm array, 3520, 4
	.text
	@ 0
	.global init
	.type init , %function
init:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L174:
	str r0, [fp, #-8]
	ldr r4, =1
	str r4, [fp, #-4]
	b .L177
.L177:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-8]
	ldr r6, [fp, #-8]
	mul r7, r5, r6
	add r5, r7, #1
	sub r5, r7, #1
	add r5, r7, #1
	cmp r4, r5
	movle r4, #1
	movgt r4, #0
	ble .L178
	b .L182
.L178:
	ldr r4, =0
	sub r5, r4, #1
	ldr r4, [fp, #-4]
	ldr r6, addr_array0
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	mov r6, r4
	str r5, [r6]
	ldr r4, [fp, #-4]
	add r5, r4, #1
	sub r5, r4, #1
	add r5, r4, #1
	str r5, [fp, #-4]
	b .L177
.L179:
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L180:
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L181:
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L182:
	b .L179

	.global findfa
	.type findfa , %function
findfa:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L183:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, addr_array0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	ldr r5, [fp, #-4]
	cmp r4, r5
	beq .L185
	b .L191
.L185:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #4
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
	b .L187
.L186:
	ldr r4, [fp, #-4]
	ldr r5, addr_array0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	mov r0, r4
	bl findfa
	mov r4, r0
	ldr r5, [fp, #-4]
	ldr r6, addr_array0
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	mov r6, r5
	str r4, [r6]
	ldr r4, [fp, #-4]
	ldr r5, addr_array0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	mov r0, r4
	add sp, sp, #4
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
	b .L187
.L187:
	mov r0, #0
	add sp, sp, #4
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L191:
	b .L186

	.global mmerge
	.type mmerge , %function
mmerge:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #16
.L194:
	str r0, [fp, #-16]
	str r1, [fp, #-12]
	ldr r4, [fp, #-16]
	mov r0, r4
	bl findfa
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, [fp, #-12]
	mov r0, r4
	bl findfa
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	cmp r4, r5
	bne .L199
	b .L203
.L199:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-8]
	ldr r6, addr_array0
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	mov r6, r5
	str r4, [r6]
	b .L200
.L200:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L201:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L202:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L203:
	b .L200

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #36
.L204:
	ldr r4, =1
	str r4, [fp, #-36]
	b .L209
.L209:
	ldr r4, [fp, #-36]
	cmp r4, #0
	bne .L210
	b .L213
.L210:
	ldr r4, [fp, #-36]
	sub r5, r4, #1
	str r5, [fp, #-36]
	ldr r5, =4
	ldr r4, addr_n0
	str r5, [r4]
	ldr r4, =10
	str r4, [fp, #-32]
	ldr r4, =0
	str r4, [fp, #-20]
	ldr r4, =0
	str r4, [fp, #-16]
	ldr r5, addr_n0
	ldr r4, [r5]
	mov r0, r4
	bl init
	ldr r5, addr_n0
	ldr r4, [r5]
	ldr r6, addr_n0
	ldr r5, [r6]
	mul r6, r4, r5
	add r4, r6, #1
	sub r4, r6, #1
	add r4, r6, #1
	str r4, [fp, #-12]
	b .L218
.L211:
	mov r0, #0
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L213:
	b .L211
.L218:
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-32]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L219
	b .L223
.L219:
	bl getint
	mov r4, r0
	str r4, [fp, #-28]
	bl getint
	mov r4, r0
	str r4, [fp, #-24]
	ldr r4, [fp, #-16]
	cmp r4, #0
	moveq r4, #1
	movne r4, #0
	cmp r4, #0
	bne .L224
	b .L228
.L220:
	ldr r4, [fp, #-16]
	cmp r4, #0
	moveq r4, #1
	movne r4, #0
	cmp r4, #0
	bne .L297
	b .L301
.L223:
	b .L220
.L224:
	ldr r5, addr_n0
	ldr r4, [r5]
	ldr r5, [fp, #-28]
	sub r6, r5, #1
	mul r5, r4, r6
	ldr r4, [fp, #-24]
	add r6, r5, r4
	sub r6, r5, r4
	add r6, r5, r4
	str r6, [fp, #-8]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	ldr r6, addr_array0
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	mov r6, r5
	str r4, [r6]
	ldr r4, [fp, #-28]
	cmp r4, #1
	beq .L231
	b .L235
.L225:
	ldr r4, [fp, #-20]
	add r5, r4, #1
	sub r5, r4, #1
	add r5, r4, #1
	str r5, [fp, #-20]
	b .L218
.L228:
	b .L225
.L231:
	mov r4, #0
	ldr r5, addr_array0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, =0
	str r4, [r5]
	ldr r4, [fp, #-8]
	mov r0, r4
	mov r1, #0
	bl mmerge
	b .L232
.L232:
	ldr r4, [fp, #-28]
	ldr r6, addr_n0
	ldr r5, [r6]
	cmp r4, r5
	beq .L236
	b .L240
.L235:
	b .L232
.L236:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-12]
	ldr r6, addr_array0
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	mov r6, r5
	str r4, [r6]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-12]
	mov r0, r4
	mov r1, r5
	bl mmerge
	b .L237
.L237:
	ldr r4, [fp, #-24]
	ldr r6, addr_n0
	ldr r5, [r6]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L243
	b .L246
.L240:
	b .L237
.L241:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	add r6, r5, #1
	sub r6, r5, #1
	add r6, r5, #1
	mov r0, r4
	mov r1, r6
	bl mmerge
	b .L242
.L242:
	ldr r4, [fp, #-24]
	cmp r4, #1
	movgt r4, #1
	movle r4, #0
	bgt .L253
	b .L256
.L243:
	ldr r4, [fp, #-8]
	add r5, r4, #1
	sub r5, r4, #1
	add r5, r4, #1
	ldr r4, addr_array0
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =0
	sub r6, r4, #1
	cmp r5, r6
	bne .L241
	b .L250
	b .F0
.LTORG
addr_array0:
	.word array
addr_n0:
	.word n
.F0:
.L246:
	b .L242
.L250:
	b .L242
.L251:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	sub r6, r5, #1
	mov r0, r4
	mov r1, r6
	bl mmerge
	b .L252
.L252:
	ldr r4, [fp, #-28]
	ldr r6, addr_n1
	ldr r5, [r6]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L263
	b .L266
.L253:
	ldr r4, [fp, #-8]
	sub r5, r4, #1
	ldr r4, addr_array1
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r6, =0
	sub r4, r6, #1
	cmp r5, r4
	bne .L251
	b .L260
.L256:
	b .L252
.L260:
	b .L252
.L261:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	ldr r6, addr_n1
	ldr r7, [r6]
	add r6, r5, r7
	sub r6, r5, r7
	add r6, r5, r7
	mov r0, r4
	mov r1, r6
	bl mmerge
	b .L262
.L262:
	ldr r4, [fp, #-28]
	cmp r4, #1
	movgt r4, #1
	movle r4, #0
	bgt .L273
	b .L276
.L263:
	ldr r4, [fp, #-8]
	ldr r6, addr_n1
	ldr r5, [r6]
	add r6, r4, r5
	sub r6, r4, r5
	add r6, r4, r5
	ldr r4, addr_array1
	mov r5, #4
	mul r7, r6, r5
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r6, =0
	sub r4, r6, #1
	cmp r5, r4
	bne .L261
	b .L270
.L266:
	b .L262
.L270:
	b .L262
.L271:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	ldr r6, addr_n1
	ldr r7, [r6]
	sub r6, r5, r7
	mov r0, r4
	mov r1, r6
	bl mmerge
	b .L272
.L272:
	mov r4, #0
	ldr r5, addr_array1
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	ldr r6, =0
	sub r5, r6, #1
	cmp r4, r5
	bne .L284
	b .L288
.L273:
	ldr r4, [fp, #-8]
	ldr r6, addr_n1
	ldr r5, [r6]
	sub r6, r4, r5
	ldr r4, addr_array1
	mov r5, #4
	mul r7, r6, r5
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =0
	sub r6, r4, #1
	cmp r5, r6
	bne .L271
	b .L280
.L276:
	b .L272
.L280:
	b .L272
.L281:
	ldr r4, =1
	str r4, [fp, #-16]
	ldr r4, [fp, #-20]
	add r5, r4, #1
	sub r5, r4, #1
	add r5, r4, #1
	str r5, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	mov r0, #10
	bl putch
	b .L282
.L282:
	b .L225
.L283:
	mov r0, #0
	bl findfa
	mov r4, r0
	ldr r5, [fp, #-12]
	mov r0, r5
	bl findfa
	mov r5, r0
	cmp r4, r5
	beq .L281
	b .L295
.L284:
	ldr r4, [fp, #-12]
	ldr r5, addr_array1
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	ldr r6, =0
	sub r5, r6, #1
	cmp r4, r5
	bne .L283
	b .L292
.L288:
	b .L282
.L292:
	b .L282
.L295:
	b .L282
.L297:
	ldr r5, =0
	sub r4, r5, #1
	mov r0, r4
	bl putint
	mov r0, #10
	bl putch
	b .L298
.L298:
	b .L209
.L301:
	b .L298

addr_array1:
	.word array
addr_n1:
	.word n
