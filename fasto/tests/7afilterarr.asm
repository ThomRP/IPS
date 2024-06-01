	.text	0x00400000
	la	x3, d.heap
	jal	f.main
	jal	p.stop
# User functions
# Function fun1
f.fun1:
	sw	x1, -4(x2)
	addi	x2, x2, -4
	mv	x12, x10
# was:	mv	_param_a_1_, x10
	li	x11, 0
# was:	li	_arr_ind_4_, 0
	addi	x10, x12, 4
# was:	addi	_arr_data_5_, _param_a_1_, 4
	bge	x11, x0, l.nonneg_8_
# was:	bge	_arr_ind_4_, x0, l.nonneg_8_
l.error_7_:
	li	x10, 2
# was:	li	x10, 2
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_8_:
	lw	x12, 0(x12)
# was:	lw	_size_6_, 0(_param_a_1_)
	bge	x11, x12, l.error_7_
# was:	bge	_arr_ind_4_, _size_6_, l.error_7_
	slli	x11, x11, 2
# was:	slli	_arr_ind_4_, _arr_ind_4_, 2
	add	x10, x10, x11
# was:	add	_arr_data_5_, _arr_data_5_, _arr_ind_4_
	lw	x13, 0(x10)
# was:	lw	_let_tmp_3_, 0(_arr_data_5_)
	la	x10, s.h_10_
# was:	la	_let_tmp1_9_, s.h_10_
# s.h_10_: string "h"
	li	x12, 0
# was:	li	_arr_ind_17_, 0
	addi	x11, x13, 4
# was:	addi	_arr_data_18_, _let_tmp_3_, 4
	bge	x12, x0, l.nonneg_21_
# was:	bge	_arr_ind_17_, x0, l.nonneg_21_
l.error_20_:
	li	x10, 4
# was:	li	x10, 4
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_21_:
	lw	x13, 0(x13)
# was:	lw	_size_19_, 0(_let_tmp_3_)
	bge	x12, x13, l.error_20_
# was:	bge	_arr_ind_17_, _size_19_, l.error_20_
	add	x11, x11, x12
# was:	add	_arr_data_18_, _arr_data_18_, _arr_ind_17_
	lbu	x11, 0(x11)
# was:	lbu	_eq_L_15_, 0(_arr_data_18_)
	li	x13, 0
# was:	li	_arr_ind_22_, 0
	addi	x12, x10, 4
# was:	addi	_arr_data_23_, _let_tmp1_9_, 4
	bge	x13, x0, l.nonneg_26_
# was:	bge	_arr_ind_22_, x0, l.nonneg_26_
l.error_25_:
	li	x10, 4
# was:	li	x10, 4
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_26_:
	lw	x10, 0(x10)
# was:	lw	_size_24_, 0(_let_tmp1_9_)
	bge	x13, x10, l.error_25_
# was:	bge	_arr_ind_22_, _size_24_, l.error_25_
	add	x12, x12, x13
# was:	add	_arr_data_23_, _arr_data_23_, _arr_ind_22_
	lbu	x10, 0(x12)
# was:	lbu	_eq_R_16_, 0(_arr_data_23_)
	li	x12, 0
# was:	li	_cond_14_, 0
	bne	x11, x10, l.false_27_
# was:	bne	_eq_L_15_, _eq_R_16_, l.false_27_
	li	x12, 1
# was:	li	_cond_14_, 1
l.false_27_:
	bne	x12, x0, l.then_11_
# was:	bne	_cond_14_, x0, l.then_11_
	j	l.else_12_
l.then_11_:
	li	x10, 1
# was:	li	_fun1res_2_, 1
	j	l.endif_13_
l.else_12_:
	li	x10, 0
# was:	li	_fun1res_2_, 0
l.endif_13_:
# 	mv	x10,_fun1res_2_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function fun2
f.fun2:
	sw	x1, -4(x2)
	sw	x21, -20(x2)
	sw	x20, -16(x2)
	sw	x19, -12(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -20
# 	mv	_param_a_28_,x10
	li	x18, 36
# was:	li	_eq_L_34_, 36
	mv	x20, x10
# was:	mv	_arr_36_, _param_a_28_
	lw	x19, 0(x20)
# was:	lw	_size_37_, 0(_arr_36_)
	li	x10, 0
# was:	li	_eq_R_35_, 0
	addi	x20, x20, 4
# was:	addi	_arr_36_, _arr_36_, 4
	mv	x21, x0
# was:	mv	_ind_var_38_, x0
l.loop_beg_40_:
	bge	x21, x19, l.loop_end_41_
# was:	bge	_ind_var_38_, _size_37_, l.loop_end_41_
	lw	x11, 0(x20)
# was:	lw	_tmp_39_, 0(_arr_36_)
	addi	x20, x20, 4
# was:	addi	_arr_36_, _arr_36_, 4
# 	mv	x10,_eq_R_35_
# 	mv	x11,_tmp_39_
	jal	f.incr
# was:	jal	f.incr, x10 x11
# 	mv	_tmp_42_,x10
# 	mv	_eq_R_35_,_tmp_42_
	addi	x21, x21, 1
# was:	addi	_ind_var_38_, _ind_var_38_, 1
	j	l.loop_beg_40_
l.loop_end_41_:
	li	x11, 0
# was:	li	_cond_33_, 0
	bne	x18, x10, l.false_43_
# was:	bne	_eq_L_34_, _eq_R_35_, l.false_43_
	li	x11, 1
# was:	li	_cond_33_, 1
l.false_43_:
	bne	x11, x0, l.then_30_
# was:	bne	_cond_33_, x0, l.then_30_
	j	l.else_31_
l.then_30_:
	li	x10, 1
# was:	li	_fun2res_29_, 1
	j	l.endif_32_
l.else_31_:
	li	x10, 0
# was:	li	_fun2res_29_, 0
l.endif_32_:
# 	mv	x10,_fun2res_29_
	addi	x2, x2, 20
	lw	x21, -20(x2)
	lw	x20, -16(x2)
	lw	x19, -12(x2)
	lw	x18, -8(x2)
	lw	x1, -4(x2)
	jr	x1
# Function incr
f.incr:
	sw	x1, -4(x2)
	addi	x2, x2, -4
# 	mv	_param_a_44_,x10
# 	mv	_param_b_45_,x11
# 	mv	_plus_L_47_,_param_a_44_
# 	mv	_plus_R_48_,_param_b_45_
	add	x10, x10, x11
# was:	add	_incrres_46_, _plus_L_47_, _plus_R_48_
# 	mv	x10,_incrres_46_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function fun3
f.fun3:
	sw	x1, -4(x2)
	addi	x2, x2, -4
	mv	x12, x10
# was:	mv	_param_a_49_, x10
	li	x10, 0
# was:	li	_arr_ind_51_, 0
	addi	x11, x12, 4
# was:	addi	_arr_data_52_, _param_a_49_, 4
	bge	x10, x0, l.nonneg_55_
# was:	bge	_arr_ind_51_, x0, l.nonneg_55_
l.error_54_:
	li	x10, 17
# was:	li	x10, 17
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_55_:
	lw	x12, 0(x12)
# was:	lw	_size_53_, 0(_param_a_49_)
	bge	x10, x12, l.error_54_
# was:	bge	_arr_ind_51_, _size_53_, l.error_54_
	add	x11, x11, x10
# was:	add	_arr_data_52_, _arr_data_52_, _arr_ind_51_
	lbu	x10, 0(x11)
# was:	lbu	_fun3res_50_, 0(_arr_data_52_)
# 	mv	x10,_fun3res_50_
	addi	x2, x2, 4
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
	li	x12, 2
# was:	li	_size_63_, 2
	mv	x10, x3
# was:	mv	_arr_59_, x3
	slli	x11, x12, 2
# was:	slli	_tmp_66_, _size_63_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_66_, _tmp_66_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_66_
	sw	x12, 0(x10)
# was:	sw	_size_63_, 0(_arr_59_)
	addi	x12, x10, 4
# was:	addi	_addr_64_, _arr_59_, 4
	li	x14, 3
# was:	li	_size_67_, 3
	mv	x11, x3
# was:	mv	_tmp_65_, x3
	slli	x13, x14, 2
# was:	slli	_tmp_70_, _size_67_, 2
	addi	x13, x13, 4
# was:	addi	_tmp_70_, _tmp_70_, 4
	add	x3, x3, x13
# was:	add	x3, x3, _tmp_70_
	sw	x14, 0(x11)
# was:	sw	_size_67_, 0(_tmp_65_)
	addi	x14, x11, 4
# was:	addi	_addr_68_, _tmp_65_, 4
	la	x13, s.ant_71_
# was:	la	_tmp_69_, s.ant_71_
# s.ant_71_: string "ant"
	sw	x13, 0(x14)
# was:	sw	_tmp_69_, 0(_addr_68_)
	addi	x14, x14, 4
# was:	addi	_addr_68_, _addr_68_, 4
	la	x13, s.bear_72_
# was:	la	_tmp_69_, s.bear_72_
# s.bear_72_: string "bear"
	sw	x13, 0(x14)
# was:	sw	_tmp_69_, 0(_addr_68_)
	addi	x14, x14, 4
# was:	addi	_addr_68_, _addr_68_, 4
	la	x13, s.cat_73_
# was:	la	_tmp_69_, s.cat_73_
# s.cat_73_: string "cat"
	sw	x13, 0(x14)
# was:	sw	_tmp_69_, 0(_addr_68_)
	addi	x14, x14, 4
# was:	addi	_addr_68_, _addr_68_, 4
	sw	x11, 0(x12)
# was:	sw	_tmp_65_, 0(_addr_64_)
	addi	x12, x12, 4
# was:	addi	_addr_64_, _addr_64_, 4
	li	x14, 2
# was:	li	_size_74_, 2
	mv	x11, x3
# was:	mv	_tmp_65_, x3
	slli	x13, x14, 2
# was:	slli	_tmp_77_, _size_74_, 2
	addi	x13, x13, 4
# was:	addi	_tmp_77_, _tmp_77_, 4
	add	x3, x3, x13
# was:	add	x3, x3, _tmp_77_
	sw	x14, 0(x11)
# was:	sw	_size_74_, 0(_tmp_65_)
	addi	x14, x11, 4
# was:	addi	_addr_75_, _tmp_65_, 4
	la	x13, s.hello_78_
# was:	la	_tmp_76_, s.hello_78_
# s.hello_78_: string "hello"
	sw	x13, 0(x14)
# was:	sw	_tmp_76_, 0(_addr_75_)
	addi	x14, x14, 4
# was:	addi	_addr_75_, _addr_75_, 4
	la	x13, s.world_79_
# was:	la	_tmp_76_, s.world_79_
# s.world_79_: string "world"
	sw	x13, 0(x14)
# was:	sw	_tmp_76_, 0(_addr_75_)
	addi	x14, x14, 4
# was:	addi	_addr_75_, _addr_75_, 4
	sw	x11, 0(x12)
# was:	sw	_tmp_65_, 0(_addr_64_)
	addi	x12, x12, 4
# was:	addi	_addr_64_, _addr_64_, 4
	lw	x20, 0(x10)
# was:	lw	_size_58_, 0(_arr_59_)
	mv	x19, x3
# was:	mv	_let_a_57_, x3
	slli	x11, x20, 2
# was:	slli	_tmp_87_, _size_58_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_87_, _tmp_87_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_87_
	sw	x20, 0(x19)
# was:	sw	_size_58_, 0(_let_a_57_)
	addi	x22, x19, 4
# was:	addi	_addrg_80_, _let_a_57_, 4
	mv	x21, x0
# was:	mv	_i_81_, x0
	mv	x23, x0
# was:	mv	_j_82_, x0
	addi	x24, x10, 4
# was:	addi	_elem_60_, _arr_59_, 4
l.loop_beg_83_:
	bge	x21, x20, l.loop_end_85_
# was:	bge	_i_81_, _size_58_, l.loop_end_85_
	lw	x18, 0(x24)
# was:	lw	_tmp_62_, 0(_elem_60_)
	addi	x24, x24, 4
# was:	addi	_elem_60_, _elem_60_, 4
	mv	x10, x18
# was:	mv	x10, _tmp_62_
	jal	f.fun1
# was:	jal	f.fun1, x10
# 	mv	_tmp_86_,x10
# 	mv	_res_61_,_tmp_86_
	beq	x10, x0, l.loop_foot_84_
# was:	beq	_res_61_, x0, l.loop_foot_84_
	sw	x18, 0(x22)
# was:	sw	_tmp_62_, 0(_addrg_80_)
	addi	x22, x22, 4
# was:	addi	_addrg_80_, _addrg_80_, 4
	addi	x23, x23, 1
# was:	addi	_j_82_, _j_82_, 1
l.loop_foot_84_:
	addi	x21, x21, 1
# was:	addi	_i_81_, _i_81_, 1
	j	l.loop_beg_83_
l.loop_end_85_:
	sw	x23, 0(x19)
# was:	sw	_j_82_, 0(_let_a_57_)
	li	x10, 0
# was:	li	_arr_ind_89_, 0
	addi	x11, x19, 4
# was:	addi	_arr_data_90_, _let_a_57_, 4
	bge	x10, x0, l.nonneg_93_
# was:	bge	_arr_ind_89_, x0, l.nonneg_93_
l.error_92_:
	li	x10, 21
# was:	li	x10, 21
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_93_:
	lw	x12, 0(x19)
# was:	lw	_size_91_, 0(_let_a_57_)
	bge	x10, x12, l.error_92_
# was:	bge	_arr_ind_89_, _size_91_, l.error_92_
	slli	x10, x10, 2
# was:	slli	_arr_ind_89_, _arr_ind_89_, 2
	add	x11, x11, x10
# was:	add	_arr_data_90_, _arr_data_90_, _arr_ind_89_
	lw	x18, 0(x11)
# was:	lw	_let_tmp1_88_, 0(_arr_data_90_)
	li	x10, 0
# was:	li	_arr_ind_96_, 0
	addi	x12, x18, 4
# was:	addi	_arr_data_97_, _let_tmp1_88_, 4
	bge	x10, x0, l.nonneg_100_
# was:	bge	_arr_ind_96_, x0, l.nonneg_100_
l.error_99_:
	li	x10, 22
# was:	li	x10, 22
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_100_:
	lw	x11, 0(x18)
# was:	lw	_size_98_, 0(_let_tmp1_88_)
	bge	x10, x11, l.error_99_
# was:	bge	_arr_ind_96_, _size_98_, l.error_99_
	slli	x10, x10, 2
# was:	slli	_arr_ind_96_, _arr_ind_96_, 2
	add	x12, x12, x10
# was:	add	_arr_data_97_, _arr_data_97_, _arr_ind_96_
	lw	x10, 0(x12)
# was:	lw	_tmp_95_, 0(_arr_data_97_)
# 	mv	_let_tmp2_94_,_tmp_95_
# 	mv	x10,_tmp_95_
	jal	p.putstring
# was:	jal	p.putstring, x10
	li	x10, 1
# was:	li	_arr_ind_103_, 1
	addi	x11, x18, 4
# was:	addi	_arr_data_104_, _let_tmp1_88_, 4
	bge	x10, x0, l.nonneg_107_
# was:	bge	_arr_ind_103_, x0, l.nonneg_107_
l.error_106_:
	li	x10, 23
# was:	li	x10, 23
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_107_:
	lw	x12, 0(x18)
# was:	lw	_size_105_, 0(_let_tmp1_88_)
	bge	x10, x12, l.error_106_
# was:	bge	_arr_ind_103_, _size_105_, l.error_106_
	slli	x10, x10, 2
# was:	slli	_arr_ind_103_, _arr_ind_103_, 2
	add	x11, x11, x10
# was:	add	_arr_data_104_, _arr_data_104_, _arr_ind_103_
	lw	x10, 0(x11)
# was:	lw	_tmp_102_, 0(_arr_data_104_)
# 	mv	_let_tmp2b_101_,_tmp_102_
# 	mv	x10,_tmp_102_
	jal	p.putstring
# was:	jal	p.putstring, x10
	li	x12, 2
# was:	li	_size_114_, 2
	mv	x10, x3
# was:	mv	_arr_110_, x3
	slli	x11, x12, 2
# was:	slli	_tmp_117_, _size_114_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_117_, _tmp_117_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_117_
	sw	x12, 0(x10)
# was:	sw	_size_114_, 0(_arr_110_)
	addi	x13, x10, 4
# was:	addi	_addr_115_, _arr_110_, 4
	li	x14, 3
# was:	li	_size_118_, 3
	mv	x12, x3
# was:	mv	_tmp_116_, x3
	addi	x11, x14, 3
# was:	addi	_tmp_121_, _size_118_, 3
	andi	x11, x11, -4
# was:	andi	_tmp_121_, _tmp_121_, -4
	addi	x11, x11, 4
# was:	addi	_tmp_121_, _tmp_121_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_121_
	sw	x14, 0(x12)
# was:	sw	_size_118_, 0(_tmp_116_)
	addi	x14, x12, 4
# was:	addi	_addr_119_, _tmp_116_, 4
	li	x11, 1
# was:	li	_tmp_120_, 1
	sb	x11, 0(x14)
# was:	sb	_tmp_120_, 0(_addr_119_)
	addi	x14, x14, 1
# was:	addi	_addr_119_, _addr_119_, 1
	li	x11, 0
# was:	li	_tmp_120_, 0
	sb	x11, 0(x14)
# was:	sb	_tmp_120_, 0(_addr_119_)
	addi	x14, x14, 1
# was:	addi	_addr_119_, _addr_119_, 1
	li	x11, 0
# was:	li	_tmp_120_, 0
	sb	x11, 0(x14)
# was:	sb	_tmp_120_, 0(_addr_119_)
	addi	x14, x14, 1
# was:	addi	_addr_119_, _addr_119_, 1
	sw	x12, 0(x13)
# was:	sw	_tmp_116_, 0(_addr_115_)
	addi	x13, x13, 4
# was:	addi	_addr_115_, _addr_115_, 4
	li	x14, 3
# was:	li	_size_122_, 3
	mv	x12, x3
# was:	mv	_tmp_116_, x3
	addi	x11, x14, 3
# was:	addi	_tmp_125_, _size_122_, 3
	andi	x11, x11, -4
# was:	andi	_tmp_125_, _tmp_125_, -4
	addi	x11, x11, 4
# was:	addi	_tmp_125_, _tmp_125_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_125_
	sw	x14, 0(x12)
# was:	sw	_size_122_, 0(_tmp_116_)
	addi	x14, x12, 4
# was:	addi	_addr_123_, _tmp_116_, 4
	li	x11, 0
# was:	li	_tmp_124_, 0
	sb	x11, 0(x14)
# was:	sb	_tmp_124_, 0(_addr_123_)
	addi	x14, x14, 1
# was:	addi	_addr_123_, _addr_123_, 1
	li	x11, 1
# was:	li	_tmp_124_, 1
	sb	x11, 0(x14)
# was:	sb	_tmp_124_, 0(_addr_123_)
	addi	x14, x14, 1
# was:	addi	_addr_123_, _addr_123_, 1
	li	x11, 1
# was:	li	_tmp_124_, 1
	sb	x11, 0(x14)
# was:	sb	_tmp_124_, 0(_addr_123_)
	addi	x14, x14, 1
# was:	addi	_addr_123_, _addr_123_, 1
	sw	x12, 0(x13)
# was:	sw	_tmp_116_, 0(_addr_115_)
	addi	x13, x13, 4
# was:	addi	_addr_115_, _addr_115_, 4
	lw	x18, 0(x10)
# was:	lw	_size_109_, 0(_arr_110_)
	mv	x22, x3
# was:	mv	_let_tmp3_108_, x3
	slli	x11, x18, 2
# was:	slli	_tmp_133_, _size_109_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_133_, _tmp_133_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_133_
	sw	x18, 0(x22)
# was:	sw	_size_109_, 0(_let_tmp3_108_)
	addi	x20, x22, 4
# was:	addi	_addrg_126_, _let_tmp3_108_, 4
	mv	x21, x0
# was:	mv	_i_127_, x0
	mv	x19, x0
# was:	mv	_j_128_, x0
	addi	x23, x10, 4
# was:	addi	_elem_111_, _arr_110_, 4
l.loop_beg_129_:
	bge	x21, x18, l.loop_end_131_
# was:	bge	_i_127_, _size_109_, l.loop_end_131_
	lw	x24, 0(x23)
# was:	lw	_tmp_113_, 0(_elem_111_)
	addi	x23, x23, 4
# was:	addi	_elem_111_, _elem_111_, 4
	mv	x10, x24
# was:	mv	x10, _tmp_113_
	jal	f.fun3
# was:	jal	f.fun3, x10
# 	mv	_tmp_132_,x10
# 	mv	_res_112_,_tmp_132_
	beq	x10, x0, l.loop_foot_130_
# was:	beq	_res_112_, x0, l.loop_foot_130_
	sw	x24, 0(x20)
# was:	sw	_tmp_113_, 0(_addrg_126_)
	addi	x20, x20, 4
# was:	addi	_addrg_126_, _addrg_126_, 4
	addi	x19, x19, 1
# was:	addi	_j_128_, _j_128_, 1
l.loop_foot_130_:
	addi	x21, x21, 1
# was:	addi	_i_127_, _i_127_, 1
	j	l.loop_beg_129_
l.loop_end_131_:
	sw	x19, 0(x22)
# was:	sw	_j_128_, 0(_let_tmp3_108_)
	li	x11, 0
# was:	li	_arr_ind_135_, 0
	addi	x10, x22, 4
# was:	addi	_arr_data_136_, _let_tmp3_108_, 4
	bge	x11, x0, l.nonneg_139_
# was:	bge	_arr_ind_135_, x0, l.nonneg_139_
l.error_138_:
	li	x10, 25
# was:	li	x10, 25
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_139_:
	lw	x12, 0(x22)
# was:	lw	_size_137_, 0(_let_tmp3_108_)
	bge	x11, x12, l.error_138_
# was:	bge	_arr_ind_135_, _size_137_, l.error_138_
	slli	x11, x11, 2
# was:	slli	_arr_ind_135_, _arr_ind_135_, 2
	add	x10, x10, x11
# was:	add	_arr_data_136_, _arr_data_136_, _arr_ind_135_
	lw	x18, 0(x10)
# was:	lw	_let_tmp3b_134_, 0(_arr_data_136_)
	li	x12, 0
# was:	li	_arr_ind_142_, 0
	addi	x10, x18, 4
# was:	addi	_arr_data_143_, _let_tmp3b_134_, 4
	bge	x12, x0, l.nonneg_146_
# was:	bge	_arr_ind_142_, x0, l.nonneg_146_
l.error_145_:
	li	x10, 26
# was:	li	x10, 26
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_146_:
	lw	x11, 0(x18)
# was:	lw	_size_144_, 0(_let_tmp3b_134_)
	bge	x12, x11, l.error_145_
# was:	bge	_arr_ind_142_, _size_144_, l.error_145_
	add	x10, x10, x12
# was:	add	_arr_data_143_, _arr_data_143_, _arr_ind_142_
	lbu	x11, 0(x10)
# was:	lbu	_tmp_141_, 0(_arr_data_143_)
# 	mv	_let_tmp3c_140_,_tmp_141_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x11, x0, l.wBoolF_147_
# was:	bne	_let_tmp3c_140_, x0, l.wBoolF_147_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_147_:
	jal	p.putstring
# was:	jal	p.putstring, x10
	li	x12, 1
# was:	li	_arr_ind_150_, 1
	addi	x10, x18, 4
# was:	addi	_arr_data_151_, _let_tmp3b_134_, 4
	bge	x12, x0, l.nonneg_154_
# was:	bge	_arr_ind_150_, x0, l.nonneg_154_
l.error_153_:
	li	x10, 27
# was:	li	x10, 27
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_154_:
	lw	x11, 0(x18)
# was:	lw	_size_152_, 0(_let_tmp3b_134_)
	bge	x12, x11, l.error_153_
# was:	bge	_arr_ind_150_, _size_152_, l.error_153_
	add	x10, x10, x12
# was:	add	_arr_data_151_, _arr_data_151_, _arr_ind_150_
	lbu	x11, 0(x10)
# was:	lbu	_tmp_149_, 0(_arr_data_151_)
# 	mv	_let_tmp3c_148_,_tmp_149_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x11, x0, l.wBoolF_155_
# was:	bne	_let_tmp3c_148_, x0, l.wBoolF_155_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_155_:
	jal	p.putstring
# was:	jal	p.putstring, x10
	li	x10, 2
# was:	li	_arr_ind_158_, 2
	addi	x11, x18, 4
# was:	addi	_arr_data_159_, _let_tmp3b_134_, 4
	bge	x10, x0, l.nonneg_162_
# was:	bge	_arr_ind_158_, x0, l.nonneg_162_
l.error_161_:
	li	x10, 28
# was:	li	x10, 28
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_162_:
	lw	x12, 0(x18)
# was:	lw	_size_160_, 0(_let_tmp3b_134_)
	bge	x10, x12, l.error_161_
# was:	bge	_arr_ind_158_, _size_160_, l.error_161_
	add	x11, x11, x10
# was:	add	_arr_data_159_, _arr_data_159_, _arr_ind_158_
	lbu	x11, 0(x11)
# was:	lbu	_tmp_157_, 0(_arr_data_159_)
# 	mv	_let_tmp3c_156_,_tmp_157_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x11, x0, l.wBoolF_163_
# was:	bne	_let_tmp3c_156_, x0, l.wBoolF_163_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_163_:
	jal	p.putstring
# was:	jal	p.putstring, x10
	li	x11, 2
# was:	li	_size_170_, 2
	mv	x10, x3
# was:	mv	_arr_166_, x3
	slli	x12, x11, 2
# was:	slli	_tmp_173_, _size_170_, 2
	addi	x12, x12, 4
# was:	addi	_tmp_173_, _tmp_173_, 4
	add	x3, x3, x12
# was:	add	x3, x3, _tmp_173_
	sw	x11, 0(x10)
# was:	sw	_size_170_, 0(_arr_166_)
	addi	x12, x10, 4
# was:	addi	_addr_171_, _arr_166_, 4
	li	x11, 3
# was:	li	_size_174_, 3
	mv	x13, x3
# was:	mv	_tmp_172_, x3
	slli	x14, x11, 2
# was:	slli	_tmp_177_, _size_174_, 2
	addi	x14, x14, 4
# was:	addi	_tmp_177_, _tmp_177_, 4
	add	x3, x3, x14
# was:	add	x3, x3, _tmp_177_
	sw	x11, 0(x13)
# was:	sw	_size_174_, 0(_tmp_172_)
	addi	x11, x13, 4
# was:	addi	_addr_175_, _tmp_172_, 4
	li	x14, 1
# was:	li	_tmp_176_, 1
	sw	x14, 0(x11)
# was:	sw	_tmp_176_, 0(_addr_175_)
	addi	x11, x11, 4
# was:	addi	_addr_175_, _addr_175_, 4
	li	x14, 2
# was:	li	_tmp_176_, 2
	sw	x14, 0(x11)
# was:	sw	_tmp_176_, 0(_addr_175_)
	addi	x11, x11, 4
# was:	addi	_addr_175_, _addr_175_, 4
	li	x14, 3
# was:	li	_tmp_176_, 3
	sw	x14, 0(x11)
# was:	sw	_tmp_176_, 0(_addr_175_)
	addi	x11, x11, 4
# was:	addi	_addr_175_, _addr_175_, 4
	sw	x13, 0(x12)
# was:	sw	_tmp_172_, 0(_addr_171_)
	addi	x12, x12, 4
# was:	addi	_addr_171_, _addr_171_, 4
	li	x11, 3
# was:	li	_size_178_, 3
	mv	x13, x3
# was:	mv	_tmp_172_, x3
	slli	x14, x11, 2
# was:	slli	_tmp_181_, _size_178_, 2
	addi	x14, x14, 4
# was:	addi	_tmp_181_, _tmp_181_, 4
	add	x3, x3, x14
# was:	add	x3, x3, _tmp_181_
	sw	x11, 0(x13)
# was:	sw	_size_178_, 0(_tmp_172_)
	addi	x11, x13, 4
# was:	addi	_addr_179_, _tmp_172_, 4
	li	x14, 10
# was:	li	_tmp_180_, 10
	sw	x14, 0(x11)
# was:	sw	_tmp_180_, 0(_addr_179_)
	addi	x11, x11, 4
# was:	addi	_addr_179_, _addr_179_, 4
	li	x14, 20
# was:	li	_tmp_180_, 20
	sw	x14, 0(x11)
# was:	sw	_tmp_180_, 0(_addr_179_)
	addi	x11, x11, 4
# was:	addi	_addr_179_, _addr_179_, 4
	li	x14, 6
# was:	li	_tmp_180_, 6
	sw	x14, 0(x11)
# was:	sw	_tmp_180_, 0(_addr_179_)
	addi	x11, x11, 4
# was:	addi	_addr_179_, _addr_179_, 4
	sw	x13, 0(x12)
# was:	sw	_tmp_172_, 0(_addr_171_)
	addi	x12, x12, 4
# was:	addi	_addr_171_, _addr_171_, 4
	lw	x18, 0(x10)
# was:	lw	_size_165_, 0(_arr_166_)
	mv	x19, x3
# was:	mv	_let_tmp4_164_, x3
	slli	x11, x18, 2
# was:	slli	_tmp_189_, _size_165_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_189_, _tmp_189_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_189_
	sw	x18, 0(x19)
# was:	sw	_size_165_, 0(_let_tmp4_164_)
	addi	x20, x19, 4
# was:	addi	_addrg_182_, _let_tmp4_164_, 4
	mv	x22, x0
# was:	mv	_i_183_, x0
	mv	x21, x0
# was:	mv	_j_184_, x0
	addi	x24, x10, 4
# was:	addi	_elem_167_, _arr_166_, 4
l.loop_beg_185_:
	bge	x22, x18, l.loop_end_187_
# was:	bge	_i_183_, _size_165_, l.loop_end_187_
	lw	x23, 0(x24)
# was:	lw	_tmp_169_, 0(_elem_167_)
	addi	x24, x24, 4
# was:	addi	_elem_167_, _elem_167_, 4
	mv	x10, x23
# was:	mv	x10, _tmp_169_
	jal	f.fun2
# was:	jal	f.fun2, x10
# 	mv	_tmp_188_,x10
# 	mv	_res_168_,_tmp_188_
	beq	x10, x0, l.loop_foot_186_
# was:	beq	_res_168_, x0, l.loop_foot_186_
	sw	x23, 0(x20)
# was:	sw	_tmp_169_, 0(_addrg_182_)
	addi	x20, x20, 4
# was:	addi	_addrg_182_, _addrg_182_, 4
	addi	x21, x21, 1
# was:	addi	_j_184_, _j_184_, 1
l.loop_foot_186_:
	addi	x22, x22, 1
# was:	addi	_i_183_, _i_183_, 1
	j	l.loop_beg_185_
l.loop_end_187_:
	sw	x21, 0(x19)
# was:	sw	_j_184_, 0(_let_tmp4_164_)
	li	x10, 0
# was:	li	_arr_ind_197_, 0
	addi	x11, x19, 4
# was:	addi	_arr_data_198_, _let_tmp4_164_, 4
	bge	x10, x0, l.nonneg_201_
# was:	bge	_arr_ind_197_, x0, l.nonneg_201_
l.error_200_:
	li	x10, 30
# was:	li	x10, 30
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_201_:
	lw	x12, 0(x19)
# was:	lw	_size_199_, 0(_let_tmp4_164_)
	bge	x10, x12, l.error_200_
# was:	bge	_arr_ind_197_, _size_199_, l.error_200_
	slli	x10, x10, 2
# was:	slli	_arr_ind_197_, _arr_ind_197_, 2
	add	x11, x11, x10
# was:	add	_arr_data_198_, _arr_data_198_, _arr_ind_197_
	lw	x19, 0(x11)
# was:	lw	_arr_191_, 0(_arr_data_198_)
	lw	x18, 0(x19)
# was:	lw	_size_192_, 0(_arr_191_)
	li	x10, 0
# was:	li	_let_b_190_, 0
	addi	x19, x19, 4
# was:	addi	_arr_191_, _arr_191_, 4
	mv	x20, x0
# was:	mv	_ind_var_193_, x0
l.loop_beg_195_:
	bge	x20, x18, l.loop_end_196_
# was:	bge	_ind_var_193_, _size_192_, l.loop_end_196_
	lw	x11, 0(x19)
# was:	lw	_tmp_194_, 0(_arr_191_)
	addi	x19, x19, 4
# was:	addi	_arr_191_, _arr_191_, 4
# 	mv	x10,_let_b_190_
# 	mv	x11,_tmp_194_
	jal	f.incr
# was:	jal	f.incr, x10 x11
# 	mv	_tmp_202_,x10
# 	mv	_let_b_190_,_tmp_202_
	addi	x20, x20, 1
# was:	addi	_ind_var_193_, _ind_var_193_, 1
	j	l.loop_beg_195_
l.loop_end_196_:
# 	mv	_tmp_203_,_let_b_190_
	mv	x18, x10
# was:	mv	_mainres_56_, _tmp_203_
	mv	x10, x18
# was:	mv	x10, _mainres_56_
	jal	p.putint
# was:	jal	p.putint, x10
	mv	x10, x18
# was:	mv	x10, _mainres_56_
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
s.world_79_:
	.word	5
	.ascii	"world"
	.align	2
s.hello_78_:
	.word	5
	.ascii	"hello"
	.align	2
s.cat_73_:
	.word	3
	.ascii	"cat"
	.align	2
s.bear_72_:
	.word	4
	.ascii	"bear"
	.align	2
s.ant_71_:
	.word	3
	.ascii	"ant"
	.align	2
s.h_10_:
	.word	1
	.ascii	"h"
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