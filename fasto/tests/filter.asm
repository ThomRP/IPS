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
# 	mv	_let_n_2_,x10
# 	mv	_size_9_,_let_n_2_
	bge	x10, x0, l.safe_10_
# was:	bge	_size_9_, x0, l.safe_10_
	li	x10, 10
# was:	li	x10, 10
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_10_:
	mv	x15, x3
# was:	mv	_arr_5_, x3
	slli	x11, x10, 2
# was:	slli	_tmp_15_, _size_9_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_15_, _tmp_15_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_15_
	sw	x10, 0(x15)
# was:	sw	_size_9_, 0(_arr_5_)
	addi	x11, x15, 4
# was:	addi	_addr_11_, _arr_5_, 4
	mv	x12, x0
# was:	mv	_i_12_, x0
l.loop_beg_13_:
	bge	x12, x10, l.loop_end_14_
# was:	bge	_i_12_, _size_9_, l.loop_end_14_
	sw	x12, 0(x11)
# was:	sw	_i_12_, 0(_addr_11_)
	addi	x11, x11, 4
# was:	addi	_addr_11_, _addr_11_, 4
	addi	x12, x12, 1
# was:	addi	_i_12_, _i_12_, 1
	j	l.loop_beg_13_
l.loop_end_14_:
	lw	x14, 0(x15)
# was:	lw	_size_4_, 0(_arr_5_)
	mv	x12, x3
# was:	mv	_let_x_3_, x3
	slli	x10, x14, 2
# was:	slli	_tmp_31_, _size_4_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_31_, _tmp_31_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_31_
	sw	x14, 0(x12)
# was:	sw	_size_4_, 0(_let_x_3_)
	addi	x10, x12, 4
# was:	addi	_addrg_16_, _let_x_3_, 4
	mv	x11, x0
# was:	mv	_i_17_, x0
	mv	x13, x0
# was:	mv	_j_18_, x0
	addi	x15, x15, 4
# was:	addi	_elem_6_, _arr_5_, 4
l.loop_beg_19_:
	bge	x11, x14, l.loop_end_21_
# was:	bge	_i_17_, _size_4_, l.loop_end_21_
	lw	x18, 0(x15)
# was:	lw	_tmp_8_, 0(_elem_6_)
	addi	x15, x15, 4
# was:	addi	_elem_6_, _elem_6_, 4
# 	mv	_eq_L_23_,_tmp_8_
	mv	x17, x18
# was:	mv	_divide_L_27_, _tmp_8_
	li	x16, 2
# was:	li	_divide_R_28_, 2
	bne	x16, x0, l.safe_29_
# was:	bne	_divide_R_28_, x0, l.safe_29_
	li	x10, 10
# was:	li	x10, 10
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.safe_29_:
	div	x16, x17, x16
# was:	div	_times_L_25_, _divide_L_27_, _divide_R_28_
	li	x17, 2
# was:	li	_times_R_26_, 2
	mul	x16, x16, x17
# was:	mul	_eq_R_24_, _times_L_25_, _times_R_26_
	li	x17, 0
# was:	li	_fun_arg_res_22_, 0
	bne	x18, x16, l.false_30_
# was:	bne	_eq_L_23_, _eq_R_24_, l.false_30_
	li	x17, 1
# was:	li	_fun_arg_res_22_, 1
l.false_30_:
# 	mv	_res_7_,_fun_arg_res_22_
	beq	x17, x0, l.loop_foot_20_
# was:	beq	_res_7_, x0, l.loop_foot_20_
	sw	x18, 0(x10)
# was:	sw	_tmp_8_, 0(_addrg_16_)
	addi	x10, x10, 4
# was:	addi	_addrg_16_, _addrg_16_, 4
	addi	x13, x13, 1
# was:	addi	_j_18_, _j_18_, 1
l.loop_foot_20_:
	addi	x11, x11, 1
# was:	addi	_i_17_, _i_17_, 1
	j	l.loop_beg_19_
l.loop_end_21_:
	sw	x13, 0(x12)
# was:	sw	_j_18_, 0(_let_x_3_)
	mv	x10, x12
# was:	mv	_arr_34_, _let_x_3_
	lw	x13, 0(x10)
# was:	lw	_size_33_, 0(_arr_34_)
	mv	x12, x3
# was:	mv	_let_y_32_, x3
	slli	x11, x13, 2
# was:	slli	_tmp_44_, _size_33_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_44_, _tmp_44_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_44_
	sw	x13, 0(x12)
# was:	sw	_size_33_, 0(_let_y_32_)
	addi	x11, x12, 4
# was:	addi	_addrg_37_, _let_y_32_, 4
	mv	x14, x0
# was:	mv	_i_38_, x0
	addi	x10, x10, 4
# was:	addi	_elem_35_, _arr_34_, 4
l.loop_beg_39_:
	bge	x14, x13, l.loop_end_40_
# was:	bge	_i_38_, _size_33_, l.loop_end_40_
	lw	x15, 0(x10)
# was:	lw	_res_36_, 0(_elem_35_)
	addi	x10, x10, 4
# was:	addi	_elem_35_, _elem_35_, 4
	mv	x16, x15
# was:	mv	_times_L_42_, _res_36_
# 	mv	_times_R_43_,_res_36_
	mul	x15, x16, x15
# was:	mul	_fun_arg_res_41_, _times_L_42_, _times_R_43_
# 	mv	_res_36_,_fun_arg_res_41_
	sw	x15, 0(x11)
# was:	sw	_res_36_, 0(_addrg_37_)
	addi	x11, x11, 4
# was:	addi	_addrg_37_, _addrg_37_, 4
	addi	x14, x14, 1
# was:	addi	_i_38_, _i_38_, 1
	j	l.loop_beg_39_
l.loop_end_40_:
	mv	x10, x12
# was:	mv	_arr_47_, _let_y_32_
	lw	x12, 0(x10)
# was:	lw	_size_46_, 0(_arr_47_)
	mv	x13, x3
# was:	mv	_let_z_45_, x3
	slli	x11, x12, 2
# was:	slli	_tmp_66_, _size_46_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_66_, _tmp_66_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_66_
	sw	x12, 0(x13)
# was:	sw	_size_46_, 0(_let_z_45_)
	addi	x14, x13, 4
# was:	addi	_addrg_51_, _let_z_45_, 4
	mv	x11, x0
# was:	mv	_i_52_, x0
	mv	x15, x0
# was:	mv	_j_53_, x0
	addi	x10, x10, 4
# was:	addi	_elem_48_, _arr_47_, 4
l.loop_beg_54_:
	bge	x11, x12, l.loop_end_56_
# was:	bge	_i_52_, _size_46_, l.loop_end_56_
	lw	x16, 0(x10)
# was:	lw	_tmp_50_, 0(_elem_48_)
	addi	x10, x10, 4
# was:	addi	_elem_48_, _elem_48_, 4
# 	mv	_divide_L_62_,_tmp_50_
	li	x17, 16
# was:	li	_divide_R_63_, 16
	bne	x17, x0, l.safe_64_
# was:	bne	_divide_R_63_, x0, l.safe_64_
	li	x10, 6
# was:	li	x10, 6
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.safe_64_:
	div	x18, x16, x17
# was:	div	_times_L_60_, _divide_L_62_, _divide_R_63_
	li	x17, 16
# was:	li	_times_R_61_, 16
	mul	x18, x18, x17
# was:	mul	_eq_L_58_, _times_L_60_, _times_R_61_
# 	mv	_eq_R_59_,_tmp_50_
	li	x17, 0
# was:	li	_fun_arg_res_57_, 0
	bne	x18, x16, l.false_65_
# was:	bne	_eq_L_58_, _eq_R_59_, l.false_65_
	li	x17, 1
# was:	li	_fun_arg_res_57_, 1
l.false_65_:
# 	mv	_res_49_,_fun_arg_res_57_
	beq	x17, x0, l.loop_foot_55_
# was:	beq	_res_49_, x0, l.loop_foot_55_
	sw	x16, 0(x14)
# was:	sw	_tmp_50_, 0(_addrg_51_)
	addi	x14, x14, 4
# was:	addi	_addrg_51_, _addrg_51_, 4
	addi	x15, x15, 1
# was:	addi	_j_53_, _j_53_, 1
l.loop_foot_55_:
	addi	x11, x11, 1
# was:	addi	_i_52_, _i_52_, 1
	j	l.loop_beg_54_
l.loop_end_56_:
	sw	x15, 0(x13)
# was:	sw	_j_53_, 0(_let_z_45_)
# 	mv	_arr_68_,_let_z_45_
	lw	x19, 0(x13)
# was:	lw	_size_67_, 0(_arr_68_)
	mv	x18, x3
# was:	mv	_mainres_1_, x3
	slli	x10, x19, 2
# was:	slli	_tmp_77_, _size_67_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_77_, _tmp_77_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_77_
	sw	x19, 0(x18)
# was:	sw	_size_67_, 0(_mainres_1_)
	addi	x20, x18, 4
# was:	addi	_addrg_71_, _mainres_1_, 4
	mv	x21, x0
# was:	mv	_i_72_, x0
	addi	x22, x13, 4
# was:	addi	_elem_69_, _arr_68_, 4
l.loop_beg_73_:
	bge	x21, x19, l.loop_end_74_
# was:	bge	_i_72_, _size_67_, l.loop_end_74_
	lw	x23, 0(x22)
# was:	lw	_res_70_, 0(_elem_69_)
	addi	x22, x22, 4
# was:	addi	_elem_69_, _elem_69_, 4
# 	mv	_tmp_76_,_res_70_
# 	mv	_fun_arg_res_75_,_tmp_76_
	mv	x10, x23
# was:	mv	x10, _fun_arg_res_75_
	jal	p.putint
# was:	jal	p.putint, x10
# 	mv	_res_70_,_fun_arg_res_75_
	sw	x23, 0(x20)
# was:	sw	_res_70_, 0(_addrg_71_)
	addi	x20, x20, 4
# was:	addi	_addrg_71_, _addrg_71_, 4
	addi	x21, x21, 1
# was:	addi	_i_72_, _i_72_, 1
	j	l.loop_beg_73_
l.loop_end_74_:
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