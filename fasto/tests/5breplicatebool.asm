	.text	0x00400000
	la	x3, d.heap
	jal	f.main
	jal	p.stop
# User functions
# Function writeBool
f.writeBool:
	sw	x1, -4(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -8
# 	mv	_param_b_1_,x10
	mv	x18, x10
# was:	mv	_tmp_3_, _param_b_1_
# 	mv	_writeBoolres_2_,_tmp_3_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x18, x0, l.wBoolF_4_
# was:	bne	_writeBoolres_2_, x0, l.wBoolF_4_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_4_:
	jal	p.putstring
# was:	jal	p.putstring, x10
	mv	x10, x18
# was:	mv	x10, _writeBoolres_2_
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
	li	x11, 1
# was:	li	_times_L_14_, 1
	li	x10, 2
# was:	li	_times_R_15_, 2
	mul	x11, x11, x10
# was:	mul	_divide_L_12_, _times_L_14_, _times_R_15_
	li	x10, 1
# was:	li	_divide_R_13_, 1
	bne	x10, x0, l.safe_16_
# was:	bne	_divide_R_13_, x0, l.safe_16_
	li	x10, 4
# was:	li	x10, 4
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.safe_16_:
	div	x12, x11, x10
# was:	div	_size_7_, _divide_L_12_, _divide_R_13_
	li	x13, 0
# was:	li	_a_8_, 0
	bge	x12, x0, l.safe_11_
# was:	bge	_size_7_, x0, l.safe_11_
	li	x10, 4
# was:	li	x10, 4
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_11_:
	mv	x10, x3
# was:	mv	_let_fs_6_, x3
	addi	x11, x12, 3
# was:	addi	_tmp_19_, _size_7_, 3
	andi	x11, x11, -4
# was:	andi	_tmp_19_, _tmp_19_, -4
	addi	x11, x11, 4
# was:	addi	_tmp_19_, _tmp_19_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_19_
	sw	x12, 0(x10)
# was:	sw	_size_7_, 0(_let_fs_6_)
	addi	x11, x10, 4
# was:	addi	_addr_9_, _let_fs_6_, 4
	mv	x14, x0
# was:	mv	_i_10_, x0
l.loop_beg_17_:
	bge	x14, x12, l.loop_end_18_
# was:	bge	_i_10_, _size_7_, l.loop_end_18_
	sb	x13, 0(x11)
# was:	sb	_a_8_, 0(_addr_9_)
	addi	x11, x11, 1
# was:	addi	_addr_9_, _addr_9_, 1
	addi	x14, x14, 1
# was:	addi	_i_10_, _i_10_, 1
	j	l.loop_beg_17_
l.loop_end_18_:
	li	x12, 0
# was:	li	_plus_L_26_, 0
	li	x11, 2
# was:	li	_plus_R_27_, 2
	add	x13, x12, x11
# was:	add	_size_21_, _plus_L_26_, _plus_R_27_
	li	x12, 1
# was:	li	_a_22_, 1
	bge	x13, x0, l.safe_25_
# was:	bge	_size_21_, x0, l.safe_25_
	li	x10, 5
# was:	li	x10, 5
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_25_:
	mv	x19, x3
# was:	mv	_let_fsb_20_, x3
	addi	x11, x13, 3
# was:	addi	_tmp_30_, _size_21_, 3
	andi	x11, x11, -4
# was:	andi	_tmp_30_, _tmp_30_, -4
	addi	x11, x11, 4
# was:	addi	_tmp_30_, _tmp_30_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_30_
	sw	x13, 0(x19)
# was:	sw	_size_21_, 0(_let_fsb_20_)
	addi	x11, x19, 4
# was:	addi	_addr_23_, _let_fsb_20_, 4
	mv	x14, x0
# was:	mv	_i_24_, x0
l.loop_beg_28_:
	bge	x14, x13, l.loop_end_29_
# was:	bge	_i_24_, _size_21_, l.loop_end_29_
	sb	x12, 0(x11)
# was:	sb	_a_22_, 0(_addr_23_)
	addi	x11, x11, 1
# was:	addi	_addr_23_, _addr_23_, 1
	addi	x14, x14, 1
# was:	addi	_i_24_, _i_24_, 1
	j	l.loop_beg_28_
l.loop_end_29_:
	li	x12, 4
# was:	li	_minus_L_37_, 4
	li	x11, 2
# was:	li	_minus_R_38_, 2
	sub	x11, x12, x11
# was:	sub	_size_32_, _minus_L_37_, _minus_R_38_
	li	x13, 1
# was:	li	_and_L_42_, 1
	beq	x0, x13, l.sc_l_44_
# was:	beq	x0, _and_L_42_, l.sc_l_44_
	li	x12, 0
# was:	li	_and_R_43_, 0
	and	x12, x13, x12
# was:	and	_NOT_exp_41_, _and_L_42_, _and_R_43_
	j	l.end_l_45_
l.sc_l_44_:
	mv	x12, x0
# was:	mv	_NOT_exp_41_, x0
l.end_l_45_:
	xori	x13, x12, 1
# was:	xori	_or_L_39_, _NOT_exp_41_, 1
	bne	x0, x13, l.sc_l_46_
# was:	bne	x0, _or_L_39_, l.sc_l_46_
	li	x12, 0
# was:	li	_or_R_40_, 0
	or	x12, x13, x12
# was:	or	_a_33_, _or_L_39_, _or_R_40_
	j	l.end_l_47_
l.sc_l_46_:
	addi	x12, x0, 1
# was:	addi	_a_33_, x0, 1
l.end_l_47_:
	bge	x11, x0, l.safe_36_
# was:	bge	_size_32_, x0, l.safe_36_
	li	x10, 6
# was:	li	x10, 6
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_36_:
	mv	x18, x3
# was:	mv	_let_fsc_31_, x3
	addi	x13, x11, 3
# was:	addi	_tmp_50_, _size_32_, 3
	andi	x13, x13, -4
# was:	andi	_tmp_50_, _tmp_50_, -4
	addi	x13, x13, 4
# was:	addi	_tmp_50_, _tmp_50_, 4
	add	x3, x3, x13
# was:	add	x3, x3, _tmp_50_
	sw	x11, 0(x18)
# was:	sw	_size_32_, 0(_let_fsc_31_)
	addi	x13, x18, 4
# was:	addi	_addr_34_, _let_fsc_31_, 4
	mv	x14, x0
# was:	mv	_i_35_, x0
l.loop_beg_48_:
	bge	x14, x11, l.loop_end_49_
# was:	bge	_i_35_, _size_32_, l.loop_end_49_
	sb	x12, 0(x13)
# was:	sb	_a_33_, 0(_addr_34_)
	addi	x13, x13, 1
# was:	addi	_addr_34_, _addr_34_, 1
	addi	x14, x14, 1
# was:	addi	_i_35_, _i_35_, 1
	j	l.loop_beg_48_
l.loop_end_49_:
# 	mv	_arr_53_,_let_fs_6_
	lw	x20, 0(x10)
# was:	lw	_size_52_, 0(_arr_53_)
	mv	x12, x3
# was:	mv	_let_tmp_51_, x3
	addi	x11, x20, 3
# was:	addi	_tmp_61_, _size_52_, 3
	andi	x11, x11, -4
# was:	andi	_tmp_61_, _tmp_61_, -4
	addi	x11, x11, 4
# was:	addi	_tmp_61_, _tmp_61_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_61_
	sw	x20, 0(x12)
# was:	sw	_size_52_, 0(_let_tmp_51_)
	addi	x21, x12, 4
# was:	addi	_addrg_56_, _let_tmp_51_, 4
	mv	x22, x0
# was:	mv	_i_57_, x0
	addi	x23, x10, 4
# was:	addi	_elem_54_, _arr_53_, 4
l.loop_beg_58_:
	bge	x22, x20, l.loop_end_59_
# was:	bge	_i_57_, _size_52_, l.loop_end_59_
	lbu	x10, 0(x23)
# was:	lbu	_res_55_, 0(_elem_54_)
	addi	x23, x23, 1
# was:	addi	_elem_54_, _elem_54_, 1
# 	mv	x10,_res_55_
	jal	f.writeBool
# was:	jal	f.writeBool, x10
# 	mv	_tmp_60_,x10
# 	mv	_res_55_,_tmp_60_
	sb	x10, 0(x21)
# was:	sb	_res_55_, 0(_addrg_56_)
	addi	x21, x21, 1
# was:	addi	_addrg_56_, _addrg_56_, 1
	addi	x22, x22, 1
# was:	addi	_i_57_, _i_57_, 1
	j	l.loop_beg_58_
l.loop_end_59_:
	mv	x10, x19
# was:	mv	_arr_64_, _let_fsb_20_
	lw	x21, 0(x10)
# was:	lw	_size_63_, 0(_arr_64_)
	mv	x12, x3
# was:	mv	_let_tmp_62_, x3
	addi	x11, x21, 3
# was:	addi	_tmp_72_, _size_63_, 3
	andi	x11, x11, -4
# was:	andi	_tmp_72_, _tmp_72_, -4
	addi	x11, x11, 4
# was:	addi	_tmp_72_, _tmp_72_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_72_
	sw	x21, 0(x12)
# was:	sw	_size_63_, 0(_let_tmp_62_)
	addi	x20, x12, 4
# was:	addi	_addrg_67_, _let_tmp_62_, 4
	mv	x19, x0
# was:	mv	_i_68_, x0
	addi	x22, x10, 4
# was:	addi	_elem_65_, _arr_64_, 4
l.loop_beg_69_:
	bge	x19, x21, l.loop_end_70_
# was:	bge	_i_68_, _size_63_, l.loop_end_70_
	lbu	x10, 0(x22)
# was:	lbu	_res_66_, 0(_elem_65_)
	addi	x22, x22, 1
# was:	addi	_elem_65_, _elem_65_, 1
# 	mv	x10,_res_66_
	jal	f.writeBool
# was:	jal	f.writeBool, x10
# 	mv	_tmp_71_,x10
# 	mv	_res_66_,_tmp_71_
	sb	x10, 0(x20)
# was:	sb	_res_66_, 0(_addrg_67_)
	addi	x20, x20, 1
# was:	addi	_addrg_67_, _addrg_67_, 1
	addi	x19, x19, 1
# was:	addi	_i_68_, _i_68_, 1
	j	l.loop_beg_69_
l.loop_end_70_:
	mv	x10, x18
# was:	mv	_arr_74_, _let_fsc_31_
	lw	x19, 0(x10)
# was:	lw	_size_73_, 0(_arr_74_)
	mv	x18, x3
# was:	mv	_mainres_5_, x3
	addi	x11, x19, 3
# was:	addi	_tmp_82_, _size_73_, 3
	andi	x11, x11, -4
# was:	andi	_tmp_82_, _tmp_82_, -4
	addi	x11, x11, 4
# was:	addi	_tmp_82_, _tmp_82_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_82_
	sw	x19, 0(x18)
# was:	sw	_size_73_, 0(_mainres_5_)
	addi	x20, x18, 4
# was:	addi	_addrg_77_, _mainres_5_, 4
	mv	x21, x0
# was:	mv	_i_78_, x0
	addi	x22, x10, 4
# was:	addi	_elem_75_, _arr_74_, 4
l.loop_beg_79_:
	bge	x21, x19, l.loop_end_80_
# was:	bge	_i_78_, _size_73_, l.loop_end_80_
	lbu	x10, 0(x22)
# was:	lbu	_res_76_, 0(_elem_75_)
	addi	x22, x22, 1
# was:	addi	_elem_75_, _elem_75_, 1
# 	mv	x10,_res_76_
	jal	f.writeBool
# was:	jal	f.writeBool, x10
# 	mv	_tmp_81_,x10
# 	mv	_res_76_,_tmp_81_
	sb	x10, 0(x20)
# was:	sb	_res_76_, 0(_addrg_77_)
	addi	x20, x20, 1
# was:	addi	_addrg_77_, _addrg_77_, 1
	addi	x21, x21, 1
# was:	addi	_i_78_, _i_78_, 1
	j	l.loop_beg_79_
l.loop_end_80_:
	mv	x10, x18
# was:	mv	x10, _mainres_5_
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