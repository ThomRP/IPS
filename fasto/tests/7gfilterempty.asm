	.text	0x00400000
	la	x3, d.heap
	jal	f.main
	jal	p.stop
# User functions
# Function fun1
f.fun1:
	sw	x1, -4(x2)
	addi	x2, x2, -4
# 	mv	_param_a_1_,x10
	la	x10, s.b_3_
# was:	la	_fun1res_2_, s.b_3_
# s.b_3_: string "b"
# 	mv	x10,_fun1res_2_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function main
f.main:
	sw	x1, -4(x2)
	sw	x24, -32(x2)
	sw	x23, -28(x2)
	sw	x22, -24(x2)
	sw	x21, -20(x2)
	sw	x20, -16(x2)
	sw	x19, -12(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -32
	li	x12, 3
# was:	li	_size_10_, 3
	mv	x10, x3
# was:	mv	_arr_6_, x3
	slli	x11, x12, 2
# was:	slli	_tmp_13_, _size_10_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_13_, _tmp_13_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_13_
	sw	x12, 0(x10)
# was:	sw	_size_10_, 0(_arr_6_)
	addi	x11, x10, 4
# was:	addi	_addr_11_, _arr_6_, 4
	li	x12, 1
# was:	li	_plus_L_14_, 1
	li	x14, 5
# was:	li	_divide_L_16_, 5
	li	x13, 2
# was:	li	_divide_R_17_, 2
	bne	x13, x0, l.safe_18_
# was:	bne	_divide_R_17_, x0, l.safe_18_
	li	x10, 5
# was:	li	x10, 5
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.safe_18_:
	div	x13, x14, x13
# was:	div	_plus_R_15_, _divide_L_16_, _divide_R_17_
	add	x12, x12, x13
# was:	add	_tmp_12_, _plus_L_14_, _plus_R_15_
	sw	x12, 0(x11)
# was:	sw	_tmp_12_, 0(_addr_11_)
	addi	x11, x11, 4
# was:	addi	_addr_11_, _addr_11_, 4
	li	x13, 0
# was:	li	_minus_L_22_, 0
	li	x12, 2
# was:	li	_minus_R_23_, 2
	sub	x12, x13, x12
# was:	sub	_NEGATE_exp_21_, _minus_L_22_, _minus_R_23_
	sub	x13, x0, x12
# was:	sub	_times_L_19_, x0, _NEGATE_exp_21_
	li	x12, 2
# was:	li	_times_R_20_, 2
	mul	x12, x13, x12
# was:	mul	_tmp_12_, _times_L_19_, _times_R_20_
	sw	x12, 0(x11)
# was:	sw	_tmp_12_, 0(_addr_11_)
	addi	x11, x11, 4
# was:	addi	_addr_11_, _addr_11_, 4
	li	x12, 3
# was:	li	_tmp_12_, 3
	sw	x12, 0(x11)
# was:	sw	_tmp_12_, 0(_addr_11_)
	addi	x11, x11, 4
# was:	addi	_addr_11_, _addr_11_, 4
	lw	x18, 0(x10)
# was:	lw	_size_5_, 0(_arr_6_)
	mv	x19, x3
# was:	mv	_mainres_4_, x3
	slli	x11, x18, 2
# was:	slli	_tmp_31_, _size_5_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_31_, _tmp_31_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_31_
	sw	x18, 0(x19)
# was:	sw	_size_5_, 0(_mainres_4_)
	addi	x20, x19, 4
# was:	addi	_addrg_24_, _mainres_4_, 4
	mv	x22, x0
# was:	mv	_i_25_, x0
	mv	x21, x0
# was:	mv	_j_26_, x0
	addi	x24, x10, 4
# was:	addi	_elem_7_, _arr_6_, 4
l.loop_beg_27_:
	bge	x22, x18, l.loop_end_29_
# was:	bge	_i_25_, _size_5_, l.loop_end_29_
	lw	x23, 0(x24)
# was:	lw	_tmp_9_, 0(_elem_7_)
	addi	x24, x24, 4
# was:	addi	_elem_7_, _elem_7_, 4
	mv	x10, x23
# was:	mv	x10, _tmp_9_
	jal	f.fun1
# was:	jal	f.fun1, x10
# 	mv	_tmp_30_,x10
# 	mv	_res_8_,_tmp_30_
	beq	x10, x0, l.loop_foot_28_
# was:	beq	_res_8_, x0, l.loop_foot_28_
	sw	x23, 0(x20)
# was:	sw	_tmp_9_, 0(_addrg_24_)
	addi	x20, x20, 4
# was:	addi	_addrg_24_, _addrg_24_, 4
	addi	x21, x21, 1
# was:	addi	_j_26_, _j_26_, 1
l.loop_foot_28_:
	addi	x22, x22, 1
# was:	addi	_i_25_, _i_25_, 1
	j	l.loop_beg_27_
l.loop_end_29_:
	sw	x21, 0(x19)
# was:	sw	_j_26_, 0(_mainres_4_)
	mv	x10, x19
# was:	mv	x10, _mainres_4_
	addi	x2, x2, 32
	lw	x24, -32(x2)
	lw	x23, -28(x2)
	lw	x22, -24(x2)
	lw	x21, -20(x2)
	lw	x20, -16(x2)
	lw	x19, -12(x2)
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
s.b_3_:
	.word	1
	.ascii	"b"
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