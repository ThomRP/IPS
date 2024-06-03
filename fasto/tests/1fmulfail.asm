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
# 	mv	_fun1res_2_,_param_a_1_
# 	mv	x10,_fun1res_2_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function writeInt
f.writeInt:
	sw	x1, -4(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -8
# 	mv	_param_n_3_,x10
	mv	x18, x10
# was:	mv	_tmp_5_, _param_n_3_
# 	mv	_writeIntres_4_,_tmp_5_
	mv	x10, x18
# was:	mv	x10, _writeIntres_4_
	jal	p.putint
# was:	jal	p.putint, x10
	mv	x10, x18
# was:	mv	x10, _writeIntres_4_
	addi	x2, x2, 8
	lw	x18, -8(x2)
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
# was:	li	_size_13_, 3
	mv	x10, x3
# was:	mv	_arr_9_, x3
	slli	x12, x11, 2
# was:	slli	_tmp_16_, _size_13_, 2
	addi	x12, x12, 4
# was:	addi	_tmp_16_, _tmp_16_, 4
	add	x3, x3, x12
# was:	add	x3, x3, _tmp_16_
	sw	x11, 0(x10)
# was:	sw	_size_13_, 0(_arr_9_)
	addi	x11, x10, 4
# was:	addi	_addr_14_, _arr_9_, 4
	li	x12, 1
# was:	li	_plus_L_17_, 1
	li	x14, 5
# was:	li	_divide_L_19_, 5
	li	x13, 2
# was:	li	_divide_R_20_, 2
	bne	x13, x0, l.safe_21_
# was:	bne	_divide_R_20_, x0, l.safe_21_
	li	x10, 7
# was:	li	x10, 7
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.safe_21_:
	div	x13, x14, x13
# was:	div	_plus_R_18_, _divide_L_19_, _divide_R_20_
	add	x12, x12, x13
# was:	add	_tmp_15_, _plus_L_17_, _plus_R_18_
	sw	x12, 0(x11)
# was:	sw	_tmp_15_, 0(_addr_14_)
	addi	x11, x11, 4
# was:	addi	_addr_14_, _addr_14_, 4
	li	x13, 0
# was:	li	_minus_L_25_, 0
	li	x12, 2
# was:	li	_minus_R_26_, 2
	sub	x12, x13, x12
# was:	sub	_NEGATE_exp_24_, _minus_L_25_, _minus_R_26_
	sub	x13, x0, x12
# was:	sub	_times_L_22_, x0, _NEGATE_exp_24_
	li	x12, 2
# was:	li	_times_R_23_, 2
	mul	x12, x13, x12
# was:	mul	_tmp_15_, _times_L_22_, _times_R_23_
	sw	x12, 0(x11)
# was:	sw	_tmp_15_, 0(_addr_14_)
	addi	x11, x11, 4
# was:	addi	_addr_14_, _addr_14_, 4
	li	x12, 3
# was:	li	_tmp_15_, 3
	sw	x12, 0(x11)
# was:	sw	_tmp_15_, 0(_addr_14_)
	addi	x11, x11, 4
# was:	addi	_addr_14_, _addr_14_, 4
	lw	x18, 0(x10)
# was:	lw	_size_8_, 0(_arr_9_)
	mv	x19, x3
# was:	mv	_let_a_7_, x3
	slli	x11, x18, 2
# was:	slli	_tmp_34_, _size_8_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_34_, _tmp_34_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_34_
	sw	x18, 0(x19)
# was:	sw	_size_8_, 0(_let_a_7_)
	addi	x21, x19, 4
# was:	addi	_addrg_27_, _let_a_7_, 4
	mv	x20, x0
# was:	mv	_i_28_, x0
	mv	x22, x0
# was:	mv	_j_29_, x0
	addi	x24, x10, 4
# was:	addi	_elem_10_, _arr_9_, 4
l.loop_beg_30_:
	bge	x20, x18, l.loop_end_32_
# was:	bge	_i_28_, _size_8_, l.loop_end_32_
	lw	x23, 0(x24)
# was:	lw	_tmp_12_, 0(_elem_10_)
	addi	x24, x24, 4
# was:	addi	_elem_10_, _elem_10_, 4
	mv	x10, x23
# was:	mv	x10, _tmp_12_
	jal	f.fun1
# was:	jal	f.fun1, x10
# 	mv	_tmp_33_,x10
# 	mv	_res_11_,_tmp_33_
	beq	x10, x0, l.loop_foot_31_
# was:	beq	_res_11_, x0, l.loop_foot_31_
	sw	x23, 0(x21)
# was:	sw	_tmp_12_, 0(_addrg_27_)
	addi	x21, x21, 4
# was:	addi	_addrg_27_, _addrg_27_, 4
	addi	x22, x22, 1
# was:	addi	_j_29_, _j_29_, 1
l.loop_foot_31_:
	addi	x20, x20, 1
# was:	addi	_i_28_, _i_28_, 1
	j	l.loop_beg_30_
l.loop_end_32_:
	sw	x22, 0(x19)
# was:	sw	_j_29_, 0(_let_a_7_)
	mv	x10, x19
# was:	mv	_arr_36_, _let_a_7_
	lw	x19, 0(x10)
# was:	lw	_size_35_, 0(_arr_36_)
	mv	x18, x3
# was:	mv	_mainres_6_, x3
	slli	x11, x19, 2
# was:	slli	_tmp_44_, _size_35_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_44_, _tmp_44_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_44_
	sw	x19, 0(x18)
# was:	sw	_size_35_, 0(_mainres_6_)
	addi	x20, x18, 4
# was:	addi	_addrg_39_, _mainres_6_, 4
	mv	x21, x0
# was:	mv	_i_40_, x0
	addi	x22, x10, 4
# was:	addi	_elem_37_, _arr_36_, 4
l.loop_beg_41_:
	bge	x21, x19, l.loop_end_42_
# was:	bge	_i_40_, _size_35_, l.loop_end_42_
	lw	x10, 0(x22)
# was:	lw	_res_38_, 0(_elem_37_)
	addi	x22, x22, 4
# was:	addi	_elem_37_, _elem_37_, 4
# 	mv	x10,_res_38_
	jal	f.writeInt
# was:	jal	f.writeInt, x10
# 	mv	_tmp_43_,x10
# 	mv	_res_38_,_tmp_43_
	sw	x10, 0(x20)
# was:	sw	_res_38_, 0(_addrg_39_)
	addi	x20, x20, 4
# was:	addi	_addrg_39_, _addrg_39_, 4
	addi	x21, x21, 1
# was:	addi	_i_40_, _i_40_, 1
	j	l.loop_beg_41_
l.loop_end_42_:
	mv	x10, x18
# was:	mv	x10, _mainres_6_
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