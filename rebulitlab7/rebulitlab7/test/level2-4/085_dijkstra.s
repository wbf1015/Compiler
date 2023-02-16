	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global n
	.align 4
	.size n, 32
n:
	.word 0
	.global m
	.align 4
	.size m, 32
m:
	.word 0
	.global v1
	.align 4
	.size v1, 32
v1:
	.word 0
	.global v2
	.align 4
	.size v2, 32
v2:
	.word 0
	.global w
	.align 4
	.size w, 32
w:
	.word 0
	.section .rodata
	.global INF
	.align 4
	.size INF, 32
INF:
	.word 65535
	.comm e, 8192, 4
	.comm book, 512, 4
	.comm dis, 512, 4
	.text
	@ 0
	.global Dijkstra
	.type Dijkstra , %function
Dijkstra:
	push {r4, r5, r6, r7, r8, r9, fp, lr}
	mov fp, sp
	sub sp, sp, #24
.L140:
	ldr r4, =1
	str r4, [fp, #-24]
	b .L143
.L143:
	ldr r4, [fp, #-24]
	ldr r5, addr_n0
	ldr r6, [r5]
	cmp r4, r6
	movle r4, #1
	movgt r4, #0
	ble .L144
	b .L148
.L144:
	mov r4, #1
	ldr r5, addr_e0
	mov r6, #64
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [fp, #-24]
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [r4]
	ldr r4, [fp, #-24]
	ldr r6, addr_dis0
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	mov r6, r4
	str r5, [r6]
	ldr r4, [fp, #-24]
	ldr r5, addr_book0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, =0
	str r4, [r5]
	ldr r4, [fp, #-24]
	add r5, r4, #1
	sub r5, r4, #1
	add r5, r4, #1
	str r5, [fp, #-24]
	b .L143
.L145:
	mov r4, #1
	ldr r5, addr_book0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, =1
	str r4, [r5]
	ldr r4, =1
	str r4, [fp, #-24]
	b .L151
.L146:
	add sp, sp, #24
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr
.L147:
	add sp, sp, #24
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr
.L148:
	b .L145
.L151:
	ldr r4, [fp, #-24]
	ldr r6, addr_n0
	ldr r5, [r6]
	sub r6, r5, #1
	cmp r4, r6
	movle r4, #1
	movgt r4, #0
	ble .L152
	b .L156
.L152:
	ldr r5, addr_INF0
	ldr r4, [r5]
	str r4, [fp, #-16]
	ldr r4, =0
	str r4, [fp, #-12]
	ldr r4, =1
	str r4, [fp, #-8]
	b .L160
.L153:
	add sp, sp, #24
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr
.L154:
	add sp, sp, #24
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr
.L155:
	add sp, sp, #24
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr
.L156:
	b .L153
.L160:
	ldr r4, [fp, #-8]
	ldr r6, addr_n0
	ldr r5, [r6]
	cmp r4, r5
	movle r4, #1
	movgt r4, #0
	ble .L161
	b .L165
.L161:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-8]
	ldr r6, addr_dis0
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	mov r6, r5
	ldr r5, [r6]
	cmp r4, r5
	movgt r4, #1
	movle r4, #0
	bgt .L168
	b .L172
.L162:
	ldr r4, [fp, #-12]
	ldr r5, addr_book0
	mov r7, #4
	mul r6, r4, r7
	add r4, r5, r6
	mov r5, r4
	ldr r4, =1
	str r4, [r5]
	ldr r4, =1
	str r4, [fp, #-4]
	b .L179
.L163:
	add sp, sp, #24
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr
.L164:
	add sp, sp, #24
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr
.L165:
	b .L162
.L166:
	ldr r4, [fp, #-8]
	ldr r5, addr_dis0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	str r4, [fp, #-16]
	ldr r4, [fp, #-8]
	str r4, [fp, #-12]
	b .L167
.L167:
	ldr r4, [fp, #-8]
	add r5, r4, #1
	sub r5, r4, #1
	add r5, r4, #1
	str r5, [fp, #-8]
	b .L160
.L168:
	ldr r4, [fp, #-8]
	ldr r5, addr_book0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	cmp r4, #0
	beq .L166
	b .L176
.L170:
	add sp, sp, #24
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr
.L171:
	add sp, sp, #24
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr
.L172:
	b .L167
.L174:
	add sp, sp, #24
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr
.L175:
	add sp, sp, #24
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr
.L176:
	b .L167
.L179:
	ldr r4, [fp, #-4]
	ldr r5, addr_n0
	ldr r6, [r5]
	cmp r4, r6
	movle r4, #1
	movgt r4, #0
	ble .L180
	b .L184
	b .F0
.LTORG
addr_INF0:
	.word INF
addr_e0:
	.word e
addr_book0:
	.word book
addr_dis0:
	.word dis
addr_n0:
	.word n
addr_m0:
	.word m
addr_v10:
	.word v1
addr_v20:
	.word v2
addr_w0:
	.word w
.F0:
.L180:
	ldr r4, [fp, #-12]
	ldr r5, addr_e1
	mov r6, #64
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [fp, #-4]
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [r4]
	ldr r6, addr_INF1
	ldr r4, [r6]
	cmp r5, r4
	movlt r4, #1
	movge r4, #0
	blt .L185
	b .L191
.L181:
	ldr r4, [fp, #-24]
	add r5, r4, #1
	sub r5, r4, #1
	add r5, r4, #1
	str r5, [fp, #-24]
	b .L151
.L182:
	add sp, sp, #24
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr
.L183:
	add sp, sp, #24
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr
.L184:
	b .L181
.L185:
	ldr r4, [fp, #-4]
	ldr r5, addr_dis1
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	ldr r5, [fp, #-12]
	ldr r6, addr_dis1
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	mov r6, r5
	ldr r5, [r6]
	ldr r6, [fp, #-12]
	ldr r7, addr_e1
	mov r8, #64
	mul r9, r6, r8
	add r6, r7, r9
	mov r7, r6
	ldr r6, [fp, #-4]
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	add r6, r5, r7
	sub r6, r5, r7
	add r6, r5, r7
	cmp r4, r6
	movgt r4, #1
	movle r4, #0
	bgt .L192
	b .L200
.L186:
	ldr r4, [fp, #-4]
	add r5, r4, #1
	sub r5, r4, #1
	add r5, r4, #1
	str r5, [fp, #-4]
	b .L179
.L189:
	add sp, sp, #24
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr
.L190:
	add sp, sp, #24
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr
.L191:
	b .L186
.L192:
	ldr r4, [fp, #-12]
	ldr r5, addr_dis1
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	ldr r5, [fp, #-12]
	ldr r6, addr_e1
	mov r7, #64
	mul r8, r5, r7
	add r5, r6, r8
	mov r6, r5
	ldr r5, [fp, #-4]
	mov r8, #4
	mul r7, r5, r8
	add r5, r6, r7
	ldr r6, [r5]
	add r5, r4, r6
	sub r5, r4, r6
	add r5, r4, r6
	ldr r4, [fp, #-4]
	ldr r6, addr_dis1
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	mov r6, r4
	str r5, [r6]
	b .L193
.L193:
	b .L186
.L198:
	add sp, sp, #24
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr
.L199:
	add sp, sp, #24
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr
.L200:
	b .L193

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #16
.L204:
	bl getint
	mov r4, r0
	ldr r5, addr_n1
	str r4, [r5]
	bl getint
	mov r4, r0
	ldr r5, addr_m1
	str r4, [r5]
	ldr r4, =1
	str r4, [fp, #-16]
	b .L206
.L206:
	ldr r4, [fp, #-16]
	ldr r5, addr_n1
	ldr r6, [r5]
	cmp r4, r6
	movle r4, #1
	movgt r4, #0
	ble .L207
	b .L211
.L207:
	ldr r4, =1
	str r4, [fp, #-12]
	b .L213
.L208:
	ldr r4, =1
	str r4, [fp, #-16]
	b .L227
.L211:
	b .L208
.L213:
	ldr r4, [fp, #-12]
	ldr r6, addr_n1
	ldr r5, [r6]
	cmp r4, r5
	movle r4, #1
	movgt r4, #0
	ble .L214
	b .L218
.L214:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	cmp r4, r5
	beq .L219
	b .L224
.L215:
	ldr r4, [fp, #-16]
	add r5, r4, #1
	sub r5, r4, #1
	add r5, r4, #1
	str r5, [fp, #-16]
	b .L206
.L218:
	b .L215
.L219:
	ldr r4, [fp, #-16]
	ldr r5, addr_e1
	mov r6, #64
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [fp, #-12]
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, =0
	str r5, [r4]
	b .L221
.L220:
	ldr r5, addr_INF1
	ldr r4, [r5]
	ldr r5, [fp, #-16]
	ldr r6, addr_e1
	mov r7, #64
	mul r8, r5, r7
	add r5, r6, r8
	mov r6, r5
	ldr r5, [fp, #-12]
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	str r4, [r5]
	b .L221
.L221:
	ldr r4, [fp, #-12]
	add r5, r4, #1
	sub r5, r4, #1
	add r5, r4, #1
	str r5, [fp, #-12]
	b .L213
.L224:
	b .L220
.L227:
	ldr r4, [fp, #-16]
	ldr r6, addr_m1
	ldr r5, [r6]
	cmp r4, r5
	movle r4, #1
	movgt r4, #0
	ble .L228
	b .L232
.L228:
	bl getint
	mov r4, r0
	str r4, [fp, #-8]
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	bl getint
	mov r4, r0
	ldr r5, [fp, #-8]
	ldr r6, addr_e1
	mov r7, #64
	mul r8, r5, r7
	add r5, r6, r8
	mov r6, r5
	ldr r5, [fp, #-4]
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	str r4, [r5]
	ldr r4, [fp, #-16]
	add r5, r4, #1
	sub r5, r4, #1
	add r5, r4, #1
	str r5, [fp, #-16]
	b .L227
.L229:
	bl Dijkstra
	ldr r4, =1
	str r4, [fp, #-16]
	b .L236
.L232:
	b .L229
.L236:
	ldr r4, [fp, #-16]
	ldr r6, addr_n1
	ldr r5, [r6]
	cmp r4, r5
	movle r4, #1
	movgt r4, #0
	ble .L237
	b .L241
.L237:
	ldr r4, [fp, #-16]
	ldr r5, addr_dis1
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	mov r0, r4
	bl putint
	mov r0, #32
	bl putch
	ldr r4, [fp, #-16]
	add r5, r4, #1
	sub r5, r4, #1
	add r5, r4, #1
	str r5, [fp, #-16]
	b .L236
.L238:
	mov r0, #10
	bl putch
	mov r0, #0
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L241:
	b .L238

addr_INF1:
	.word INF
addr_e1:
	.word e
addr_book1:
	.word book
addr_dis1:
	.word dis
addr_n1:
	.word n
addr_m1:
	.word m
addr_v11:
	.word v1
addr_v21:
	.word v2
addr_w1:
	.word w
