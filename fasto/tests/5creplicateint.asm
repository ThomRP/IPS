	.text	0x00400000
	la	x3, d.heap
	jal	f.main
	jal	p.stop
# User functions
# Function writeInt
f.writeInt:
	sw	x1, -4(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -8
# 	mv	_param_b_1_,x10
	mv	x18, x10
# was:	mv	_tmp_3_, _param_b_1_
# 	mv	_writeIntres_2_,_tmp_3_
	mv	x10, x18
# was:	mv	x10, _writeIntres_2_
	jal	p.putint
# was:	jal	p.putint, x10
	mv	x10, x18
# was:	mv	x10, _writeIntres_2_
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
	li	x10, 2
# was:	li	_plus_L_13_, 2
	li	x11, 10
# was:	li	_plus_R_14_, 10
	add	x10, x10, x11
# was:	add	_divide_L_11_, _plus_L_13_, _plus_R_14_
	li	x11, 6
# was:	li	_divide_R_12_, 6
	bne	x11, x0, l.safe_15_
# was:	bne	_divide_R_12_, x0, l.safe_15_
	li	x10, 4
# was:	li	x10, 4
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.safe_15_:
	div	x12, x10, x11
# was:	div	_size_6_, _divide_L_11_, _divide_R_12_
	li	x10, 2
# was:	li	_plus_L_16_, 2
	li	x11, 10
# was:	li	_divide_L_18_, 10
	li	x13, 2
# was:	li	_divide_R_19_, 2
	bne	x13, x0, l.safe_20_
# was:	bne	_divide_R_19_, x0, l.safe_20_
	li	x10, 4
# was:	li	x10, 4
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.safe_20_:
	div	x11, x11, x13
# was:	div	_plus_R_17_, _divide_L_18_, _divide_R_19_
	add	x13, x10, x11
# was:	add	_a_7_, _plus_L_16_, _plus_R_17_
	bge	x12, x0, l.safe_10_
# was:	bge	_size_6_, x0, l.safe_10_
	li	x10, 4
# was:	li	x10, 4
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_10_:
	mv	x11, x3
# was:	mv	_let_fs_5_, x3
	slli	x10, x12, 2
# was:	slli	_tmp_23_, _size_6_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_23_, _tmp_23_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_23_
	sw	x12, 0(x11)
# was:	sw	_size_6_, 0(_let_fs_5_)
	addi	x10, x11, 4
# was:	addi	_addr_8_, _let_fs_5_, 4
	mv	x14, x0
# was:	mv	_i_9_, x0
l.loop_beg_21_:
	bge	x14, x12, l.loop_end_22_
# was:	bge	_i_9_, _size_6_, l.loop_end_22_
	sw	x13, 0(x10)
# was:	sw	_a_7_, 0(_addr_8_)
	addi	x10, x10, 4
# was:	addi	_addr_8_, _addr_8_, 4
	addi	x14, x14, 1
# was:	addi	_i_9_, _i_9_, 1
	j	l.loop_beg_21_
l.loop_end_22_:
	li	x10, 0
# was:	li	_minus_L_31_, 0
	li	x12, 2
# was:	li	_minus_R_32_, 2
	sub	x10, x10, x12
# was:	sub	_NEGATE_exp_30_, _minus_L_31_, _minus_R_32_
	sub	x13, x0, x10
# was:	sub	_size_25_, x0, _NEGATE_exp_30_
	li	x12, 0
# was:	li	_a_26_, 0
	bge	x13, x0, l.safe_29_
# was:	bge	_size_25_, x0, l.safe_29_
	li	x10, 5
# was:	li	x10, 5
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_29_:
	mv	x20, x3
# was:	mv	_let_fsb_24_, x3
	slli	x10, x13, 2
# was:	slli	_tmp_35_, _size_25_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_35_, _tmp_35_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_35_
	sw	x13, 0(x20)
# was:	sw	_size_25_, 0(_let_fsb_24_)
	addi	x14, x20, 4
# was:	addi	_addr_27_, _let_fsb_24_, 4
	mv	x10, x0
# was:	mv	_i_28_, x0
l.loop_beg_33_:
	bge	x10, x13, l.loop_end_34_
# was:	bge	_i_28_, _size_25_, l.loop_end_34_
	sw	x12, 0(x14)
# was:	sw	_a_26_, 0(_addr_27_)
	addi	x14, x14, 4
# was:	addi	_addr_27_, _addr_27_, 4
	addi	x10, x10, 1
# was:	addi	_i_28_, _i_28_, 1
	j	l.loop_beg_33_
l.loop_end_34_:
	li	x12, 2
# was:	li	_times_L_42_, 2
	li	x10, 2
# was:	li	_times_R_43_, 2
	mul	x10, x12, x10
# was:	mul	_size_37_, _times_L_42_, _times_R_43_
	li	x12, 0
# was:	li	_minus_L_44_, 0
	li	x13, 2
# was:	li	_divide_L_46_, 2
	li	x14, 2
# was:	li	_divide_R_47_, 2
	bne	x14, x0, l.safe_48_
# was:	bne	_divide_R_47_, x0, l.safe_48_
	li	x10, 6
# was:	li	x10, 6
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.safe_48_:
	div	x13, x13, x14
# was:	div	_minus_R_45_, _divide_L_46_, _divide_R_47_
	sub	x12, x12, x13
# was:	sub	_a_38_, _minus_L_44_, _minus_R_45_
	bge	x10, x0, l.safe_41_
# was:	bge	_size_37_, x0, l.safe_41_
	li	x10, 6
# was:	li	x10, 6
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_41_:
	mv	x19, x3
# was:	mv	_let_fsc_36_, x3
	slli	x13, x10, 2
# was:	slli	_tmp_51_, _size_37_, 2
	addi	x13, x13, 4
# was:	addi	_tmp_51_, _tmp_51_, 4
	add	x3, x3, x13
# was:	add	x3, x3, _tmp_51_
	sw	x10, 0(x19)
# was:	sw	_size_37_, 0(_let_fsc_36_)
	addi	x14, x19, 4
# was:	addi	_addr_39_, _let_fsc_36_, 4
	mv	x13, x0
# was:	mv	_i_40_, x0
l.loop_beg_49_:
	bge	x13, x10, l.loop_end_50_
# was:	bge	_i_40_, _size_37_, l.loop_end_50_
	sw	x12, 0(x14)
# was:	sw	_a_38_, 0(_addr_39_)
	addi	x14, x14, 4
# was:	addi	_addr_39_, _addr_39_, 4
	addi	x13, x13, 1
# was:	addi	_i_40_, _i_40_, 1
	j	l.loop_beg_49_
l.loop_end_50_:
	li	x13, 0
# was:	li	_size_53_, 0
	li	x12, 2
# was:	li	_a_54_, 2
	bge	x13, x0, l.safe_57_
# was:	bge	_size_53_, x0, l.safe_57_
	li	x10, 7
# was:	li	x10, 7
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_57_:
	mv	x18, x3
# was:	mv	_let_fsd_52_, x3
	slli	x10, x13, 2
# was:	slli	_tmp_60_, _size_53_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_60_, _tmp_60_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_60_
	sw	x13, 0(x18)
# was:	sw	_size_53_, 0(_let_fsd_52_)
	addi	x10, x18, 4
# was:	addi	_addr_55_, _let_fsd_52_, 4
	mv	x14, x0
# was:	mv	_i_56_, x0
l.loop_beg_58_:
	bge	x14, x13, l.loop_end_59_
# was:	bge	_i_56_, _size_53_, l.loop_end_59_
	sw	x12, 0(x10)
# was:	sw	_a_54_, 0(_addr_55_)
	addi	x10, x10, 4
# was:	addi	_addr_55_, _addr_55_, 4
	addi	x14, x14, 1
# was:	addi	_i_56_, _i_56_, 1
	j	l.loop_beg_58_
l.loop_end_59_:
# 	mv	_arr_63_,_let_fs_5_
	lw	x21, 0(x11)
# was:	lw	_size_62_, 0(_arr_63_)
	mv	x12, x3
# was:	mv	_let_tmp1_61_, x3
	slli	x10, x21, 2
# was:	slli	_tmp_71_, _size_62_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_71_, _tmp_71_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_71_
	sw	x21, 0(x12)
# was:	sw	_size_62_, 0(_let_tmp1_61_)
	addi	x22, x12, 4
# was:	addi	_addrg_66_, _let_tmp1_61_, 4
	mv	x23, x0
# was:	mv	_i_67_, x0
	addi	x24, x11, 4
# was:	addi	_elem_64_, _arr_63_, 4
l.loop_beg_68_:
	bge	x23, x21, l.loop_end_69_
# was:	bge	_i_67_, _size_62_, l.loop_end_69_
	lw	x10, 0(x24)
# was:	lw	_res_65_, 0(_elem_64_)
	addi	x24, x24, 4
# was:	addi	_elem_64_, _elem_64_, 4
# 	mv	x10,_res_65_
	jal	f.writeInt
# was:	jal	f.writeInt, x10
# 	mv	_tmp_70_,x10
# 	mv	_res_65_,_tmp_70_
	sw	x10, 0(x22)
# was:	sw	_res_65_, 0(_addrg_66_)
	addi	x22, x22, 4
# was:	addi	_addrg_66_, _addrg_66_, 4
	addi	x23, x23, 1
# was:	addi	_i_67_, _i_67_, 1
	j	l.loop_beg_68_
l.loop_end_69_:
	mv	x10, x20
# was:	mv	_arr_74_, _let_fsb_24_
	lw	x20, 0(x10)
# was:	lw	_size_73_, 0(_arr_74_)
	mv	x11, x3
# was:	mv	_let_tmp2_72_, x3
	slli	x12, x20, 2
# was:	slli	_tmp_82_, _size_73_, 2
	addi	x12, x12, 4
# was:	addi	_tmp_82_, _tmp_82_, 4
	add	x3, x3, x12
# was:	add	x3, x3, _tmp_82_
	sw	x20, 0(x11)
# was:	sw	_size_73_, 0(_let_tmp2_72_)
	addi	x21, x11, 4
# was:	addi	_addrg_77_, _let_tmp2_72_, 4
	mv	x22, x0
# was:	mv	_i_78_, x0
	addi	x23, x10, 4
# was:	addi	_elem_75_, _arr_74_, 4
l.loop_beg_79_:
	bge	x22, x20, l.loop_end_80_
# was:	bge	_i_78_, _size_73_, l.loop_end_80_
	lw	x10, 0(x23)
# was:	lw	_res_76_, 0(_elem_75_)
	addi	x23, x23, 4
# was:	addi	_elem_75_, _elem_75_, 4
# 	mv	x10,_res_76_
	jal	f.writeInt
# was:	jal	f.writeInt, x10
# 	mv	_tmp_81_,x10
# 	mv	_res_76_,_tmp_81_
	sw	x10, 0(x21)
# was:	sw	_res_76_, 0(_addrg_77_)
	addi	x21, x21, 4
# was:	addi	_addrg_77_, _addrg_77_, 4
	addi	x22, x22, 1
# was:	addi	_i_78_, _i_78_, 1
	j	l.loop_beg_79_
l.loop_end_80_:
	mv	x10, x19
# was:	mv	_arr_85_, _let_fsc_36_
	lw	x21, 0(x10)
# was:	lw	_size_84_, 0(_arr_85_)
	mv	x12, x3
# was:	mv	_let_tmp3_83_, x3
	slli	x11, x21, 2
# was:	slli	_tmp_93_, _size_84_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_93_, _tmp_93_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_93_
	sw	x21, 0(x12)
# was:	sw	_size_84_, 0(_let_tmp3_83_)
	addi	x19, x12, 4
# was:	addi	_addrg_88_, _let_tmp3_83_, 4
	mv	x20, x0
# was:	mv	_i_89_, x0
	addi	x22, x10, 4
# was:	addi	_elem_86_, _arr_85_, 4
l.loop_beg_90_:
	bge	x20, x21, l.loop_end_91_
# was:	bge	_i_89_, _size_84_, l.loop_end_91_
	lw	x10, 0(x22)
# was:	lw	_res_87_, 0(_elem_86_)
	addi	x22, x22, 4
# was:	addi	_elem_86_, _elem_86_, 4
# 	mv	x10,_res_87_
	jal	f.writeInt
# was:	jal	f.writeInt, x10
# 	mv	_tmp_92_,x10
# 	mv	_res_87_,_tmp_92_
	sw	x10, 0(x19)
# was:	sw	_res_87_, 0(_addrg_88_)
	addi	x19, x19, 4
# was:	addi	_addrg_88_, _addrg_88_, 4
	addi	x20, x20, 1
# was:	addi	_i_89_, _i_89_, 1
	j	l.loop_beg_90_
l.loop_end_91_:
	mv	x10, x18
# was:	mv	_arr_95_, _let_fsd_52_
	lw	x18, 0(x10)
# was:	lw	_size_94_, 0(_arr_95_)
	mv	x19, x3
# was:	mv	_mainres_4_, x3
	slli	x11, x18, 2
# was:	slli	_tmp_103_, _size_94_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_103_, _tmp_103_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_103_
	sw	x18, 0(x19)
# was:	sw	_size_94_, 0(_mainres_4_)
	addi	x20, x19, 4
# was:	addi	_addrg_98_, _mainres_4_, 4
	mv	x22, x0
# was:	mv	_i_99_, x0
	addi	x21, x10, 4
# was:	addi	_elem_96_, _arr_95_, 4
l.loop_beg_100_:
	bge	x22, x18, l.loop_end_101_
# was:	bge	_i_99_, _size_94_, l.loop_end_101_
	lw	x10, 0(x21)
# was:	lw	_res_97_, 0(_elem_96_)
	addi	x21, x21, 4
# was:	addi	_elem_96_, _elem_96_, 4
# 	mv	x10,_res_97_
	jal	f.writeInt
# was:	jal	f.writeInt, x10
# 	mv	_tmp_102_,x10
# 	mv	_res_97_,_tmp_102_
	sw	x10, 0(x20)
# was:	sw	_res_97_, 0(_addrg_98_)
	addi	x20, x20, 4
# was:	addi	_addrg_98_, _addrg_98_, 4
	addi	x22, x22, 1
# was:	addi	_i_99_, _i_99_, 1
	j	l.loop_beg_100_
l.loop_end_101_:
	mv	x10, x19
# was:	mv	x10, _mainres_4_
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