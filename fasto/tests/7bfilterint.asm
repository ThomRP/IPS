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
	mv	x11, x10
# was:	mv	_eq_L_7_, _param_a_1_
	li	x10, 3
# was:	li	_eq_R_8_, 3
	li	x12, 0
# was:	li	_cond_6_, 0
	bne	x11, x10, l.false_9_
# was:	bne	_eq_L_7_, _eq_R_8_, l.false_9_
	li	x12, 1
# was:	li	_cond_6_, 1
l.false_9_:
	bne	x12, x0, l.then_3_
# was:	bne	_cond_6_, x0, l.then_3_
	j	l.else_4_
l.then_3_:
	li	x10, 1
# was:	li	_fun1res_2_, 1
	j	l.endif_5_
l.else_4_:
	li	x10, 0
# was:	li	_fun1res_2_, 0
l.endif_5_:
# 	mv	x10,_fun1res_2_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function writeInt
f.writeInt:
	sw	x1, -4(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -8
# 	mv	_param_n_10_,x10
	mv	x18, x10
# was:	mv	_tmp_12_, _param_n_10_
# 	mv	_writeIntres_11_,_tmp_12_
	mv	x10, x18
# was:	mv	x10, _writeIntres_11_
	jal	p.putint
# was:	jal	p.putint, x10
	mv	x10, x18
# was:	mv	x10, _writeIntres_11_
	addi	x2, x2, 8
	lw	x18, -8(x2)
	lw	x1, -4(x2)
	jr	x1
# Function main
f.main:
	sw	x1, -4(x2)
	sw	x25, -36(x2)
	sw	x24, -32(x2)
	sw	x23, -28(x2)
	sw	x22, -24(x2)
	sw	x21, -20(x2)
	sw	x20, -16(x2)
	sw	x19, -12(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -36
	li	x12, 3
# was:	li	_size_20_, 3
	mv	x10, x3
# was:	mv	_arr_16_, x3
	slli	x11, x12, 2
# was:	slli	_tmp_23_, _size_20_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_23_, _tmp_23_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_23_
	sw	x12, 0(x10)
# was:	sw	_size_20_, 0(_arr_16_)
	addi	x11, x10, 4
# was:	addi	_addr_21_, _arr_16_, 4
	li	x12, 1
# was:	li	_plus_L_24_, 1
	li	x14, 5
# was:	li	_divide_L_26_, 5
	li	x13, 2
# was:	li	_divide_R_27_, 2
	bne	x13, x0, l.safe_28_
# was:	bne	_divide_R_27_, x0, l.safe_28_
	li	x10, 9
# was:	li	x10, 9
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.safe_28_:
	div	x13, x14, x13
# was:	div	_plus_R_25_, _divide_L_26_, _divide_R_27_
	add	x12, x12, x13
# was:	add	_tmp_22_, _plus_L_24_, _plus_R_25_
	sw	x12, 0(x11)
# was:	sw	_tmp_22_, 0(_addr_21_)
	addi	x11, x11, 4
# was:	addi	_addr_21_, _addr_21_, 4
	li	x13, 0
# was:	li	_minus_L_32_, 0
	li	x12, 2
# was:	li	_minus_R_33_, 2
	sub	x12, x13, x12
# was:	sub	_NEGATE_exp_31_, _minus_L_32_, _minus_R_33_
	sub	x13, x0, x12
# was:	sub	_times_L_29_, x0, _NEGATE_exp_31_
	li	x12, 2
# was:	li	_times_R_30_, 2
	mul	x12, x13, x12
# was:	mul	_tmp_22_, _times_L_29_, _times_R_30_
	sw	x12, 0(x11)
# was:	sw	_tmp_22_, 0(_addr_21_)
	addi	x11, x11, 4
# was:	addi	_addr_21_, _addr_21_, 4
	li	x12, 3
# was:	li	_tmp_22_, 3
	sw	x12, 0(x11)
# was:	sw	_tmp_22_, 0(_addr_21_)
	addi	x11, x11, 4
# was:	addi	_addr_21_, _addr_21_, 4
	lw	x20, 0(x10)
# was:	lw	_size_15_, 0(_arr_16_)
	mv	x21, x3
# was:	mv	_let_a_14_, x3
	slli	x11, x20, 2
# was:	slli	_tmp_41_, _size_15_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_41_, _tmp_41_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_41_
	sw	x20, 0(x21)
# was:	sw	_size_15_, 0(_let_a_14_)
	addi	x18, x21, 4
# was:	addi	_addrg_34_, _let_a_14_, 4
	mv	x22, x0
# was:	mv	_i_35_, x0
	mv	x19, x0
# was:	mv	_j_36_, x0
	addi	x24, x10, 4
# was:	addi	_elem_17_, _arr_16_, 4
l.loop_beg_37_:
	bge	x22, x20, l.loop_end_39_
# was:	bge	_i_35_, _size_15_, l.loop_end_39_
	lw	x23, 0(x24)
# was:	lw	_tmp_19_, 0(_elem_17_)
	addi	x24, x24, 4
# was:	addi	_elem_17_, _elem_17_, 4
	mv	x10, x23
# was:	mv	x10, _tmp_19_
	jal	f.fun1
# was:	jal	f.fun1, x10
# 	mv	_tmp_40_,x10
# 	mv	_res_18_,_tmp_40_
	beq	x10, x0, l.loop_foot_38_
# was:	beq	_res_18_, x0, l.loop_foot_38_
	sw	x23, 0(x18)
# was:	sw	_tmp_19_, 0(_addrg_34_)
	addi	x18, x18, 4
# was:	addi	_addrg_34_, _addrg_34_, 4
	addi	x19, x19, 1
# was:	addi	_j_36_, _j_36_, 1
l.loop_foot_38_:
	addi	x22, x22, 1
# was:	addi	_i_35_, _i_35_, 1
	j	l.loop_beg_37_
l.loop_end_39_:
	sw	x19, 0(x21)
# was:	sw	_j_36_, 0(_let_a_14_)
# 	mv	_arr_44_,_let_a_14_
	lw	x19, 0(x21)
# was:	lw	_size_43_, 0(_arr_44_)
	mv	x11, x3
# was:	mv	_let_tmp_42_, x3
	slli	x10, x19, 2
# was:	slli	_tmp_52_, _size_43_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_52_, _tmp_52_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_52_
	sw	x19, 0(x11)
# was:	sw	_size_43_, 0(_let_tmp_42_)
	addi	x20, x11, 4
# was:	addi	_addrg_47_, _let_tmp_42_, 4
	mv	x18, x0
# was:	mv	_i_48_, x0
	addi	x21, x21, 4
# was:	addi	_elem_45_, _arr_44_, 4
l.loop_beg_49_:
	bge	x18, x19, l.loop_end_50_
# was:	bge	_i_48_, _size_43_, l.loop_end_50_
	lw	x10, 0(x21)
# was:	lw	_res_46_, 0(_elem_45_)
	addi	x21, x21, 4
# was:	addi	_elem_45_, _elem_45_, 4
# 	mv	x10,_res_46_
	jal	f.writeInt
# was:	jal	f.writeInt, x10
# 	mv	_tmp_51_,x10
# 	mv	_res_46_,_tmp_51_
	sw	x10, 0(x20)
# was:	sw	_res_46_, 0(_addrg_47_)
	addi	x20, x20, 4
# was:	addi	_addrg_47_, _addrg_47_, 4
	addi	x18, x18, 1
# was:	addi	_i_48_, _i_48_, 1
	j	l.loop_beg_49_
l.loop_end_50_:
	li	x12, 1
# was:	li	_size_59_, 1
	mv	x10, x3
# was:	mv	_arr_55_, x3
	slli	x11, x12, 2
# was:	slli	_tmp_62_, _size_59_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_62_, _tmp_62_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_62_
	sw	x12, 0(x10)
# was:	sw	_size_59_, 0(_arr_55_)
	addi	x12, x10, 4
# was:	addi	_addr_60_, _arr_55_, 4
	li	x11, 1
# was:	li	_tmp_61_, 1
	sw	x11, 0(x12)
# was:	sw	_tmp_61_, 0(_addr_60_)
	addi	x12, x12, 4
# was:	addi	_addr_60_, _addr_60_, 4
	lw	x20, 0(x10)
# was:	lw	_size_54_, 0(_arr_55_)
	mv	x18, x3
# was:	mv	_let_b_53_, x3
	slli	x11, x20, 2
# was:	slli	_tmp_70_, _size_54_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_70_, _tmp_70_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_70_
	sw	x20, 0(x18)
# was:	sw	_size_54_, 0(_let_b_53_)
	addi	x21, x18, 4
# was:	addi	_addrg_63_, _let_b_53_, 4
	mv	x19, x0
# was:	mv	_i_64_, x0
	mv	x22, x0
# was:	mv	_j_65_, x0
	addi	x23, x10, 4
# was:	addi	_elem_56_, _arr_55_, 4
l.loop_beg_66_:
	bge	x19, x20, l.loop_end_68_
# was:	bge	_i_64_, _size_54_, l.loop_end_68_
	lw	x24, 0(x23)
# was:	lw	_tmp_58_, 0(_elem_56_)
	addi	x23, x23, 4
# was:	addi	_elem_56_, _elem_56_, 4
	mv	x10, x24
# was:	mv	x10, _tmp_58_
	jal	f.fun1
# was:	jal	f.fun1, x10
# 	mv	_tmp_69_,x10
# 	mv	_res_57_,_tmp_69_
	beq	x10, x0, l.loop_foot_67_
# was:	beq	_res_57_, x0, l.loop_foot_67_
	sw	x24, 0(x21)
# was:	sw	_tmp_58_, 0(_addrg_63_)
	addi	x21, x21, 4
# was:	addi	_addrg_63_, _addrg_63_, 4
	addi	x22, x22, 1
# was:	addi	_j_65_, _j_65_, 1
l.loop_foot_67_:
	addi	x19, x19, 1
# was:	addi	_i_64_, _i_64_, 1
	j	l.loop_beg_66_
l.loop_end_68_:
	sw	x22, 0(x18)
# was:	sw	_j_65_, 0(_let_b_53_)
# 	mv	_arr_73_,_let_b_53_
	lw	x19, 0(x18)
# was:	lw	_size_72_, 0(_arr_73_)
	mv	x11, x3
# was:	mv	_let_tmp_71_, x3
	slli	x10, x19, 2
# was:	slli	_tmp_81_, _size_72_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_81_, _tmp_81_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_81_
	sw	x19, 0(x11)
# was:	sw	_size_72_, 0(_let_tmp_71_)
	addi	x21, x11, 4
# was:	addi	_addrg_76_, _let_tmp_71_, 4
	mv	x20, x0
# was:	mv	_i_77_, x0
	addi	x22, x18, 4
# was:	addi	_elem_74_, _arr_73_, 4
l.loop_beg_78_:
	bge	x20, x19, l.loop_end_79_
# was:	bge	_i_77_, _size_72_, l.loop_end_79_
	lw	x10, 0(x22)
# was:	lw	_res_75_, 0(_elem_74_)
	addi	x22, x22, 4
# was:	addi	_elem_74_, _elem_74_, 4
# 	mv	x10,_res_75_
	jal	f.writeInt
# was:	jal	f.writeInt, x10
# 	mv	_tmp_80_,x10
# 	mv	_res_75_,_tmp_80_
	sw	x10, 0(x21)
# was:	sw	_res_75_, 0(_addrg_76_)
	addi	x21, x21, 4
# was:	addi	_addrg_76_, _addrg_76_, 4
	addi	x20, x20, 1
# was:	addi	_i_77_, _i_77_, 1
	j	l.loop_beg_78_
l.loop_end_79_:
	li	x10, 0
# was:	li	_size_83_, 0
	bge	x10, x0, l.safe_84_
# was:	bge	_size_83_, x0, l.safe_84_
	li	x10, 13
# was:	li	x10, 13
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_84_:
	mv	x11, x3
# was:	mv	_let_c_82_, x3
	slli	x12, x10, 2
# was:	slli	_tmp_89_, _size_83_, 2
	addi	x12, x12, 4
# was:	addi	_tmp_89_, _tmp_89_, 4
	add	x3, x3, x12
# was:	add	x3, x3, _tmp_89_
	sw	x10, 0(x11)
# was:	sw	_size_83_, 0(_let_c_82_)
	addi	x13, x11, 4
# was:	addi	_addr_85_, _let_c_82_, 4
	mv	x12, x0
# was:	mv	_i_86_, x0
l.loop_beg_87_:
	bge	x12, x10, l.loop_end_88_
# was:	bge	_i_86_, _size_83_, l.loop_end_88_
	sw	x12, 0(x13)
# was:	sw	_i_86_, 0(_addr_85_)
	addi	x13, x13, 4
# was:	addi	_addr_85_, _addr_85_, 4
	addi	x12, x12, 1
# was:	addi	_i_86_, _i_86_, 1
	j	l.loop_beg_87_
l.loop_end_88_:
	mv	x10, x11
# was:	mv	_arr_92_, _let_c_82_
	lw	x19, 0(x10)
# was:	lw	_size_91_, 0(_arr_92_)
	mv	x20, x3
# was:	mv	_let_c1_90_, x3
	slli	x11, x19, 2
# was:	slli	_tmp_103_, _size_91_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_103_, _tmp_103_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_103_
	sw	x19, 0(x20)
# was:	sw	_size_91_, 0(_let_c1_90_)
	addi	x23, x20, 4
# was:	addi	_addrg_96_, _let_c1_90_, 4
	mv	x22, x0
# was:	mv	_i_97_, x0
	mv	x21, x0
# was:	mv	_j_98_, x0
	addi	x25, x10, 4
# was:	addi	_elem_93_, _arr_92_, 4
l.loop_beg_99_:
	bge	x22, x19, l.loop_end_101_
# was:	bge	_i_97_, _size_91_, l.loop_end_101_
	lw	x24, 0(x25)
# was:	lw	_tmp_95_, 0(_elem_93_)
	addi	x25, x25, 4
# was:	addi	_elem_93_, _elem_93_, 4
	mv	x10, x24
# was:	mv	x10, _tmp_95_
	jal	f.fun1
# was:	jal	f.fun1, x10
# 	mv	_tmp_102_,x10
# 	mv	_res_94_,_tmp_102_
	beq	x10, x0, l.loop_foot_100_
# was:	beq	_res_94_, x0, l.loop_foot_100_
	sw	x24, 0(x23)
# was:	sw	_tmp_95_, 0(_addrg_96_)
	addi	x23, x23, 4
# was:	addi	_addrg_96_, _addrg_96_, 4
	addi	x21, x21, 1
# was:	addi	_j_98_, _j_98_, 1
l.loop_foot_100_:
	addi	x22, x22, 1
# was:	addi	_i_97_, _i_97_, 1
	j	l.loop_beg_99_
l.loop_end_101_:
	sw	x21, 0(x20)
# was:	sw	_j_98_, 0(_let_c1_90_)
	mv	x10, x18
# was:	mv	_arr_105_, _let_b_53_
	lw	x18, 0(x10)
# was:	lw	_size_104_, 0(_arr_105_)
	mv	x19, x3
# was:	mv	_mainres_13_, x3
	slli	x11, x18, 2
# was:	slli	_tmp_113_, _size_104_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_113_, _tmp_113_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_113_
	sw	x18, 0(x19)
# was:	sw	_size_104_, 0(_mainres_13_)
	addi	x20, x19, 4
# was:	addi	_addrg_108_, _mainres_13_, 4
	mv	x21, x0
# was:	mv	_i_109_, x0
	addi	x22, x10, 4
# was:	addi	_elem_106_, _arr_105_, 4
l.loop_beg_110_:
	bge	x21, x18, l.loop_end_111_
# was:	bge	_i_109_, _size_104_, l.loop_end_111_
	lw	x10, 0(x22)
# was:	lw	_res_107_, 0(_elem_106_)
	addi	x22, x22, 4
# was:	addi	_elem_106_, _elem_106_, 4
# 	mv	x10,_res_107_
	jal	f.writeInt
# was:	jal	f.writeInt, x10
# 	mv	_tmp_112_,x10
# 	mv	_res_107_,_tmp_112_
	sw	x10, 0(x20)
# was:	sw	_res_107_, 0(_addrg_108_)
	addi	x20, x20, 4
# was:	addi	_addrg_108_, _addrg_108_, 4
	addi	x21, x21, 1
# was:	addi	_i_109_, _i_109_, 1
	j	l.loop_beg_110_
l.loop_end_111_:
	mv	x10, x19
# was:	mv	x10, _mainres_13_
	addi	x2, x2, 36
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