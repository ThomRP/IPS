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
# 	mv	_minus_L_5_,_param_a_1_
	mv	x12, x11
# was:	mv	_divide_L_7_, _param_b_2_
# 	mv	_divide_R_8_,_param_b_2_
	bne	x11, x0, l.safe_9_
# was:	bne	_divide_R_8_, x0, l.safe_9_
	li	x10, 1
# was:	li	x10, 1
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.safe_9_:
	div	x11, x12, x11
# was:	div	_minus_R_6_, _divide_L_7_, _divide_R_8_
	sub	x10, x10, x11
# was:	sub	_NEGATE_exp_4_, _minus_L_5_, _minus_R_6_
	sub	x10, x0, x10
# was:	sub	_fun1res_3_, x0, _NEGATE_exp_4_
# 	mv	x10,_fun1res_3_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function fun2
f.fun2:
	sw	x1, -4(x2)
	addi	x2, x2, -4
# 	mv	_param_a_10_,x10
# 	mv	_param_b_11_,x11
# 	mv	_minus_L_13_,_param_a_10_
# 	mv	_times_L_15_,_param_b_11_
	mv	x12, x10
# was:	mv	_times_R_16_, _param_a_10_
	mul	x11, x11, x12
# was:	mul	_minus_R_14_, _times_L_15_, _times_R_16_
	sub	x10, x10, x11
# was:	sub	_fun2res_12_, _minus_L_13_, _minus_R_14_
# 	mv	x10,_fun2res_12_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function writeInt
f.writeInt:
	sw	x1, -4(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -8
# 	mv	_param_n_17_,x10
	mv	x18, x10
# was:	mv	_tmp_19_, _param_n_17_
# 	mv	_writeIntres_18_,_tmp_19_
	mv	x10, x18
# was:	mv	x10, _writeIntres_18_
	jal	p.putint
# was:	jal	p.putint, x10
	mv	x10, x18
# was:	mv	x10, _writeIntres_18_
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
	li	x10, 3
# was:	li	_size_22_, 3
	mv	x19, x3
# was:	mv	_let_a_21_, x3
	slli	x11, x10, 2
# was:	slli	_tmp_25_, _size_22_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_25_, _tmp_25_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_25_
	sw	x10, 0(x19)
# was:	sw	_size_22_, 0(_let_a_21_)
	addi	x10, x19, 4
# was:	addi	_addr_23_, _let_a_21_, 4
	li	x11, 1
# was:	li	_tmp_24_, 1
	sw	x11, 0(x10)
# was:	sw	_tmp_24_, 0(_addr_23_)
	addi	x10, x10, 4
# was:	addi	_addr_23_, _addr_23_, 4
	li	x11, 2
# was:	li	_tmp_24_, 2
	sw	x11, 0(x10)
# was:	sw	_tmp_24_, 0(_addr_23_)
	addi	x10, x10, 4
# was:	addi	_addr_23_, _addr_23_, 4
	li	x11, 3
# was:	li	_tmp_24_, 3
	sw	x11, 0(x10)
# was:	sw	_tmp_24_, 0(_addr_23_)
	addi	x10, x10, 4
# was:	addi	_addr_23_, _addr_23_, 4
	mv	x21, x19
# was:	mv	_arr_27_, _let_a_21_
	lw	x18, 0(x21)
# was:	lw	_size_28_, 0(_arr_27_)
	mv	x20, x3
# was:	mv	_let_b_26_, x3
	slli	x10, x18, 2
# was:	slli	_tmp_43_, _size_28_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_43_, _tmp_43_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_43_
	sw	x18, 0(x20)
# was:	sw	_size_28_, 0(_let_b_26_)
	li	x11, 0
# was:	li	_minus_L_39_, 0
	li	x10, 10
# was:	li	_minus_R_40_, 10
	sub	x11, x11, x10
# was:	sub	_plus_L_37_, _minus_L_39_, _minus_R_40_
	li	x10, 12
# was:	li	_plus_R_38_, 12
	add	x11, x11, x10
# was:	add	_divide_L_35_, _plus_L_37_, _plus_R_38_
	li	x10, 2
# was:	li	_divide_R_36_, 2
	bne	x10, x0, l.safe_41_
# was:	bne	_divide_R_36_, x0, l.safe_41_
	li	x10, 8
# was:	li	x10, 8
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.safe_41_:
	div	x10, x11, x10
# was:	div	_tmp2_31_, _divide_L_35_, _divide_R_36_
	addi	x23, x20, 4
# was:	addi	_addrg_34_, _let_b_26_, 4
	addi	x21, x21, 4
# was:	addi	_arr_27_, _arr_27_, 4
	mv	x22, x0
# was:	mv	_ind_var_29_, x0
l.loop_beg_32_:
	bge	x22, x18, l.loop_end_33_
# was:	bge	_ind_var_29_, _size_28_, l.loop_end_33_
	lw	x11, 0(x21)
# was:	lw	_tmp1_30_, 0(_arr_27_)
	addi	x21, x21, 4
# was:	addi	_arr_27_, _arr_27_, 4
# 	mv	x10,_tmp2_31_
# 	mv	x11,_tmp1_30_
	jal	f.fun1
# was:	jal	f.fun1, x10 x11
# 	mv	_tmp_42_,x10
# 	mv	_tmp2_31_,_tmp_42_
	sw	x10, 0(x23)
# was:	sw	_tmp2_31_, 0(_addrg_34_)
	addi	x23, x23, 4
# was:	addi	_addrg_34_, _addrg_34_, 4
	addi	x22, x22, 1
# was:	addi	_ind_var_29_, _ind_var_29_, 1
	j	l.loop_beg_32_
l.loop_end_33_:
# 	mv	_arr_45_,_let_a_21_
	lw	x21, 0(x19)
# was:	lw	_size_46_, 0(_arr_45_)
	mv	x18, x3
# was:	mv	_let_c_44_, x3
	slli	x10, x21, 2
# was:	slli	_tmp_59_, _size_46_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_59_, _tmp_59_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_59_
	sw	x21, 0(x18)
# was:	sw	_size_46_, 0(_let_c_44_)
	li	x11, 0
# was:	li	_minus_L_56_, 0
	li	x10, 1
# was:	li	_minus_R_57_, 1
	sub	x10, x11, x10
# was:	sub	_NEGATE_exp_55_, _minus_L_56_, _minus_R_57_
	sub	x11, x0, x10
# was:	sub	_times_L_53_, x0, _NEGATE_exp_55_
	li	x10, 2
# was:	li	_times_R_54_, 2
	mul	x10, x11, x10
# was:	mul	_tmp2_49_, _times_L_53_, _times_R_54_
	addi	x23, x18, 4
# was:	addi	_addrg_52_, _let_c_44_, 4
	addi	x19, x19, 4
# was:	addi	_arr_45_, _arr_45_, 4
	mv	x22, x0
# was:	mv	_ind_var_47_, x0
l.loop_beg_50_:
	bge	x22, x21, l.loop_end_51_
# was:	bge	_ind_var_47_, _size_46_, l.loop_end_51_
	lw	x11, 0(x19)
# was:	lw	_tmp1_48_, 0(_arr_45_)
	addi	x19, x19, 4
# was:	addi	_arr_45_, _arr_45_, 4
# 	mv	x10,_tmp2_49_
# 	mv	x11,_tmp1_48_
	jal	f.fun2
# was:	jal	f.fun2, x10 x11
# 	mv	_tmp_58_,x10
# 	mv	_tmp2_49_,_tmp_58_
	sw	x10, 0(x23)
# was:	sw	_tmp2_49_, 0(_addrg_52_)
	addi	x23, x23, 4
# was:	addi	_addrg_52_, _addrg_52_, 4
	addi	x22, x22, 1
# was:	addi	_ind_var_47_, _ind_var_47_, 1
	j	l.loop_beg_50_
l.loop_end_51_:
	li	x11, 1
# was:	li	_size_69_, 1
	mv	x22, x3
# was:	mv	_arr_61_, x3
	slli	x10, x11, 2
# was:	slli	_tmp_72_, _size_69_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_72_, _tmp_72_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_72_
	sw	x11, 0(x22)
# was:	sw	_size_69_, 0(_arr_61_)
	addi	x11, x22, 4
# was:	addi	_addr_70_, _arr_61_, 4
	li	x10, 3
# was:	li	_tmp_71_, 3
	sw	x10, 0(x11)
# was:	sw	_tmp_71_, 0(_addr_70_)
	addi	x11, x11, 4
# was:	addi	_addr_70_, _addr_70_, 4
	lw	x23, 0(x22)
# was:	lw	_size_62_, 0(_arr_61_)
	mv	x19, x3
# was:	mv	_let_d_60_, x3
	slli	x10, x23, 2
# was:	slli	_tmp_74_, _size_62_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_74_, _tmp_74_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_74_
	sw	x23, 0(x19)
# was:	sw	_size_62_, 0(_let_d_60_)
	li	x10, 1
# was:	li	_tmp2_65_, 1
	addi	x24, x19, 4
# was:	addi	_addrg_68_, _let_d_60_, 4
	addi	x22, x22, 4
# was:	addi	_arr_61_, _arr_61_, 4
	mv	x21, x0
# was:	mv	_ind_var_63_, x0
l.loop_beg_66_:
	bge	x21, x23, l.loop_end_67_
# was:	bge	_ind_var_63_, _size_62_, l.loop_end_67_
	lw	x11, 0(x22)
# was:	lw	_tmp1_64_, 0(_arr_61_)
	addi	x22, x22, 4
# was:	addi	_arr_61_, _arr_61_, 4
# 	mv	x10,_tmp2_65_
# 	mv	x11,_tmp1_64_
	jal	f.fun1
# was:	jal	f.fun1, x10 x11
# 	mv	_tmp_73_,x10
# 	mv	_tmp2_65_,_tmp_73_
	sw	x10, 0(x24)
# was:	sw	_tmp2_65_, 0(_addrg_68_)
	addi	x24, x24, 4
# was:	addi	_addrg_68_, _addrg_68_, 4
	addi	x21, x21, 1
# was:	addi	_ind_var_63_, _ind_var_63_, 1
	j	l.loop_beg_66_
l.loop_end_67_:
	li	x11, 0
# was:	li	_size_76_, 0
	bge	x11, x0, l.safe_77_
# was:	bge	_size_76_, x0, l.safe_77_
	li	x10, 11
# was:	li	x10, 11
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_77_:
	mv	x23, x3
# was:	mv	_let_e1_75_, x3
	slli	x10, x11, 2
# was:	slli	_tmp_82_, _size_76_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_82_, _tmp_82_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_82_
	sw	x11, 0(x23)
# was:	sw	_size_76_, 0(_let_e1_75_)
	addi	x12, x23, 4
# was:	addi	_addr_78_, _let_e1_75_, 4
	mv	x10, x0
# was:	mv	_i_79_, x0
l.loop_beg_80_:
	bge	x10, x11, l.loop_end_81_
# was:	bge	_i_79_, _size_76_, l.loop_end_81_
	sw	x10, 0(x12)
# was:	sw	_i_79_, 0(_addr_78_)
	addi	x12, x12, 4
# was:	addi	_addr_78_, _addr_78_, 4
	addi	x10, x10, 1
# was:	addi	_i_79_, _i_79_, 1
	j	l.loop_beg_80_
l.loop_end_81_:
# 	mv	_arr_84_,_let_e1_75_
	lw	x22, 0(x23)
# was:	lw	_size_85_, 0(_arr_84_)
	mv	x21, x3
# was:	mv	_let_e_83_, x3
	slli	x10, x22, 2
# was:	slli	_tmp_93_, _size_85_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_93_, _tmp_93_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_93_
	sw	x22, 0(x21)
# was:	sw	_size_85_, 0(_let_e_83_)
	li	x10, 1
# was:	li	_tmp2_88_, 1
	addi	x25, x21, 4
# was:	addi	_addrg_91_, _let_e_83_, 4
	addi	x23, x23, 4
# was:	addi	_arr_84_, _arr_84_, 4
	mv	x24, x0
# was:	mv	_ind_var_86_, x0
l.loop_beg_89_:
	bge	x24, x22, l.loop_end_90_
# was:	bge	_ind_var_86_, _size_85_, l.loop_end_90_
	lw	x11, 0(x23)
# was:	lw	_tmp1_87_, 0(_arr_84_)
	addi	x23, x23, 4
# was:	addi	_arr_84_, _arr_84_, 4
# 	mv	x10,_tmp2_88_
# 	mv	x11,_tmp1_87_
	jal	f.fun1
# was:	jal	f.fun1, x10 x11
# 	mv	_tmp_92_,x10
# 	mv	_tmp2_88_,_tmp_92_
	sw	x10, 0(x25)
# was:	sw	_tmp2_88_, 0(_addrg_91_)
	addi	x25, x25, 4
# was:	addi	_addrg_91_, _addrg_91_, 4
	addi	x24, x24, 1
# was:	addi	_ind_var_86_, _ind_var_86_, 1
	j	l.loop_beg_89_
l.loop_end_90_:
	mv	x10, x20
# was:	mv	_arr_96_, _let_b_26_
	lw	x20, 0(x10)
# was:	lw	_size_95_, 0(_arr_96_)
	mv	x12, x3
# was:	mv	_let_tmp_94_, x3
	slli	x11, x20, 2
# was:	slli	_tmp_104_, _size_95_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_104_, _tmp_104_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_104_
	sw	x20, 0(x12)
# was:	sw	_size_95_, 0(_let_tmp_94_)
	addi	x23, x12, 4
# was:	addi	_addrg_99_, _let_tmp_94_, 4
	mv	x22, x0
# was:	mv	_i_100_, x0
	addi	x24, x10, 4
# was:	addi	_elem_97_, _arr_96_, 4
l.loop_beg_101_:
	bge	x22, x20, l.loop_end_102_
# was:	bge	_i_100_, _size_95_, l.loop_end_102_
	lw	x10, 0(x24)
# was:	lw	_res_98_, 0(_elem_97_)
	addi	x24, x24, 4
# was:	addi	_elem_97_, _elem_97_, 4
# 	mv	x10,_res_98_
	jal	f.writeInt
# was:	jal	f.writeInt, x10
# 	mv	_tmp_103_,x10
# 	mv	_res_98_,_tmp_103_
	sw	x10, 0(x23)
# was:	sw	_res_98_, 0(_addrg_99_)
	addi	x23, x23, 4
# was:	addi	_addrg_99_, _addrg_99_, 4
	addi	x22, x22, 1
# was:	addi	_i_100_, _i_100_, 1
	j	l.loop_beg_101_
l.loop_end_102_:
	mv	x10, x18
# was:	mv	_arr_107_, _let_c_44_
	lw	x20, 0(x10)
# was:	lw	_size_106_, 0(_arr_107_)
	mv	x12, x3
# was:	mv	_let_tmp2_105_, x3
	slli	x11, x20, 2
# was:	slli	_tmp_115_, _size_106_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_115_, _tmp_115_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_115_
	sw	x20, 0(x12)
# was:	sw	_size_106_, 0(_let_tmp2_105_)
	addi	x18, x12, 4
# was:	addi	_addrg_110_, _let_tmp2_105_, 4
	mv	x22, x0
# was:	mv	_i_111_, x0
	addi	x23, x10, 4
# was:	addi	_elem_108_, _arr_107_, 4
l.loop_beg_112_:
	bge	x22, x20, l.loop_end_113_
# was:	bge	_i_111_, _size_106_, l.loop_end_113_
	lw	x10, 0(x23)
# was:	lw	_res_109_, 0(_elem_108_)
	addi	x23, x23, 4
# was:	addi	_elem_108_, _elem_108_, 4
# 	mv	x10,_res_109_
	jal	f.writeInt
# was:	jal	f.writeInt, x10
# 	mv	_tmp_114_,x10
# 	mv	_res_109_,_tmp_114_
	sw	x10, 0(x18)
# was:	sw	_res_109_, 0(_addrg_110_)
	addi	x18, x18, 4
# was:	addi	_addrg_110_, _addrg_110_, 4
	addi	x22, x22, 1
# was:	addi	_i_111_, _i_111_, 1
	j	l.loop_beg_112_
l.loop_end_113_:
	mv	x10, x19
# was:	mv	_arr_118_, _let_d_60_
	lw	x18, 0(x10)
# was:	lw	_size_117_, 0(_arr_118_)
	mv	x11, x3
# was:	mv	_let_tmp3_116_, x3
	slli	x12, x18, 2
# was:	slli	_tmp_126_, _size_117_, 2
	addi	x12, x12, 4
# was:	addi	_tmp_126_, _tmp_126_, 4
	add	x3, x3, x12
# was:	add	x3, x3, _tmp_126_
	sw	x18, 0(x11)
# was:	sw	_size_117_, 0(_let_tmp3_116_)
	addi	x19, x11, 4
# was:	addi	_addrg_121_, _let_tmp3_116_, 4
	mv	x20, x0
# was:	mv	_i_122_, x0
	addi	x22, x10, 4
# was:	addi	_elem_119_, _arr_118_, 4
l.loop_beg_123_:
	bge	x20, x18, l.loop_end_124_
# was:	bge	_i_122_, _size_117_, l.loop_end_124_
	lw	x10, 0(x22)
# was:	lw	_res_120_, 0(_elem_119_)
	addi	x22, x22, 4
# was:	addi	_elem_119_, _elem_119_, 4
# 	mv	x10,_res_120_
	jal	f.writeInt
# was:	jal	f.writeInt, x10
# 	mv	_tmp_125_,x10
# 	mv	_res_120_,_tmp_125_
	sw	x10, 0(x19)
# was:	sw	_res_120_, 0(_addrg_121_)
	addi	x19, x19, 4
# was:	addi	_addrg_121_, _addrg_121_, 4
	addi	x20, x20, 1
# was:	addi	_i_122_, _i_122_, 1
	j	l.loop_beg_123_
l.loop_end_124_:
	mv	x10, x21
# was:	mv	_arr_128_, _let_e_83_
	lw	x18, 0(x10)
# was:	lw	_size_127_, 0(_arr_128_)
	mv	x19, x3
# was:	mv	_mainres_20_, x3
	slli	x11, x18, 2
# was:	slli	_tmp_136_, _size_127_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_136_, _tmp_136_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_136_
	sw	x18, 0(x19)
# was:	sw	_size_127_, 0(_mainres_20_)
	addi	x20, x19, 4
# was:	addi	_addrg_131_, _mainres_20_, 4
	mv	x21, x0
# was:	mv	_i_132_, x0
	addi	x22, x10, 4
# was:	addi	_elem_129_, _arr_128_, 4
l.loop_beg_133_:
	bge	x21, x18, l.loop_end_134_
# was:	bge	_i_132_, _size_127_, l.loop_end_134_
	lw	x10, 0(x22)
# was:	lw	_res_130_, 0(_elem_129_)
	addi	x22, x22, 4
# was:	addi	_elem_129_, _elem_129_, 4
# 	mv	x10,_res_130_
	jal	f.writeInt
# was:	jal	f.writeInt, x10
# 	mv	_tmp_135_,x10
# 	mv	_res_130_,_tmp_135_
	sw	x10, 0(x20)
# was:	sw	_res_130_, 0(_addrg_131_)
	addi	x20, x20, 4
# was:	addi	_addrg_131_, _addrg_131_, 4
	addi	x21, x21, 1
# was:	addi	_i_132_, _i_132_, 1
	j	l.loop_beg_133_
l.loop_end_134_:
	mv	x10, x19
# was:	mv	x10, _mainres_20_
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