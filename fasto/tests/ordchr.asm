	.text	0x00400000
	la	x3, d.heap
	jal	f.main
	jal	p.stop
# User functions
# Function main
f.main:
	sw	x1, -4(x2)
	sw	x22, -24(x2)
	sw	x21, -20(x2)
	sw	x20, -16(x2)
	sw	x19, -12(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -24
	jal	p.getint
# was:	jal	p.getint, 
# 	mv	_let_n_2_,x10
	mv	x12, x10
# was:	mv	_let_n_4_, _let_n_2_
# 	mv	_size_9_,_let_n_4_
	bge	x12, x0, l.safe_10_
# was:	bge	_size_9_, x0, l.safe_10_
	li	x10, 3
# was:	li	x10, 3
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_10_:
	mv	x10, x3
# was:	mv	_arr_6_, x3
	slli	x11, x12, 2
# was:	slli	_tmp_15_, _size_9_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_15_, _tmp_15_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_15_
	sw	x12, 0(x10)
# was:	sw	_size_9_, 0(_arr_6_)
	addi	x11, x10, 4
# was:	addi	_addr_11_, _arr_6_, 4
	mv	x13, x0
# was:	mv	_i_12_, x0
l.loop_beg_13_:
	bge	x13, x12, l.loop_end_14_
# was:	bge	_i_12_, _size_9_, l.loop_end_14_
	sw	x13, 0(x11)
# was:	sw	_i_12_, 0(_addr_11_)
	addi	x11, x11, 4
# was:	addi	_addr_11_, _addr_11_, 4
	addi	x13, x13, 1
# was:	addi	_i_12_, _i_12_, 1
	j	l.loop_beg_13_
l.loop_end_14_:
	lw	x20, 0(x10)
# was:	lw	_size_5_, 0(_arr_6_)
	mv	x19, x3
# was:	mv	_let_s1_3_, x3
	addi	x11, x20, 3
# was:	addi	_tmp_21_, _size_5_, 3
	andi	x11, x11, -4
# was:	andi	_tmp_21_, _tmp_21_, -4
	addi	x11, x11, 4
# was:	addi	_tmp_21_, _tmp_21_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_21_
	sw	x20, 0(x19)
# was:	sw	_size_5_, 0(_let_s1_3_)
	addi	x18, x19, 4
# was:	addi	_addrg_16_, _let_s1_3_, 4
	mv	x21, x0
# was:	mv	_i_17_, x0
	addi	x22, x10, 4
# was:	addi	_elem_7_, _arr_6_, 4
l.loop_beg_18_:
	bge	x21, x20, l.loop_end_19_
# was:	bge	_i_17_, _size_5_, l.loop_end_19_
	lw	x10, 0(x22)
# was:	lw	_res_8_, 0(_elem_7_)
	addi	x22, x22, 4
# was:	addi	_elem_7_, _elem_7_, 4
	jal	p.getchar
# was:	jal	p.getchar, 
# 	mv	_fun_arg_res_20_,x10
# 	mv	_res_8_,_fun_arg_res_20_
	sb	x10, 0(x18)
# was:	sb	_res_8_, 0(_addrg_16_)
	addi	x18, x18, 1
# was:	addi	_addrg_16_, _addrg_16_, 1
	addi	x21, x21, 1
# was:	addi	_i_17_, _i_17_, 1
	j	l.loop_beg_18_
l.loop_end_19_:
	mv	x10, x19
# was:	mv	_arr_32_, _let_s1_3_
	lw	x20, 0(x10)
# was:	lw	_size_31_, 0(_arr_32_)
	mv	x18, x3
# was:	mv	_arr_28_, x3
	slli	x11, x20, 2
# was:	slli	_tmp_40_, _size_31_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_40_, _tmp_40_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_40_
	sw	x20, 0(x18)
# was:	sw	_size_31_, 0(_arr_28_)
	addi	x21, x18, 4
# was:	addi	_addrg_35_, _arr_28_, 4
	mv	x19, x0
# was:	mv	_i_36_, x0
	addi	x22, x10, 4
# was:	addi	_elem_33_, _arr_32_, 4
l.loop_beg_37_:
	bge	x19, x20, l.loop_end_38_
# was:	bge	_i_36_, _size_31_, l.loop_end_38_
	lbu	x10, 0(x22)
# was:	lbu	_res_34_, 0(_elem_33_)
	addi	x22, x22, 1
# was:	addi	_elem_33_, _elem_33_, 1
# 	mv	x10,_res_34_
	jal	f.ord
# was:	jal	f.ord, x10
# 	mv	_tmp_39_,x10
# 	mv	_res_34_,_tmp_39_
	sw	x10, 0(x21)
# was:	sw	_res_34_, 0(_addrg_35_)
	addi	x21, x21, 4
# was:	addi	_addrg_35_, _addrg_35_, 4
	addi	x19, x19, 1
# was:	addi	_i_36_, _i_36_, 1
	j	l.loop_beg_37_
l.loop_end_38_:
	lw	x11, 0(x18)
# was:	lw	_size_27_, 0(_arr_28_)
	mv	x10, x3
# was:	mv	_arr_24_, x3
	slli	x12, x11, 2
# was:	slli	_tmp_48_, _size_27_, 2
	addi	x12, x12, 4
# was:	addi	_tmp_48_, _tmp_48_, 4
	add	x3, x3, x12
# was:	add	x3, x3, _tmp_48_
	sw	x11, 0(x10)
# was:	sw	_size_27_, 0(_arr_24_)
	addi	x13, x10, 4
# was:	addi	_addrg_41_, _arr_24_, 4
	mv	x12, x0
# was:	mv	_i_42_, x0
	addi	x14, x18, 4
# was:	addi	_elem_29_, _arr_28_, 4
l.loop_beg_43_:
	bge	x12, x11, l.loop_end_44_
# was:	bge	_i_42_, _size_27_, l.loop_end_44_
	lw	x15, 0(x14)
# was:	lw	_res_30_, 0(_elem_29_)
	addi	x14, x14, 4
# was:	addi	_elem_29_, _elem_29_, 4
	mv	x16, x15
# was:	mv	_plus_L_46_, _res_30_
	li	x15, 1
# was:	li	_plus_R_47_, 1
	add	x15, x16, x15
# was:	add	_fun_arg_res_45_, _plus_L_46_, _plus_R_47_
# 	mv	_res_30_,_fun_arg_res_45_
	sw	x15, 0(x13)
# was:	sw	_res_30_, 0(_addrg_41_)
	addi	x13, x13, 4
# was:	addi	_addrg_41_, _addrg_41_, 4
	addi	x12, x12, 1
# was:	addi	_i_42_, _i_42_, 1
	j	l.loop_beg_43_
l.loop_end_44_:
	lw	x18, 0(x10)
# was:	lw	_size_23_, 0(_arr_24_)
	mv	x19, x3
# was:	mv	_let_s2_22_, x3
	addi	x11, x18, 3
# was:	addi	_tmp_54_, _size_23_, 3
	andi	x11, x11, -4
# was:	andi	_tmp_54_, _tmp_54_, -4
	addi	x11, x11, 4
# was:	addi	_tmp_54_, _tmp_54_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_54_
	sw	x18, 0(x19)
# was:	sw	_size_23_, 0(_let_s2_22_)
	addi	x20, x19, 4
# was:	addi	_addrg_49_, _let_s2_22_, 4
	mv	x21, x0
# was:	mv	_i_50_, x0
	addi	x22, x10, 4
# was:	addi	_elem_25_, _arr_24_, 4
l.loop_beg_51_:
	bge	x21, x18, l.loop_end_52_
# was:	bge	_i_50_, _size_23_, l.loop_end_52_
	lw	x10, 0(x22)
# was:	lw	_res_26_, 0(_elem_25_)
	addi	x22, x22, 4
# was:	addi	_elem_25_, _elem_25_, 4
# 	mv	x10,_res_26_
	jal	f.chr
# was:	jal	f.chr, x10
# 	mv	_tmp_53_,x10
# 	mv	_res_26_,_tmp_53_
	sb	x10, 0(x20)
# was:	sb	_res_26_, 0(_addrg_49_)
	addi	x20, x20, 1
# was:	addi	_addrg_49_, _addrg_49_, 1
	addi	x21, x21, 1
# was:	addi	_i_50_, _i_50_, 1
	j	l.loop_beg_51_
l.loop_end_52_:
	mv	x10, x19
# was:	mv	_tmp_55_, _let_s2_22_
	mv	x18, x10
# was:	mv	_mainres_1_, _tmp_55_
# 	mv	x10,_tmp_55_
	jal	p.putstring
# was:	jal	p.putstring, x10
	mv	x10, x18
# was:	mv	x10, _mainres_1_
	addi	x2, x2, 24
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