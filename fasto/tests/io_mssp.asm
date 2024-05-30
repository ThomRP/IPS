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
	li	x11, 8
# was:	li	_size_5_, 8
	bge	x11, x0, l.safe_6_
# was:	bge	_size_5_, x0, l.safe_6_
	li	x10, 10
# was:	li	x10, 10
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_6_:
	mv	x12, x3
# was:	mv	_let_itsp_4_, x3
	slli	x10, x11, 2
# was:	slli	_tmp_11_, _size_5_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_11_, _tmp_11_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_11_
	sw	x11, 0(x12)
# was:	sw	_size_5_, 0(_let_itsp_4_)
	addi	x10, x12, 4
# was:	addi	_addr_7_, _let_itsp_4_, 4
	mv	x13, x0
# was:	mv	_i_8_, x0
l.loop_beg_9_:
	bge	x13, x11, l.loop_end_10_
# was:	bge	_i_8_, _size_5_, l.loop_end_10_
	sw	x13, 0(x10)
# was:	sw	_i_8_, 0(_addr_7_)
	addi	x10, x10, 4
# was:	addi	_addr_7_, _addr_7_, 4
	addi	x13, x13, 1
# was:	addi	_i_8_, _i_8_, 1
	j	l.loop_beg_9_
l.loop_end_10_:
	mv	x10, x12
# was:	mv	_arr_13_, _let_itsp_4_
	lw	x18, 0(x10)
# was:	lw	_size_12_, 0(_arr_13_)
	mv	x19, x3
# was:	mv	_let_in_arr_3_, x3
	slli	x11, x18, 2
# was:	slli	_tmp_33_, _size_12_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_33_, _tmp_33_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_33_
	sw	x18, 0(x19)
# was:	sw	_size_12_, 0(_let_in_arr_3_)
	addi	x21, x19, 4
# was:	addi	_addrg_16_, _let_in_arr_3_, 4
	mv	x20, x0
# was:	mv	_i_17_, x0
	addi	x22, x10, 4
# was:	addi	_elem_14_, _arr_13_, 4
l.loop_beg_18_:
	bge	x20, x18, l.loop_end_19_
# was:	bge	_i_17_, _size_12_, l.loop_end_19_
	lw	x23, 0(x22)
# was:	lw	_res_15_, 0(_elem_14_)
	addi	x22, x22, 4
# was:	addi	_elem_14_, _elem_14_, 4
	la	x10, s.Introdu_23_
# was:	la	_tmp_22_, s.Introdu_23_
# s.Introdu_23_: string "Introduce number "
# 	mv	_let_t_21_,_tmp_22_
# 	mv	x10,_tmp_22_
	jal	p.putstring
# was:	jal	p.putstring, x10
# 	mv	_tmp_25_,_res_15_
	mv	x10, x23
# was:	mv	_let_t_24_, _tmp_25_
# 	mv	x10,_let_t_24_
	jal	p.putint
# was:	jal	p.putint, x10
	la	x10, s.XX_28_
# was:	la	_tmp_27_, s.XX_28_
# s.XX_28_: string ": "
# 	mv	_let_t_26_,_tmp_27_
# 	mv	x10,_tmp_27_
	jal	p.putstring
# was:	jal	p.putstring, x10
	jal	p.getint
# was:	jal	p.getint, 
	mv	x23, x10
# was:	mv	_let_m_29_, x10
	la	x10, s.X_32_
# was:	la	_tmp_31_, s.X_32_
# s.X_32_: string "\n"
# 	mv	_let_t_30_,_tmp_31_
# 	mv	x10,_tmp_31_
	jal	p.putstring
# was:	jal	p.putstring, x10
# 	mv	_fun_arg_res_20_,_let_m_29_
# 	mv	_res_15_,_fun_arg_res_20_
	sw	x23, 0(x21)
# was:	sw	_res_15_, 0(_addrg_16_)
	addi	x21, x21, 4
# was:	addi	_addrg_16_, _addrg_16_, 4
	addi	x20, x20, 1
# was:	addi	_i_17_, _i_17_, 1
	j	l.loop_beg_18_
l.loop_end_19_:
# 	mv	_arr_36_,_let_in_arr_3_
	lw	x14, 0(x19)
# was:	lw	_size_35_, 0(_arr_36_)
	mv	x13, x3
# was:	mv	_let_map_arr_34_, x3
	slli	x10, x14, 2
# was:	slli	_tmp_59_, _size_35_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_59_, _tmp_59_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_59_
	sw	x14, 0(x13)
# was:	sw	_size_35_, 0(_let_map_arr_34_)
	addi	x16, x13, 4
# was:	addi	_addrg_39_, _let_map_arr_34_, 4
	mv	x15, x0
# was:	mv	_i_40_, x0
	addi	x17, x19, 4
# was:	addi	_elem_37_, _arr_36_, 4
l.loop_beg_41_:
	bge	x15, x14, l.loop_end_42_
# was:	bge	_i_40_, _size_35_, l.loop_end_42_
	lw	x12, 0(x17)
# was:	lw	_res_38_, 0(_elem_37_)
	addi	x17, x17, 4
# was:	addi	_elem_37_, _elem_37_, 4
# 	mv	_let_x_I14_45_,_res_38_
	li	x11, 0
# was:	li	_let_y_I14_46_, 0
	mv	x18, x12
# was:	mv	_let_x_47_, _let_x_I14_45_
# 	mv	_let_y_48_,_let_y_I14_46_
# 	mv	_lt_L_53_,_let_x_47_
# 	mv	_lt_R_54_,_let_y_48_
	slt	x10, x18, x11
# was:	slt	_cond_52_, _lt_L_53_, _lt_R_54_
	bne	x10, x0, l.then_49_
# was:	bne	_cond_52_, x0, l.then_49_
	j	l.else_50_
l.then_49_:
	mv	x18, x11
# was:	mv	_let_xm_44_, _let_y_48_
	j	l.endif_51_
l.else_50_:
# 	mv	_let_xm_44_,_let_x_47_
l.endif_51_:
	li	x10, 4
# was:	li	_size_55_, 4
	mv	x19, x3
# was:	mv	_fun_arg_res_43_, x3
	slli	x11, x10, 2
# was:	slli	_tmp_58_, _size_55_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_58_, _tmp_58_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_58_
	sw	x10, 0(x19)
# was:	sw	_size_55_, 0(_fun_arg_res_43_)
	addi	x10, x19, 4
# was:	addi	_addr_56_, _fun_arg_res_43_, 4
# 	mv	_tmp_57_,_let_xm_44_
	sw	x18, 0(x10)
# was:	sw	_tmp_57_, 0(_addr_56_)
	addi	x10, x10, 4
# was:	addi	_addr_56_, _addr_56_, 4
# 	mv	_tmp_57_,_let_xm_44_
	sw	x18, 0(x10)
# was:	sw	_tmp_57_, 0(_addr_56_)
	addi	x10, x10, 4
# was:	addi	_addr_56_, _addr_56_, 4
# 	mv	_tmp_57_,_let_xm_44_
	sw	x18, 0(x10)
# was:	sw	_tmp_57_, 0(_addr_56_)
	addi	x10, x10, 4
# was:	addi	_addr_56_, _addr_56_, 4
	mv	x18, x12
# was:	mv	_tmp_57_, _res_38_
	sw	x18, 0(x10)
# was:	sw	_tmp_57_, 0(_addr_56_)
	addi	x10, x10, 4
# was:	addi	_addr_56_, _addr_56_, 4
	mv	x12, x19
# was:	mv	_res_38_, _fun_arg_res_43_
	sw	x12, 0(x16)
# was:	sw	_res_38_, 0(_addrg_39_)
	addi	x16, x16, 4
# was:	addi	_addrg_39_, _addrg_39_, 4
	addi	x15, x15, 1
# was:	addi	_i_40_, _i_40_, 1
	j	l.loop_beg_41_
l.loop_end_42_:
	li	x11, 4
# was:	li	_size_61_, 4
	mv	x18, x3
# was:	mv	_let_ne_60_, x3
	slli	x10, x11, 2
# was:	slli	_tmp_64_, _size_61_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_64_, _tmp_64_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_64_
	sw	x11, 0(x18)
# was:	sw	_size_61_, 0(_let_ne_60_)
	addi	x11, x18, 4
# was:	addi	_addr_62_, _let_ne_60_, 4
	li	x10, 0
# was:	li	_tmp_63_, 0
	sw	x10, 0(x11)
# was:	sw	_tmp_63_, 0(_addr_62_)
	addi	x11, x11, 4
# was:	addi	_addr_62_, _addr_62_, 4
	li	x10, 0
# was:	li	_tmp_63_, 0
	sw	x10, 0(x11)
# was:	sw	_tmp_63_, 0(_addr_62_)
	addi	x11, x11, 4
# was:	addi	_addr_62_, _addr_62_, 4
	li	x10, 0
# was:	li	_tmp_63_, 0
	sw	x10, 0(x11)
# was:	sw	_tmp_63_, 0(_addr_62_)
	addi	x11, x11, 4
# was:	addi	_addr_62_, _addr_62_, 4
	li	x10, 0
# was:	li	_tmp_63_, 0
	sw	x10, 0(x11)
# was:	sw	_tmp_63_, 0(_addr_62_)
	addi	x11, x11, 4
# was:	addi	_addr_62_, _addr_62_, 4
	mv	x11, x13
# was:	mv	_arr_65_, _let_map_arr_34_
	lw	x10, 0(x11)
# was:	lw	_size_66_, 0(_arr_65_)
# 	mv	_let_arr_2_,_let_ne_60_
	addi	x11, x11, 4
# was:	addi	_arr_65_, _arr_65_, 4
	mv	x12, x0
# was:	mv	_ind_var_67_, x0
l.loop_beg_69_:
	bge	x12, x10, l.loop_end_70_
# was:	bge	_ind_var_67_, _size_66_, l.loop_end_70_
	lw	x14, 0(x11)
# was:	lw	_tmp_68_, 0(_arr_65_)
	addi	x11, x11, 4
# was:	addi	_arr_65_, _arr_65_, 4
	li	x13, 0
# was:	li	_arr_ind_75_, 0
	addi	x15, x18, 4
# was:	addi	_arr_data_76_, _let_arr_2_, 4
	bge	x13, x0, l.nonneg_79_
# was:	bge	_arr_ind_75_, x0, l.nonneg_79_
l.error_78_:
	li	x10, 28
# was:	li	x10, 28
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_79_:
	lw	x16, 0(x18)
# was:	lw	_size_77_, 0(_let_arr_2_)
	bge	x13, x16, l.error_78_
# was:	bge	_arr_ind_75_, _size_77_, l.error_78_
	slli	x13, x13, 2
# was:	slli	_arr_ind_75_, _arr_ind_75_, 2
	add	x15, x15, x13
# was:	add	_arr_data_76_, _arr_data_76_, _arr_ind_75_
	lw	x16, 0(x15)
# was:	lw	_let_x_I16_74_, 0(_arr_data_76_)
	li	x15, 0
# was:	li	_arr_ind_81_, 0
	addi	x17, x14, 4
# was:	addi	_arr_data_82_, _tmp_68_, 4
	bge	x15, x0, l.nonneg_85_
# was:	bge	_arr_ind_81_, x0, l.nonneg_85_
l.error_84_:
	li	x10, 28
# was:	li	x10, 28
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_85_:
	lw	x13, 0(x14)
# was:	lw	_size_83_, 0(_tmp_68_)
	bge	x15, x13, l.error_84_
# was:	bge	_arr_ind_81_, _size_83_, l.error_84_
	slli	x15, x15, 2
# was:	slli	_arr_ind_81_, _arr_ind_81_, 2
	add	x17, x17, x15
# was:	add	_arr_data_82_, _arr_data_82_, _arr_ind_81_
	lw	x15, 0(x17)
# was:	lw	_let_y_I16_80_, 0(_arr_data_82_)
	mv	x13, x16
# was:	mv	_let_x_86_, _let_x_I16_74_
# 	mv	_let_y_87_,_let_y_I16_80_
# 	mv	_lt_L_92_,_let_x_86_
# 	mv	_lt_R_93_,_let_y_87_
	slt	x16, x13, x15
# was:	slt	_cond_91_, _lt_L_92_, _lt_R_93_
	bne	x16, x0, l.then_88_
# was:	bne	_cond_91_, x0, l.then_88_
	j	l.else_89_
l.then_88_:
	mv	x13, x15
# was:	mv	_let_x_I15_73_, _let_y_87_
	j	l.endif_90_
l.else_89_:
# 	mv	_let_x_I15_73_,_let_x_86_
l.endif_90_:
	li	x15, 2
# was:	li	_arr_ind_97_, 2
	addi	x17, x18, 4
# was:	addi	_arr_data_98_, _let_arr_2_, 4
	bge	x15, x0, l.nonneg_101_
# was:	bge	_arr_ind_97_, x0, l.nonneg_101_
l.error_100_:
	li	x10, 28
# was:	li	x10, 28
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_101_:
	lw	x16, 0(x18)
# was:	lw	_size_99_, 0(_let_arr_2_)
	bge	x15, x16, l.error_100_
# was:	bge	_arr_ind_97_, _size_99_, l.error_100_
	slli	x15, x15, 2
# was:	slli	_arr_ind_97_, _arr_ind_97_, 2
	add	x17, x17, x15
# was:	add	_arr_data_98_, _arr_data_98_, _arr_ind_97_
	lw	x15, 0(x17)
# was:	lw	_plus_L_95_, 0(_arr_data_98_)
	li	x17, 1
# was:	li	_arr_ind_102_, 1
	addi	x16, x14, 4
# was:	addi	_arr_data_103_, _tmp_68_, 4
	bge	x17, x0, l.nonneg_106_
# was:	bge	_arr_ind_102_, x0, l.nonneg_106_
l.error_105_:
	li	x10, 28
# was:	li	x10, 28
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_106_:
	lw	x19, 0(x14)
# was:	lw	_size_104_, 0(_tmp_68_)
	bge	x17, x19, l.error_105_
# was:	bge	_arr_ind_102_, _size_104_, l.error_105_
	slli	x17, x17, 2
# was:	slli	_arr_ind_102_, _arr_ind_102_, 2
	add	x16, x16, x17
# was:	add	_arr_data_103_, _arr_data_103_, _arr_ind_102_
	lw	x16, 0(x16)
# was:	lw	_plus_R_96_, 0(_arr_data_103_)
	add	x16, x15, x16
# was:	add	_let_y_I15_94_, _plus_L_95_, _plus_R_96_
	mv	x15, x13
# was:	mv	_let_x_107_, _let_x_I15_73_
	mv	x13, x16
# was:	mv	_let_y_108_, _let_y_I15_94_
# 	mv	_lt_L_113_,_let_x_107_
# 	mv	_lt_R_114_,_let_y_108_
	slt	x16, x15, x13
# was:	slt	_cond_112_, _lt_L_113_, _lt_R_114_
	bne	x16, x0, l.then_109_
# was:	bne	_cond_112_, x0, l.then_109_
	j	l.else_110_
l.then_109_:
# 	mv	_let_mss_72_,_let_y_108_
	j	l.endif_111_
l.else_110_:
	mv	x13, x15
# was:	mv	_let_mss_72_, _let_x_107_
l.endif_111_:
	li	x15, 1
# was:	li	_arr_ind_117_, 1
	addi	x17, x18, 4
# was:	addi	_arr_data_118_, _let_arr_2_, 4
	bge	x15, x0, l.nonneg_121_
# was:	bge	_arr_ind_117_, x0, l.nonneg_121_
l.error_120_:
	li	x10, 29
# was:	li	x10, 29
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_121_:
	lw	x16, 0(x18)
# was:	lw	_size_119_, 0(_let_arr_2_)
	bge	x15, x16, l.error_120_
# was:	bge	_arr_ind_117_, _size_119_, l.error_120_
	slli	x15, x15, 2
# was:	slli	_arr_ind_117_, _arr_ind_117_, 2
	add	x17, x17, x15
# was:	add	_arr_data_118_, _arr_data_118_, _arr_ind_117_
	lw	x15, 0(x17)
# was:	lw	_let_x_I17_116_, 0(_arr_data_118_)
	li	x19, 3
# was:	li	_arr_ind_125_, 3
	addi	x16, x18, 4
# was:	addi	_arr_data_126_, _let_arr_2_, 4
	bge	x19, x0, l.nonneg_129_
# was:	bge	_arr_ind_125_, x0, l.nonneg_129_
l.error_128_:
	li	x10, 29
# was:	li	x10, 29
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_129_:
	lw	x17, 0(x18)
# was:	lw	_size_127_, 0(_let_arr_2_)
	bge	x19, x17, l.error_128_
# was:	bge	_arr_ind_125_, _size_127_, l.error_128_
	slli	x19, x19, 2
# was:	slli	_arr_ind_125_, _arr_ind_125_, 2
	add	x16, x16, x19
# was:	add	_arr_data_126_, _arr_data_126_, _arr_ind_125_
	lw	x20, 0(x16)
# was:	lw	_plus_L_123_, 0(_arr_data_126_)
	li	x19, 1
# was:	li	_arr_ind_130_, 1
	addi	x17, x14, 4
# was:	addi	_arr_data_131_, _tmp_68_, 4
	bge	x19, x0, l.nonneg_134_
# was:	bge	_arr_ind_130_, x0, l.nonneg_134_
l.error_133_:
	li	x10, 29
# was:	li	x10, 29
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_134_:
	lw	x16, 0(x14)
# was:	lw	_size_132_, 0(_tmp_68_)
	bge	x19, x16, l.error_133_
# was:	bge	_arr_ind_130_, _size_132_, l.error_133_
	slli	x19, x19, 2
# was:	slli	_arr_ind_130_, _arr_ind_130_, 2
	add	x17, x17, x19
# was:	add	_arr_data_131_, _arr_data_131_, _arr_ind_130_
	lw	x16, 0(x17)
# was:	lw	_plus_R_124_, 0(_arr_data_131_)
	add	x17, x20, x16
# was:	add	_let_y_I17_122_, _plus_L_123_, _plus_R_124_
	mv	x16, x15
# was:	mv	_let_x_135_, _let_x_I17_116_
	mv	x15, x17
# was:	mv	_let_y_136_, _let_y_I17_122_
# 	mv	_lt_L_141_,_let_x_135_
# 	mv	_lt_R_142_,_let_y_136_
	slt	x17, x16, x15
# was:	slt	_cond_140_, _lt_L_141_, _lt_R_142_
	bne	x17, x0, l.then_137_
# was:	bne	_cond_140_, x0, l.then_137_
	j	l.else_138_
l.then_137_:
# 	mv	_let_mis_115_,_let_y_136_
	j	l.endif_139_
l.else_138_:
	mv	x15, x16
# was:	mv	_let_mis_115_, _let_x_135_
l.endif_139_:
	li	x16, 2
# was:	li	_arr_ind_147_, 2
	addi	x17, x18, 4
# was:	addi	_arr_data_148_, _let_arr_2_, 4
	bge	x16, x0, l.nonneg_151_
# was:	bge	_arr_ind_147_, x0, l.nonneg_151_
l.error_150_:
	li	x10, 30
# was:	li	x10, 30
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_151_:
	lw	x19, 0(x18)
# was:	lw	_size_149_, 0(_let_arr_2_)
	bge	x16, x19, l.error_150_
# was:	bge	_arr_ind_147_, _size_149_, l.error_150_
	slli	x16, x16, 2
# was:	slli	_arr_ind_147_, _arr_ind_147_, 2
	add	x17, x17, x16
# was:	add	_arr_data_148_, _arr_data_148_, _arr_ind_147_
	lw	x20, 0(x17)
# was:	lw	_plus_L_145_, 0(_arr_data_148_)
	li	x19, 3
# was:	li	_arr_ind_152_, 3
	addi	x16, x14, 4
# was:	addi	_arr_data_153_, _tmp_68_, 4
	bge	x19, x0, l.nonneg_156_
# was:	bge	_arr_ind_152_, x0, l.nonneg_156_
l.error_155_:
	li	x10, 30
# was:	li	x10, 30
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_156_:
	lw	x17, 0(x14)
# was:	lw	_size_154_, 0(_tmp_68_)
	bge	x19, x17, l.error_155_
# was:	bge	_arr_ind_152_, _size_154_, l.error_155_
	slli	x19, x19, 2
# was:	slli	_arr_ind_152_, _arr_ind_152_, 2
	add	x16, x16, x19
# was:	add	_arr_data_153_, _arr_data_153_, _arr_ind_152_
	lw	x16, 0(x16)
# was:	lw	_plus_R_146_, 0(_arr_data_153_)
	add	x17, x20, x16
# was:	add	_let_x_I18_144_, _plus_L_145_, _plus_R_146_
	li	x20, 2
# was:	li	_arr_ind_158_, 2
	addi	x16, x14, 4
# was:	addi	_arr_data_159_, _tmp_68_, 4
	bge	x20, x0, l.nonneg_162_
# was:	bge	_arr_ind_158_, x0, l.nonneg_162_
l.error_161_:
	li	x10, 30
# was:	li	x10, 30
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_162_:
	lw	x19, 0(x14)
# was:	lw	_size_160_, 0(_tmp_68_)
	bge	x20, x19, l.error_161_
# was:	bge	_arr_ind_158_, _size_160_, l.error_161_
	slli	x20, x20, 2
# was:	slli	_arr_ind_158_, _arr_ind_158_, 2
	add	x16, x16, x20
# was:	add	_arr_data_159_, _arr_data_159_, _arr_ind_158_
	lw	x16, 0(x16)
# was:	lw	_let_y_I18_157_, 0(_arr_data_159_)
# 	mv	_let_x_163_,_let_x_I18_144_
	mv	x19, x16
# was:	mv	_let_y_164_, _let_y_I18_157_
# 	mv	_lt_L_169_,_let_x_163_
# 	mv	_lt_R_170_,_let_y_164_
	slt	x16, x17, x19
# was:	slt	_cond_168_, _lt_L_169_, _lt_R_170_
	bne	x16, x0, l.then_165_
# was:	bne	_cond_168_, x0, l.then_165_
	j	l.else_166_
l.then_165_:
	mv	x16, x19
# was:	mv	_let_mcs_143_, _let_y_164_
	j	l.endif_167_
l.else_166_:
	mv	x16, x17
# was:	mv	_let_mcs_143_, _let_x_163_
l.endif_167_:
	li	x17, 3
# was:	li	_arr_ind_174_, 3
	addi	x19, x18, 4
# was:	addi	_arr_data_175_, _let_arr_2_, 4
	bge	x17, x0, l.nonneg_178_
# was:	bge	_arr_ind_174_, x0, l.nonneg_178_
l.error_177_:
	li	x10, 31
# was:	li	x10, 31
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_178_:
	lw	x18, 0(x18)
# was:	lw	_size_176_, 0(_let_arr_2_)
	bge	x17, x18, l.error_177_
# was:	bge	_arr_ind_174_, _size_176_, l.error_177_
	slli	x17, x17, 2
# was:	slli	_arr_ind_174_, _arr_ind_174_, 2
	add	x19, x19, x17
# was:	add	_arr_data_175_, _arr_data_175_, _arr_ind_174_
	lw	x17, 0(x19)
# was:	lw	_plus_L_172_, 0(_arr_data_175_)
	li	x19, 3
# was:	li	_arr_ind_179_, 3
	addi	x18, x14, 4
# was:	addi	_arr_data_180_, _tmp_68_, 4
	bge	x19, x0, l.nonneg_183_
# was:	bge	_arr_ind_179_, x0, l.nonneg_183_
l.error_182_:
	li	x10, 31
# was:	li	x10, 31
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_183_:
	lw	x14, 0(x14)
# was:	lw	_size_181_, 0(_tmp_68_)
	bge	x19, x14, l.error_182_
# was:	bge	_arr_ind_179_, _size_181_, l.error_182_
	slli	x19, x19, 2
# was:	slli	_arr_ind_179_, _arr_ind_179_, 2
	add	x18, x18, x19
# was:	add	_arr_data_180_, _arr_data_180_, _arr_ind_179_
	lw	x14, 0(x18)
# was:	lw	_plus_R_173_, 0(_arr_data_180_)
	add	x19, x17, x14
# was:	add	_let_ts_171_, _plus_L_172_, _plus_R_173_
	li	x17, 4
# was:	li	_size_184_, 4
	mv	x18, x3
# was:	mv	_fun_arg_res_71_, x3
	slli	x14, x17, 2
# was:	slli	_tmp_187_, _size_184_, 2
	addi	x14, x14, 4
# was:	addi	_tmp_187_, _tmp_187_, 4
	add	x3, x3, x14
# was:	add	x3, x3, _tmp_187_
	sw	x17, 0(x18)
# was:	sw	_size_184_, 0(_fun_arg_res_71_)
	addi	x14, x18, 4
# was:	addi	_addr_185_, _fun_arg_res_71_, 4
# 	mv	_tmp_186_,_let_mss_72_
	sw	x13, 0(x14)
# was:	sw	_tmp_186_, 0(_addr_185_)
	addi	x14, x14, 4
# was:	addi	_addr_185_, _addr_185_, 4
	mv	x13, x15
# was:	mv	_tmp_186_, _let_mis_115_
	sw	x13, 0(x14)
# was:	sw	_tmp_186_, 0(_addr_185_)
	addi	x14, x14, 4
# was:	addi	_addr_185_, _addr_185_, 4
	mv	x13, x16
# was:	mv	_tmp_186_, _let_mcs_143_
	sw	x13, 0(x14)
# was:	sw	_tmp_186_, 0(_addr_185_)
	addi	x14, x14, 4
# was:	addi	_addr_185_, _addr_185_, 4
	mv	x13, x19
# was:	mv	_tmp_186_, _let_ts_171_
	sw	x13, 0(x14)
# was:	sw	_tmp_186_, 0(_addr_185_)
	addi	x14, x14, 4
# was:	addi	_addr_185_, _addr_185_, 4
# 	mv	_let_arr_2_,_fun_arg_res_71_
	addi	x12, x12, 1
# was:	addi	_ind_var_67_, _ind_var_67_, 1
	j	l.loop_beg_69_
l.loop_end_70_:
	la	x10, s.XXMSSPX_190_
# was:	la	_tmp_189_, s.XXMSSPX_190_
# s.XXMSSPX_190_: string "\n\nMSSP result is: "
# 	mv	_let_t_188_,_tmp_189_
# 	mv	x10,_tmp_189_
	jal	p.putstring
# was:	jal	p.putstring, x10
	li	x10, 0
# was:	li	_arr_ind_192_, 0
	addi	x11, x18, 4
# was:	addi	_arr_data_193_, _let_arr_2_, 4
	bge	x10, x0, l.nonneg_196_
# was:	bge	_arr_ind_192_, x0, l.nonneg_196_
l.error_195_:
	li	x10, 44
# was:	li	x10, 44
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_196_:
	lw	x12, 0(x18)
# was:	lw	_size_194_, 0(_let_arr_2_)
	bge	x10, x12, l.error_195_
# was:	bge	_arr_ind_192_, _size_194_, l.error_195_
	slli	x10, x10, 2
# was:	slli	_arr_ind_192_, _arr_ind_192_, 2
	add	x11, x11, x10
# was:	add	_arr_data_193_, _arr_data_193_, _arr_ind_192_
	lw	x18, 0(x11)
# was:	lw	_tmp_191_, 0(_arr_data_193_)
# 	mv	_mainres_1_,_tmp_191_
	mv	x10, x18
# was:	mv	x10, _mainres_1_
	jal	p.putint
# was:	jal	p.putint, x10
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
s.XXMSSPX_190_:
	.word	18
	.ascii	"\n\nMSSP result is: "
	.align	2
s.X_32_:
	.word	1
	.ascii	"\n"
	.align	2
s.XX_28_:
	.word	2
	.ascii	": "
	.align	2
s.Introdu_23_:
	.word	17
	.ascii	"Introduce number "
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