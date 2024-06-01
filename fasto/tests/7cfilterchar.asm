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
	la	x13, s.a_4_
# was:	la	_let_tmp_3_, s.a_4_
# s.a_4_: string "a"
	li	x10, 0
# was:	li	_arr_ind_11_, 0
	addi	x11, x12, 4
# was:	addi	_arr_data_12_, _param_a_1_, 4
	bge	x10, x0, l.nonneg_15_
# was:	bge	_arr_ind_11_, x0, l.nonneg_15_
l.error_14_:
	li	x10, 3
# was:	li	x10, 3
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_15_:
	lw	x12, 0(x12)
# was:	lw	_size_13_, 0(_param_a_1_)
	bge	x10, x12, l.error_14_
# was:	bge	_arr_ind_11_, _size_13_, l.error_14_
	add	x11, x11, x10
# was:	add	_arr_data_12_, _arr_data_12_, _arr_ind_11_
	lbu	x10, 0(x11)
# was:	lbu	_eq_L_9_, 0(_arr_data_12_)
	li	x11, 0
# was:	li	_arr_ind_16_, 0
	addi	x12, x13, 4
# was:	addi	_arr_data_17_, _let_tmp_3_, 4
	bge	x11, x0, l.nonneg_20_
# was:	bge	_arr_ind_16_, x0, l.nonneg_20_
l.error_19_:
	li	x10, 3
# was:	li	x10, 3
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_20_:
	lw	x13, 0(x13)
# was:	lw	_size_18_, 0(_let_tmp_3_)
	bge	x11, x13, l.error_19_
# was:	bge	_arr_ind_16_, _size_18_, l.error_19_
	add	x12, x12, x11
# was:	add	_arr_data_17_, _arr_data_17_, _arr_ind_16_
	lbu	x11, 0(x12)
# was:	lbu	_eq_R_10_, 0(_arr_data_17_)
	li	x12, 0
# was:	li	_cond_8_, 0
	bne	x10, x11, l.false_21_
# was:	bne	_eq_L_9_, _eq_R_10_, l.false_21_
	li	x12, 1
# was:	li	_cond_8_, 1
l.false_21_:
	bne	x12, x0, l.then_5_
# was:	bne	_cond_8_, x0, l.then_5_
	j	l.else_6_
l.then_5_:
	li	x10, 1
# was:	li	_fun1res_2_, 1
	j	l.endif_7_
l.else_6_:
	li	x10, 0
# was:	li	_fun1res_2_, 0
l.endif_7_:
# 	mv	x10,_fun1res_2_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function writeChar
f.writeChar:
	sw	x1, -4(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -8
# 	mv	_param_n_22_,x10
# 	mv	_tmp_24_,_param_n_22_
	mv	x18, x10
# was:	mv	_writeCharres_23_, _tmp_24_
# 	mv	x10,_tmp_24_
	jal	p.putstring
# was:	jal	p.putstring, x10
	mv	x10, x18
# was:	mv	x10, _writeCharres_23_
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
	li	x12, 3
# was:	li	_size_32_, 3
	mv	x10, x3
# was:	mv	_arr_28_, x3
	slli	x11, x12, 2
# was:	slli	_tmp_35_, _size_32_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_35_, _tmp_35_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_35_
	sw	x12, 0(x10)
# was:	sw	_size_32_, 0(_arr_28_)
	addi	x12, x10, 4
# was:	addi	_addr_33_, _arr_28_, 4
	la	x11, s.ant_36_
# was:	la	_tmp_34_, s.ant_36_
# s.ant_36_: string "ant"
	sw	x11, 0(x12)
# was:	sw	_tmp_34_, 0(_addr_33_)
	addi	x12, x12, 4
# was:	addi	_addr_33_, _addr_33_, 4
	la	x11, s.bear_37_
# was:	la	_tmp_34_, s.bear_37_
# s.bear_37_: string "bear"
	sw	x11, 0(x12)
# was:	sw	_tmp_34_, 0(_addr_33_)
	addi	x12, x12, 4
# was:	addi	_addr_33_, _addr_33_, 4
	la	x11, s.cat_38_
# was:	la	_tmp_34_, s.cat_38_
# s.cat_38_: string "cat"
	sw	x11, 0(x12)
# was:	sw	_tmp_34_, 0(_addr_33_)
	addi	x12, x12, 4
# was:	addi	_addr_33_, _addr_33_, 4
	lw	x18, 0(x10)
# was:	lw	_size_27_, 0(_arr_28_)
	mv	x19, x3
# was:	mv	_let_a_26_, x3
	slli	x11, x18, 2
# was:	slli	_tmp_46_, _size_27_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_46_, _tmp_46_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_46_
	sw	x18, 0(x19)
# was:	sw	_size_27_, 0(_let_a_26_)
	addi	x21, x19, 4
# was:	addi	_addrg_39_, _let_a_26_, 4
	mv	x20, x0
# was:	mv	_i_40_, x0
	mv	x22, x0
# was:	mv	_j_41_, x0
	addi	x24, x10, 4
# was:	addi	_elem_29_, _arr_28_, 4
l.loop_beg_42_:
	bge	x20, x18, l.loop_end_44_
# was:	bge	_i_40_, _size_27_, l.loop_end_44_
	lw	x23, 0(x24)
# was:	lw	_tmp_31_, 0(_elem_29_)
	addi	x24, x24, 4
# was:	addi	_elem_29_, _elem_29_, 4
	mv	x10, x23
# was:	mv	x10, _tmp_31_
	jal	f.fun1
# was:	jal	f.fun1, x10
# 	mv	_tmp_45_,x10
# 	mv	_res_30_,_tmp_45_
	beq	x10, x0, l.loop_foot_43_
# was:	beq	_res_30_, x0, l.loop_foot_43_
	sw	x23, 0(x21)
# was:	sw	_tmp_31_, 0(_addrg_39_)
	addi	x21, x21, 4
# was:	addi	_addrg_39_, _addrg_39_, 4
	addi	x22, x22, 1
# was:	addi	_j_41_, _j_41_, 1
l.loop_foot_43_:
	addi	x20, x20, 1
# was:	addi	_i_40_, _i_40_, 1
	j	l.loop_beg_42_
l.loop_end_44_:
	sw	x22, 0(x19)
# was:	sw	_j_41_, 0(_let_a_26_)
	mv	x10, x19
# was:	mv	_arr_48_, _let_a_26_
	lw	x18, 0(x10)
# was:	lw	_size_47_, 0(_arr_48_)
	mv	x19, x3
# was:	mv	_mainres_25_, x3
	slli	x11, x18, 2
# was:	slli	_tmp_56_, _size_47_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_56_, _tmp_56_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_56_
	sw	x18, 0(x19)
# was:	sw	_size_47_, 0(_mainres_25_)
	addi	x20, x19, 4
# was:	addi	_addrg_51_, _mainres_25_, 4
	mv	x21, x0
# was:	mv	_i_52_, x0
	addi	x22, x10, 4
# was:	addi	_elem_49_, _arr_48_, 4
l.loop_beg_53_:
	bge	x21, x18, l.loop_end_54_
# was:	bge	_i_52_, _size_47_, l.loop_end_54_
	lw	x10, 0(x22)
# was:	lw	_res_50_, 0(_elem_49_)
	addi	x22, x22, 4
# was:	addi	_elem_49_, _elem_49_, 4
# 	mv	x10,_res_50_
	jal	f.writeChar
# was:	jal	f.writeChar, x10
# 	mv	_tmp_55_,x10
# 	mv	_res_50_,_tmp_55_
	sw	x10, 0(x20)
# was:	sw	_res_50_, 0(_addrg_51_)
	addi	x20, x20, 4
# was:	addi	_addrg_51_, _addrg_51_, 4
	addi	x21, x21, 1
# was:	addi	_i_52_, _i_52_, 1
	j	l.loop_beg_53_
l.loop_end_54_:
	mv	x10, x19
# was:	mv	x10, _mainres_25_
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
s.cat_38_:
	.word	3
	.ascii	"cat"
	.align	2
s.bear_37_:
	.word	4
	.ascii	"bear"
	.align	2
s.ant_36_:
	.word	3
	.ascii	"ant"
	.align	2
s.a_4_:
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