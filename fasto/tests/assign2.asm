	.text	0x00400000
	la	x3, d.heap
	jal	f.main
	jal	p.stop
# User functions
# Function mul
f.mul:
	sw	x1, -4(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -8
# 	mv	_param_x_1_,x10
# 	mv	_param_y_2_,x11
# 	mv	_eq_L_8_,_param_x_1_
	li	x13, 0
# was:	li	_eq_R_9_, 0
	li	x12, 0
# was:	li	_cond_7_, 0
	bne	x10, x13, l.false_10_
# was:	bne	_eq_L_8_, _eq_R_9_, l.false_10_
	li	x12, 1
# was:	li	_cond_7_, 1
l.false_10_:
	bne	x12, x0, l.then_4_
# was:	bne	_cond_7_, x0, l.then_4_
	j	l.else_5_
l.then_4_:
	li	x10, 0
# was:	li	_mulres_3_, 0
	j	l.endif_6_
l.else_5_:
	li	x12, 0
# was:	li	_lt_L_15_, 0
# 	mv	_lt_R_16_,_param_x_1_
	slt	x12, x12, x10
# was:	slt	_cond_14_, _lt_L_15_, _lt_R_16_
	bne	x12, x0, l.then_11_
# was:	bne	_cond_14_, x0, l.then_11_
	j	l.else_12_
l.then_11_:
	mv	x18, x11
# was:	mv	_plus_L_17_, _param_y_2_
	mv	x12, x10
# was:	mv	_minus_L_20_, _param_x_1_
	li	x10, 1
# was:	li	_minus_R_21_, 1
	sub	x10, x12, x10
# was:	sub	_arg_19_, _minus_L_20_, _minus_R_21_
# 	mv	_arg_22_,_param_y_2_
# 	mv	x10,_arg_19_
# 	mv	x11,_arg_22_
	jal	f.mul
# was:	jal	f.mul, x10 x11
# 	mv	_plus_R_18_,x10
	add	x10, x18, x10
# was:	add	_mulres_3_, _plus_L_17_, _plus_R_18_
	j	l.endif_13_
l.else_12_:
	li	x12, 0
# was:	li	_minus_L_25_, 0
# 	mv	_minus_R_26_,_param_y_2_
	sub	x18, x12, x11
# was:	sub	_plus_L_23_, _minus_L_25_, _minus_R_26_
	mv	x12, x10
# was:	mv	_plus_L_28_, _param_x_1_
	li	x10, 1
# was:	li	_plus_R_29_, 1
	add	x10, x12, x10
# was:	add	_arg_27_, _plus_L_28_, _plus_R_29_
# 	mv	_arg_30_,_param_y_2_
# 	mv	x10,_arg_27_
# 	mv	x11,_arg_30_
	jal	f.mul
# was:	jal	f.mul, x10 x11
# 	mv	_plus_R_24_,x10
	add	x10, x18, x10
# was:	add	_mulres_3_, _plus_L_23_, _plus_R_24_
l.endif_13_:
l.endif_6_:
# 	mv	x10,_mulres_3_
	addi	x2, x2, 8
	lw	x18, -8(x2)
	lw	x1, -4(x2)
	jr	x1
# Function readInt
f.readInt:
	sw	x1, -4(x2)
	addi	x2, x2, -4
# 	mv	_param_i_31_,x10
	jal	p.getint
# was:	jal	p.getint, 
# 	mv	_readIntres_32_,x10
# 	mv	x10,_readIntres_32_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function diff
f.diff:
	sw	x1, -4(x2)
	addi	x2, x2, -4
# 	mv	_param_i_33_,x10
# 	mv	_param_arr_34_,x11
# 	mv	_param_len_35_,x12
# 	mv	_eq_L_41_,_param_i_33_
	li	x14, 0
# was:	li	_eq_R_42_, 0
	li	x13, 0
# was:	li	_cond_40_, 0
	bne	x10, x14, l.false_43_
# was:	bne	_eq_L_41_, _eq_R_42_, l.false_43_
	li	x13, 1
# was:	li	_cond_40_, 1
l.false_43_:
	bne	x13, x0, l.then_37_
# was:	bne	_cond_40_, x0, l.then_37_
	j	l.else_38_
l.then_37_:
	mv	x13, x10
# was:	mv	_arr_ind_46_, _param_i_33_
	addi	x14, x11, 4
# was:	addi	_arr_data_47_, _param_arr_34_, 4
	bge	x13, x0, l.nonneg_50_
# was:	bge	_arr_ind_46_, x0, l.nonneg_50_
l.error_49_:
	li	x10, 14
# was:	li	x10, 14
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_50_:
	lw	x10, 0(x11)
# was:	lw	_size_48_, 0(_param_arr_34_)
	bge	x13, x10, l.error_49_
# was:	bge	_arr_ind_46_, _size_48_, l.error_49_
	slli	x13, x13, 2
# was:	slli	_arr_ind_46_, _arr_ind_46_, 2
	add	x14, x14, x13
# was:	add	_arr_data_47_, _arr_data_47_, _arr_ind_46_
	lw	x10, 0(x14)
# was:	lw	_minus_L_44_, 0(_arr_data_47_)
# 	mv	_minus_L_52_,_param_len_35_
	li	x13, 1
# was:	li	_minus_R_53_, 1
	sub	x13, x12, x13
# was:	sub	_arr_ind_51_, _minus_L_52_, _minus_R_53_
	addi	x12, x11, 4
# was:	addi	_arr_data_54_, _param_arr_34_, 4
	bge	x13, x0, l.nonneg_57_
# was:	bge	_arr_ind_51_, x0, l.nonneg_57_
l.error_56_:
	li	x10, 14
# was:	li	x10, 14
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_57_:
	lw	x11, 0(x11)
# was:	lw	_size_55_, 0(_param_arr_34_)
	bge	x13, x11, l.error_56_
# was:	bge	_arr_ind_51_, _size_55_, l.error_56_
	slli	x13, x13, 2
# was:	slli	_arr_ind_51_, _arr_ind_51_, 2
	add	x12, x12, x13
# was:	add	_arr_data_54_, _arr_data_54_, _arr_ind_51_
	lw	x11, 0(x12)
# was:	lw	_minus_R_45_, 0(_arr_data_54_)
	sub	x10, x10, x11
# was:	sub	_diffres_36_, _minus_L_44_, _minus_R_45_
	j	l.endif_39_
l.else_38_:
	mv	x12, x10
# was:	mv	_arr_ind_60_, _param_i_33_
	addi	x13, x11, 4
# was:	addi	_arr_data_61_, _param_arr_34_, 4
	bge	x12, x0, l.nonneg_64_
# was:	bge	_arr_ind_60_, x0, l.nonneg_64_
l.error_63_:
	li	x10, 16
# was:	li	x10, 16
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_64_:
	lw	x14, 0(x11)
# was:	lw	_size_62_, 0(_param_arr_34_)
	bge	x12, x14, l.error_63_
# was:	bge	_arr_ind_60_, _size_62_, l.error_63_
	slli	x12, x12, 2
# was:	slli	_arr_ind_60_, _arr_ind_60_, 2
	add	x13, x13, x12
# was:	add	_arr_data_61_, _arr_data_61_, _arr_ind_60_
	lw	x12, 0(x13)
# was:	lw	_minus_L_58_, 0(_arr_data_61_)
	mv	x13, x10
# was:	mv	_minus_L_66_, _param_i_33_
	li	x10, 1
# was:	li	_minus_R_67_, 1
	sub	x10, x13, x10
# was:	sub	_arr_ind_65_, _minus_L_66_, _minus_R_67_
	addi	x13, x11, 4
# was:	addi	_arr_data_68_, _param_arr_34_, 4
	bge	x10, x0, l.nonneg_71_
# was:	bge	_arr_ind_65_, x0, l.nonneg_71_
l.error_70_:
	li	x10, 16
# was:	li	x10, 16
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_71_:
	lw	x11, 0(x11)
# was:	lw	_size_69_, 0(_param_arr_34_)
	bge	x10, x11, l.error_70_
# was:	bge	_arr_ind_65_, _size_69_, l.error_70_
	slli	x10, x10, 2
# was:	slli	_arr_ind_65_, _arr_ind_65_, 2
	add	x13, x13, x10
# was:	add	_arr_data_68_, _arr_data_68_, _arr_ind_65_
	lw	x10, 0(x13)
# was:	lw	_minus_R_59_, 0(_arr_data_68_)
	sub	x10, x12, x10
# was:	sub	_diffres_36_, _minus_L_58_, _minus_R_59_
l.endif_39_:
# 	mv	x10,_diffres_36_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function sq
f.sq:
	sw	x1, -4(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -8
	mv	x18, x10
# was:	mv	_param_x_72_, x10
	mv	x10, x11
# was:	mv	_param_y_73_, x11
# 	mv	_plus_L_75_,_param_x_72_
# 	mv	_arg_77_,_param_y_73_
	mv	x11, x10
# was:	mv	_arg_78_, _param_y_73_
# 	mv	x10,_arg_77_
# 	mv	x11,_arg_78_
	jal	f.mul
# was:	jal	f.mul, x10 x11
# 	mv	_plus_R_76_,x10
	add	x10, x18, x10
# was:	add	_sqres_74_, _plus_L_75_, _plus_R_76_
# 	mv	x10,_sqres_74_
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
	jal	p.getint
# was:	jal	p.getint, 
	mv	x19, x10
# was:	mv	_let_n_80_, x10
# 	mv	_lt_L_85_,_let_n_80_
	li	x10, 1
# was:	li	_lt_R_86_, 1
	slt	x10, x19, x10
# was:	slt	_cond_84_, _lt_L_85_, _lt_R_86_
	bne	x10, x0, l.then_81_
# was:	bne	_cond_84_, x0, l.then_81_
	j	l.else_82_
l.then_81_:
	la	x10, s.Incorre_89_
# was:	la	_tmp_88_, s.Incorre_89_
# s.Incorre_89_: string "Incorrect Input!"
# 	mv	_let_incorrect_87_,_tmp_88_
# 	mv	x10,_tmp_88_
	jal	p.putstring
# was:	jal	p.putstring, x10
	li	x18, 0
# was:	li	_mainres_79_, 0
	j	l.endif_83_
l.else_82_:
# 	mv	_size_91_,_let_n_80_
	bge	x19, x0, l.safe_92_
# was:	bge	_size_91_, x0, l.safe_92_
	li	x10, 28
# was:	li	x10, 28
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_92_:
	mv	x11, x3
# was:	mv	_let_arr_90_, x3
	slli	x10, x19, 2
# was:	slli	_tmp_97_, _size_91_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_97_, _tmp_97_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_97_
	sw	x19, 0(x11)
# was:	sw	_size_91_, 0(_let_arr_90_)
	addi	x10, x11, 4
# was:	addi	_addr_93_, _let_arr_90_, 4
	mv	x12, x0
# was:	mv	_i_94_, x0
l.loop_beg_95_:
	bge	x12, x19, l.loop_end_96_
# was:	bge	_i_94_, _size_91_, l.loop_end_96_
	sw	x12, 0(x10)
# was:	sw	_i_94_, 0(_addr_93_)
	addi	x10, x10, 4
# was:	addi	_addr_93_, _addr_93_, 4
	addi	x12, x12, 1
# was:	addi	_i_94_, _i_94_, 1
	j	l.loop_beg_95_
l.loop_end_96_:
	mv	x10, x11
# was:	mv	_arr_100_, _let_arr_90_
	lw	x20, 0(x10)
# was:	lw	_size_99_, 0(_arr_100_)
	mv	x18, x3
# was:	mv	_let_arr_98_, x3
	slli	x11, x20, 2
# was:	slli	_tmp_108_, _size_99_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_108_, _tmp_108_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_108_
	sw	x20, 0(x18)
# was:	sw	_size_99_, 0(_let_arr_98_)
	addi	x22, x18, 4
# was:	addi	_addrg_103_, _let_arr_98_, 4
	mv	x21, x0
# was:	mv	_i_104_, x0
	addi	x23, x10, 4
# was:	addi	_elem_101_, _arr_100_, 4
l.loop_beg_105_:
	bge	x21, x20, l.loop_end_106_
# was:	bge	_i_104_, _size_99_, l.loop_end_106_
	lw	x10, 0(x23)
# was:	lw	_res_102_, 0(_elem_101_)
	addi	x23, x23, 4
# was:	addi	_elem_101_, _elem_101_, 4
# 	mv	x10,_res_102_
	jal	f.readInt
# was:	jal	f.readInt, x10
# 	mv	_tmp_107_,x10
# 	mv	_res_102_,_tmp_107_
	sw	x10, 0(x22)
# was:	sw	_res_102_, 0(_addrg_103_)
	addi	x22, x22, 4
# was:	addi	_addrg_103_, _addrg_103_, 4
	addi	x21, x21, 1
# was:	addi	_i_104_, _i_104_, 1
	j	l.loop_beg_105_
l.loop_end_106_:
# 	mv	_size_110_,_let_n_80_
	bge	x19, x0, l.safe_111_
# was:	bge	_size_110_, x0, l.safe_111_
	li	x10, 30
# was:	li	x10, 30
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_111_:
	mv	x12, x3
# was:	mv	_let_indexes_109_, x3
	slli	x10, x19, 2
# was:	slli	_tmp_116_, _size_110_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_116_, _tmp_116_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_116_
	sw	x19, 0(x12)
# was:	sw	_size_110_, 0(_let_indexes_109_)
	addi	x11, x12, 4
# was:	addi	_addr_112_, _let_indexes_109_, 4
	mv	x10, x0
# was:	mv	_i_113_, x0
l.loop_beg_114_:
	bge	x10, x19, l.loop_end_115_
# was:	bge	_i_113_, _size_110_, l.loop_end_115_
	sw	x10, 0(x11)
# was:	sw	_i_113_, 0(_addr_112_)
	addi	x11, x11, 4
# was:	addi	_addr_112_, _addr_112_, 4
	addi	x10, x10, 1
# was:	addi	_i_113_, _i_113_, 1
	j	l.loop_beg_114_
l.loop_end_115_:
	mv	x10, x12
# was:	mv	_arr_119_, _let_indexes_109_
	lw	x20, 0(x10)
# was:	lw	_size_118_, 0(_arr_119_)
	mv	x21, x3
# was:	mv	_let_difs_117_, x3
	slli	x11, x20, 2
# was:	slli	_tmp_130_, _size_118_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_130_, _tmp_130_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_130_
	sw	x20, 0(x21)
# was:	sw	_size_118_, 0(_let_difs_117_)
	addi	x23, x21, 4
# was:	addi	_addrg_122_, _let_difs_117_, 4
	mv	x22, x0
# was:	mv	_i_123_, x0
	addi	x24, x10, 4
# was:	addi	_elem_120_, _arr_119_, 4
l.loop_beg_124_:
	bge	x22, x20, l.loop_end_125_
# was:	bge	_i_123_, _size_118_, l.loop_end_125_
	lw	x10, 0(x24)
# was:	lw	_res_121_, 0(_elem_120_)
	addi	x24, x24, 4
# was:	addi	_elem_120_, _elem_120_, 4
# 	mv	_arg_127_,_res_121_
	mv	x11, x18
# was:	mv	_arg_128_, _let_arr_98_
	mv	x12, x19
# was:	mv	_arg_129_, _let_n_80_
# 	mv	x10,_arg_127_
# 	mv	x11,_arg_128_
# 	mv	x12,_arg_129_
	jal	f.diff
# was:	jal	f.diff, x10 x11 x12
# 	mv	_fun_arg_res_126_,x10
# 	mv	_res_121_,_fun_arg_res_126_
	sw	x10, 0(x23)
# was:	sw	_res_121_, 0(_addrg_122_)
	addi	x23, x23, 4
# was:	addi	_addrg_122_, _addrg_122_, 4
	addi	x22, x22, 1
# was:	addi	_i_123_, _i_123_, 1
	j	l.loop_beg_124_
l.loop_end_125_:
# 	mv	_arr_132_,_let_difs_117_
	lw	x18, 0(x21)
# was:	lw	_size_133_, 0(_arr_132_)
	li	x10, 0
# was:	li	_let_result_131_, 0
	addi	x21, x21, 4
# was:	addi	_arr_132_, _arr_132_, 4
	mv	x19, x0
# was:	mv	_ind_var_134_, x0
l.loop_beg_136_:
	bge	x19, x18, l.loop_end_137_
# was:	bge	_ind_var_134_, _size_133_, l.loop_end_137_
	lw	x11, 0(x21)
# was:	lw	_tmp_135_, 0(_arr_132_)
	addi	x21, x21, 4
# was:	addi	_arr_132_, _arr_132_, 4
# 	mv	x10,_let_result_131_
# 	mv	x11,_tmp_135_
	jal	f.sq
# was:	jal	f.sq, x10 x11
# 	mv	_tmp_138_,x10
# 	mv	_let_result_131_,_tmp_138_
	addi	x19, x19, 1
# was:	addi	_ind_var_134_, _ind_var_134_, 1
	j	l.loop_beg_136_
l.loop_end_137_:
# 	mv	_tmp_139_,_let_result_131_
	mv	x18, x10
# was:	mv	_mainres_79_, _tmp_139_
	mv	x10, x18
# was:	mv	x10, _mainres_79_
	jal	p.putint
# was:	jal	p.putint, x10
l.endif_83_:
	mv	x10, x18
# was:	mv	x10, _mainres_79_
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
s.Incorre_89_:
	.word	16
	.ascii	"Incorrect Input!"
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