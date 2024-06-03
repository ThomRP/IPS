	.text	0x00400000
	la	x3, d.heap
	jal	f.main
	jal	p.stop
# User functions
# Function main
f.main:
	sw	x1, -4(x2)
	sw	x23, -28(x2)
	sw	x22, -24(x2)
	sw	x21, -20(x2)
	sw	x20, -16(x2)
	sw	x19, -12(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -28
	jal	p.getint
# was:	jal	p.getint, 
# 	mv	_let_N_2_,x10
# 	mv	_plus_L_4_,_let_N_2_
	mv	x11, x10
# was:	mv	_plus_R_5_, _let_N_2_
	add	x10, x10, x11
# was:	add	_let_z_3_, _plus_L_4_, _plus_R_5_
# 	mv	_let_a_I3_7_,_let_z_3_
# 	mv	_let_a_8_,_let_a_I3_7_
# 	mv	_arr_11_,_let_a_8_
	lw	x12, 0(x10)
# was:	lw	_size_10_, 0(_arr_11_)
	mv	x13, x3
# was:	mv	_let_x_9_, x3
	slli	x11, x12, 2
# was:	slli	_tmp_21_, _size_10_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_21_, _tmp_21_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_21_
	sw	x12, 0(x13)
# was:	sw	_size_10_, 0(_let_x_9_)
	addi	x11, x13, 4
# was:	addi	_addrg_14_, _let_x_9_, 4
	mv	x14, x0
# was:	mv	_i_15_, x0
	addi	x15, x10, 4
# was:	addi	_elem_12_, _arr_11_, 4
l.loop_beg_16_:
	bge	x14, x12, l.loop_end_17_
# was:	bge	_i_15_, _size_10_, l.loop_end_17_
	lw	x10, 0(x15)
# was:	lw	_res_13_, 0(_elem_12_)
	addi	x15, x15, 4
# was:	addi	_elem_12_, _elem_12_, 4
	mv	x16, x10
# was:	mv	_plus_L_19_, _res_13_
	li	x10, 5
# was:	li	_plus_R_20_, 5
	add	x10, x16, x10
# was:	add	_fun_arg_res_18_, _plus_L_19_, _plus_R_20_
# 	mv	_res_13_,_fun_arg_res_18_
	sw	x10, 0(x11)
# was:	sw	_res_13_, 0(_addrg_14_)
	addi	x11, x11, 4
# was:	addi	_addrg_14_, _addrg_14_, 4
	addi	x14, x14, 1
# was:	addi	_i_15_, _i_15_, 1
	j	l.loop_beg_16_
l.loop_end_17_:
	mv	x10, x13
# was:	mv	_let_y_6_, _let_x_9_
# 	mv	_arr_24_,_let_y_6_
	lw	x12, 0(x10)
# was:	lw	_size_23_, 0(_arr_24_)
	mv	x13, x3
# was:	mv	_let_w_22_, x3
	slli	x11, x12, 2
# was:	slli	_tmp_34_, _size_23_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_34_, _tmp_34_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_34_
	sw	x12, 0(x13)
# was:	sw	_size_23_, 0(_let_w_22_)
	addi	x11, x13, 4
# was:	addi	_addrg_27_, _let_w_22_, 4
	mv	x14, x0
# was:	mv	_i_28_, x0
	addi	x15, x10, 4
# was:	addi	_elem_25_, _arr_24_, 4
l.loop_beg_29_:
	bge	x14, x12, l.loop_end_30_
# was:	bge	_i_28_, _size_23_, l.loop_end_30_
	lw	x10, 0(x15)
# was:	lw	_res_26_, 0(_elem_25_)
	addi	x15, x15, 4
# was:	addi	_elem_25_, _elem_25_, 4
	mv	x16, x10
# was:	mv	_plus_L_32_, _res_26_
# 	mv	_plus_R_33_,_res_26_
	add	x10, x16, x10
# was:	add	_fun_arg_res_31_, _plus_L_32_, _plus_R_33_
# 	mv	_res_26_,_fun_arg_res_31_
	sw	x10, 0(x11)
# was:	sw	_res_26_, 0(_addrg_27_)
	addi	x11, x11, 4
# was:	addi	_addrg_27_, _addrg_27_, 4
	addi	x14, x14, 1
# was:	addi	_i_28_, _i_28_, 1
	j	l.loop_beg_29_
l.loop_end_30_:
# 	mv	_let_x_I4_35_,_let_w_22_
	mv	x10, x13
# was:	mv	_let_x_36_, _let_x_I4_35_
# 	mv	_arr_38_,_let_x_36_
	lw	x19, 0(x10)
# was:	lw	_size_37_, 0(_arr_38_)
	mv	x18, x3
# was:	mv	_mainres_1_, x3
	slli	x11, x19, 2
# was:	slli	_tmp_47_, _size_37_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_47_, _tmp_47_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_47_
	sw	x19, 0(x18)
# was:	sw	_size_37_, 0(_mainres_1_)
	addi	x20, x18, 4
# was:	addi	_addrg_41_, _mainres_1_, 4
	mv	x21, x0
# was:	mv	_i_42_, x0
	addi	x22, x10, 4
# was:	addi	_elem_39_, _arr_38_, 4
l.loop_beg_43_:
	bge	x21, x19, l.loop_end_44_
# was:	bge	_i_42_, _size_37_, l.loop_end_44_
	lw	x23, 0(x22)
# was:	lw	_res_40_, 0(_elem_39_)
	addi	x22, x22, 4
# was:	addi	_elem_39_, _elem_39_, 4
# 	mv	_tmp_46_,_res_40_
# 	mv	_fun_arg_res_45_,_tmp_46_
	mv	x10, x23
# was:	mv	x10, _fun_arg_res_45_
	jal	p.putint
# was:	jal	p.putint, x10
# 	mv	_res_40_,_fun_arg_res_45_
	sw	x23, 0(x20)
# was:	sw	_res_40_, 0(_addrg_41_)
	addi	x20, x20, 4
# was:	addi	_addrg_41_, _addrg_41_, 4
	addi	x21, x21, 1
# was:	addi	_i_42_, _i_42_, 1
	j	l.loop_beg_43_
l.loop_end_44_:
	mv	x10, x18
# was:	mv	x10, _mainres_1_
	addi	x2, x2, 28
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