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
	mv	x18, x10
# was:	mv	_let_n_32_, x10
# 	mv	_lt_L_37_,_let_n_32_
	li	x10, 1
# was:	li	_lt_R_38_, 1
	slt	x10, x18, x10
# was:	slt	_cond_36_, _lt_L_37_, _lt_R_38_
	bne	x10, x0, l.then_33_
# was:	bne	_cond_36_, x0, l.then_33_
	j	l.else_34_
l.then_33_:
	la	x10, s.Incorre_41_
# was:	la	_tmp_40_, s.Incorre_41_
# s.Incorre_41_: string "Incorrect Input!"
# 	mv	_let_incorrect_39_,_tmp_40_
# 	mv	x10,_tmp_40_
	jal	p.putstring
# was:	jal	p.putstring, x10
	li	x18, 0
# was:	li	_mainres_31_, 0
	j	l.endif_35_
l.else_34_:
# 	mv	_size_43_,_let_n_32_
	bge	x18, x0, l.safe_44_
# was:	bge	_size_43_, x0, l.safe_44_
	li	x10, 28
# was:	li	x10, 28
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_44_:
	mv	x10, x3
# was:	mv	_let_arr_42_, x3
	slli	x11, x18, 2
# was:	slli	_tmp_49_, _size_43_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_49_, _tmp_49_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_49_
	sw	x18, 0(x10)
# was:	sw	_size_43_, 0(_let_arr_42_)
	addi	x12, x10, 4
# was:	addi	_addr_45_, _let_arr_42_, 4
	mv	x11, x0
# was:	mv	_i_46_, x0
l.loop_beg_47_:
	bge	x11, x18, l.loop_end_48_
# was:	bge	_i_46_, _size_43_, l.loop_end_48_
	sw	x11, 0(x12)
# was:	sw	_i_46_, 0(_addr_45_)
	addi	x12, x12, 4
# was:	addi	_addr_45_, _addr_45_, 4
	addi	x11, x11, 1
# was:	addi	_i_46_, _i_46_, 1
	j	l.loop_beg_47_
l.loop_end_48_:
# 	mv	_arr_52_,_let_arr_42_
	lw	x20, 0(x10)
# was:	lw	_size_51_, 0(_arr_52_)
	mv	x19, x3
# was:	mv	_let_arr_50_, x3
	slli	x11, x20, 2
# was:	slli	_tmp_60_, _size_51_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_60_, _tmp_60_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_60_
	sw	x20, 0(x19)
# was:	sw	_size_51_, 0(_let_arr_50_)
	addi	x21, x19, 4
# was:	addi	_addrg_55_, _let_arr_50_, 4
	mv	x22, x0
# was:	mv	_i_56_, x0
	addi	x23, x10, 4
# was:	addi	_elem_53_, _arr_52_, 4
l.loop_beg_57_:
	bge	x22, x20, l.loop_end_58_
# was:	bge	_i_56_, _size_51_, l.loop_end_58_
	lw	x10, 0(x23)
# was:	lw	_res_54_, 0(_elem_53_)
	addi	x23, x23, 4
# was:	addi	_elem_53_, _elem_53_, 4
	jal	p.getint
# was:	jal	p.getint, 
# 	mv	_fun_arg_res_59_,x10
# 	mv	_res_54_,_fun_arg_res_59_
	sw	x10, 0(x21)
# was:	sw	_res_54_, 0(_addrg_55_)
	addi	x21, x21, 4
# was:	addi	_addrg_55_, _addrg_55_, 4
	addi	x22, x22, 1
# was:	addi	_i_56_, _i_56_, 1
	j	l.loop_beg_57_
l.loop_end_58_:
# 	mv	_size_62_,_let_n_32_
	bge	x18, x0, l.safe_63_
# was:	bge	_size_62_, x0, l.safe_63_
	li	x10, 30
# was:	li	x10, 30
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_63_:
	mv	x14, x3
# was:	mv	_let_indexes_61_, x3
	slli	x10, x18, 2
# was:	slli	_tmp_68_, _size_62_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_68_, _tmp_68_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_68_
	sw	x18, 0(x14)
# was:	sw	_size_62_, 0(_let_indexes_61_)
	addi	x10, x14, 4
# was:	addi	_addr_64_, _let_indexes_61_, 4
	mv	x11, x0
# was:	mv	_i_65_, x0
l.loop_beg_66_:
	bge	x11, x18, l.loop_end_67_
# was:	bge	_i_65_, _size_62_, l.loop_end_67_
	sw	x11, 0(x10)
# was:	sw	_i_65_, 0(_addr_64_)
	addi	x10, x10, 4
# was:	addi	_addr_64_, _addr_64_, 4
	addi	x11, x11, 1
# was:	addi	_i_65_, _i_65_, 1
	j	l.loop_beg_66_
l.loop_end_67_:
# 	mv	_arr_71_,_let_indexes_61_
	lw	x11, 0(x14)
# was:	lw	_size_70_, 0(_arr_71_)
	mv	x10, x3
# was:	mv	_let_difs_69_, x3
	slli	x12, x11, 2
# was:	slli	_tmp_116_, _size_70_, 2
	addi	x12, x12, 4
# was:	addi	_tmp_116_, _tmp_116_, 4
	add	x3, x3, x12
# was:	add	x3, x3, _tmp_116_
	sw	x11, 0(x10)
# was:	sw	_size_70_, 0(_let_difs_69_)
	addi	x12, x10, 4
# was:	addi	_addrg_74_, _let_difs_69_, 4
	mv	x13, x0
# was:	mv	_i_75_, x0
	addi	x14, x14, 4
# was:	addi	_elem_72_, _arr_71_, 4
l.loop_beg_76_:
	bge	x13, x11, l.loop_end_77_
# was:	bge	_i_75_, _size_70_, l.loop_end_77_
	lw	x15, 0(x14)
# was:	lw	_res_73_, 0(_elem_72_)
	addi	x14, x14, 4
# was:	addi	_elem_72_, _elem_72_, 4
# 	mv	_let_i_79_,_res_73_
# 	mv	_let_arr_80_,_let_arr_50_
# 	mv	_eq_L_85_,_let_i_79_
	li	x17, 0
# was:	li	_eq_R_86_, 0
	li	x16, 0
# was:	li	_cond_84_, 0
	bne	x15, x17, l.false_87_
# was:	bne	_eq_L_85_, _eq_R_86_, l.false_87_
	li	x16, 1
# was:	li	_cond_84_, 1
l.false_87_:
	bne	x16, x0, l.then_81_
# was:	bne	_cond_84_, x0, l.then_81_
	j	l.else_82_
l.then_81_:
	mv	x16, x15
# was:	mv	_arr_ind_90_, _let_i_79_
	addi	x15, x19, 4
# was:	addi	_arr_data_91_, _let_arr_80_, 4
	bge	x16, x0, l.nonneg_94_
# was:	bge	_arr_ind_90_, x0, l.nonneg_94_
l.error_93_:
	li	x10, 14
# was:	li	x10, 14
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_94_:
	lw	x17, 0(x19)
# was:	lw	_size_92_, 0(_let_arr_80_)
	bge	x16, x17, l.error_93_
# was:	bge	_arr_ind_90_, _size_92_, l.error_93_
	slli	x16, x16, 2
# was:	slli	_arr_ind_90_, _arr_ind_90_, 2
	add	x15, x15, x16
# was:	add	_arr_data_91_, _arr_data_91_, _arr_ind_90_
	lw	x16, 0(x15)
# was:	lw	_minus_L_88_, 0(_arr_data_91_)
# 	mv	_minus_L_96_,_let_n_32_
	li	x15, 1
# was:	li	_minus_R_97_, 1
	sub	x15, x18, x15
# was:	sub	_arr_ind_95_, _minus_L_96_, _minus_R_97_
	addi	x17, x19, 4
# was:	addi	_arr_data_98_, _let_arr_80_, 4
	bge	x15, x0, l.nonneg_101_
# was:	bge	_arr_ind_95_, x0, l.nonneg_101_
l.error_100_:
	li	x10, 14
# was:	li	x10, 14
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_101_:
	lw	x20, 0(x19)
# was:	lw	_size_99_, 0(_let_arr_80_)
	bge	x15, x20, l.error_100_
# was:	bge	_arr_ind_95_, _size_99_, l.error_100_
	slli	x15, x15, 2
# was:	slli	_arr_ind_95_, _arr_ind_95_, 2
	add	x17, x17, x15
# was:	add	_arr_data_98_, _arr_data_98_, _arr_ind_95_
	lw	x15, 0(x17)
# was:	lw	_minus_R_89_, 0(_arr_data_98_)
	sub	x15, x16, x15
# was:	sub	_fun_arg_res_78_, _minus_L_88_, _minus_R_89_
	j	l.endif_83_
l.else_82_:
	mv	x20, x15
# was:	mv	_arr_ind_104_, _let_i_79_
	addi	x16, x19, 4
# was:	addi	_arr_data_105_, _let_arr_80_, 4
	bge	x20, x0, l.nonneg_108_
# was:	bge	_arr_ind_104_, x0, l.nonneg_108_
l.error_107_:
	li	x10, 16
# was:	li	x10, 16
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_108_:
	lw	x17, 0(x19)
# was:	lw	_size_106_, 0(_let_arr_80_)
	bge	x20, x17, l.error_107_
# was:	bge	_arr_ind_104_, _size_106_, l.error_107_
	slli	x20, x20, 2
# was:	slli	_arr_ind_104_, _arr_ind_104_, 2
	add	x16, x16, x20
# was:	add	_arr_data_105_, _arr_data_105_, _arr_ind_104_
	lw	x16, 0(x16)
# was:	lw	_minus_L_102_, 0(_arr_data_105_)
	mv	x17, x15
# was:	mv	_minus_L_110_, _let_i_79_
	li	x15, 1
# was:	li	_minus_R_111_, 1
	sub	x15, x17, x15
# was:	sub	_arr_ind_109_, _minus_L_110_, _minus_R_111_
	addi	x17, x19, 4
# was:	addi	_arr_data_112_, _let_arr_80_, 4
	bge	x15, x0, l.nonneg_115_
# was:	bge	_arr_ind_109_, x0, l.nonneg_115_
l.error_114_:
	li	x10, 16
# was:	li	x10, 16
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_115_:
	lw	x20, 0(x19)
# was:	lw	_size_113_, 0(_let_arr_80_)
	bge	x15, x20, l.error_114_
# was:	bge	_arr_ind_109_, _size_113_, l.error_114_
	slli	x15, x15, 2
# was:	slli	_arr_ind_109_, _arr_ind_109_, 2
	add	x17, x17, x15
# was:	add	_arr_data_112_, _arr_data_112_, _arr_ind_109_
	lw	x15, 0(x17)
# was:	lw	_minus_R_103_, 0(_arr_data_112_)
	sub	x15, x16, x15
# was:	sub	_fun_arg_res_78_, _minus_L_102_, _minus_R_103_
l.endif_83_:
# 	mv	_res_73_,_fun_arg_res_78_
	sw	x15, 0(x12)
# was:	sw	_res_73_, 0(_addrg_74_)
	addi	x12, x12, 4
# was:	addi	_addrg_74_, _addrg_74_, 4
	addi	x13, x13, 1
# was:	addi	_i_75_, _i_75_, 1
	j	l.loop_beg_76_
l.loop_end_77_:
	mv	x18, x10
# was:	mv	_arr_118_, _let_difs_69_
	lw	x19, 0(x18)
# was:	lw	_size_119_, 0(_arr_118_)
	li	x20, 0
# was:	li	_let_result_117_, 0
	addi	x18, x18, 4
# was:	addi	_arr_118_, _arr_118_, 4
	mv	x21, x0
# was:	mv	_ind_var_120_, x0
l.loop_beg_122_:
	bge	x21, x19, l.loop_end_123_
# was:	bge	_ind_var_120_, _size_119_, l.loop_end_123_
	lw	x10, 0(x18)
# was:	lw	_tmp_121_, 0(_arr_118_)
	addi	x18, x18, 4
# was:	addi	_arr_118_, _arr_118_, 4
# 	mv	_plus_L_125_,_let_result_117_
# 	mv	_arg_127_,_tmp_121_
	mv	x11, x10
# was:	mv	_arg_128_, _tmp_121_
# 	mv	x10,_arg_127_
# 	mv	x11,_arg_128_
	jal	f.mul
# was:	jal	f.mul, x10 x11
# 	mv	_plus_R_126_,x10
	add	x20, x20, x10
# was:	add	_fun_arg_res_124_, _plus_L_125_, _plus_R_126_
# 	mv	_let_result_117_,_fun_arg_res_124_
	addi	x21, x21, 1
# was:	addi	_ind_var_120_, _ind_var_120_, 1
	j	l.loop_beg_122_
l.loop_end_123_:
	mv	x18, x20
# was:	mv	_tmp_129_, _let_result_117_
# 	mv	_mainres_31_,_tmp_129_
	mv	x10, x18
# was:	mv	x10, _mainres_31_
	jal	p.putint
# was:	jal	p.putint, x10
l.endif_35_:
	mv	x10, x18
# was:	mv	x10, _mainres_31_
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
s.Incorre_41_:
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