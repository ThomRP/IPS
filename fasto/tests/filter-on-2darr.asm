	.text	0x00400000
	la	x3, d.heap
	jal	f.main
	jal	p.stop
# User functions
# Function main
f.main:
	sw	x1, -4(x2)
	sw	x28, -48(x2)
	sw	x27, -44(x2)
	sw	x26, -40(x2)
	sw	x25, -36(x2)
	sw	x24, -32(x2)
	sw	x23, -28(x2)
	sw	x22, -24(x2)
	sw	x21, -20(x2)
	sw	x20, -16(x2)
	sw	x19, -12(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -48
	jal	p.getint
# was:	jal	p.getint, 
# 	mv	_let_n_2_,x10
	mv	x11, x10
# was:	mv	_size_8_, _let_n_2_
	bge	x11, x0, l.safe_9_
# was:	bge	_size_8_, x0, l.safe_9_
	li	x10, 11
# was:	li	x10, 11
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_9_:
	mv	x10, x3
# was:	mv	_arr_5_, x3
	slli	x12, x11, 2
# was:	slli	_tmp_14_, _size_8_, 2
	addi	x12, x12, 4
# was:	addi	_tmp_14_, _tmp_14_, 4
	add	x3, x3, x12
# was:	add	x3, x3, _tmp_14_
	sw	x11, 0(x10)
# was:	sw	_size_8_, 0(_arr_5_)
	addi	x13, x10, 4
# was:	addi	_addr_10_, _arr_5_, 4
	mv	x12, x0
# was:	mv	_i_11_, x0
l.loop_beg_12_:
	bge	x12, x11, l.loop_end_13_
# was:	bge	_i_11_, _size_8_, l.loop_end_13_
	sw	x12, 0(x13)
# was:	sw	_i_11_, 0(_addr_10_)
	addi	x13, x13, 4
# was:	addi	_addr_10_, _addr_10_, 4
	addi	x12, x12, 1
# was:	addi	_i_11_, _i_11_, 1
	j	l.loop_beg_12_
l.loop_end_13_:
	lw	x14, 0(x10)
# was:	lw	_size_4_, 0(_arr_5_)
	mv	x11, x3
# was:	mv	_let_a2d_3_, x3
	slli	x12, x14, 2
# was:	slli	_tmp_29_, _size_4_, 2
	addi	x12, x12, 4
# was:	addi	_tmp_29_, _tmp_29_, 4
	add	x3, x3, x12
# was:	add	x3, x3, _tmp_29_
	sw	x14, 0(x11)
# was:	sw	_size_4_, 0(_let_a2d_3_)
	addi	x13, x11, 4
# was:	addi	_addrg_15_, _let_a2d_3_, 4
	mv	x12, x0
# was:	mv	_i_16_, x0
	addi	x15, x10, 4
# was:	addi	_elem_6_, _arr_5_, 4
l.loop_beg_17_:
	bge	x12, x14, l.loop_end_18_
# was:	bge	_i_16_, _size_4_, l.loop_end_18_
	lw	x10, 0(x15)
# was:	lw	_res_7_, 0(_elem_6_)
	addi	x15, x15, 4
# was:	addi	_elem_6_, _elem_6_, 4
# 	mv	_plus_L_21_,_res_7_
	li	x16, 2
# was:	li	_plus_R_22_, 2
	add	x16, x10, x16
# was:	add	_size_20_, _plus_L_21_, _plus_R_22_
	bge	x16, x0, l.safe_23_
# was:	bge	_size_20_, x0, l.safe_23_
	li	x10, 10
# was:	li	x10, 10
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_23_:
	mv	x17, x3
# was:	mv	_fun_arg_res_19_, x3
	slli	x10, x16, 2
# was:	slli	_tmp_28_, _size_20_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_28_, _tmp_28_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_28_
	sw	x16, 0(x17)
# was:	sw	_size_20_, 0(_fun_arg_res_19_)
	addi	x10, x17, 4
# was:	addi	_addr_24_, _fun_arg_res_19_, 4
	mv	x18, x0
# was:	mv	_i_25_, x0
l.loop_beg_26_:
	bge	x18, x16, l.loop_end_27_
# was:	bge	_i_25_, _size_20_, l.loop_end_27_
	sw	x18, 0(x10)
# was:	sw	_i_25_, 0(_addr_24_)
	addi	x10, x10, 4
# was:	addi	_addr_24_, _addr_24_, 4
	addi	x18, x18, 1
# was:	addi	_i_25_, _i_25_, 1
	j	l.loop_beg_26_
l.loop_end_27_:
	mv	x10, x17
# was:	mv	_res_7_, _fun_arg_res_19_
	sw	x10, 0(x13)
# was:	sw	_res_7_, 0(_addrg_15_)
	addi	x13, x13, 4
# was:	addi	_addrg_15_, _addrg_15_, 4
	addi	x12, x12, 1
# was:	addi	_i_16_, _i_16_, 1
	j	l.loop_beg_17_
l.loop_end_18_:
	mv	x15, x11
# was:	mv	_arr_32_, _let_a2d_3_
	lw	x14, 0(x15)
# was:	lw	_size_31_, 0(_arr_32_)
	mv	x13, x3
# was:	mv	_let_a2df_30_, x3
	slli	x10, x14, 2
# was:	slli	_tmp_61_, _size_31_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_61_, _tmp_61_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_61_
	sw	x14, 0(x13)
# was:	sw	_size_31_, 0(_let_a2df_30_)
	addi	x10, x13, 4
# was:	addi	_addrg_36_, _let_a2df_30_, 4
	mv	x11, x0
# was:	mv	_i_37_, x0
	mv	x12, x0
# was:	mv	_j_38_, x0
	addi	x16, x15, 4
# was:	addi	_elem_33_, _arr_32_, 4
l.loop_beg_39_:
	bge	x11, x14, l.loop_end_41_
# was:	bge	_i_37_, _size_31_, l.loop_end_41_
	lw	x15, 0(x16)
# was:	lw	_tmp_35_, 0(_elem_33_)
	addi	x16, x16, 4
# was:	addi	_elem_33_, _elem_33_, 4
	mv	x19, x15
# was:	mv	_arr_44_, _tmp_35_
	lw	x17, 0(x19)
# was:	lw	_size_45_, 0(_arr_44_)
	li	x21, 0
# was:	li	_let_r_43_, 0
	addi	x19, x19, 4
# was:	addi	_arr_44_, _arr_44_, 4
	mv	x18, x0
# was:	mv	_ind_var_46_, x0
l.loop_beg_48_:
	bge	x18, x17, l.loop_end_49_
# was:	bge	_ind_var_46_, _size_45_, l.loop_end_49_
	lw	x20, 0(x19)
# was:	lw	_tmp_47_, 0(_arr_44_)
	addi	x19, x19, 4
# was:	addi	_arr_44_, _arr_44_, 4
# 	mv	_plus_L_51_,_let_r_43_
# 	mv	_plus_R_52_,_tmp_47_
	add	x21, x21, x20
# was:	add	_fun_arg_res_50_, _plus_L_51_, _plus_R_52_
# 	mv	_let_r_43_,_fun_arg_res_50_
	addi	x18, x18, 1
# was:	addi	_ind_var_46_, _ind_var_46_, 1
	j	l.loop_beg_48_
l.loop_end_49_:
# 	mv	_divide_L_57_,_let_r_43_
	li	x17, 2
# was:	li	_divide_R_58_, 2
	bne	x17, x0, l.safe_59_
# was:	bne	_divide_R_58_, x0, l.safe_59_
	li	x10, 6
# was:	li	x10, 6
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.safe_59_:
	div	x18, x21, x17
# was:	div	_times_L_55_, _divide_L_57_, _divide_R_58_
	li	x17, 2
# was:	li	_times_R_56_, 2
	mul	x17, x18, x17
# was:	mul	_eq_L_53_, _times_L_55_, _times_R_56_
# 	mv	_eq_R_54_,_let_r_43_
	li	x18, 0
# was:	li	_fun_arg_res_42_, 0
	bne	x17, x21, l.false_60_
# was:	bne	_eq_L_53_, _eq_R_54_, l.false_60_
	li	x18, 1
# was:	li	_fun_arg_res_42_, 1
l.false_60_:
# 	mv	_res_34_,_fun_arg_res_42_
	beq	x18, x0, l.loop_foot_40_
# was:	beq	_res_34_, x0, l.loop_foot_40_
	sw	x15, 0(x10)
# was:	sw	_tmp_35_, 0(_addrg_36_)
	addi	x10, x10, 4
# was:	addi	_addrg_36_, _addrg_36_, 4
	addi	x12, x12, 1
# was:	addi	_j_38_, _j_38_, 1
l.loop_foot_40_:
	addi	x11, x11, 1
# was:	addi	_i_37_, _i_37_, 1
	j	l.loop_beg_39_
l.loop_end_41_:
	sw	x12, 0(x13)
# was:	sw	_j_38_, 0(_let_a2df_30_)
# 	mv	_arr_63_,_let_a2df_30_
	lw	x20, 0(x13)
# was:	lw	_size_62_, 0(_arr_63_)
	mv	x19, x3
# was:	mv	_mainres_1_, x3
	slli	x10, x20, 2
# was:	slli	_tmp_82_, _size_62_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_82_, _tmp_82_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_82_
	sw	x20, 0(x19)
# was:	sw	_size_62_, 0(_mainres_1_)
	addi	x21, x19, 4
# was:	addi	_addrg_66_, _mainres_1_, 4
	mv	x22, x0
# was:	mv	_i_67_, x0
	addi	x18, x13, 4
# was:	addi	_elem_64_, _arr_63_, 4
l.loop_beg_68_:
	bge	x22, x20, l.loop_end_69_
# was:	bge	_i_67_, _size_62_, l.loop_end_69_
	lw	x10, 0(x18)
# was:	lw	_res_65_, 0(_elem_64_)
	addi	x18, x18, 4
# was:	addi	_elem_64_, _elem_64_, 4
# 	mv	_arr_72_,_res_65_
	lw	x23, 0(x10)
# was:	lw	_size_71_, 0(_arr_72_)
	mv	x24, x3
# was:	mv	_fun_arg_res_70_, x3
	slli	x11, x23, 2
# was:	slli	_tmp_81_, _size_71_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_81_, _tmp_81_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_81_
	sw	x23, 0(x24)
# was:	sw	_size_71_, 0(_fun_arg_res_70_)
	addi	x26, x24, 4
# was:	addi	_addrg_75_, _fun_arg_res_70_, 4
	mv	x25, x0
# was:	mv	_i_76_, x0
	addi	x27, x10, 4
# was:	addi	_elem_73_, _arr_72_, 4
l.loop_beg_77_:
	bge	x25, x23, l.loop_end_78_
# was:	bge	_i_76_, _size_71_, l.loop_end_78_
	lw	x28, 0(x27)
# was:	lw	_res_74_, 0(_elem_73_)
	addi	x27, x27, 4
# was:	addi	_elem_73_, _elem_73_, 4
# 	mv	_tmp_80_,_res_74_
# 	mv	_fun_arg_res_79_,_tmp_80_
	mv	x10, x28
# was:	mv	x10, _fun_arg_res_79_
	jal	p.putint
# was:	jal	p.putint, x10
# 	mv	_res_74_,_fun_arg_res_79_
	sw	x28, 0(x26)
# was:	sw	_res_74_, 0(_addrg_75_)
	addi	x26, x26, 4
# was:	addi	_addrg_75_, _addrg_75_, 4
	addi	x25, x25, 1
# was:	addi	_i_76_, _i_76_, 1
	j	l.loop_beg_77_
l.loop_end_78_:
	mv	x10, x24
# was:	mv	_res_65_, _fun_arg_res_70_
	sw	x10, 0(x21)
# was:	sw	_res_65_, 0(_addrg_66_)
	addi	x21, x21, 4
# was:	addi	_addrg_66_, _addrg_66_, 4
	addi	x22, x22, 1
# was:	addi	_i_67_, _i_67_, 1
	j	l.loop_beg_68_
l.loop_end_69_:
	mv	x10, x19
# was:	mv	x10, _mainres_1_
	addi	x2, x2, 48
	lw	x28, -48(x2)
	lw	x27, -44(x2)
	lw	x26, -40(x2)
	lw	x25, -36(x2)
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