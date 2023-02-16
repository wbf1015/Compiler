	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global ptr
	.align 4
	.size ptr, 32
ptr:
	.word 0
	.section .rodata
	.global TAPE_LEN
	.align 4
	.size TAPE_LEN, 32
TAPE_LEN:
	.word 65536
	.global BUFFER_LEN
	.align 4
	.size BUFFER_LEN, 32
BUFFER_LEN:
	.word 32768
	.comm tape, 2097152, 4
	.comm program, 1048576, 4
	.text
	@ 0
	.global read_program
	.type read_program , %function
read_program:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L94:
	ldr r4, =0
	str r4, [fp, #-8]
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	b .L97
.L97:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L98
	b .L102
.L98:
	bl getch
	mov r4, r0
	ldr r5, [fp, #-8]
	ldr r6, addr_program0
	mov r8, #4
	mul r7, r5, r8
	add r5, r6, r7
	mov r6, r5
	str r4, [r6]
	ldr r4, [fp, #-8]
	add r5, r4, #1
	sub r5, r4, #1
	add r5, r4, #1
	str r5, [fp, #-8]
	b .L97
.L99:
	ldr r4, [fp, #-8]
	ldr r5, addr_program0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, =0
	str r4, [r5]
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L100:
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L101:
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L102:
	b .L99

	.global interpret
	.type interpret , %function
interpret:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #16
.L103:
	str r0, [fp, #-16]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L108
.L108:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-4]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	cmp r4, #0
	bne .L109
	b .L114
.L109:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-4]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	str r4, [fp, #-12]
	ldr r4, [fp, #-12]
	cmp r4, #62
	beq .L118
	b .L123
.L110:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L113:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L114:
	b .L110
.L115:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L118:
	ldr r5, addr_ptr0
	ldr r4, [r5]
	add r5, r4, #1
	sub r5, r4, #1
	add r5, r4, #1
	ldr r4, addr_ptr0
	str r5, [r4]
	b .L120
.L119:
	ldr r4, [fp, #-12]
	cmp r4, #60
	beq .L124
	b .L129
.L120:
	ldr r4, [fp, #-4]
	add r5, r4, #1
	sub r5, r4, #1
	add r5, r4, #1
	str r5, [fp, #-4]
	b .L108
.L121:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L122:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L123:
	b .L119
.L124:
	ldr r5, addr_ptr0
	ldr r4, [r5]
	sub r5, r4, #1
	ldr r4, addr_ptr0
	str r5, [r4]
	b .L126
.L125:
	ldr r4, [fp, #-12]
	cmp r4, #43
	beq .L130
	b .L135
.L126:
	b .L120
.L127:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L128:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L129:
	b .L125
.L130:
	ldr r4, addr_ptr0
	ldr r5, [r4]
	ldr r4, addr_tape0
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	add r4, r5, #1
	sub r4, r5, #1
	add r4, r5, #1
	ldr r6, addr_ptr0
	ldr r5, [r6]
	ldr r6, addr_tape0
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	mov r6, r5
	str r4, [r6]
	b .L132
.L131:
	ldr r4, [fp, #-12]
	cmp r4, #45
	beq .L137
	b .L142
.L132:
	b .L126
.L133:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L134:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L135:
	b .L131
.L137:
	ldr r5, addr_ptr0
	ldr r4, [r5]
	ldr r5, addr_tape0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	sub r5, r4, #1
	ldr r4, addr_ptr0
	ldr r6, [r4]
	ldr r4, addr_tape0
	mov r7, #4
	mul r8, r6, r7
	add r6, r4, r8
	mov r4, r6
	str r5, [r4]
	b .L139
.L138:
	ldr r4, [fp, #-12]
	cmp r4, #46
	beq .L144
	b .L149
.L139:
	b .L132
.L140:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L141:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L142:
	b .L138
.L144:
	ldr r5, addr_ptr0
	ldr r4, [r5]
	ldr r5, addr_tape0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	mov r0, r4
	bl putch
	b .L146
.L145:
	ldr r4, [fp, #-12]
	cmp r4, #44
	beq .L151
	b .L156
.L146:
	b .L139
.L147:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L148:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L149:
	b .L145
.L151:
	bl getch
	mov r4, r0
	ldr r6, addr_ptr0
	ldr r5, [r6]
	ldr r6, addr_tape0
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	mov r6, r5
	str r4, [r6]
	b .L153
.L152:
	ldr r4, [fp, #-12]
	cmp r4, #93
	beq .L159
	b .L162
	b .F0
.LTORG
addr_TAPE_LEN0:
	.word TAPE_LEN
addr_BUFFER_LEN0:
	.word BUFFER_LEN
addr_tape0:
	.word tape
addr_program0:
	.word program
addr_ptr0:
	.word ptr
.F0:
.L153:
	b .L146
.L154:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L155:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L156:
	b .L152
.L157:
	ldr r4, =1
	str r4, [fp, #-8]
	b .L167
.L158:
	b .L153
.L159:
	ldr r5, addr_ptr1
	ldr r4, [r5]
	ldr r5, addr_tape1
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	cmp r4, #0
	bne .L157
	b .L165
.L160:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L161:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L162:
	b .L158
.L164:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L165:
	b .L158
.L166:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L167:
	ldr r4, [fp, #-8]
	cmp r4, #0
	movgt r4, #1
	movle r4, #0
	bgt .L168
	b .L172
.L168:
	ldr r4, [fp, #-4]
	sub r5, r4, #1
	str r5, [fp, #-4]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-4]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	str r4, [fp, #-12]
	ldr r4, [fp, #-12]
	cmp r4, #91
	beq .L175
	b .L180
.L169:
	b .L158
.L170:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L171:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L172:
	b .L169
.L175:
	ldr r4, [fp, #-8]
	sub r5, r4, #1
	str r5, [fp, #-8]
	b .L177
.L176:
	ldr r4, [fp, #-12]
	cmp r4, #93
	beq .L181
	b .L185
.L177:
	b .L167
.L178:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L179:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L180:
	b .L176
.L181:
	ldr r4, [fp, #-8]
	add r5, r4, #1
	sub r5, r4, #1
	add r5, r4, #1
	str r5, [fp, #-8]
	b .L182
.L182:
	b .L177
.L183:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L184:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L185:
	b .L182

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #0
.L186:
	bl read_program
	mov r4, #0
	ldr r5, addr_program1
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	mov r0, r5
	bl interpret
	mov r0, #0
	add sp, sp, #0
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

addr_TAPE_LEN1:
	.word TAPE_LEN
addr_BUFFER_LEN1:
	.word BUFFER_LEN
addr_tape1:
	.word tape
addr_program1:
	.word program
addr_ptr1:
	.word ptr
