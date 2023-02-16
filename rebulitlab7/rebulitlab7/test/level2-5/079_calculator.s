	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global intt
	.align 4
	.size intt, 32
intt:
	.word 0
	.global chat
	.align 4
	.size chat, 32
chat:
	.word 0
	.global i
	.align 4
	.size i, 32
i:
	.word 0
	.global ii
	.align 4
	.size ii, 32
ii:
	.word 1
	.global c
	.align 4
	.size c, 32
c:
	.word 0
	.section .rodata
	.comm ints, 320000, 4
	.comm chas, 320000, 4
	.comm get, 320000, 4
	.comm get2, 320000, 4
	.text
	@ 0
	.global isdigit
	.type isdigit , %function
isdigit:
	push {r4, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L390:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	cmp r4, #48
	movge r4, #1
	movlt r4, #0
	bge .L394
	b .L397
.L392:
	mov r0, #1
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr
	b .L393
.L393:
	mov r0, #0
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr
.L394:
	ldr r4, [fp, #-4]
	cmp r4, #57
	movle r4, #1
	movgt r4, #0
	ble .L392
	b .L400
.L397:
	b .L393
.L400:
	b .L393

	.global power
	.type power , %function
power:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #12
.L401:
	str r0, [fp, #-12]
	str r1, [fp, #-8]
	ldr r4, =1
	str r4, [fp, #-4]
	b .L405
.L405:
	ldr r4, [fp, #-8]
	cmp r4, #0
	bne .L406
	b .L410
.L406:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-12]
	mul r6, r4, r5
	str r6, [fp, #-4]
	ldr r4, [fp, #-8]
	sub r5, r4, #1
	str r5, [fp, #-8]
	b .L405
.L407:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #12
	pop {r4, r5, r6, fp, lr}
	bx lr
.L410:
	b .L407

	.global getstr
	.type getstr , %function
getstr:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #12
.L411:
	str r0, [fp, #-12]
	bl getch
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L415
.L415:
	ldr r4, [fp, #-8]
	cmp r4, #13
	bne .L418
	b .L421
.L416:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-12]
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
	bl getch
	mov r4, r0
	str r4, [fp, #-8]
	b .L415
.L417:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #12
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L418:
	ldr r4, [fp, #-8]
	cmp r4, #10
	bne .L416
	b .L424
.L421:
	b .L417
.L424:
	b .L417

	.global intpush
	.type intpush , %function
intpush:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L426:
	str r0, [fp, #-4]
	ldr r5, addr_intt0
	ldr r4, [r5]
	add r5, r4, #1
	sub r5, r4, #1
	add r5, r4, #1
	ldr r4, addr_intt0
	str r5, [r4]
	ldr r4, [fp, #-4]
	ldr r6, addr_intt0
	ldr r5, [r6]
	ldr r6, addr_ints0
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	mov r6, r5
	str r4, [r6]
	add sp, sp, #4
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

	.global chapush
	.type chapush , %function
chapush:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L428:
	str r0, [fp, #-4]
	ldr r5, addr_chat0
	ldr r4, [r5]
	add r5, r4, #1
	sub r5, r4, #1
	add r5, r4, #1
	ldr r4, addr_chat0
	str r5, [r4]
	ldr r4, [fp, #-4]
	ldr r6, addr_chat0
	ldr r5, [r6]
	ldr r6, addr_chas0
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	mov r6, r5
	str r4, [r6]
	add sp, sp, #4
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

	.global intpop
	.type intpop , %function
intpop:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #0
.L430:
	ldr r5, addr_intt0
	ldr r4, [r5]
	sub r5, r4, #1
	ldr r4, addr_intt0
	str r5, [r4]
	ldr r5, addr_intt0
	ldr r4, [r5]
	add r5, r4, #1
	sub r5, r4, #1
	add r5, r4, #1
	ldr r4, addr_ints0
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	mov r0, r5
	add sp, sp, #0
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

	.global chapop
	.type chapop , %function
chapop:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #0
.L432:
	ldr r5, addr_chat0
	ldr r4, [r5]
	sub r5, r4, #1
	ldr r4, addr_chat0
	str r5, [r4]
	ldr r5, addr_chat0
	ldr r4, [r5]
	add r5, r4, #1
	sub r5, r4, #1
	add r5, r4, #1
	ldr r4, addr_chas0
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	mov r0, r5
	add sp, sp, #0
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

	.global intadd
	.type intadd , %function
intadd:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L434:
	str r0, [fp, #-4]
	ldr r4, addr_intt0
	ldr r5, [r4]
	ldr r4, addr_ints0
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r6, =10
	mul r4, r5, r6
	ldr r6, addr_intt0
	ldr r5, [r6]
	ldr r6, addr_ints0
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	mov r6, r5
	str r4, [r6]
	ldr r5, addr_intt0
	ldr r4, [r5]
	ldr r5, addr_ints0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	ldr r5, [fp, #-4]
	add r6, r4, r5
	sub r6, r4, r5
	add r6, r4, r5
	ldr r5, addr_intt0
	ldr r4, [r5]
	ldr r5, addr_ints0
	mov r7, #4
	mul r8, r4, r7
	add r4, r5, r8
	mov r5, r4
	str r6, [r5]
	add sp, sp, #4
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

	.global find
	.type find , %function
find:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #0
.L438:
	bl chapop
	mov r4, r0
	ldr r5, addr_c0
	str r4, [r5]
	ldr r5, addr_ii0
	ldr r4, [r5]
	ldr r5, addr_get20
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, =32
	str r4, [r5]
	ldr r5, addr_c0
	ldr r4, [r5]
	ldr r5, addr_ii0
	ldr r6, [r5]
	add r5, r6, #1
	sub r5, r6, #1
	add r5, r6, #1
	ldr r6, addr_get20
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	mov r6, r5
	str r4, [r6]
	ldr r5, addr_ii0
	ldr r4, [r5]
	add r5, r4, #2
	sub r5, r4, #2
	add r5, r4, #2
	ldr r4, addr_ii0
	str r5, [r4]
	ldr r5, addr_chat0
	ldr r4, [r5]
	cmp r4, #0
	beq .L439
	b .L443
.L439:
	mov r0, #0
	add sp, sp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
	b .L440
.L440:
	mov r0, #1
	add sp, sp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L443:
	b .L440

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #20
.L444:
	ldr r5, =0
	ldr r4, addr_intt0
	str r5, [r4]
	ldr r5, =0
	ldr r4, addr_chat0
	str r5, [r4]
	mov r4, #0
	ldr r5, addr_get0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	mov r0, r5
	bl getstr
	mov r4, r0
	str r4, [fp, #-20]
	b .L446
.L446:
	ldr r5, addr_i0
	ldr r4, [r5]
	ldr r5, [fp, #-20]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L447
	b .L451
.L447:
	ldr r5, addr_i0
	ldr r4, [r5]
	ldr r5, addr_get0
	mov r7, #4
	mul r6, r4, r7
	add r4, r5, r6
	mov r5, r4
	ldr r4, [r5]
	mov r0, r4
	bl isdigit
	mov r4, r0
	cmp r4, #1
	beq .L452
	b .L458
.L448:
	b .L674
.L451:
	b .L448
.L452:
	ldr r5, addr_i0
	ldr r4, [r5]
	ldr r5, addr_get0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	ldr r6, addr_ii0
	ldr r5, [r6]
	ldr r6, addr_get20
	mov r8, #4
	mul r7, r5, r8
	add r5, r6, r7
	mov r6, r5
	str r4, [r6]
	ldr r5, addr_ii0
	ldr r4, [r5]
	add r5, r4, #1
	sub r5, r4, #1
	add r5, r4, #1
	ldr r4, addr_ii0
	str r5, [r4]
	b .L454
.L453:
	ldr r5, addr_i0
	ldr r4, [r5]
	ldr r5, addr_get0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	cmp r4, #40
	beq .L460
	b .L465
.L454:
	ldr r5, addr_i0
	ldr r4, [r5]
	add r5, r4, #1
	sub r5, r4, #1
	add r5, r4, #1
	ldr r4, addr_i0
	str r5, [r4]
	b .L446
.L458:
	b .L453
.L460:
	mov r0, #40
	bl chapush
	b .L461
.L461:
	ldr r4, addr_i0
	ldr r5, [r4]
	ldr r4, addr_get0
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #94
	beq .L466
	b .L471
.L465:
	b .L461
.L466:
	mov r0, #94
	bl chapush
	b .L467
.L467:
	ldr r5, addr_i0
	ldr r4, [r5]
	ldr r5, addr_get0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	cmp r4, #41
	beq .L472
	b .L477
.L471:
	b .L467
.L472:
	bl chapop
	mov r4, r0
	ldr r5, addr_c0
	str r4, [r5]
	b .L478
.L473:
	ldr r5, addr_i0
	ldr r4, [r5]
	ldr r5, addr_get0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	cmp r4, #43
	beq .L484
	b .L489
.L477:
	b .L473
.L478:
	ldr r5, addr_c0
	ldr r4, [r5]
	cmp r4, #40
	bne .L479
	b .L483
.L479:
	ldr r5, addr_ii0
	ldr r4, [r5]
	ldr r5, addr_get20
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, =32
	str r4, [r5]
	ldr r5, addr_c0
	ldr r4, [r5]
	ldr r6, addr_ii0
	ldr r5, [r6]
	add r6, r5, #1
	sub r6, r5, #1
	add r6, r5, #1
	ldr r5, addr_get20
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	mov r5, r6
	str r4, [r5]
	ldr r5, addr_ii0
	ldr r4, [r5]
	add r5, r4, #2
	sub r5, r4, #2
	add r5, r4, #2
	ldr r4, addr_ii0
	str r5, [r4]
	bl chapop
	mov r4, r0
	ldr r5, addr_c0
	str r4, [r5]
	b .L478
	b .F0
.LTORG
addr_ints0:
	.word ints
addr_intt0:
	.word intt
addr_chas0:
	.word chas
addr_chat0:
	.word chat
addr_i0:
	.word i
addr_ii0:
	.word ii
addr_c0:
	.word c
addr_get0:
	.word get
addr_get20:
	.word get2
.F0:
.L480:
	b .L473
.L483:
	b .L480
.L484:
	b .L490
.L485:
	ldr r5, addr_i1
	ldr r4, [r5]
	ldr r5, addr_get1
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	cmp r4, #45
	beq .L528
	b .L533
.L489:
	b .L485
.L490:
	ldr r5, addr_chat1
	ldr r4, [r5]
	ldr r5, addr_chas1
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	cmp r4, #43
	beq .L491
	b .L501
.L491:
	bl find
	mov r4, r0
	cmp r4, #0
	beq .L522
	b .L526
.L492:
	mov r0, #43
	bl chapush
	b .L485
.L493:
	ldr r5, addr_chat1
	ldr r4, [r5]
	ldr r5, addr_chas1
	mov r7, #4
	mul r6, r4, r7
	add r4, r5, r6
	mov r5, r4
	ldr r4, [r5]
	cmp r4, #94
	beq .L491
	b .L521
.L494:
	ldr r5, addr_chat1
	ldr r4, [r5]
	ldr r5, addr_chas1
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	cmp r4, #37
	beq .L491
	b .L517
.L495:
	ldr r5, addr_chat1
	ldr r4, [r5]
	ldr r5, addr_chas1
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	cmp r4, #47
	beq .L491
	b .L513
.L496:
	ldr r5, addr_chat1
	ldr r4, [r5]
	ldr r5, addr_chas1
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	cmp r4, #42
	beq .L491
	b .L509
.L497:
	ldr r5, addr_chat1
	ldr r4, [r5]
	ldr r5, addr_chas1
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	cmp r4, #45
	beq .L491
	b .L505
.L501:
	b .L497
.L505:
	b .L496
.L509:
	b .L495
.L513:
	b .L494
.L517:
	b .L493
.L521:
	b .L492
.L522:
	b .L492
.L523:
	b .L490
.L526:
	b .L523
.L527:
	b .L523
.L528:
	b .L534
.L529:
	ldr r5, addr_i1
	ldr r4, [r5]
	ldr r5, addr_get1
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	cmp r4, #42
	beq .L572
	b .L577
.L533:
	b .L529
.L534:
	ldr r5, addr_chat1
	ldr r4, [r5]
	ldr r5, addr_chas1
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	cmp r4, #43
	beq .L535
	b .L545
.L535:
	bl find
	mov r4, r0
	cmp r4, #0
	beq .L566
	b .L570
.L536:
	mov r0, #45
	bl chapush
	b .L529
.L537:
	ldr r4, addr_chat1
	ldr r5, [r4]
	ldr r4, addr_chas1
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #94
	beq .L535
	b .L565
.L538:
	ldr r5, addr_chat1
	ldr r4, [r5]
	ldr r5, addr_chas1
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	cmp r4, #37
	beq .L535
	b .L561
.L539:
	ldr r5, addr_chat1
	ldr r4, [r5]
	ldr r5, addr_chas1
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	cmp r4, #47
	beq .L535
	b .L557
	b .F1
.LTORG
addr_ints1:
	.word ints
addr_intt1:
	.word intt
addr_chas1:
	.word chas
addr_chat1:
	.word chat
addr_i1:
	.word i
addr_ii1:
	.word ii
addr_c1:
	.word c
addr_get1:
	.word get
addr_get21:
	.word get2
.F1:
.L540:
	ldr r5, addr_chat2
	ldr r4, [r5]
	ldr r5, addr_chas2
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	cmp r4, #42
	beq .L535
	b .L553
.L541:
	ldr r5, addr_chat2
	ldr r4, [r5]
	ldr r5, addr_chas2
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	cmp r4, #45
	beq .L535
	b .L549
.L545:
	b .L541
.L549:
	b .L540
.L553:
	b .L539
.L557:
	b .L538
.L561:
	b .L537
.L565:
	b .L536
.L566:
	b .L536
.L567:
	b .L534
.L570:
	b .L567
.L571:
	b .L567
.L572:
	b .L578
.L573:
	ldr r5, addr_i2
	ldr r4, [r5]
	ldr r5, addr_get2
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	cmp r4, #47
	beq .L606
	b .L611
.L577:
	b .L573
.L578:
	ldr r5, addr_chat2
	ldr r4, [r5]
	ldr r5, addr_chas2
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	cmp r4, #42
	beq .L579
	b .L587
.L579:
	bl find
	mov r4, r0
	cmp r4, #0
	beq .L600
	b .L604
.L580:
	mov r0, #42
	bl chapush
	b .L573
.L581:
	ldr r5, addr_chat2
	ldr r4, [r5]
	ldr r5, addr_chas2
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	cmp r4, #94
	beq .L579
	b .L599
.L582:
	ldr r5, addr_chat2
	ldr r4, [r5]
	ldr r5, addr_chas2
	mov r7, #4
	mul r6, r4, r7
	add r4, r5, r6
	mov r5, r4
	ldr r4, [r5]
	cmp r4, #37
	beq .L579
	b .L595
.L583:
	ldr r5, addr_chat2
	ldr r4, [r5]
	ldr r5, addr_chas2
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	cmp r4, #47
	beq .L579
	b .L591
.L587:
	b .L583
.L591:
	b .L582
.L595:
	b .L581
.L599:
	b .L580
.L600:
	b .L580
.L601:
	b .L578
.L604:
	b .L601
.L605:
	b .L601
.L606:
	b .L612
.L607:
	ldr r5, addr_i2
	ldr r4, [r5]
	ldr r5, addr_get2
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	cmp r4, #37
	beq .L640
	b .L645
.L611:
	b .L607
.L612:
	ldr r5, addr_chat2
	ldr r4, [r5]
	ldr r5, addr_chas2
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	cmp r4, #42
	beq .L613
	b .L621
.L613:
	bl find
	mov r4, r0
	cmp r4, #0
	beq .L634
	b .L638
.L614:
	mov r0, #47
	bl chapush
	b .L607
.L615:
	ldr r4, addr_chat2
	ldr r5, [r4]
	ldr r4, addr_chas2
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #94
	beq .L613
	b .L633
.L616:
	ldr r5, addr_chat2
	ldr r4, [r5]
	ldr r5, addr_chas2
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	cmp r4, #37
	beq .L613
	b .L629
.L617:
	ldr r4, addr_chat2
	ldr r5, [r4]
	ldr r4, addr_chas2
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #47
	beq .L613
	b .L625
	b .F2
.LTORG
addr_ints2:
	.word ints
addr_intt2:
	.word intt
addr_chas2:
	.word chas
addr_chat2:
	.word chat
addr_i2:
	.word i
addr_ii2:
	.word ii
addr_c2:
	.word c
addr_get2:
	.word get
addr_get22:
	.word get2
.F2:
.L621:
	b .L617
.L625:
	b .L616
.L629:
	b .L615
.L633:
	b .L614
.L634:
	b .L614
.L635:
	b .L612
.L638:
	b .L635
.L639:
	b .L635
.L640:
	b .L646
.L641:
	ldr r4, addr_ii3
	ldr r5, [r4]
	ldr r4, addr_get23
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, =32
	str r5, [r4]
	ldr r5, addr_ii3
	ldr r4, [r5]
	add r5, r4, #1
	sub r5, r4, #1
	add r5, r4, #1
	ldr r4, addr_ii3
	str r5, [r4]
	b .L454
.L645:
	b .L641
.L646:
	ldr r5, addr_chat3
	ldr r4, [r5]
	ldr r5, addr_chas3
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	cmp r4, #42
	beq .L647
	b .L655
.L647:
	bl find
	mov r4, r0
	cmp r4, #0
	beq .L668
	b .L672
.L648:
	mov r0, #37
	bl chapush
	b .L641
.L649:
	ldr r5, addr_chat3
	ldr r4, [r5]
	ldr r5, addr_chas3
	mov r7, #4
	mul r6, r4, r7
	add r4, r5, r6
	mov r5, r4
	ldr r4, [r5]
	cmp r4, #94
	beq .L647
	b .L667
.L650:
	ldr r5, addr_chat3
	ldr r4, [r5]
	ldr r5, addr_chas3
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	cmp r4, #37
	beq .L647
	b .L663
.L651:
	ldr r5, addr_chat3
	ldr r4, [r5]
	ldr r5, addr_chas3
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	cmp r4, #47
	beq .L647
	b .L659
.L655:
	b .L651
.L659:
	b .L650
.L663:
	b .L649
.L667:
	b .L648
.L668:
	b .L648
.L669:
	b .L646
.L672:
	b .L669
.L673:
	b .L669
.L674:
	ldr r4, addr_chat3
	ldr r5, [r4]
	cmp r5, #0
	movgt r4, #1
	movle r4, #0
	bgt .L675
	b .L679
.L675:
	bl chapop
	mov r4, r0
	str r4, [fp, #-16]
	ldr r5, addr_ii3
	ldr r4, [r5]
	ldr r5, addr_get23
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, =32
	str r4, [r5]
	ldr r4, [fp, #-16]
	ldr r6, addr_ii3
	ldr r5, [r6]
	add r6, r5, #1
	sub r6, r5, #1
	add r6, r5, #1
	ldr r5, addr_get23
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	mov r5, r6
	str r4, [r5]
	ldr r5, addr_ii3
	ldr r4, [r5]
	add r5, r4, #2
	sub r5, r4, #2
	add r5, r4, #2
	ldr r4, addr_ii3
	str r5, [r4]
	b .L674
.L676:
	ldr r5, addr_ii3
	ldr r4, [r5]
	ldr r5, addr_get23
	mov r7, #4
	mul r6, r4, r7
	add r4, r5, r6
	mov r5, r4
	ldr r4, =64
	str r4, [r5]
	ldr r4, =1
	ldr r5, addr_i3
	str r4, [r5]
	b .L681
.L679:
	b .L676
.L681:
	ldr r5, addr_i3
	ldr r4, [r5]
	ldr r5, addr_get23
	mov r7, #4
	mul r6, r4, r7
	add r4, r5, r6
	mov r5, r4
	ldr r4, [r5]
	cmp r4, #64
	bne .L682
	b .L687
.L682:
	ldr r5, addr_i3
	ldr r4, [r5]
	ldr r5, addr_get23
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	cmp r4, #43
	beq .L688
	b .L699
	b .F3
.LTORG
addr_ints3:
	.word ints
addr_intt3:
	.word intt
addr_chas3:
	.word chas
addr_chat3:
	.word chat
addr_i3:
	.word i
addr_ii3:
	.word ii
addr_c3:
	.word c
addr_get3:
	.word get
addr_get23:
	.word get2
.F3:
.L683:
	mov r4, #1
	ldr r5, addr_ints4
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	mov r0, r4
	bl putint
	mov r0, #0
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L687:
	b .L683
.L688:
	bl intpop
	mov r4, r0
	str r4, [fp, #-12]
	bl intpop
	mov r4, r0
	str r4, [fp, #-8]
	ldr r5, addr_i4
	ldr r4, [r5]
	ldr r5, addr_get24
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	cmp r4, #43
	beq .L723
	b .L728
.L689:
	ldr r5, addr_i4
	ldr r4, [r5]
	ldr r5, addr_get24
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	cmp r4, #32
	bne .L759
	b .L764
.L690:
	ldr r5, addr_i4
	ldr r4, [r5]
	add r5, r4, #1
	sub r5, r4, #1
	add r5, r4, #1
	ldr r4, addr_i4
	str r5, [r4]
	b .L681
.L691:
	ldr r5, addr_i4
	ldr r4, [r5]
	ldr r5, addr_get24
	mov r7, #4
	mul r6, r4, r7
	add r4, r5, r6
	mov r5, r4
	ldr r4, [r5]
	cmp r4, #94
	beq .L688
	b .L719
.L692:
	ldr r5, addr_i4
	ldr r4, [r5]
	ldr r5, addr_get24
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	cmp r4, #37
	beq .L688
	b .L715
.L693:
	ldr r5, addr_i4
	ldr r4, [r5]
	ldr r5, addr_get24
	mov r7, #4
	mul r6, r4, r7
	add r4, r5, r6
	mov r5, r4
	ldr r4, [r5]
	cmp r4, #47
	beq .L688
	b .L711
.L694:
	ldr r5, addr_i4
	ldr r4, [r5]
	ldr r5, addr_get24
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	cmp r4, #42
	beq .L688
	b .L707
.L695:
	ldr r5, addr_i4
	ldr r4, [r5]
	ldr r5, addr_get24
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	cmp r4, #45
	beq .L688
	b .L703
.L699:
	b .L695
.L703:
	b .L694
.L707:
	b .L693
.L711:
	b .L692
.L715:
	b .L691
.L719:
	b .L689
.L723:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-8]
	add r6, r4, r5
	sub r6, r4, r5
	add r6, r4, r5
	str r6, [fp, #-4]
	b .L724
.L724:
	ldr r4, addr_i4
	ldr r5, [r4]
	ldr r4, addr_get24
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #45
	beq .L729
	b .L734
.L728:
	b .L724
.L729:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-12]
	sub r6, r4, r5
	str r6, [fp, #-4]
	b .L730
.L730:
	ldr r5, addr_i4
	ldr r4, [r5]
	ldr r5, addr_get24
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	cmp r4, #42
	beq .L735
	b .L740
.L734:
	b .L730
.L735:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-8]
	mul r6, r4, r5
	str r6, [fp, #-4]
	b .L736
.L736:
	ldr r4, addr_i4
	ldr r5, [r4]
	ldr r4, addr_get24
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #47
	beq .L741
	b .L746
	b .F4
.LTORG
addr_ints4:
	.word ints
addr_intt4:
	.word intt
addr_chas4:
	.word chas
addr_chat4:
	.word chat
addr_i4:
	.word i
addr_ii4:
	.word ii
addr_c4:
	.word c
addr_get4:
	.word get
addr_get24:
	.word get2
.F4:
.L740:
	b .L736
.L741:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-12]
	sdiv r6, r4, r5
	str r6, [fp, #-4]
	b .L742
.L742:
	ldr r5, addr_i5
	ldr r4, [r5]
	ldr r5, addr_get25
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	cmp r4, #37
	beq .L747
	b .L752
.L746:
	b .L742
.L747:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-12]
	sdiv r6, r4, r5
	mul r5, r6, r5
	sub r6, r4, r5
	str r6, [fp, #-4]
	b .L748
.L748:
	ldr r5, addr_i5
	ldr r4, [r5]
	ldr r5, addr_get25
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	cmp r4, #94
	beq .L753
	b .L758
.L752:
	b .L748
.L753:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-12]
	mov r0, r4
	mov r1, r5
	bl power
	mov r4, r0
	str r4, [fp, #-4]
	b .L754
.L754:
	ldr r4, [fp, #-4]
	mov r0, r4
	bl intpush
	b .L690
.L758:
	b .L754
.L759:
	ldr r4, addr_i5
	ldr r5, [r4]
	ldr r4, addr_get25
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	sub r4, r5, #48
	mov r0, r4
	bl intpush
	ldr r4, =1
	ldr r5, addr_ii5
	str r4, [r5]
	b .L766
.L760:
	b .L690
.L764:
	b .L760
.L766:
	ldr r5, addr_i5
	ldr r4, [r5]
	ldr r6, addr_ii5
	ldr r5, [r6]
	add r6, r4, r5
	sub r6, r4, r5
	add r6, r4, r5
	ldr r4, addr_get25
	mov r5, #4
	mul r7, r6, r5
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #32
	bne .L767
	b .L772
.L767:
	ldr r4, addr_i5
	ldr r5, [r4]
	ldr r6, addr_ii5
	ldr r4, [r6]
	add r6, r5, r4
	sub r6, r5, r4
	add r6, r5, r4
	ldr r4, addr_get25
	mov r5, #4
	mul r7, r6, r5
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	sub r4, r5, #48
	mov r0, r4
	bl intadd
	ldr r5, addr_ii5
	ldr r4, [r5]
	add r5, r4, #1
	sub r5, r4, #1
	add r5, r4, #1
	ldr r4, addr_ii5
	str r5, [r4]
	b .L766
.L768:
	ldr r5, addr_i5
	ldr r4, [r5]
	ldr r6, addr_ii5
	ldr r5, [r6]
	add r6, r4, r5
	sub r6, r4, r5
	add r6, r4, r5
	sub r4, r6, #1
	ldr r5, addr_i5
	str r4, [r5]
	b .L760
.L772:
	b .L768

addr_ints5:
	.word ints
addr_intt5:
	.word intt
addr_chas5:
	.word chas
addr_chat5:
	.word chat
addr_i5:
	.word i
addr_ii5:
	.word ii
addr_c5:
	.word c
addr_get5:
	.word get
addr_get25:
	.word get2
