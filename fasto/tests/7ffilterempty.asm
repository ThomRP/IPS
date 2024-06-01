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
# 	mv	_size_3_,_param_a_1_
	bge	x10, x0, l.safe_4_
# was:	bge	_size_3_, x0, l.safe_4_
	li	x10, 2
# was:	li	x10, 2
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_4_:
	mv	x11, x3
# was:	mv	_fun1res_2_, x3
	slli	x12, x10, 2
# was:	slli	_tmp_9_, _size_3_, 2
	addi	x12, x12, 4
# was:	addi	_tmp_9_, _tmp_9_, 4
	add	x3, x3, x12
# was:	add	x3, x3, _tmp_9_
	sw	x10, 0(x11)
# was:	sw	_size_3_, 0(_fun1res_2_)
	addi	x12, x11, 4
# was:	addi	_addr_5_, _fun1res_2_, 4
	mv	x13, x0
# was:	mv	_i_6_, x0
l.loop_beg_7_:
	bge	x13, x10, l.loop_end_8_
# was:	bge	_i_6_, _size_3_, l.loop_end_8_
	sw	x13, 0(x12)
# was:	sw	_i_6_, 0(_addr_5_)
	addi	x12, x12, 4
# was:	addi	_addr_5_, _addr_5_, 4
	addi	x13, x13, 1
# was:	addi	_i_6_, _i_6_, 1
	j	l.loop_beg_7_
l.loop_end_8_:
	mv	x10, x11
# was:	mv	x10, _fun1res_2_
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
	li	x11, 3
# was:	li	_size_16_, 3
	mv	x10, x3
# was:	mv	_arr_12_, x3
	slli	x12, x11, 2
# was:	slli	_tmp_19_, _size_16_, 2
	addi	x12, x12, 4
# was:	addi	_tmp_19_, _tmp_19_, 4
	add	x3, x3, x12
# was:	add	x3, x3, _tmp_19_
	sw	x11, 0(x10)
# was:	sw	_size_16_, 0(_arr_12_)
	addi	x11, x10, 4
# was:	addi	_addr_17_, _arr_12_, 4
	li	x12, 1
# was:	li	_plus_L_20_, 1
	li	x14, 5
# was:	li	_divide_L_22_, 5
	li	x13, 2
# was:	li	_divide_R_23_, 2
	bne	x13, x0, l.safe_24_
# was:	bne	_divide_R_23_, x0, l.safe_24_
	li	x10, 5
# was:	li	x10, 5
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.safe_24_:
	div	x13, x14, x13
# was:	div	_plus_R_21_, _divide_L_22_, _divide_R_23_
	add	x12, x12, x13
# was:	add	_tmp_18_, _plus_L_20_, _plus_R_21_
	sw	x12, 0(x11)
# was:	sw	_tmp_18_, 0(_addr_17_)
	addi	x11, x11, 4
# was:	addi	_addr_17_, _addr_17_, 4
	li	x13, 0
# was:	li	_minus_L_28_, 0
	li	x12, 2
# was:	li	_minus_R_29_, 2
	sub	x12, x13, x12
# was:	sub	_NEGATE_exp_27_, _minus_L_28_, _minus_R_29_
	sub	x13, x0, x12
# was:	sub	_times_L_25_, x0, _NEGATE_exp_27_
	li	x12, 2
# was:	li	_times_R_26_, 2
	mul	x12, x13, x12
# was:	mul	_tmp_18_, _times_L_25_, _times_R_26_
	sw	x12, 0(x11)
# was:	sw	_tmp_18_, 0(_addr_17_)
	addi	x11, x11, 4
# was:	addi	_addr_17_, _addr_17_, 4
	li	x12, 3
# was:	li	_tmp_18_, 3
	sw	x12, 0(x11)
# was:	sw	_tmp_18_, 0(_addr_17_)
	addi	x11, x11, 4
# was:	addi	_addr_17_, _addr_17_, 4
	lw	x19, 0(x10)
# was:	lw	_size_11_, 0(_arr_12_)
	mv	x18, x3
# was:	mv	_mainres_10_, x3
	slli	x11, x19, 2
# was:	slli	_tmp_37_, _size_11_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_37_, _tmp_37_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_37_
	sw	x19, 0(x18)
# was:	sw	_size_11_, 0(_mainres_10_)
	addi	x20, x18, 4
# was:	addi	_addrg_30_, _mainres_10_, 4
	mv	x22, x0
# was:	mv	_i_31_, x0
	mv	x21, x0
# was:	mv	_j_32_, x0
	addi	x24, x10, 4
# was:	addi	_elem_13_, _arr_12_, 4
l.loop_beg_33_:
	bge	x22, x19, l.loop_end_35_
# was:	bge	_i_31_, _size_11_, l.loop_end_35_
	lw	x23, 0(x24)
# was:	lw	_tmp_15_, 0(_elem_13_)
	addi	x24, x24, 4
# was:	addi	_elem_13_, _elem_13_, 4
	mv	x10, x23
# was:	mv	x10, _tmp_15_
	jal	f.fun1
# was:	jal	f.fun1, x10
# 	mv	_tmp_36_,x10
# 	mv	_res_14_,_tmp_36_
	beq	x10, x0, l.loop_foot_34_
# was:	beq	_res_14_, x0, l.loop_foot_34_
	sw	x23, 0(x20)
# was:	sw	_tmp_15_, 0(_addrg_30_)
	addi	x20, x20, 4
# was:	addi	_addrg_30_, _addrg_30_, 4
	addi	x21, x21, 1
# was:	addi	_j_32_, _j_32_, 1
l.loop_foot_34_:
	addi	x22, x22, 1
# was:	addi	_i_31_, _i_31_, 1
	j	l.loop_beg_33_
l.loop_end_35_:
	sw	x21, 0(x18)
# was:	sw	_j_32_, 0(_mainres_10_)
	mv	x10, x18
# was:	mv	x10, _mainres_10_
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