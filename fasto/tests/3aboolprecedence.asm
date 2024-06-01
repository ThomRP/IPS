	.text	0x00400000
	la	x3, d.heap
	jal	f.main
	jal	p.stop
# User functions
# Function main
f.main:
	sw	x1, -4(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -8
	jal	p.getint
# was:	jal	p.getint, 
# 	mv	_let_n_2_,x10
	li	x10, 0
# was:	li	_NOT_exp_9_, 0
	xori	x11, x10, 1
# was:	xori	_and_L_7_, _NOT_exp_9_, 1
	beq	x0, x11, l.sc_l_10_
# was:	beq	x0, _and_L_7_, l.sc_l_10_
	li	x10, 0
# was:	li	_and_R_8_, 0
	and	x11, x11, x10
# was:	and	_or_L_5_, _and_L_7_, _and_R_8_
	j	l.end_l_11_
l.sc_l_10_:
	mv	x11, x0
# was:	mv	_or_L_5_, x0
l.end_l_11_:
	bne	x0, x11, l.sc_l_12_
# was:	bne	x0, _or_L_5_, l.sc_l_12_
	li	x10, 0
# was:	li	_or_R_6_, 0
	or	x11, x11, x10
# was:	or	_tmp_4_, _or_L_5_, _or_R_6_
	j	l.end_l_13_
l.sc_l_12_:
	addi	x11, x0, 1
# was:	addi	_tmp_4_, x0, 1
l.end_l_13_:
# 	mv	_let_x_3_,_tmp_4_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x11, x0, l.wBoolF_14_
# was:	bne	_let_x_3_, x0, l.wBoolF_14_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_14_:
	jal	p.putstring
# was:	jal	p.putstring, x10
	li	x11, 0
# was:	li	_and_L_19_, 0
	beq	x0, x11, l.sc_l_21_
# was:	beq	x0, _and_L_19_, l.sc_l_21_
	li	x10, 1
# was:	li	_and_R_20_, 1
	and	x10, x11, x10
# was:	and	_NOT_exp_18_, _and_L_19_, _and_R_20_
	j	l.end_l_22_
l.sc_l_21_:
	mv	x10, x0
# was:	mv	_NOT_exp_18_, x0
l.end_l_22_:
	xori	x11, x10, 1
# was:	xori	_or_L_16_, _NOT_exp_18_, 1
	bne	x0, x11, l.sc_l_23_
# was:	bne	x0, _or_L_16_, l.sc_l_23_
	li	x10, 0
# was:	li	_or_R_17_, 0
	or	x18, x11, x10
# was:	or	_tmp_15_, _or_L_16_, _or_R_17_
	j	l.end_l_24_
l.sc_l_23_:
	addi	x18, x0, 1
# was:	addi	_tmp_15_, x0, 1
l.end_l_24_:
# 	mv	_mainres_1_,_tmp_15_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x18, x0, l.wBoolF_25_
# was:	bne	_mainres_1_, x0, l.wBoolF_25_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_25_:
	jal	p.putstring
# was:	jal	p.putstring, x10
	mv	x10, x18
# was:	mv	x10, _mainres_1_
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