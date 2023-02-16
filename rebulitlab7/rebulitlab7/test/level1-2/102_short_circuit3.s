	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global a
	.align 4
	.size a, 32
a:
	.word 0
	.global b
	.align 4
	.size b, 32
b:
	.word 0
	.global d
	.align 4
	.size d, 32
d:
	.word 0
	.section .rodata
	.text
	@ 0
	.global set_a
	.type set_a , %function
set_a:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L121:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, addr_a0
	str r4, [r5]
	ldr r5, addr_a0
	ldr r4, [r5]
	mov r0, r4
	add sp, sp, #4
	pop {r4, r5, fp, lr}
	bx lr

	.global set_b
	.type set_b , %function
set_b:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L123:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, addr_b0
	str r4, [r5]
	ldr r5, addr_b0
	ldr r4, [r5]
	mov r0, r4
	add sp, sp, #4
	pop {r4, r5, fp, lr}
	bx lr

	.global set_d
	.type set_d , %function
set_d:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L125:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, addr_d0
	str r4, [r5]
	ldr r5, addr_d0
	ldr r4, [r5]
	mov r0, r4
	add sp, sp, #4
	pop {r4, r5, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #24
.L127:
	ldr r5, =2
	ldr r4, addr_a0
	str r5, [r4]
	ldr r5, =3
	ldr r4, addr_b0
	str r5, [r4]
	mov r0, #0
	bl set_a
	mov r4, r0
	cmp r4, #0
	bne .L130
	b .L132
.L128:
	b .L129
.L129:
	ldr r5, addr_a0
	ldr r4, [r5]
	mov r0, r4
	bl putint
	mov r0, #32
	bl putch
	ldr r5, addr_b0
	ldr r4, [r5]
	mov r0, r4
	bl putint
	mov r0, #32
	bl putch
	ldr r4, =2
	ldr r5, addr_a0
	str r4, [r5]
	ldr r4, =3
	ldr r5, addr_b0
	str r4, [r5]
	mov r0, #0
	bl set_a
	mov r4, r0
	cmp r4, #0
	bne .L139
	b .L141
.L130:
	mov r0, #1
	bl set_b
	mov r4, r0
	cmp r4, #0
	bne .L128
	b .L135
.L132:
	b .L129
.L135:
	b .L129
.L137:
	b .L138
.L138:
	ldr r5, addr_a0
	ldr r4, [r5]
	mov r0, r4
	bl putint
	mov r0, #32
	bl putch
	ldr r5, addr_b0
	ldr r4, [r5]
	mov r0, r4
	bl putint
	mov r0, #10
	bl putch
	ldr r4, =1
	str r4, [fp, #-24]
	ldr r4, =2
	ldr r5, addr_d0
	str r4, [r5]
	ldr r4, [fp, #-24]
	cmp r4, #1
	movge r4, #1
	movlt r4, #0
	bge .L149
	b .L152
.L139:
	mov r0, #1
	bl set_b
	mov r4, r0
	cmp r4, #0
	bne .L137
	b .L144
.L141:
	b .L138
.L144:
	b .L138
.L147:
	b .L148
.L148:
	ldr r5, addr_d0
	ldr r4, [r5]
	mov r0, r4
	bl putint
	mov r0, #32
	bl putch
	ldr r4, [fp, #-24]
	cmp r4, #1
	movle r4, #1
	movgt r4, #0
	ble .L156
	b .L161
.L149:
	mov r0, #3
	bl set_d
	mov r4, r0
	cmp r4, #0
	bne .L147
	b .L154
.L152:
	b .L148
.L154:
	b .L148
.L156:
	b .L157
.L157:
	ldr r5, addr_d0
	ldr r4, [r5]
	mov r0, r4
	bl putint
	mov r0, #10
	bl putch
	ldr r5, =2
	add r4, r5, #1
	sub r4, r5, #1
	add r4, r5, #1
	ldr r6, =3
	sub r5, r6, r4
	ldr r4, =16
	cmp r4, r5
	movge r4, #1
	movlt r4, #0
	bge .L165
	b .L169
.L158:
	mov r0, #4
	bl set_d
	mov r4, r0
	cmp r4, #0
	bne .L156
	b .L163
.L161:
	b .L158
.L163:
	b .L157
.L165:
	mov r0, #65
	bl putch
	b .L166
.L166:
	ldr r5, =25
	sub r4, r5, #7
	ldr r5, =6
	ldr r6, =3
	mul r7, r5, r6
	ldr r6, =36
	sub r5, r6, r7
	cmp r4, r5
	bne .L170
	b .L174
.L169:
	b .L166
.L170:
	mov r0, #66
	bl putch
	b .L171
.L171:
	ldr r4, =1
	cmp r4, #8
	movlt r4, #1
	movge r4, #0
	ldr r5, =7
	ldr r6, =2
	sdiv r7, r5, r6
	mul r6, r7, r6
	sub r7, r5, r6
	mov r5, r4
	cmp r5, r7
	bne .L175
	b .L183
.L174:
	b .L171
.L175:
	mov r0, #67
	bl putch
	b .L176
.L176:
	ldr r4, =3
	cmp r4, #4
	movgt r4, #1
	movle r4, #0
	mov r5, r4
	cmp r5, #0
	beq .L184
	b .L192
	b .F0
.LTORG
addr_a0:
	.word a
addr_b0:
	.word b
addr_d0:
	.word d
.F0:
.L178:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L179:
	b .L178
.L183:
	b .L176
.L184:
	mov r0, #68
	bl putch
	b .L185
.L185:
	ldr r4, =102
	cmp r4, #63
	movle r4, #1
	movgt r4, #0
	mov r5, r4
	ldr r4, =1
	cmp r4, r5
	beq .L193
	b .L201
.L187:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L188:
	b .L187
.L192:
	b .L185
.L193:
	mov r0, #69
	bl putch
	b .L194
.L194:
	ldr r5, =5
	sub r4, r5, #6
	ldr r5, =0
	cmp r5, #0
	moveq r5, #1
	movne r5, #0
	mov r6, r5
	ldr r7, =0
	sub r5, r7, r6
	cmp r4, r5
	beq .L202
	b .L208
.L196:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L197:
	b .L196
.L201:
	b .L194
.L202:
	mov r0, #70
	bl putch
	b .L203
.L203:
	mov r0, #10
	bl putch
	ldr r4, =0
	str r4, [fp, #-20]
	ldr r4, =1
	str r4, [fp, #-16]
	ldr r4, =2
	str r4, [fp, #-12]
	ldr r4, =3
	str r4, [fp, #-8]
	ldr r4, =4
	str r4, [fp, #-4]
	b .L214
.L208:
	b .L203
.L214:
	ldr r4, [fp, #-20]
	cmp r4, #0
	bne .L217
	b .L219
.L215:
	mov r0, #32
	bl putch
	b .L214
.L216:
	ldr r4, [fp, #-20]
	cmp r4, #0
	bne .L224
	b .L228
.L217:
	ldr r4, [fp, #-16]
	cmp r4, #0
	bne .L215
	b .L222
.L219:
	b .L216
.L222:
	b .L216
.L224:
	mov r0, #67
	bl putch
	b .L225
.L225:
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-16]
	cmp r4, r5
	movge r4, #1
	movlt r4, #0
	bge .L233
	b .L238
.L226:
	ldr r4, [fp, #-16]
	cmp r4, #0
	bne .L224
	b .L231
.L228:
	b .L226
.L231:
	b .L225
.L233:
	mov r0, #72
	bl putch
	b .L234
.L234:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-16]
	cmp r4, r5
	movge r4, #1
	movlt r4, #0
	bge .L244
	b .L247
.L235:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-20]
	cmp r4, r5
	movle r4, #1
	movgt r4, #0
	ble .L233
	b .L241
.L238:
	b .L235
.L241:
	b .L234
.L242:
	mov r0, #73
	bl putch
	b .L243
.L243:
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-16]
	cmp r5, #0
	moveq r5, #1
	movne r5, #0
	mov r6, r5
	cmp r4, r6
	beq .L254
	b .L259
.L244:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-8]
	cmp r4, r5
	bne .L242
	b .L250
.L247:
	b .L243
.L250:
	b .L243
.L251:
	mov r0, #74
	bl putch
	b .L252
.L252:
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-16]
	cmp r5, #0
	moveq r5, #1
	movne r5, #0
	mov r6, r5
	cmp r4, r6
	beq .L266
	b .L273
.L253:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-4]
	cmp r4, r5
	movge r4, #1
	movlt r4, #0
	bge .L251
	b .L265
.L254:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L251
	b .L262
.L259:
	b .L253
.L262:
	b .L253
.L265:
	b .L252
.L266:
	mov r0, #75
	bl putch
	b .L267
	b .F1
.LTORG
addr_a1:
	.word a
addr_b1:
	.word b
addr_d1:
	.word d
.F1:
.L267:
	mov r0, #10
	bl putch
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L268:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L274
	b .L277
.L273:
	b .L268
.L274:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-4]
	cmp r4, r5
	movge r4, #1
	movlt r4, #0
	bge .L266
	b .L280
.L277:
	b .L267
.L280:
	b .L267

addr_a2:
	.word a
addr_b2:
	.word b
addr_d2:
	.word d
