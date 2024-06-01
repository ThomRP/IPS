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
	li	x10, 1
# was:	li	_NEGATE_exp_15_, 1
	sub	x11, x0, x10
# was:	sub	_plus_L_13_, x0, _NEGATE_exp_15_
	li	x10, 2
# was:	li	_plus_R_14_, 2
	add	x10, x11, x10
# was:	add	_plus_L_11_, _plus_L_13_, _plus_R_14_
	li	x11, 3
# was:	li	_NEGATE_exp_16_, 3
	sub	x11, x0, x11
# was:	sub	_plus_R_12_, x0, _NEGATE_exp_16_
	add	x11, x10, x11
# was:	add	_minus_L_9_, _plus_L_11_, _plus_R_12_
	li	x10, 4
# was:	li	_minus_R_10_, 4
	sub	x12, x11, x10
# was:	sub	_plus_L_7_, _minus_L_9_, _minus_R_10_
	li	x10, 5
# was:	li	_NEGATE_exp_19_, 5
	sub	x10, x0, x10
# was:	sub	_times_L_17_, x0, _NEGATE_exp_19_
	li	x11, 6
# was:	li	_times_R_18_, 6
	mul	x10, x10, x11
# was:	mul	_plus_R_8_, _times_L_17_, _times_R_18_
	add	x11, x12, x10
# was:	add	_plus_L_5_, _plus_L_7_, _plus_R_8_
	li	x10, 7
# was:	li	_NEGATE_exp_22_, 7
	sub	x12, x0, x10
# was:	sub	_divide_L_20_, x0, _NEGATE_exp_22_
	li	x10, 8
# was:	li	_divide_R_21_, 8
	bne	x10, x0, l.safe_23_
# was:	bne	_divide_R_21_, x0, l.safe_23_
	li	x10, 2
# was:	li	x10, 2
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.safe_23_:
	div	x10, x12, x10
# was:	div	_plus_R_6_, _divide_L_20_, _divide_R_21_
	add	x10, x11, x10
# was:	add	_tmp_4_, _plus_L_5_, _plus_R_6_
# 	mv	_let_y_3_,_tmp_4_
# 	mv	x10,_let_y_3_
	jal	p.putint
# was:	jal	p.putint, x10
	li	x10, 1
# was:	li	_plus_L_32_, 1
	li	x11, 2
# was:	li	_plus_R_33_, 2
	add	x10, x10, x11
# was:	add	_NEGATE_exp_31_, _plus_L_32_, _plus_R_33_
	sub	x12, x0, x10
# was:	sub	_plus_L_29_, x0, _NEGATE_exp_31_
	li	x11, 3
# was:	li	_minus_L_35_, 3
	li	x10, 4
# was:	li	_minus_R_36_, 4
	sub	x10, x11, x10
# was:	sub	_NEGATE_exp_34_, _minus_L_35_, _minus_R_36_
	sub	x10, x0, x10
# was:	sub	_plus_R_30_, x0, _NEGATE_exp_34_
	add	x12, x12, x10
# was:	add	_plus_L_27_, _plus_L_29_, _plus_R_30_
	li	x10, 5
# was:	li	_times_L_38_, 5
	li	x11, 6
# was:	li	_times_R_39_, 6
	mul	x10, x10, x11
# was:	mul	_NEGATE_exp_37_, _times_L_38_, _times_R_39_
	sub	x10, x0, x10
# was:	sub	_plus_R_28_, x0, _NEGATE_exp_37_
	add	x11, x12, x10
# was:	add	_plus_L_25_, _plus_L_27_, _plus_R_28_
	li	x12, 7
# was:	li	_divide_L_41_, 7
	li	x10, 8
# was:	li	_divide_R_42_, 8
	bne	x10, x0, l.safe_43_
# was:	bne	_divide_R_42_, x0, l.safe_43_
	li	x10, 3
# was:	li	x10, 3
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.safe_43_:
	div	x10, x12, x10
# was:	div	_NEGATE_exp_40_, _divide_L_41_, _divide_R_42_
	sub	x10, x0, x10
# was:	sub	_plus_R_26_, x0, _NEGATE_exp_40_
	add	x18, x11, x10
# was:	add	_tmp_24_, _plus_L_25_, _plus_R_26_
# 	mv	_mainres_1_,_tmp_24_
	mv	x10, x18
# was:	mv	x10, _mainres_1_
	jal	p.putint
# was:	jal	p.putint, x10
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