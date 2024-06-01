	.text	0x00400000
	la	x3, d.heap
	jal	f.main
	jal	p.stop
# User functions
# Function incr
f.incr:
	sw	x1, -4(x2)
	addi	x2, x2, -4
# 	mv	_param_a_1_,x10
# 	mv	_param_b_2_,x11
# 	mv	_plus_L_4_,_param_a_1_
# 	mv	_plus_R_5_,_param_b_2_
	add	x10, x10, x11
# was:	add	_incrres_3_, _plus_L_4_, _plus_R_5_
# 	mv	x10,_incrres_3_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function orfun
f.orfun:
	sw	x1, -4(x2)
	addi	x2, x2, -4
# 	mv	_param_a_6_,x10
# 	mv	_param_b_7_,x11
# 	mv	_or_L_9_,_param_a_6_
	bne	x0, x10, l.sc_l_11_
# was:	bne	x0, _or_L_9_, l.sc_l_11_
# 	mv	_or_R_10_,_param_b_7_
	or	x10, x10, x11
# was:	or	_orfunres_8_, _or_L_9_, _or_R_10_
	j	l.end_l_12_
l.sc_l_11_:
	addi	x10, x0, 1
# was:	addi	_orfunres_8_, x0, 1
l.end_l_12_:
# 	mv	x10,_orfunres_8_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function fun1
f.fun1:
	sw	x1, -4(x2)
	addi	x2, x2, -4
# 	mv	_param_a_13_,x10
	mv	x12, x11
# was:	mv	_param_b_14_, x11
	li	x14, 3
# was:	li	_size_17_, 3
	mv	x11, x3
# was:	mv	_let_c_16_, x3
	slli	x13, x14, 2
# was:	slli	_tmp_20_, _size_17_, 2
	addi	x13, x13, 4
# was:	addi	_tmp_20_, _tmp_20_, 4
	add	x3, x3, x13
# was:	add	x3, x3, _tmp_20_
	sw	x14, 0(x11)
# was:	sw	_size_17_, 0(_let_c_16_)
	addi	x13, x11, 4
# was:	addi	_addr_18_, _let_c_16_, 4
	li	x16, 0
# was:	li	_arr_ind_23_, 0
	addi	x15, x10, 4
# was:	addi	_arr_data_24_, _param_a_13_, 4
	bge	x16, x0, l.nonneg_27_
# was:	bge	_arr_ind_23_, x0, l.nonneg_27_
l.error_26_:
	li	x10, 3
# was:	li	x10, 3
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_27_:
	lw	x14, 0(x10)
# was:	lw	_size_25_, 0(_param_a_13_)
	bge	x16, x14, l.error_26_
# was:	bge	_arr_ind_23_, _size_25_, l.error_26_
	slli	x16, x16, 2
# was:	slli	_arr_ind_23_, _arr_ind_23_, 2
	add	x15, x15, x16
# was:	add	_arr_data_24_, _arr_data_24_, _arr_ind_23_
	lw	x14, 0(x15)
# was:	lw	_plus_L_21_, 0(_arr_data_24_)
	li	x17, 0
# was:	li	_arr_ind_28_, 0
	addi	x16, x12, 4
# was:	addi	_arr_data_29_, _param_b_14_, 4
	bge	x17, x0, l.nonneg_32_
# was:	bge	_arr_ind_28_, x0, l.nonneg_32_
l.error_31_:
	li	x10, 3
# was:	li	x10, 3
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_32_:
	lw	x15, 0(x12)
# was:	lw	_size_30_, 0(_param_b_14_)
	bge	x17, x15, l.error_31_
# was:	bge	_arr_ind_28_, _size_30_, l.error_31_
	slli	x17, x17, 2
# was:	slli	_arr_ind_28_, _arr_ind_28_, 2
	add	x16, x16, x17
# was:	add	_arr_data_29_, _arr_data_29_, _arr_ind_28_
	lw	x15, 0(x16)
# was:	lw	_plus_R_22_, 0(_arr_data_29_)
	add	x14, x14, x15
# was:	add	_tmp_19_, _plus_L_21_, _plus_R_22_
	sw	x14, 0(x13)
# was:	sw	_tmp_19_, 0(_addr_18_)
	addi	x13, x13, 4
# was:	addi	_addr_18_, _addr_18_, 4
	li	x16, 1
# was:	li	_arr_ind_35_, 1
	addi	x15, x10, 4
# was:	addi	_arr_data_36_, _param_a_13_, 4
	bge	x16, x0, l.nonneg_39_
# was:	bge	_arr_ind_35_, x0, l.nonneg_39_
l.error_38_:
	li	x10, 3
# was:	li	x10, 3
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_39_:
	lw	x14, 0(x10)
# was:	lw	_size_37_, 0(_param_a_13_)
	bge	x16, x14, l.error_38_
# was:	bge	_arr_ind_35_, _size_37_, l.error_38_
	slli	x16, x16, 2
# was:	slli	_arr_ind_35_, _arr_ind_35_, 2
	add	x15, x15, x16
# was:	add	_arr_data_36_, _arr_data_36_, _arr_ind_35_
	lw	x14, 0(x15)
# was:	lw	_plus_L_33_, 0(_arr_data_36_)
	li	x17, 1
# was:	li	_arr_ind_40_, 1
	addi	x16, x12, 4
# was:	addi	_arr_data_41_, _param_b_14_, 4
	bge	x17, x0, l.nonneg_44_
# was:	bge	_arr_ind_40_, x0, l.nonneg_44_
l.error_43_:
	li	x10, 3
# was:	li	x10, 3
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_44_:
	lw	x15, 0(x12)
# was:	lw	_size_42_, 0(_param_b_14_)
	bge	x17, x15, l.error_43_
# was:	bge	_arr_ind_40_, _size_42_, l.error_43_
	slli	x17, x17, 2
# was:	slli	_arr_ind_40_, _arr_ind_40_, 2
	add	x16, x16, x17
# was:	add	_arr_data_41_, _arr_data_41_, _arr_ind_40_
	lw	x15, 0(x16)
# was:	lw	_plus_R_34_, 0(_arr_data_41_)
	add	x14, x14, x15
# was:	add	_tmp_19_, _plus_L_33_, _plus_R_34_
	sw	x14, 0(x13)
# was:	sw	_tmp_19_, 0(_addr_18_)
	addi	x13, x13, 4
# was:	addi	_addr_18_, _addr_18_, 4
	li	x14, 2
# was:	li	_arr_ind_47_, 2
	addi	x15, x10, 4
# was:	addi	_arr_data_48_, _param_a_13_, 4
	bge	x14, x0, l.nonneg_51_
# was:	bge	_arr_ind_47_, x0, l.nonneg_51_
l.error_50_:
	li	x10, 3
# was:	li	x10, 3
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_51_:
	lw	x10, 0(x10)
# was:	lw	_size_49_, 0(_param_a_13_)
	bge	x14, x10, l.error_50_
# was:	bge	_arr_ind_47_, _size_49_, l.error_50_
	slli	x14, x14, 2
# was:	slli	_arr_ind_47_, _arr_ind_47_, 2
	add	x15, x15, x14
# was:	add	_arr_data_48_, _arr_data_48_, _arr_ind_47_
	lw	x10, 0(x15)
# was:	lw	_plus_L_45_, 0(_arr_data_48_)
	li	x15, 2
# was:	li	_arr_ind_52_, 2
	addi	x14, x12, 4
# was:	addi	_arr_data_53_, _param_b_14_, 4
	bge	x15, x0, l.nonneg_56_
# was:	bge	_arr_ind_52_, x0, l.nonneg_56_
l.error_55_:
	li	x10, 3
# was:	li	x10, 3
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_56_:
	lw	x12, 0(x12)
# was:	lw	_size_54_, 0(_param_b_14_)
	bge	x15, x12, l.error_55_
# was:	bge	_arr_ind_52_, _size_54_, l.error_55_
	slli	x15, x15, 2
# was:	slli	_arr_ind_52_, _arr_ind_52_, 2
	add	x14, x14, x15
# was:	add	_arr_data_53_, _arr_data_53_, _arr_ind_52_
	lw	x12, 0(x14)
# was:	lw	_plus_R_46_, 0(_arr_data_53_)
	add	x14, x10, x12
# was:	add	_tmp_19_, _plus_L_45_, _plus_R_46_
	sw	x14, 0(x13)
# was:	sw	_tmp_19_, 0(_addr_18_)
	addi	x13, x13, 4
# was:	addi	_addr_18_, _addr_18_, 4
	mv	x10, x11
# was:	mv	_fun1res_15_, _let_c_16_
# 	mv	x10,_fun1res_15_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function fun2
f.fun2:
	sw	x1, -4(x2)
	addi	x2, x2, -4
# 	mv	_param_a_57_,x10
	mv	x12, x11
# was:	mv	_param_b_58_, x11
	li	x14, 3
# was:	li	_size_61_, 3
	mv	x11, x3
# was:	mv	_let_c_60_, x3
	addi	x13, x14, 3
# was:	addi	_tmp_64_, _size_61_, 3
	andi	x13, x13, -4
# was:	andi	_tmp_64_, _tmp_64_, -4
	addi	x13, x13, 4
# was:	addi	_tmp_64_, _tmp_64_, 4
	add	x3, x3, x13
# was:	add	x3, x3, _tmp_64_
	sw	x14, 0(x11)
# was:	sw	_size_61_, 0(_let_c_60_)
	addi	x13, x11, 4
# was:	addi	_addr_62_, _let_c_60_, 4
	li	x14, 0
# was:	li	_arr_ind_67_, 0
	addi	x16, x10, 4
# was:	addi	_arr_data_68_, _param_a_57_, 4
	bge	x14, x0, l.nonneg_71_
# was:	bge	_arr_ind_67_, x0, l.nonneg_71_
l.error_70_:
	li	x10, 4
# was:	li	x10, 4
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_71_:
	lw	x15, 0(x10)
# was:	lw	_size_69_, 0(_param_a_57_)
	bge	x14, x15, l.error_70_
# was:	bge	_arr_ind_67_, _size_69_, l.error_70_
	add	x16, x16, x14
# was:	add	_arr_data_68_, _arr_data_68_, _arr_ind_67_
	lbu	x14, 0(x16)
# was:	lbu	_or_L_65_, 0(_arr_data_68_)
	bne	x0, x14, l.sc_l_77_
# was:	bne	x0, _or_L_65_, l.sc_l_77_
	li	x17, 0
# was:	li	_arr_ind_72_, 0
	addi	x16, x12, 4
# was:	addi	_arr_data_73_, _param_b_58_, 4
	bge	x17, x0, l.nonneg_76_
# was:	bge	_arr_ind_72_, x0, l.nonneg_76_
l.error_75_:
	li	x10, 4
# was:	li	x10, 4
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_76_:
	lw	x15, 0(x12)
# was:	lw	_size_74_, 0(_param_b_58_)
	bge	x17, x15, l.error_75_
# was:	bge	_arr_ind_72_, _size_74_, l.error_75_
	add	x16, x16, x17
# was:	add	_arr_data_73_, _arr_data_73_, _arr_ind_72_
	lbu	x15, 0(x16)
# was:	lbu	_or_R_66_, 0(_arr_data_73_)
	or	x14, x14, x15
# was:	or	_tmp_63_, _or_L_65_, _or_R_66_
	j	l.end_l_78_
l.sc_l_77_:
	addi	x14, x0, 1
# was:	addi	_tmp_63_, x0, 1
l.end_l_78_:
	sb	x14, 0(x13)
# was:	sb	_tmp_63_, 0(_addr_62_)
	addi	x13, x13, 1
# was:	addi	_addr_62_, _addr_62_, 1
	li	x15, 1
# was:	li	_arr_ind_81_, 1
	addi	x14, x10, 4
# was:	addi	_arr_data_82_, _param_a_57_, 4
	bge	x15, x0, l.nonneg_85_
# was:	bge	_arr_ind_81_, x0, l.nonneg_85_
l.error_84_:
	li	x10, 4
# was:	li	x10, 4
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_85_:
	lw	x16, 0(x10)
# was:	lw	_size_83_, 0(_param_a_57_)
	bge	x15, x16, l.error_84_
# was:	bge	_arr_ind_81_, _size_83_, l.error_84_
	add	x14, x14, x15
# was:	add	_arr_data_82_, _arr_data_82_, _arr_ind_81_
	lbu	x14, 0(x14)
# was:	lbu	_or_L_79_, 0(_arr_data_82_)
	bne	x0, x14, l.sc_l_91_
# was:	bne	x0, _or_L_79_, l.sc_l_91_
	li	x16, 1
# was:	li	_arr_ind_86_, 1
	addi	x15, x12, 4
# was:	addi	_arr_data_87_, _param_b_58_, 4
	bge	x16, x0, l.nonneg_90_
# was:	bge	_arr_ind_86_, x0, l.nonneg_90_
l.error_89_:
	li	x10, 4
# was:	li	x10, 4
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_90_:
	lw	x17, 0(x12)
# was:	lw	_size_88_, 0(_param_b_58_)
	bge	x16, x17, l.error_89_
# was:	bge	_arr_ind_86_, _size_88_, l.error_89_
	add	x15, x15, x16
# was:	add	_arr_data_87_, _arr_data_87_, _arr_ind_86_
	lbu	x15, 0(x15)
# was:	lbu	_or_R_80_, 0(_arr_data_87_)
	or	x14, x14, x15
# was:	or	_tmp_63_, _or_L_79_, _or_R_80_
	j	l.end_l_92_
l.sc_l_91_:
	addi	x14, x0, 1
# was:	addi	_tmp_63_, x0, 1
l.end_l_92_:
	sb	x14, 0(x13)
# was:	sb	_tmp_63_, 0(_addr_62_)
	addi	x13, x13, 1
# was:	addi	_addr_62_, _addr_62_, 1
	li	x14, 2
# was:	li	_arr_ind_95_, 2
	addi	x15, x10, 4
# was:	addi	_arr_data_96_, _param_a_57_, 4
	bge	x14, x0, l.nonneg_99_
# was:	bge	_arr_ind_95_, x0, l.nonneg_99_
l.error_98_:
	li	x10, 4
# was:	li	x10, 4
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_99_:
	lw	x10, 0(x10)
# was:	lw	_size_97_, 0(_param_a_57_)
	bge	x14, x10, l.error_98_
# was:	bge	_arr_ind_95_, _size_97_, l.error_98_
	add	x15, x15, x14
# was:	add	_arr_data_96_, _arr_data_96_, _arr_ind_95_
	lbu	x10, 0(x15)
# was:	lbu	_or_L_93_, 0(_arr_data_96_)
	bne	x0, x10, l.sc_l_105_
# was:	bne	x0, _or_L_93_, l.sc_l_105_
	li	x14, 2
# was:	li	_arr_ind_100_, 2
	addi	x15, x12, 4
# was:	addi	_arr_data_101_, _param_b_58_, 4
	bge	x14, x0, l.nonneg_104_
# was:	bge	_arr_ind_100_, x0, l.nonneg_104_
l.error_103_:
	li	x10, 4
# was:	li	x10, 4
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_104_:
	lw	x12, 0(x12)
# was:	lw	_size_102_, 0(_param_b_58_)
	bge	x14, x12, l.error_103_
# was:	bge	_arr_ind_100_, _size_102_, l.error_103_
	add	x15, x15, x14
# was:	add	_arr_data_101_, _arr_data_101_, _arr_ind_100_
	lbu	x12, 0(x15)
# was:	lbu	_or_R_94_, 0(_arr_data_101_)
	or	x14, x10, x12
# was:	or	_tmp_63_, _or_L_93_, _or_R_94_
	j	l.end_l_106_
l.sc_l_105_:
	addi	x14, x0, 1
# was:	addi	_tmp_63_, x0, 1
l.end_l_106_:
	sb	x14, 0(x13)
# was:	sb	_tmp_63_, 0(_addr_62_)
	addi	x13, x13, 1
# was:	addi	_addr_62_, _addr_62_, 1
	mv	x10, x11
# was:	mv	_fun2res_59_, _let_c_60_
# 	mv	x10,_fun2res_59_
	addi	x2, x2, 4
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
	li	x10, 3
# was:	li	_size_109_, 3
	mv	x20, x3
# was:	mv	_let_a1_108_, x3
	slli	x11, x10, 2
# was:	slli	_tmp_112_, _size_109_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_112_, _tmp_112_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_112_
	sw	x10, 0(x20)
# was:	sw	_size_109_, 0(_let_a1_108_)
	addi	x12, x20, 4
# was:	addi	_addr_110_, _let_a1_108_, 4
	li	x10, 3
# was:	li	_size_113_, 3
	mv	x11, x3
# was:	mv	_tmp_111_, x3
	slli	x13, x10, 2
# was:	slli	_tmp_116_, _size_113_, 2
	addi	x13, x13, 4
# was:	addi	_tmp_116_, _tmp_116_, 4
	add	x3, x3, x13
# was:	add	x3, x3, _tmp_116_
	sw	x10, 0(x11)
# was:	sw	_size_113_, 0(_tmp_111_)
	addi	x10, x11, 4
# was:	addi	_addr_114_, _tmp_111_, 4
	li	x13, 1
# was:	li	_tmp_115_, 1
	sw	x13, 0(x10)
# was:	sw	_tmp_115_, 0(_addr_114_)
	addi	x10, x10, 4
# was:	addi	_addr_114_, _addr_114_, 4
	li	x13, 2
# was:	li	_tmp_115_, 2
	sw	x13, 0(x10)
# was:	sw	_tmp_115_, 0(_addr_114_)
	addi	x10, x10, 4
# was:	addi	_addr_114_, _addr_114_, 4
	li	x13, 3
# was:	li	_tmp_115_, 3
	sw	x13, 0(x10)
# was:	sw	_tmp_115_, 0(_addr_114_)
	addi	x10, x10, 4
# was:	addi	_addr_114_, _addr_114_, 4
	sw	x11, 0(x12)
# was:	sw	_tmp_111_, 0(_addr_110_)
	addi	x12, x12, 4
# was:	addi	_addr_110_, _addr_110_, 4
	li	x10, 3
# was:	li	_size_117_, 3
	mv	x11, x3
# was:	mv	_tmp_111_, x3
	slli	x13, x10, 2
# was:	slli	_tmp_120_, _size_117_, 2
	addi	x13, x13, 4
# was:	addi	_tmp_120_, _tmp_120_, 4
	add	x3, x3, x13
# was:	add	x3, x3, _tmp_120_
	sw	x10, 0(x11)
# was:	sw	_size_117_, 0(_tmp_111_)
	addi	x10, x11, 4
# was:	addi	_addr_118_, _tmp_111_, 4
	li	x13, 1
# was:	li	_tmp_119_, 1
	sw	x13, 0(x10)
# was:	sw	_tmp_119_, 0(_addr_118_)
	addi	x10, x10, 4
# was:	addi	_addr_118_, _addr_118_, 4
	li	x13, 2
# was:	li	_tmp_119_, 2
	sw	x13, 0(x10)
# was:	sw	_tmp_119_, 0(_addr_118_)
	addi	x10, x10, 4
# was:	addi	_addr_118_, _addr_118_, 4
	li	x13, 3
# was:	li	_tmp_119_, 3
	sw	x13, 0(x10)
# was:	sw	_tmp_119_, 0(_addr_118_)
	addi	x10, x10, 4
# was:	addi	_addr_118_, _addr_118_, 4
	sw	x11, 0(x12)
# was:	sw	_tmp_111_, 0(_addr_110_)
	addi	x12, x12, 4
# was:	addi	_addr_110_, _addr_110_, 4
	li	x10, 3
# was:	li	_size_121_, 3
	mv	x11, x3
# was:	mv	_tmp_111_, x3
	slli	x13, x10, 2
# was:	slli	_tmp_124_, _size_121_, 2
	addi	x13, x13, 4
# was:	addi	_tmp_124_, _tmp_124_, 4
	add	x3, x3, x13
# was:	add	x3, x3, _tmp_124_
	sw	x10, 0(x11)
# was:	sw	_size_121_, 0(_tmp_111_)
	addi	x10, x11, 4
# was:	addi	_addr_122_, _tmp_111_, 4
	li	x13, 1
# was:	li	_tmp_123_, 1
	sw	x13, 0(x10)
# was:	sw	_tmp_123_, 0(_addr_122_)
	addi	x10, x10, 4
# was:	addi	_addr_122_, _addr_122_, 4
	li	x13, 2
# was:	li	_tmp_123_, 2
	sw	x13, 0(x10)
# was:	sw	_tmp_123_, 0(_addr_122_)
	addi	x10, x10, 4
# was:	addi	_addr_122_, _addr_122_, 4
	li	x13, 3
# was:	li	_tmp_123_, 3
	sw	x13, 0(x10)
# was:	sw	_tmp_123_, 0(_addr_122_)
	addi	x10, x10, 4
# was:	addi	_addr_122_, _addr_122_, 4
	sw	x11, 0(x12)
# was:	sw	_tmp_111_, 0(_addr_110_)
	addi	x12, x12, 4
# was:	addi	_addr_110_, _addr_110_, 4
# 	mv	_arr_126_,_let_a1_108_
	lw	x19, 0(x20)
# was:	lw	_size_127_, 0(_arr_126_)
	mv	x18, x3
# was:	mv	_let_x1_125_, x3
	slli	x10, x19, 2
# was:	slli	_tmp_139_, _size_127_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_139_, _tmp_139_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_139_
	sw	x19, 0(x18)
# was:	sw	_size_127_, 0(_let_x1_125_)
	li	x11, 3
# was:	li	_size_134_, 3
	mv	x10, x3
# was:	mv	_tmp2_130_, x3
	slli	x12, x11, 2
# was:	slli	_tmp_137_, _size_134_, 2
	addi	x12, x12, 4
# was:	addi	_tmp_137_, _tmp_137_, 4
	add	x3, x3, x12
# was:	add	x3, x3, _tmp_137_
	sw	x11, 0(x10)
# was:	sw	_size_134_, 0(_tmp2_130_)
	addi	x11, x10, 4
# was:	addi	_addr_135_, _tmp2_130_, 4
	li	x12, 1
# was:	li	_tmp_136_, 1
	sw	x12, 0(x11)
# was:	sw	_tmp_136_, 0(_addr_135_)
	addi	x11, x11, 4
# was:	addi	_addr_135_, _addr_135_, 4
	li	x12, 2
# was:	li	_tmp_136_, 2
	sw	x12, 0(x11)
# was:	sw	_tmp_136_, 0(_addr_135_)
	addi	x11, x11, 4
# was:	addi	_addr_135_, _addr_135_, 4
	li	x12, 3
# was:	li	_tmp_136_, 3
	sw	x12, 0(x11)
# was:	sw	_tmp_136_, 0(_addr_135_)
	addi	x11, x11, 4
# was:	addi	_addr_135_, _addr_135_, 4
	addi	x21, x18, 4
# was:	addi	_addrg_133_, _let_x1_125_, 4
	addi	x20, x20, 4
# was:	addi	_arr_126_, _arr_126_, 4
	mv	x22, x0
# was:	mv	_ind_var_128_, x0
l.loop_beg_131_:
	bge	x22, x19, l.loop_end_132_
# was:	bge	_ind_var_128_, _size_127_, l.loop_end_132_
	lw	x11, 0(x20)
# was:	lw	_tmp1_129_, 0(_arr_126_)
	addi	x20, x20, 4
# was:	addi	_arr_126_, _arr_126_, 4
# 	mv	x10,_tmp2_130_
# 	mv	x11,_tmp1_129_
	jal	f.fun1
# was:	jal	f.fun1, x10 x11
# 	mv	_tmp_138_,x10
# 	mv	_tmp2_130_,_tmp_138_
	sw	x10, 0(x21)
# was:	sw	_tmp2_130_, 0(_addrg_133_)
	addi	x21, x21, 4
# was:	addi	_addrg_133_, _addrg_133_, 4
	addi	x22, x22, 1
# was:	addi	_ind_var_128_, _ind_var_128_, 1
	j	l.loop_beg_131_
l.loop_end_132_:
	li	x11, 0
# was:	li	_arr_ind_148_, 0
	addi	x10, x18, 4
# was:	addi	_arr_data_149_, _let_x1_125_, 4
	bge	x11, x0, l.nonneg_152_
# was:	bge	_arr_ind_148_, x0, l.nonneg_152_
l.error_151_:
	li	x10, 9
# was:	li	x10, 9
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_152_:
	lw	x12, 0(x18)
# was:	lw	_size_150_, 0(_let_x1_125_)
	bge	x11, x12, l.error_151_
# was:	bge	_arr_ind_148_, _size_150_, l.error_151_
	slli	x11, x11, 2
# was:	slli	_arr_ind_148_, _arr_ind_148_, 2
	add	x10, x10, x11
# was:	add	_arr_data_149_, _arr_data_149_, _arr_ind_148_
	lw	x19, 0(x10)
# was:	lw	_arr_142_, 0(_arr_data_149_)
	lw	x21, 0(x19)
# was:	lw	_size_143_, 0(_arr_142_)
	li	x10, 0
# was:	li	_tmp_141_, 0
	addi	x19, x19, 4
# was:	addi	_arr_142_, _arr_142_, 4
	mv	x20, x0
# was:	mv	_ind_var_144_, x0
l.loop_beg_146_:
	bge	x20, x21, l.loop_end_147_
# was:	bge	_ind_var_144_, _size_143_, l.loop_end_147_
	lw	x11, 0(x19)
# was:	lw	_tmp_145_, 0(_arr_142_)
	addi	x19, x19, 4
# was:	addi	_arr_142_, _arr_142_, 4
# 	mv	x10,_tmp_141_
# 	mv	x11,_tmp_145_
	jal	f.incr
# was:	jal	f.incr, x10 x11
# 	mv	_tmp_153_,x10
# 	mv	_tmp_141_,_tmp_153_
	addi	x20, x20, 1
# was:	addi	_ind_var_144_, _ind_var_144_, 1
	j	l.loop_beg_146_
l.loop_end_147_:
# 	mv	_let_tmp1_140_,_tmp_141_
# 	mv	x10,_let_tmp1_140_
	jal	p.putint
# was:	jal	p.putint, x10
	li	x11, 1
# was:	li	_arr_ind_162_, 1
	addi	x10, x18, 4
# was:	addi	_arr_data_163_, _let_x1_125_, 4
	bge	x11, x0, l.nonneg_166_
# was:	bge	_arr_ind_162_, x0, l.nonneg_166_
l.error_165_:
	li	x10, 10
# was:	li	x10, 10
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_166_:
	lw	x12, 0(x18)
# was:	lw	_size_164_, 0(_let_x1_125_)
	bge	x11, x12, l.error_165_
# was:	bge	_arr_ind_162_, _size_164_, l.error_165_
	slli	x11, x11, 2
# was:	slli	_arr_ind_162_, _arr_ind_162_, 2
	add	x10, x10, x11
# was:	add	_arr_data_163_, _arr_data_163_, _arr_ind_162_
	lw	x20, 0(x10)
# was:	lw	_arr_156_, 0(_arr_data_163_)
	lw	x19, 0(x20)
# was:	lw	_size_157_, 0(_arr_156_)
	li	x10, 0
# was:	li	_tmp_155_, 0
	addi	x20, x20, 4
# was:	addi	_arr_156_, _arr_156_, 4
	mv	x21, x0
# was:	mv	_ind_var_158_, x0
l.loop_beg_160_:
	bge	x21, x19, l.loop_end_161_
# was:	bge	_ind_var_158_, _size_157_, l.loop_end_161_
	lw	x11, 0(x20)
# was:	lw	_tmp_159_, 0(_arr_156_)
	addi	x20, x20, 4
# was:	addi	_arr_156_, _arr_156_, 4
# 	mv	x10,_tmp_155_
# 	mv	x11,_tmp_159_
	jal	f.incr
# was:	jal	f.incr, x10 x11
# 	mv	_tmp_167_,x10
# 	mv	_tmp_155_,_tmp_167_
	addi	x21, x21, 1
# was:	addi	_ind_var_158_, _ind_var_158_, 1
	j	l.loop_beg_160_
l.loop_end_161_:
# 	mv	_let_tmp2_154_,_tmp_155_
# 	mv	x10,_let_tmp2_154_
	jal	p.putint
# was:	jal	p.putint, x10
	li	x11, 2
# was:	li	_arr_ind_176_, 2
	addi	x10, x18, 4
# was:	addi	_arr_data_177_, _let_x1_125_, 4
	bge	x11, x0, l.nonneg_180_
# was:	bge	_arr_ind_176_, x0, l.nonneg_180_
l.error_179_:
	li	x10, 11
# was:	li	x10, 11
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_180_:
	lw	x12, 0(x18)
# was:	lw	_size_178_, 0(_let_x1_125_)
	bge	x11, x12, l.error_179_
# was:	bge	_arr_ind_176_, _size_178_, l.error_179_
	slli	x11, x11, 2
# was:	slli	_arr_ind_176_, _arr_ind_176_, 2
	add	x10, x10, x11
# was:	add	_arr_data_177_, _arr_data_177_, _arr_ind_176_
	lw	x19, 0(x10)
# was:	lw	_arr_170_, 0(_arr_data_177_)
	lw	x20, 0(x19)
# was:	lw	_size_171_, 0(_arr_170_)
	li	x10, 0
# was:	li	_tmp_169_, 0
	addi	x19, x19, 4
# was:	addi	_arr_170_, _arr_170_, 4
	mv	x21, x0
# was:	mv	_ind_var_172_, x0
l.loop_beg_174_:
	bge	x21, x20, l.loop_end_175_
# was:	bge	_ind_var_172_, _size_171_, l.loop_end_175_
	lw	x11, 0(x19)
# was:	lw	_tmp_173_, 0(_arr_170_)
	addi	x19, x19, 4
# was:	addi	_arr_170_, _arr_170_, 4
# 	mv	x10,_tmp_169_
# 	mv	x11,_tmp_173_
	jal	f.incr
# was:	jal	f.incr, x10 x11
# 	mv	_tmp_181_,x10
# 	mv	_tmp_169_,_tmp_181_
	addi	x21, x21, 1
# was:	addi	_ind_var_172_, _ind_var_172_, 1
	j	l.loop_beg_174_
l.loop_end_175_:
# 	mv	_let_tmp3_168_,_tmp_169_
# 	mv	x10,_let_tmp3_168_
	jal	p.putint
# was:	jal	p.putint, x10
	li	x10, 3
# was:	li	_size_183_, 3
	mv	x21, x3
# was:	mv	_let_a2_182_, x3
	slli	x11, x10, 2
# was:	slli	_tmp_186_, _size_183_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_186_, _tmp_186_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_186_
	sw	x10, 0(x21)
# was:	sw	_size_183_, 0(_let_a2_182_)
	addi	x11, x21, 4
# was:	addi	_addr_184_, _let_a2_182_, 4
	li	x10, 3
# was:	li	_size_187_, 3
	mv	x12, x3
# was:	mv	_tmp_185_, x3
	addi	x13, x10, 3
# was:	addi	_tmp_190_, _size_187_, 3
	andi	x13, x13, -4
# was:	andi	_tmp_190_, _tmp_190_, -4
	addi	x13, x13, 4
# was:	addi	_tmp_190_, _tmp_190_, 4
	add	x3, x3, x13
# was:	add	x3, x3, _tmp_190_
	sw	x10, 0(x12)
# was:	sw	_size_187_, 0(_tmp_185_)
	addi	x10, x12, 4
# was:	addi	_addr_188_, _tmp_185_, 4
	li	x13, 0
# was:	li	_tmp_189_, 0
	sb	x13, 0(x10)
# was:	sb	_tmp_189_, 0(_addr_188_)
	addi	x10, x10, 1
# was:	addi	_addr_188_, _addr_188_, 1
	li	x13, 0
# was:	li	_tmp_189_, 0
	sb	x13, 0(x10)
# was:	sb	_tmp_189_, 0(_addr_188_)
	addi	x10, x10, 1
# was:	addi	_addr_188_, _addr_188_, 1
	li	x13, 0
# was:	li	_tmp_189_, 0
	sb	x13, 0(x10)
# was:	sb	_tmp_189_, 0(_addr_188_)
	addi	x10, x10, 1
# was:	addi	_addr_188_, _addr_188_, 1
	sw	x12, 0(x11)
# was:	sw	_tmp_185_, 0(_addr_184_)
	addi	x11, x11, 4
# was:	addi	_addr_184_, _addr_184_, 4
	li	x10, 3
# was:	li	_size_191_, 3
	mv	x12, x3
# was:	mv	_tmp_185_, x3
	addi	x13, x10, 3
# was:	addi	_tmp_194_, _size_191_, 3
	andi	x13, x13, -4
# was:	andi	_tmp_194_, _tmp_194_, -4
	addi	x13, x13, 4
# was:	addi	_tmp_194_, _tmp_194_, 4
	add	x3, x3, x13
# was:	add	x3, x3, _tmp_194_
	sw	x10, 0(x12)
# was:	sw	_size_191_, 0(_tmp_185_)
	addi	x10, x12, 4
# was:	addi	_addr_192_, _tmp_185_, 4
	li	x13, 1
# was:	li	_tmp_193_, 1
	sb	x13, 0(x10)
# was:	sb	_tmp_193_, 0(_addr_192_)
	addi	x10, x10, 1
# was:	addi	_addr_192_, _addr_192_, 1
	li	x13, 0
# was:	li	_tmp_193_, 0
	sb	x13, 0(x10)
# was:	sb	_tmp_193_, 0(_addr_192_)
	addi	x10, x10, 1
# was:	addi	_addr_192_, _addr_192_, 1
	li	x13, 0
# was:	li	_tmp_193_, 0
	sb	x13, 0(x10)
# was:	sb	_tmp_193_, 0(_addr_192_)
	addi	x10, x10, 1
# was:	addi	_addr_192_, _addr_192_, 1
	sw	x12, 0(x11)
# was:	sw	_tmp_185_, 0(_addr_184_)
	addi	x11, x11, 4
# was:	addi	_addr_184_, _addr_184_, 4
	li	x10, 3
# was:	li	_size_195_, 3
	mv	x12, x3
# was:	mv	_tmp_185_, x3
	addi	x13, x10, 3
# was:	addi	_tmp_198_, _size_195_, 3
	andi	x13, x13, -4
# was:	andi	_tmp_198_, _tmp_198_, -4
	addi	x13, x13, 4
# was:	addi	_tmp_198_, _tmp_198_, 4
	add	x3, x3, x13
# was:	add	x3, x3, _tmp_198_
	sw	x10, 0(x12)
# was:	sw	_size_195_, 0(_tmp_185_)
	addi	x10, x12, 4
# was:	addi	_addr_196_, _tmp_185_, 4
	li	x13, 0
# was:	li	_tmp_197_, 0
	sb	x13, 0(x10)
# was:	sb	_tmp_197_, 0(_addr_196_)
	addi	x10, x10, 1
# was:	addi	_addr_196_, _addr_196_, 1
	li	x13, 0
# was:	li	_tmp_197_, 0
	sb	x13, 0(x10)
# was:	sb	_tmp_197_, 0(_addr_196_)
	addi	x10, x10, 1
# was:	addi	_addr_196_, _addr_196_, 1
	li	x13, 0
# was:	li	_tmp_197_, 0
	sb	x13, 0(x10)
# was:	sb	_tmp_197_, 0(_addr_196_)
	addi	x10, x10, 1
# was:	addi	_addr_196_, _addr_196_, 1
	sw	x12, 0(x11)
# was:	sw	_tmp_185_, 0(_addr_184_)
	addi	x11, x11, 4
# was:	addi	_addr_184_, _addr_184_, 4
# 	mv	_arr_200_,_let_a2_182_
	lw	x20, 0(x21)
# was:	lw	_size_201_, 0(_arr_200_)
	mv	x19, x3
# was:	mv	_let_x2_199_, x3
	slli	x10, x20, 2
# was:	slli	_tmp_213_, _size_201_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_213_, _tmp_213_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_213_
	sw	x20, 0(x19)
# was:	sw	_size_201_, 0(_let_x2_199_)
	li	x12, 3
# was:	li	_size_208_, 3
	mv	x10, x3
# was:	mv	_tmp2_204_, x3
	addi	x11, x12, 3
# was:	addi	_tmp_211_, _size_208_, 3
	andi	x11, x11, -4
# was:	andi	_tmp_211_, _tmp_211_, -4
	addi	x11, x11, 4
# was:	addi	_tmp_211_, _tmp_211_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_211_
	sw	x12, 0(x10)
# was:	sw	_size_208_, 0(_tmp2_204_)
	addi	x11, x10, 4
# was:	addi	_addr_209_, _tmp2_204_, 4
	li	x12, 0
# was:	li	_tmp_210_, 0
	sb	x12, 0(x11)
# was:	sb	_tmp_210_, 0(_addr_209_)
	addi	x11, x11, 1
# was:	addi	_addr_209_, _addr_209_, 1
	li	x12, 0
# was:	li	_tmp_210_, 0
	sb	x12, 0(x11)
# was:	sb	_tmp_210_, 0(_addr_209_)
	addi	x11, x11, 1
# was:	addi	_addr_209_, _addr_209_, 1
	li	x12, 0
# was:	li	_tmp_210_, 0
	sb	x12, 0(x11)
# was:	sb	_tmp_210_, 0(_addr_209_)
	addi	x11, x11, 1
# was:	addi	_addr_209_, _addr_209_, 1
	addi	x23, x19, 4
# was:	addi	_addrg_207_, _let_x2_199_, 4
	addi	x21, x21, 4
# was:	addi	_arr_200_, _arr_200_, 4
	mv	x22, x0
# was:	mv	_ind_var_202_, x0
l.loop_beg_205_:
	bge	x22, x20, l.loop_end_206_
# was:	bge	_ind_var_202_, _size_201_, l.loop_end_206_
	lw	x11, 0(x21)
# was:	lw	_tmp1_203_, 0(_arr_200_)
	addi	x21, x21, 4
# was:	addi	_arr_200_, _arr_200_, 4
# 	mv	x10,_tmp2_204_
# 	mv	x11,_tmp1_203_
	jal	f.fun2
# was:	jal	f.fun2, x10 x11
# 	mv	_tmp_212_,x10
# 	mv	_tmp2_204_,_tmp_212_
	sw	x10, 0(x23)
# was:	sw	_tmp2_204_, 0(_addrg_207_)
	addi	x23, x23, 4
# was:	addi	_addrg_207_, _addrg_207_, 4
	addi	x22, x22, 1
# was:	addi	_ind_var_202_, _ind_var_202_, 1
	j	l.loop_beg_205_
l.loop_end_206_:
	li	x10, 0
# was:	li	_arr_ind_222_, 0
	addi	x11, x19, 4
# was:	addi	_arr_data_223_, _let_x2_199_, 4
	bge	x10, x0, l.nonneg_226_
# was:	bge	_arr_ind_222_, x0, l.nonneg_226_
l.error_225_:
	li	x10, 14
# was:	li	x10, 14
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_226_:
	lw	x12, 0(x19)
# was:	lw	_size_224_, 0(_let_x2_199_)
	bge	x10, x12, l.error_225_
# was:	bge	_arr_ind_222_, _size_224_, l.error_225_
	slli	x10, x10, 2
# was:	slli	_arr_ind_222_, _arr_ind_222_, 2
	add	x11, x11, x10
# was:	add	_arr_data_223_, _arr_data_223_, _arr_ind_222_
	lw	x22, 0(x11)
# was:	lw	_arr_216_, 0(_arr_data_223_)
	lw	x21, 0(x22)
# was:	lw	_size_217_, 0(_arr_216_)
	li	x10, 0
# was:	li	_tmp_215_, 0
	addi	x22, x22, 4
# was:	addi	_arr_216_, _arr_216_, 4
	mv	x20, x0
# was:	mv	_ind_var_218_, x0
l.loop_beg_220_:
	bge	x20, x21, l.loop_end_221_
# was:	bge	_ind_var_218_, _size_217_, l.loop_end_221_
	lbu	x11, 0(x22)
# was:	lbu	_tmp_219_, 0(_arr_216_)
	addi	x22, x22, 1
# was:	addi	_arr_216_, _arr_216_, 1
# 	mv	x10,_tmp_215_
# 	mv	x11,_tmp_219_
	jal	f.orfun
# was:	jal	f.orfun, x10 x11
# 	mv	_tmp_227_,x10
# 	mv	_tmp_215_,_tmp_227_
	addi	x20, x20, 1
# was:	addi	_ind_var_218_, _ind_var_218_, 1
	j	l.loop_beg_220_
l.loop_end_221_:
	mv	x11, x10
# was:	mv	_let_tmp1_214_, _tmp_215_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x11, x0, l.wBoolF_228_
# was:	bne	_let_tmp1_214_, x0, l.wBoolF_228_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_228_:
	jal	p.putstring
# was:	jal	p.putstring, x10
	li	x11, 1
# was:	li	_arr_ind_237_, 1
	addi	x10, x19, 4
# was:	addi	_arr_data_238_, _let_x2_199_, 4
	bge	x11, x0, l.nonneg_241_
# was:	bge	_arr_ind_237_, x0, l.nonneg_241_
l.error_240_:
	li	x10, 15
# was:	li	x10, 15
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_241_:
	lw	x12, 0(x19)
# was:	lw	_size_239_, 0(_let_x2_199_)
	bge	x11, x12, l.error_240_
# was:	bge	_arr_ind_237_, _size_239_, l.error_240_
	slli	x11, x11, 2
# was:	slli	_arr_ind_237_, _arr_ind_237_, 2
	add	x10, x10, x11
# was:	add	_arr_data_238_, _arr_data_238_, _arr_ind_237_
	lw	x22, 0(x10)
# was:	lw	_arr_231_, 0(_arr_data_238_)
	lw	x21, 0(x22)
# was:	lw	_size_232_, 0(_arr_231_)
	li	x10, 0
# was:	li	_tmp_230_, 0
	addi	x22, x22, 4
# was:	addi	_arr_231_, _arr_231_, 4
	mv	x20, x0
# was:	mv	_ind_var_233_, x0
l.loop_beg_235_:
	bge	x20, x21, l.loop_end_236_
# was:	bge	_ind_var_233_, _size_232_, l.loop_end_236_
	lbu	x11, 0(x22)
# was:	lbu	_tmp_234_, 0(_arr_231_)
	addi	x22, x22, 1
# was:	addi	_arr_231_, _arr_231_, 1
# 	mv	x10,_tmp_230_
# 	mv	x11,_tmp_234_
	jal	f.orfun
# was:	jal	f.orfun, x10 x11
# 	mv	_tmp_242_,x10
# 	mv	_tmp_230_,_tmp_242_
	addi	x20, x20, 1
# was:	addi	_ind_var_233_, _ind_var_233_, 1
	j	l.loop_beg_235_
l.loop_end_236_:
	mv	x11, x10
# was:	mv	_let_tmp2_229_, _tmp_230_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x11, x0, l.wBoolF_243_
# was:	bne	_let_tmp2_229_, x0, l.wBoolF_243_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_243_:
	jal	p.putstring
# was:	jal	p.putstring, x10
	li	x11, 2
# was:	li	_arr_ind_252_, 2
	addi	x10, x19, 4
# was:	addi	_arr_data_253_, _let_x2_199_, 4
	bge	x11, x0, l.nonneg_256_
# was:	bge	_arr_ind_252_, x0, l.nonneg_256_
l.error_255_:
	li	x10, 16
# was:	li	x10, 16
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_256_:
	lw	x12, 0(x19)
# was:	lw	_size_254_, 0(_let_x2_199_)
	bge	x11, x12, l.error_255_
# was:	bge	_arr_ind_252_, _size_254_, l.error_255_
	slli	x11, x11, 2
# was:	slli	_arr_ind_252_, _arr_ind_252_, 2
	add	x10, x10, x11
# was:	add	_arr_data_253_, _arr_data_253_, _arr_ind_252_
	lw	x19, 0(x10)
# was:	lw	_arr_246_, 0(_arr_data_253_)
	lw	x20, 0(x19)
# was:	lw	_size_247_, 0(_arr_246_)
	li	x10, 0
# was:	li	_tmp_245_, 0
	addi	x19, x19, 4
# was:	addi	_arr_246_, _arr_246_, 4
	mv	x21, x0
# was:	mv	_ind_var_248_, x0
l.loop_beg_250_:
	bge	x21, x20, l.loop_end_251_
# was:	bge	_ind_var_248_, _size_247_, l.loop_end_251_
	lbu	x11, 0(x19)
# was:	lbu	_tmp_249_, 0(_arr_246_)
	addi	x19, x19, 1
# was:	addi	_arr_246_, _arr_246_, 1
# 	mv	x10,_tmp_245_
# 	mv	x11,_tmp_249_
	jal	f.orfun
# was:	jal	f.orfun, x10 x11
# 	mv	_tmp_257_,x10
# 	mv	_tmp_245_,_tmp_257_
	addi	x21, x21, 1
# was:	addi	_ind_var_248_, _ind_var_248_, 1
	j	l.loop_beg_250_
l.loop_end_251_:
	mv	x11, x10
# was:	mv	_let_tmp3_244_, _tmp_245_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x11, x0, l.wBoolF_258_
# was:	bne	_let_tmp3_244_, x0, l.wBoolF_258_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_258_:
	jal	p.putstring
# was:	jal	p.putstring, x10
	mv	x10, x18
# was:	mv	_mainres_107_, _let_x1_125_
# 	mv	x10,_mainres_107_
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