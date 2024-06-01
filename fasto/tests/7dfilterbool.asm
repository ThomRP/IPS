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
# Function writeBool
f.writeBool:
	sw	x1, -4(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -8
# 	mv	_param_n_3_,x10
	mv	x18, x10
# was:	mv	_tmp_5_, _param_n_3_
# 	mv	_writeBoolres_4_,_tmp_5_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x18, x0, l.wBoolF_6_
# was:	bne	_writeBoolres_4_, x0, l.wBoolF_6_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_6_:
	jal	p.putstring
# was:	jal	p.putstring, x10
	mv	x10, x18
# was:	mv	x10, _writeBoolres_4_
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
	li	x12, 4
# was:	li	_size_14_, 4
	mv	x10, x3
# was:	mv	_arr_10_, x3
	addi	x11, x12, 3
# was:	addi	_tmp_17_, _size_14_, 3
	andi	x11, x11, -4
# was:	andi	_tmp_17_, _tmp_17_, -4
	addi	x11, x11, 4
# was:	addi	_tmp_17_, _tmp_17_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_17_
	sw	x12, 0(x10)
# was:	sw	_size_14_, 0(_arr_10_)
	addi	x11, x10, 4
# was:	addi	_addr_15_, _arr_10_, 4
	li	x12, 1
# was:	li	_tmp_16_, 1
	sb	x12, 0(x11)
# was:	sb	_tmp_16_, 0(_addr_15_)
	addi	x11, x11, 1
# was:	addi	_addr_15_, _addr_15_, 1
	li	x12, 0
# was:	li	_tmp_16_, 0
	sb	x12, 0(x11)
# was:	sb	_tmp_16_, 0(_addr_15_)
	addi	x11, x11, 1
# was:	addi	_addr_15_, _addr_15_, 1
	li	x13, 1
# was:	li	_or_L_19_, 1
	bne	x0, x13, l.sc_l_21_
# was:	bne	x0, _or_L_19_, l.sc_l_21_
	li	x12, 0
# was:	li	_or_R_20_, 0
	or	x12, x13, x12
# was:	or	_NOT_exp_18_, _or_L_19_, _or_R_20_
	j	l.end_l_22_
l.sc_l_21_:
	addi	x12, x0, 1
# was:	addi	_NOT_exp_18_, x0, 1
l.end_l_22_:
	xori	x12, x12, 1
# was:	xori	_tmp_16_, _NOT_exp_18_, 1
	sb	x12, 0(x11)
# was:	sb	_tmp_16_, 0(_addr_15_)
	addi	x11, x11, 1
# was:	addi	_addr_15_, _addr_15_, 1
	li	x13, 0
# was:	li	_or_L_24_, 0
	bne	x0, x13, l.sc_l_26_
# was:	bne	x0, _or_L_24_, l.sc_l_26_
	li	x12, 0
# was:	li	_or_R_25_, 0
	or	x12, x13, x12
# was:	or	_NOT_exp_23_, _or_L_24_, _or_R_25_
	j	l.end_l_27_
l.sc_l_26_:
	addi	x12, x0, 1
# was:	addi	_NOT_exp_23_, x0, 1
l.end_l_27_:
	xori	x12, x12, 1
# was:	xori	_tmp_16_, _NOT_exp_23_, 1
	sb	x12, 0(x11)
# was:	sb	_tmp_16_, 0(_addr_15_)
	addi	x11, x11, 1
# was:	addi	_addr_15_, _addr_15_, 1
	lw	x19, 0(x10)
# was:	lw	_size_9_, 0(_arr_10_)
	mv	x18, x3
# was:	mv	_let_a_8_, x3
	addi	x11, x19, 3
# was:	addi	_tmp_35_, _size_9_, 3
	andi	x11, x11, -4
# was:	andi	_tmp_35_, _tmp_35_, -4
	addi	x11, x11, 4
# was:	addi	_tmp_35_, _tmp_35_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_35_
	sw	x19, 0(x18)
# was:	sw	_size_9_, 0(_let_a_8_)
	addi	x21, x18, 4
# was:	addi	_addrg_28_, _let_a_8_, 4
	mv	x22, x0
# was:	mv	_i_29_, x0
	mv	x20, x0
# was:	mv	_j_30_, x0
	addi	x23, x10, 4
# was:	addi	_elem_11_, _arr_10_, 4
l.loop_beg_31_:
	bge	x22, x19, l.loop_end_33_
# was:	bge	_i_29_, _size_9_, l.loop_end_33_
	lbu	x24, 0(x23)
# was:	lbu	_tmp_13_, 0(_elem_11_)
	addi	x23, x23, 1
# was:	addi	_elem_11_, _elem_11_, 1
	mv	x10, x24
# was:	mv	x10, _tmp_13_
	jal	f.fun1
# was:	jal	f.fun1, x10
# 	mv	_tmp_34_,x10
# 	mv	_res_12_,_tmp_34_
	beq	x10, x0, l.loop_foot_32_
# was:	beq	_res_12_, x0, l.loop_foot_32_
	sb	x24, 0(x21)
# was:	sb	_tmp_13_, 0(_addrg_28_)
	addi	x21, x21, 1
# was:	addi	_addrg_28_, _addrg_28_, 1
	addi	x20, x20, 1
# was:	addi	_j_30_, _j_30_, 1
l.loop_foot_32_:
	addi	x22, x22, 1
# was:	addi	_i_29_, _i_29_, 1
	j	l.loop_beg_31_
l.loop_end_33_:
	sw	x20, 0(x18)
# was:	sw	_j_30_, 0(_let_a_8_)
	mv	x10, x18
# was:	mv	_arr_37_, _let_a_8_
	lw	x18, 0(x10)
# was:	lw	_size_36_, 0(_arr_37_)
	mv	x19, x3
# was:	mv	_mainres_7_, x3
	addi	x11, x18, 3
# was:	addi	_tmp_45_, _size_36_, 3
	andi	x11, x11, -4
# was:	andi	_tmp_45_, _tmp_45_, -4
	addi	x11, x11, 4
# was:	addi	_tmp_45_, _tmp_45_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_45_
	sw	x18, 0(x19)
# was:	sw	_size_36_, 0(_mainres_7_)
	addi	x20, x19, 4
# was:	addi	_addrg_40_, _mainres_7_, 4
	mv	x21, x0
# was:	mv	_i_41_, x0
	addi	x22, x10, 4
# was:	addi	_elem_38_, _arr_37_, 4
l.loop_beg_42_:
	bge	x21, x18, l.loop_end_43_
# was:	bge	_i_41_, _size_36_, l.loop_end_43_
	lbu	x10, 0(x22)
# was:	lbu	_res_39_, 0(_elem_38_)
	addi	x22, x22, 1
# was:	addi	_elem_38_, _elem_38_, 1
# 	mv	x10,_res_39_
	jal	f.writeBool
# was:	jal	f.writeBool, x10
# 	mv	_tmp_44_,x10
# 	mv	_res_39_,_tmp_44_
	sb	x10, 0(x20)
# was:	sb	_res_39_, 0(_addrg_40_)
	addi	x20, x20, 1
# was:	addi	_addrg_40_, _addrg_40_, 1
	addi	x21, x21, 1
# was:	addi	_i_41_, _i_41_, 1
	j	l.loop_beg_42_
l.loop_end_43_:
	mv	x10, x19
# was:	mv	x10, _mainres_7_
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