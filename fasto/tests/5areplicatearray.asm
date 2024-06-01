	.text	0x00400000
	la	x3, d.heap
	jal	f.main
	jal	p.stop
# User functions
# Function main
f.main:
	sw	x1, -4(x2)
	sw	x21, -20(x2)
	sw	x20, -16(x2)
	sw	x19, -12(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -20
	li	x10, 3
# was:	li	_size_3_, 3
	mv	x12, x3
# was:	mv	_let_a_2_, x3
	slli	x11, x10, 2
# was:	slli	_tmp_6_, _size_3_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_6_, _tmp_6_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_6_
	sw	x10, 0(x12)
# was:	sw	_size_3_, 0(_let_a_2_)
	addi	x10, x12, 4
# was:	addi	_addr_4_, _let_a_2_, 4
	li	x13, 1
# was:	li	_plus_L_9_, 1
	li	x11, 3
# was:	li	_plus_R_10_, 3
	add	x13, x13, x11
# was:	add	_minus_L_7_, _plus_L_9_, _plus_R_10_
	li	x11, 2
# was:	li	_minus_R_8_, 2
	sub	x11, x13, x11
# was:	sub	_tmp_5_, _minus_L_7_, _minus_R_8_
	sw	x11, 0(x10)
# was:	sw	_tmp_5_, 0(_addr_4_)
	addi	x10, x10, 4
# was:	addi	_addr_4_, _addr_4_, 4
	li	x13, 2
# was:	li	_times_L_13_, 2
	li	x11, 8
# was:	li	_times_R_14_, 8
	mul	x13, x13, x11
# was:	mul	_divide_L_11_, _times_L_13_, _times_R_14_
	li	x11, 4
# was:	li	_divide_R_12_, 4
	bne	x11, x0, l.safe_15_
# was:	bne	_divide_R_12_, x0, l.safe_15_
	li	x10, 2
# was:	li	x10, 2
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.safe_15_:
	div	x11, x13, x11
# was:	div	_tmp_5_, _divide_L_11_, _divide_R_12_
	sw	x11, 0(x10)
# was:	sw	_tmp_5_, 0(_addr_4_)
	addi	x10, x10, 4
# was:	addi	_addr_4_, _addr_4_, 4
	li	x11, 3
# was:	li	_NEGATE_exp_16_, 3
	sub	x11, x0, x11
# was:	sub	_tmp_5_, x0, _NEGATE_exp_16_
	sw	x11, 0(x10)
# was:	sw	_tmp_5_, 0(_addr_4_)
	addi	x10, x10, 4
# was:	addi	_addr_4_, _addr_4_, 4
	li	x10, 1
# was:	li	_size_18_, 1
	mv	x19, x3
# was:	mv	_let_b_17_, x3
	slli	x11, x10, 2
# was:	slli	_tmp_21_, _size_18_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_21_, _tmp_21_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_21_
	sw	x10, 0(x19)
# was:	sw	_size_18_, 0(_let_b_17_)
	addi	x10, x19, 4
# was:	addi	_addr_19_, _let_b_17_, 4
	la	x11, s.a_22_
# was:	la	_tmp_20_, s.a_22_
# s.a_22_: string "a"
	sw	x11, 0(x10)
# was:	sw	_tmp_20_, 0(_addr_19_)
	addi	x10, x10, 4
# was:	addi	_addr_19_, _addr_19_, 4
	li	x10, 2
# was:	li	_size_24_, 2
	mv	x18, x3
# was:	mv	_let_c_23_, x3
	addi	x11, x10, 3
# was:	addi	_tmp_27_, _size_24_, 3
	andi	x11, x11, -4
# was:	andi	_tmp_27_, _tmp_27_, -4
	addi	x11, x11, 4
# was:	addi	_tmp_27_, _tmp_27_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_27_
	sw	x10, 0(x18)
# was:	sw	_size_24_, 0(_let_c_23_)
	addi	x10, x18, 4
# was:	addi	_addr_25_, _let_c_23_, 4
	li	x13, 1
# was:	li	_and_L_29_, 1
	beq	x0, x13, l.sc_l_31_
# was:	beq	x0, _and_L_29_, l.sc_l_31_
	li	x11, 0
# was:	li	_and_R_30_, 0
	and	x11, x13, x11
# was:	and	_NOT_exp_28_, _and_L_29_, _and_R_30_
	j	l.end_l_32_
l.sc_l_31_:
	mv	x11, x0
# was:	mv	_NOT_exp_28_, x0
l.end_l_32_:
	xori	x11, x11, 1
# was:	xori	_tmp_26_, _NOT_exp_28_, 1
	sb	x11, 0(x10)
# was:	sb	_tmp_26_, 0(_addr_25_)
	addi	x10, x10, 1
# was:	addi	_addr_25_, _addr_25_, 1
	li	x13, 0
# was:	li	_or_L_33_, 0
	bne	x0, x13, l.sc_l_35_
# was:	bne	x0, _or_L_33_, l.sc_l_35_
	li	x11, 1
# was:	li	_or_R_34_, 1
	or	x11, x13, x11
# was:	or	_tmp_26_, _or_L_33_, _or_R_34_
	j	l.end_l_36_
l.sc_l_35_:
	addi	x11, x0, 1
# was:	addi	_tmp_26_, x0, 1
l.end_l_36_:
	sb	x11, 0(x10)
# was:	sb	_tmp_26_, 0(_addr_25_)
	addi	x10, x10, 1
# was:	addi	_addr_25_, _addr_25_, 1
	li	x11, 2
# was:	li	_size_38_, 2
# 	mv	_a_39_,_let_a_2_
	bge	x11, x0, l.safe_42_
# was:	bge	_size_38_, x0, l.safe_42_
	li	x10, 5
# was:	li	x10, 5
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_42_:
	mv	x10, x3
# was:	mv	_let_a1_37_, x3
	slli	x13, x11, 2
# was:	slli	_tmp_45_, _size_38_, 2
	addi	x13, x13, 4
# was:	addi	_tmp_45_, _tmp_45_, 4
	add	x3, x3, x13
# was:	add	x3, x3, _tmp_45_
	sw	x11, 0(x10)
# was:	sw	_size_38_, 0(_let_a1_37_)
	addi	x13, x10, 4
# was:	addi	_addr_40_, _let_a1_37_, 4
	mv	x14, x0
# was:	mv	_i_41_, x0
l.loop_beg_43_:
	bge	x14, x11, l.loop_end_44_
# was:	bge	_i_41_, _size_38_, l.loop_end_44_
	sw	x12, 0(x13)
# was:	sw	_a_39_, 0(_addr_40_)
	addi	x13, x13, 4
# was:	addi	_addr_40_, _addr_40_, 4
	addi	x14, x14, 1
# was:	addi	_i_41_, _i_41_, 1
	j	l.loop_beg_43_
l.loop_end_44_:
	li	x12, 0
# was:	li	_arr_ind_47_, 0
	addi	x11, x10, 4
# was:	addi	_arr_data_48_, _let_a1_37_, 4
	bge	x12, x0, l.nonneg_51_
# was:	bge	_arr_ind_47_, x0, l.nonneg_51_
l.error_50_:
	li	x10, 6
# was:	li	x10, 6
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_51_:
	lw	x13, 0(x10)
# was:	lw	_size_49_, 0(_let_a1_37_)
	bge	x12, x13, l.error_50_
# was:	bge	_arr_ind_47_, _size_49_, l.error_50_
	slli	x12, x12, 2
# was:	slli	_arr_ind_47_, _arr_ind_47_, 2
	add	x11, x11, x12
# was:	add	_arr_data_48_, _arr_data_48_, _arr_ind_47_
	lw	x20, 0(x11)
# was:	lw	_let_a2a_46_, 0(_arr_data_48_)
	li	x12, 1
# was:	li	_arr_ind_53_, 1
	addi	x11, x10, 4
# was:	addi	_arr_data_54_, _let_a1_37_, 4
	bge	x12, x0, l.nonneg_57_
# was:	bge	_arr_ind_53_, x0, l.nonneg_57_
l.error_56_:
	li	x10, 7
# was:	li	x10, 7
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_57_:
	lw	x10, 0(x10)
# was:	lw	_size_55_, 0(_let_a1_37_)
	bge	x12, x10, l.error_56_
# was:	bge	_arr_ind_53_, _size_55_, l.error_56_
	slli	x12, x12, 2
# was:	slli	_arr_ind_53_, _arr_ind_53_, 2
	add	x11, x11, x12
# was:	add	_arr_data_54_, _arr_data_54_, _arr_ind_53_
	lw	x21, 0(x11)
# was:	lw	_let_a2b_52_, 0(_arr_data_54_)
	li	x12, 0
# was:	li	_arr_ind_60_, 0
	addi	x11, x20, 4
# was:	addi	_arr_data_61_, _let_a2a_46_, 4
	bge	x12, x0, l.nonneg_64_
# was:	bge	_arr_ind_60_, x0, l.nonneg_64_
l.error_63_:
	li	x10, 8
# was:	li	x10, 8
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_64_:
	lw	x10, 0(x20)
# was:	lw	_size_62_, 0(_let_a2a_46_)
	bge	x12, x10, l.error_63_
# was:	bge	_arr_ind_60_, _size_62_, l.error_63_
	slli	x12, x12, 2
# was:	slli	_arr_ind_60_, _arr_ind_60_, 2
	add	x11, x11, x12
# was:	add	_arr_data_61_, _arr_data_61_, _arr_ind_60_
	lw	x10, 0(x11)
# was:	lw	_tmp_59_, 0(_arr_data_61_)
# 	mv	_let_tmp1_58_,_tmp_59_
# 	mv	x10,_let_tmp1_58_
	jal	p.putint
# was:	jal	p.putint, x10
	li	x12, 1
# was:	li	_arr_ind_67_, 1
	addi	x11, x20, 4
# was:	addi	_arr_data_68_, _let_a2a_46_, 4
	bge	x12, x0, l.nonneg_71_
# was:	bge	_arr_ind_67_, x0, l.nonneg_71_
l.error_70_:
	li	x10, 9
# was:	li	x10, 9
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_71_:
	lw	x10, 0(x20)
# was:	lw	_size_69_, 0(_let_a2a_46_)
	bge	x12, x10, l.error_70_
# was:	bge	_arr_ind_67_, _size_69_, l.error_70_
	slli	x12, x12, 2
# was:	slli	_arr_ind_67_, _arr_ind_67_, 2
	add	x11, x11, x12
# was:	add	_arr_data_68_, _arr_data_68_, _arr_ind_67_
	lw	x10, 0(x11)
# was:	lw	_tmp_66_, 0(_arr_data_68_)
# 	mv	_let_tmp2_65_,_tmp_66_
# 	mv	x10,_let_tmp2_65_
	jal	p.putint
# was:	jal	p.putint, x10
	li	x10, 2
# was:	li	_arr_ind_74_, 2
	addi	x11, x20, 4
# was:	addi	_arr_data_75_, _let_a2a_46_, 4
	bge	x10, x0, l.nonneg_78_
# was:	bge	_arr_ind_74_, x0, l.nonneg_78_
l.error_77_:
	li	x10, 10
# was:	li	x10, 10
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_78_:
	lw	x12, 0(x20)
# was:	lw	_size_76_, 0(_let_a2a_46_)
	bge	x10, x12, l.error_77_
# was:	bge	_arr_ind_74_, _size_76_, l.error_77_
	slli	x10, x10, 2
# was:	slli	_arr_ind_74_, _arr_ind_74_, 2
	add	x11, x11, x10
# was:	add	_arr_data_75_, _arr_data_75_, _arr_ind_74_
	lw	x10, 0(x11)
# was:	lw	_tmp_73_, 0(_arr_data_75_)
# 	mv	_let_tmp3_72_,_tmp_73_
# 	mv	x10,_let_tmp3_72_
	jal	p.putint
# was:	jal	p.putint, x10
	li	x11, 0
# was:	li	_arr_ind_81_, 0
	addi	x12, x21, 4
# was:	addi	_arr_data_82_, _let_a2b_52_, 4
	bge	x11, x0, l.nonneg_85_
# was:	bge	_arr_ind_81_, x0, l.nonneg_85_
l.error_84_:
	li	x10, 11
# was:	li	x10, 11
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_85_:
	lw	x10, 0(x21)
# was:	lw	_size_83_, 0(_let_a2b_52_)
	bge	x11, x10, l.error_84_
# was:	bge	_arr_ind_81_, _size_83_, l.error_84_
	slli	x11, x11, 2
# was:	slli	_arr_ind_81_, _arr_ind_81_, 2
	add	x12, x12, x11
# was:	add	_arr_data_82_, _arr_data_82_, _arr_ind_81_
	lw	x10, 0(x12)
# was:	lw	_tmp_80_, 0(_arr_data_82_)
# 	mv	_let_tmp4_79_,_tmp_80_
# 	mv	x10,_let_tmp4_79_
	jal	p.putint
# was:	jal	p.putint, x10
	li	x11, 1
# was:	li	_arr_ind_88_, 1
	addi	x12, x21, 4
# was:	addi	_arr_data_89_, _let_a2b_52_, 4
	bge	x11, x0, l.nonneg_92_
# was:	bge	_arr_ind_88_, x0, l.nonneg_92_
l.error_91_:
	li	x10, 12
# was:	li	x10, 12
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_92_:
	lw	x10, 0(x21)
# was:	lw	_size_90_, 0(_let_a2b_52_)
	bge	x11, x10, l.error_91_
# was:	bge	_arr_ind_88_, _size_90_, l.error_91_
	slli	x11, x11, 2
# was:	slli	_arr_ind_88_, _arr_ind_88_, 2
	add	x12, x12, x11
# was:	add	_arr_data_89_, _arr_data_89_, _arr_ind_88_
	lw	x10, 0(x12)
# was:	lw	_tmp_87_, 0(_arr_data_89_)
# 	mv	_let_tmp5_86_,_tmp_87_
# 	mv	x10,_let_tmp5_86_
	jal	p.putint
# was:	jal	p.putint, x10
	li	x11, 2
# was:	li	_arr_ind_95_, 2
	addi	x10, x21, 4
# was:	addi	_arr_data_96_, _let_a2b_52_, 4
	bge	x11, x0, l.nonneg_99_
# was:	bge	_arr_ind_95_, x0, l.nonneg_99_
l.error_98_:
	li	x10, 13
# was:	li	x10, 13
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_99_:
	lw	x12, 0(x21)
# was:	lw	_size_97_, 0(_let_a2b_52_)
	bge	x11, x12, l.error_98_
# was:	bge	_arr_ind_95_, _size_97_, l.error_98_
	slli	x11, x11, 2
# was:	slli	_arr_ind_95_, _arr_ind_95_, 2
	add	x10, x10, x11
# was:	add	_arr_data_96_, _arr_data_96_, _arr_ind_95_
	lw	x10, 0(x10)
# was:	lw	_tmp_94_, 0(_arr_data_96_)
# 	mv	_let_tmp6_93_,_tmp_94_
# 	mv	x10,_let_tmp6_93_
	jal	p.putint
# was:	jal	p.putint, x10
	li	x10, 1
# was:	li	_size_101_, 1
# 	mv	_a_102_,_let_b_17_
	bge	x10, x0, l.safe_105_
# was:	bge	_size_101_, x0, l.safe_105_
	li	x10, 14
# was:	li	x10, 14
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_105_:
	mv	x12, x3
# was:	mv	_let_b1_100_, x3
	slli	x11, x10, 2
# was:	slli	_tmp_108_, _size_101_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_108_, _tmp_108_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_108_
	sw	x10, 0(x12)
# was:	sw	_size_101_, 0(_let_b1_100_)
	addi	x11, x12, 4
# was:	addi	_addr_103_, _let_b1_100_, 4
	mv	x13, x0
# was:	mv	_i_104_, x0
l.loop_beg_106_:
	bge	x13, x10, l.loop_end_107_
# was:	bge	_i_104_, _size_101_, l.loop_end_107_
	sw	x19, 0(x11)
# was:	sw	_a_102_, 0(_addr_103_)
	addi	x11, x11, 4
# was:	addi	_addr_103_, _addr_103_, 4
	addi	x13, x13, 1
# was:	addi	_i_104_, _i_104_, 1
	j	l.loop_beg_106_
l.loop_end_107_:
	li	x11, 0
# was:	li	_arr_ind_110_, 0
	addi	x10, x12, 4
# was:	addi	_arr_data_111_, _let_b1_100_, 4
	bge	x11, x0, l.nonneg_114_
# was:	bge	_arr_ind_110_, x0, l.nonneg_114_
l.error_113_:
	li	x10, 15
# was:	li	x10, 15
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_114_:
	lw	x12, 0(x12)
# was:	lw	_size_112_, 0(_let_b1_100_)
	bge	x11, x12, l.error_113_
# was:	bge	_arr_ind_110_, _size_112_, l.error_113_
	slli	x11, x11, 2
# was:	slli	_arr_ind_110_, _arr_ind_110_, 2
	add	x10, x10, x11
# was:	add	_arr_data_111_, _arr_data_111_, _arr_ind_110_
	lw	x12, 0(x10)
# was:	lw	_let_b2a_109_, 0(_arr_data_111_)
	li	x10, 0
# was:	li	_arr_ind_117_, 0
	addi	x11, x12, 4
# was:	addi	_arr_data_118_, _let_b2a_109_, 4
	bge	x10, x0, l.nonneg_121_
# was:	bge	_arr_ind_117_, x0, l.nonneg_121_
l.error_120_:
	li	x10, 16
# was:	li	x10, 16
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_121_:
	lw	x12, 0(x12)
# was:	lw	_size_119_, 0(_let_b2a_109_)
	bge	x10, x12, l.error_120_
# was:	bge	_arr_ind_117_, _size_119_, l.error_120_
	slli	x10, x10, 2
# was:	slli	_arr_ind_117_, _arr_ind_117_, 2
	add	x11, x11, x10
# was:	add	_arr_data_118_, _arr_data_118_, _arr_ind_117_
	lw	x10, 0(x11)
# was:	lw	_tmp_116_, 0(_arr_data_118_)
# 	mv	_let_tmp1_115_,_tmp_116_
# 	mv	x10,_tmp_116_
	jal	p.putstring
# was:	jal	p.putstring, x10
	li	x10, 2
# was:	li	_size_123_, 2
# 	mv	_a_124_,_let_c_23_
	bge	x10, x0, l.safe_127_
# was:	bge	_size_123_, x0, l.safe_127_
	li	x10, 17
# was:	li	x10, 17
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_127_:
	mv	x11, x3
# was:	mv	_let_c1_122_, x3
	slli	x12, x10, 2
# was:	slli	_tmp_130_, _size_123_, 2
	addi	x12, x12, 4
# was:	addi	_tmp_130_, _tmp_130_, 4
	add	x3, x3, x12
# was:	add	x3, x3, _tmp_130_
	sw	x10, 0(x11)
# was:	sw	_size_123_, 0(_let_c1_122_)
	addi	x13, x11, 4
# was:	addi	_addr_125_, _let_c1_122_, 4
	mv	x12, x0
# was:	mv	_i_126_, x0
l.loop_beg_128_:
	bge	x12, x10, l.loop_end_129_
# was:	bge	_i_126_, _size_123_, l.loop_end_129_
	sw	x18, 0(x13)
# was:	sw	_a_124_, 0(_addr_125_)
	addi	x13, x13, 4
# was:	addi	_addr_125_, _addr_125_, 4
	addi	x12, x12, 1
# was:	addi	_i_126_, _i_126_, 1
	j	l.loop_beg_128_
l.loop_end_129_:
	li	x12, 0
# was:	li	_arr_ind_132_, 0
	addi	x13, x11, 4
# was:	addi	_arr_data_133_, _let_c1_122_, 4
	bge	x12, x0, l.nonneg_136_
# was:	bge	_arr_ind_132_, x0, l.nonneg_136_
l.error_135_:
	li	x10, 18
# was:	li	x10, 18
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_136_:
	lw	x10, 0(x11)
# was:	lw	_size_134_, 0(_let_c1_122_)
	bge	x12, x10, l.error_135_
# was:	bge	_arr_ind_132_, _size_134_, l.error_135_
	slli	x12, x12, 2
# was:	slli	_arr_ind_132_, _arr_ind_132_, 2
	add	x13, x13, x12
# was:	add	_arr_data_133_, _arr_data_133_, _arr_ind_132_
	lw	x18, 0(x13)
# was:	lw	_let_c2a_131_, 0(_arr_data_133_)
	li	x12, 1
# was:	li	_arr_ind_138_, 1
	addi	x10, x11, 4
# was:	addi	_arr_data_139_, _let_c1_122_, 4
	bge	x12, x0, l.nonneg_142_
# was:	bge	_arr_ind_138_, x0, l.nonneg_142_
l.error_141_:
	li	x10, 19
# was:	li	x10, 19
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_142_:
	lw	x11, 0(x11)
# was:	lw	_size_140_, 0(_let_c1_122_)
	bge	x12, x11, l.error_141_
# was:	bge	_arr_ind_138_, _size_140_, l.error_141_
	slli	x12, x12, 2
# was:	slli	_arr_ind_138_, _arr_ind_138_, 2
	add	x10, x10, x12
# was:	add	_arr_data_139_, _arr_data_139_, _arr_ind_138_
	lw	x19, 0(x10)
# was:	lw	_let_c2b_137_, 0(_arr_data_139_)
	li	x12, 0
# was:	li	_arr_ind_145_, 0
	addi	x11, x18, 4
# was:	addi	_arr_data_146_, _let_c2a_131_, 4
	bge	x12, x0, l.nonneg_149_
# was:	bge	_arr_ind_145_, x0, l.nonneg_149_
l.error_148_:
	li	x10, 20
# was:	li	x10, 20
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_149_:
	lw	x10, 0(x18)
# was:	lw	_size_147_, 0(_let_c2a_131_)
	bge	x12, x10, l.error_148_
# was:	bge	_arr_ind_145_, _size_147_, l.error_148_
	add	x11, x11, x12
# was:	add	_arr_data_146_, _arr_data_146_, _arr_ind_145_
	lbu	x11, 0(x11)
# was:	lbu	_tmp_144_, 0(_arr_data_146_)
# 	mv	_let_tmp1_143_,_tmp_144_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x11, x0, l.wBoolF_150_
# was:	bne	_let_tmp1_143_, x0, l.wBoolF_150_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_150_:
	jal	p.putstring
# was:	jal	p.putstring, x10
	li	x11, 1
# was:	li	_arr_ind_153_, 1
	addi	x10, x18, 4
# was:	addi	_arr_data_154_, _let_c2a_131_, 4
	bge	x11, x0, l.nonneg_157_
# was:	bge	_arr_ind_153_, x0, l.nonneg_157_
l.error_156_:
	li	x10, 21
# was:	li	x10, 21
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_157_:
	lw	x12, 0(x18)
# was:	lw	_size_155_, 0(_let_c2a_131_)
	bge	x11, x12, l.error_156_
# was:	bge	_arr_ind_153_, _size_155_, l.error_156_
	add	x10, x10, x11
# was:	add	_arr_data_154_, _arr_data_154_, _arr_ind_153_
	lbu	x11, 0(x10)
# was:	lbu	_tmp_152_, 0(_arr_data_154_)
# 	mv	_let_tmp2_151_,_tmp_152_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x11, x0, l.wBoolF_158_
# was:	bne	_let_tmp2_151_, x0, l.wBoolF_158_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_158_:
	jal	p.putstring
# was:	jal	p.putstring, x10
	li	x11, 0
# was:	li	_arr_ind_161_, 0
	addi	x10, x19, 4
# was:	addi	_arr_data_162_, _let_c2b_137_, 4
	bge	x11, x0, l.nonneg_165_
# was:	bge	_arr_ind_161_, x0, l.nonneg_165_
l.error_164_:
	li	x10, 22
# was:	li	x10, 22
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_165_:
	lw	x12, 0(x19)
# was:	lw	_size_163_, 0(_let_c2b_137_)
	bge	x11, x12, l.error_164_
# was:	bge	_arr_ind_161_, _size_163_, l.error_164_
	add	x10, x10, x11
# was:	add	_arr_data_162_, _arr_data_162_, _arr_ind_161_
	lbu	x11, 0(x10)
# was:	lbu	_tmp_160_, 0(_arr_data_162_)
# 	mv	_let_tmp1_159_,_tmp_160_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x11, x0, l.wBoolF_166_
# was:	bne	_let_tmp1_159_, x0, l.wBoolF_166_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_166_:
	jal	p.putstring
# was:	jal	p.putstring, x10
	li	x10, 1
# was:	li	_arr_ind_169_, 1
	addi	x11, x19, 4
# was:	addi	_arr_data_170_, _let_c2b_137_, 4
	bge	x10, x0, l.nonneg_173_
# was:	bge	_arr_ind_169_, x0, l.nonneg_173_
l.error_172_:
	li	x10, 23
# was:	li	x10, 23
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_173_:
	lw	x12, 0(x19)
# was:	lw	_size_171_, 0(_let_c2b_137_)
	bge	x10, x12, l.error_172_
# was:	bge	_arr_ind_169_, _size_171_, l.error_172_
	add	x11, x11, x10
# was:	add	_arr_data_170_, _arr_data_170_, _arr_ind_169_
	lbu	x11, 0(x11)
# was:	lbu	_tmp_168_, 0(_arr_data_170_)
# 	mv	_let_tmp2_167_,_tmp_168_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x11, x0, l.wBoolF_174_
# was:	bne	_let_tmp2_167_, x0, l.wBoolF_174_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_174_:
	jal	p.putstring
# was:	jal	p.putstring, x10
	li	x10, 0
# was:	li	_mainres_1_, 0
# 	mv	x10,_mainres_1_
	addi	x2, x2, 20
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
s.a_22_:
	.word	1
	.ascii	"a"
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