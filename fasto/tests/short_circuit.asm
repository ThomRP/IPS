	.text	0x00400000
	la	x3, d.heap
	jal	f.main
	jal	p.stop
# User functions
# Function no_way
f.no_way:
	sw	x1, -4(x2)
	addi	x2, x2, -4
	jal	f.no_way
# was:	jal	f.no_way, 
# 	mv	_no_wayres_1_,x10
# 	mv	x10,_no_wayres_1_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function main
f.main:
	sw	x1, -4(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -8
	li	x18, 0
# was:	li	_and_L_5_, 0
	beq	x0, x18, l.sc_l_7_
# was:	beq	x0, _and_L_5_, l.sc_l_7_
	jal	f.no_way
# was:	jal	f.no_way, 
# 	mv	_and_R_6_,x10
	and	x11, x18, x10
# was:	and	_tmp_4_, _and_L_5_, _and_R_6_
	j	l.end_l_8_
l.sc_l_7_:
	mv	x11, x0
# was:	mv	_tmp_4_, x0
l.end_l_8_:
# 	mv	_let_a_3_,_tmp_4_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x11, x0, l.wBoolF_9_
# was:	bne	_let_a_3_, x0, l.wBoolF_9_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_9_:
	jal	p.putstring
# was:	jal	p.putstring, x10
	li	x18, 1
# was:	li	_or_L_12_, 1
	bne	x0, x18, l.sc_l_14_
# was:	bne	x0, _or_L_12_, l.sc_l_14_
	jal	f.no_way
# was:	jal	f.no_way, 
# 	mv	_or_R_13_,x10
	or	x11, x18, x10
# was:	or	_tmp_11_, _or_L_12_, _or_R_13_
	j	l.end_l_15_
l.sc_l_14_:
	addi	x11, x0, 1
# was:	addi	_tmp_11_, x0, 1
l.end_l_15_:
# 	mv	_let_b_10_,_tmp_11_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x11, x0, l.wBoolF_16_
# was:	bne	_let_b_10_, x0, l.wBoolF_16_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_16_:
	jal	p.putstring
# was:	jal	p.putstring, x10
	li	x10, 1
# was:	li	_mainres_2_, 1
# 	mv	x10,_mainres_2_
	addi	x2, x2, 8
	lw	x18, -8(x2)
	lw	x1, -4(x2)
	jr	x1
# Library functions in Fasto namespace
f.ord:
	mv	x10, x10
	jr	x1
f.chr:
	andi	x10, x10, 255
	jr	x1
# Internal procedures (for syscalls, etc.)
p.putint:
	li	x17, 1
	ecall
	li	x17, 4
	la	x10, m.space
	ecall
	jr	x1
p.getint:
	li	x17, 5
	ecall
	jr	x1
p.putchar:
	li	x17, 11
	ecall
	li	x17, 4
	la	x10, m.space
	ecall
	jr	x1
p.getchar:
	li	x17, 12
	ecall
	jr	x1
p.putstring:
	lw	x7, 0(x10)
	addi	x6, x10, 4
	add	x7, x6, x7
	li	x17, 11
l.ps_begin:
	bge	x6, x7, l.ps_done
	lbu	x10, 0(x6)
	ecall
	addi	x6, x6, 1
	j	l.ps_begin
l.ps_done:
	jr	x1
p.stop:
	li	x17, 93
	li	x10, 0
	ecall
p.RuntimeError:
	mv	x6, x10
	li	x17, 4
	la	x10, m.RunErr
	ecall
	li	x17, 1
	mv	x10, x6
	ecall
	li	x17, 4
	la	x10, m.colon_space
	ecall
	mv	x10, x11
	ecall
	la	x10, m.nl
	ecall
	jal	p.stop
	.data	
# Fixed strings for runtime I/O
m.RunErr:
	.asciz	"Runtime error at line "
m.colon_space:
	.asciz	": "
m.nl:
	.asciz	"\n"
m.space:
	.asciz	" "
# Message strings for specific errors
m.BadSize:
	.asciz	"negative array size"
m.BadIndex:
	.asciz	"array index out of bounds"
m.DivZero:
	.asciz	"division by zero"
# String literals (including lengths) from program
	.align	2
s.true:
	.word	4
	.ascii	"true"
	.align	2
s.false:
	.word	5
	.ascii	"false"
	.align	2
# Space for Fasto heap
d.heap:
	.space	100000