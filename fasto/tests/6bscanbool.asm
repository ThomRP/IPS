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
# 	mv	_param_b_2_,x11
# 	mv	_or_L_5_,_param_a_1_
	bne	x0, x10, l.sc_l_7_
# was:	bne	x0, _or_L_5_, l.sc_l_7_
# 	mv	_or_R_6_,_param_b_2_
	or	x10, x10, x11
# was:	or	_NOT_exp_4_, _or_L_5_, _or_R_6_
	j	l.end_l_8_
l.sc_l_7_:
	addi	x10, x0, 1
# was:	addi	_NOT_exp_4_, x0, 1
l.end_l_8_:
	xori	x10, x10, 1
# was:	xori	_fun1res_3_, _NOT_exp_4_, 1
# 	mv	x10,_fun1res_3_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function fun2
f.fun2:
	sw	x1, -4(x2)
	addi	x2, x2, -4
# 	mv	_param_a_9_,x10
# 	mv	_param_b_10_,x11
# 	mv	_and_L_14_,_param_a_9_
	beq	x0, x10, l.sc_l_16_
# was:	beq	x0, _and_L_14_, l.sc_l_16_
# 	mv	_and_R_15_,_param_b_10_
	and	x11, x10, x11
# was:	and	_or_L_12_, _and_L_14_, _and_R_15_
	j	l.end_l_17_
l.sc_l_16_:
	mv	x11, x0
# was:	mv	_or_L_12_, x0
l.end_l_17_:
	bne	x0, x11, l.sc_l_19_
# was:	bne	x0, _or_L_12_, l.sc_l_19_
# 	mv	_NOT_exp_18_,_param_a_9_
	xori	x10, x10, 1
# was:	xori	_or_R_13_, _NOT_exp_18_, 1
	or	x10, x11, x10
# was:	or	_fun2res_11_, _or_L_12_, _or_R_13_
	j	l.end_l_20_
l.sc_l_19_:
	addi	x10, x0, 1
# was:	addi	_fun2res_11_, x0, 1
l.end_l_20_:
# 	mv	x10,_fun2res_11_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function writeBool
f.writeBool:
	sw	x1, -4(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -8
# 	mv	_param_n_21_,x10
	mv	x18, x10
# was:	mv	_tmp_23_, _param_n_21_
# 	mv	_writeBoolres_22_,_tmp_23_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x18, x0, l.wBoolF_24_
# was:	bne	_writeBoolres_22_, x0, l.wBoolF_24_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_24_:
	jal	p.putstring
# was:	jal	p.putstring, x10
	mv	x10, x18
# was:	mv	x10, _writeBoolres_22_
	addi	x2, x2, 8
	lw	x18, -8(x2)
	lw	x1, -4(x2)
	jr	x1
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
	li	x11, 2
# was:	li	_size_27_, 2
	mv	x21, x3
# was:	mv	_let_a_26_, x3
	addi	x10, x11, 3
# was:	addi	_tmp_30_, _size_27_, 3
	andi	x10, x10, -4
# was:	andi	_tmp_30_, _tmp_30_, -4
	addi	x10, x10, 4
# was:	addi	_tmp_30_, _tmp_30_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_30_
	sw	x11, 0(x21)
# was:	sw	_size_27_, 0(_let_a_26_)
	addi	x11, x21, 4
# was:	addi	_addr_28_, _let_a_26_, 4
	li	x10, 0
# was:	li	_tmp_29_, 0
	sb	x10, 0(x11)
# was:	sb	_tmp_29_, 0(_addr_28_)
	addi	x11, x11, 1
# was:	addi	_addr_28_, _addr_28_, 1
	li	x10, 1
# was:	li	_tmp_29_, 1
	sb	x10, 0(x11)
# was:	sb	_tmp_29_, 0(_addr_28_)
	addi	x11, x11, 1
# was:	addi	_addr_28_, _addr_28_, 1
	mv	x22, x21
# was:	mv	_arr_32_, _let_a_26_
	lw	x20, 0(x22)
# was:	lw	_size_33_, 0(_arr_32_)
	mv	x18, x3
# was:	mv	_let_b_31_, x3
	addi	x10, x20, 3
# was:	addi	_tmp_41_, _size_33_, 3
	andi	x10, x10, -4
# was:	andi	_tmp_41_, _tmp_41_, -4
	addi	x10, x10, 4
# was:	addi	_tmp_41_, _tmp_41_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_41_
	sw	x20, 0(x18)
# was:	sw	_size_33_, 0(_let_b_31_)
	li	x10, 0
# was:	li	_tmp2_36_, 0
	addi	x23, x18, 4
# was:	addi	_addrg_39_, _let_b_31_, 4
	addi	x22, x22, 4
# was:	addi	_arr_32_, _arr_32_, 4
	mv	x19, x0
# was:	mv	_ind_var_34_, x0
l.loop_beg_37_:
	bge	x19, x20, l.loop_end_38_
# was:	bge	_ind_var_34_, _size_33_, l.loop_end_38_
	lbu	x11, 0(x22)
# was:	lbu	_tmp1_35_, 0(_arr_32_)
	addi	x22, x22, 1
# was:	addi	_arr_32_, _arr_32_, 1
# 	mv	x10,_tmp2_36_
# 	mv	x11,_tmp1_35_
	jal	f.fun1
# was:	jal	f.fun1, x10 x11
# 	mv	_tmp_40_,x10
# 	mv	_tmp2_36_,_tmp_40_
	sb	x10, 0(x23)
# was:	sb	_tmp2_36_, 0(_addrg_39_)
	addi	x23, x23, 1
# was:	addi	_addrg_39_, _addrg_39_, 1
	addi	x19, x19, 1
# was:	addi	_ind_var_34_, _ind_var_34_, 1
	j	l.loop_beg_37_
l.loop_end_38_:
# 	mv	_arr_43_,_let_a_26_
	lw	x20, 0(x21)
# was:	lw	_size_44_, 0(_arr_43_)
	mv	x19, x3
# was:	mv	_let_c_42_, x3
	addi	x10, x20, 3
# was:	addi	_tmp_52_, _size_44_, 3
	andi	x10, x10, -4
# was:	andi	_tmp_52_, _tmp_52_, -4
	addi	x10, x10, 4
# was:	addi	_tmp_52_, _tmp_52_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_52_
	sw	x20, 0(x19)
# was:	sw	_size_44_, 0(_let_c_42_)
	li	x10, 1
# was:	li	_tmp2_47_, 1
	addi	x22, x19, 4
# was:	addi	_addrg_50_, _let_c_42_, 4
	addi	x21, x21, 4
# was:	addi	_arr_43_, _arr_43_, 4
	mv	x23, x0
# was:	mv	_ind_var_45_, x0
l.loop_beg_48_:
	bge	x23, x20, l.loop_end_49_
# was:	bge	_ind_var_45_, _size_44_, l.loop_end_49_
	lbu	x11, 0(x21)
# was:	lbu	_tmp1_46_, 0(_arr_43_)
	addi	x21, x21, 1
# was:	addi	_arr_43_, _arr_43_, 1
# 	mv	x10,_tmp2_47_
# 	mv	x11,_tmp1_46_
	jal	f.fun2
# was:	jal	f.fun2, x10 x11
# 	mv	_tmp_51_,x10
# 	mv	_tmp2_47_,_tmp_51_
	sb	x10, 0(x22)
# was:	sb	_tmp2_47_, 0(_addrg_50_)
	addi	x22, x22, 1
# was:	addi	_addrg_50_, _addrg_50_, 1
	addi	x23, x23, 1
# was:	addi	_ind_var_45_, _ind_var_45_, 1
	j	l.loop_beg_48_
l.loop_end_49_:
	mv	x10, x18
# was:	mv	_arr_55_, _let_b_31_
	lw	x21, 0(x10)
# was:	lw	_size_54_, 0(_arr_55_)
	mv	x12, x3
# was:	mv	_let_tmp_53_, x3
	addi	x11, x21, 3
# was:	addi	_tmp_63_, _size_54_, 3
	andi	x11, x11, -4
# was:	andi	_tmp_63_, _tmp_63_, -4
	addi	x11, x11, 4
# was:	addi	_tmp_63_, _tmp_63_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_63_
	sw	x21, 0(x12)
# was:	sw	_size_54_, 0(_let_tmp_53_)
	addi	x18, x12, 4
# was:	addi	_addrg_58_, _let_tmp_53_, 4
	mv	x20, x0
# was:	mv	_i_59_, x0
	addi	x22, x10, 4
# was:	addi	_elem_56_, _arr_55_, 4
l.loop_beg_60_:
	bge	x20, x21, l.loop_end_61_
# was:	bge	_i_59_, _size_54_, l.loop_end_61_
	lbu	x10, 0(x22)
# was:	lbu	_res_57_, 0(_elem_56_)
	addi	x22, x22, 1
# was:	addi	_elem_56_, _elem_56_, 1
# 	mv	x10,_res_57_
	jal	f.writeBool
# was:	jal	f.writeBool, x10
# 	mv	_tmp_62_,x10
# 	mv	_res_57_,_tmp_62_
	sb	x10, 0(x18)
# was:	sb	_res_57_, 0(_addrg_58_)
	addi	x18, x18, 1
# was:	addi	_addrg_58_, _addrg_58_, 1
	addi	x20, x20, 1
# was:	addi	_i_59_, _i_59_, 1
	j	l.loop_beg_60_
l.loop_end_61_:
	mv	x10, x19
# was:	mv	_arr_65_, _let_c_42_
	lw	x19, 0(x10)
# was:	lw	_size_64_, 0(_arr_65_)
	mv	x18, x3
# was:	mv	_mainres_25_, x3
	addi	x11, x19, 3
# was:	addi	_tmp_73_, _size_64_, 3
	andi	x11, x11, -4
# was:	andi	_tmp_73_, _tmp_73_, -4
	addi	x11, x11, 4
# was:	addi	_tmp_73_, _tmp_73_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_73_
	sw	x19, 0(x18)
# was:	sw	_size_64_, 0(_mainres_25_)
	addi	x20, x18, 4
# was:	addi	_addrg_68_, _mainres_25_, 4
	mv	x21, x0
# was:	mv	_i_69_, x0
	addi	x22, x10, 4
# was:	addi	_elem_66_, _arr_65_, 4
l.loop_beg_70_:
	bge	x21, x19, l.loop_end_71_
# was:	bge	_i_69_, _size_64_, l.loop_end_71_
	lbu	x10, 0(x22)
# was:	lbu	_res_67_, 0(_elem_66_)
	addi	x22, x22, 1
# was:	addi	_elem_66_, _elem_66_, 1
# 	mv	x10,_res_67_
	jal	f.writeBool
# was:	jal	f.writeBool, x10
# 	mv	_tmp_72_,x10
# 	mv	_res_67_,_tmp_72_
	sb	x10, 0(x20)
# was:	sb	_res_67_, 0(_addrg_68_)
	addi	x20, x20, 1
# was:	addi	_addrg_68_, _addrg_68_, 1
	addi	x21, x21, 1
# was:	addi	_i_69_, _i_69_, 1
	j	l.loop_beg_70_
l.loop_end_71_:
	mv	x10, x18
# was:	mv	x10, _mainres_25_
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