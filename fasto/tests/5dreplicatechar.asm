	.text	0x00400000
	la	x3, d.heap
	jal	f.main
	jal	p.stop
# User functions
# Function main
f.main:
	sw	x1, -4(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -8
	li	x10, 2
# was:	li	_size_3_, 2
	la	x11, s.a_8_
# was:	la	_a_4_, s.a_8_
# s.a_8_: string "a"
	bge	x10, x0, l.safe_7_
# was:	bge	_size_3_, x0, l.safe_7_
	li	x10, 3
# was:	li	x10, 3
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_7_:
	mv	x18, x3
# was:	mv	_let_a_2_, x3
	slli	x12, x10, 2
# was:	slli	_tmp_11_, _size_3_, 2
	addi	x12, x12, 4
# was:	addi	_tmp_11_, _tmp_11_, 4
	add	x3, x3, x12
# was:	add	x3, x3, _tmp_11_
	sw	x10, 0(x18)
# was:	sw	_size_3_, 0(_let_a_2_)
	addi	x13, x18, 4
# was:	addi	_addr_5_, _let_a_2_, 4
	mv	x12, x0
# was:	mv	_i_6_, x0
l.loop_beg_9_:
	bge	x12, x10, l.loop_end_10_
# was:	bge	_i_6_, _size_3_, l.loop_end_10_
	sw	x11, 0(x13)
# was:	sw	_a_4_, 0(_addr_5_)
	addi	x13, x13, 4
# was:	addi	_addr_5_, _addr_5_, 4
	addi	x12, x12, 1
# was:	addi	_i_6_, _i_6_, 1
	j	l.loop_beg_9_
l.loop_end_10_:
	li	x12, 0
# was:	li	_arr_ind_14_, 0
	addi	x11, x18, 4
# was:	addi	_arr_data_15_, _let_a_2_, 4
	bge	x12, x0, l.nonneg_18_
# was:	bge	_arr_ind_14_, x0, l.nonneg_18_
l.error_17_:
	li	x10, 4
# was:	li	x10, 4
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_18_:
	lw	x10, 0(x18)
# was:	lw	_size_16_, 0(_let_a_2_)
	bge	x12, x10, l.error_17_
# was:	bge	_arr_ind_14_, _size_16_, l.error_17_
	slli	x12, x12, 2
# was:	slli	_arr_ind_14_, _arr_ind_14_, 2
	add	x11, x11, x12
# was:	add	_arr_data_15_, _arr_data_15_, _arr_ind_14_
	lw	x10, 0(x11)
# was:	lw	_tmp_13_, 0(_arr_data_15_)
# 	mv	_let_tmp_12_,_tmp_13_
# 	mv	x10,_tmp_13_
	jal	p.putstring
# was:	jal	p.putstring, x10
	li	x10, 1
# was:	li	_arr_ind_21_, 1
	addi	x11, x18, 4
# was:	addi	_arr_data_22_, _let_a_2_, 4
	bge	x10, x0, l.nonneg_25_
# was:	bge	_arr_ind_21_, x0, l.nonneg_25_
l.error_24_:
	li	x10, 5
# was:	li	x10, 5
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_25_:
	lw	x12, 0(x18)
# was:	lw	_size_23_, 0(_let_a_2_)
	bge	x10, x12, l.error_24_
# was:	bge	_arr_ind_21_, _size_23_, l.error_24_
	slli	x10, x10, 2
# was:	slli	_arr_ind_21_, _arr_ind_21_, 2
	add	x11, x11, x10
# was:	add	_arr_data_22_, _arr_data_22_, _arr_ind_21_
	lw	x10, 0(x11)
# was:	lw	_tmp_20_, 0(_arr_data_22_)
# 	mv	_let_tmp_19_,_tmp_20_
# 	mv	x10,_tmp_20_
	jal	p.putstring
# was:	jal	p.putstring, x10
	li	x10, 2
# was:	li	_size_27_, 2
	la	x11, s.b_32_
# was:	la	_a_28_, s.b_32_
# s.b_32_: string "b"
	bge	x10, x0, l.safe_31_
# was:	bge	_size_27_, x0, l.safe_31_
	li	x10, 6
# was:	li	x10, 6
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_31_:
	mv	x18, x3
# was:	mv	_let_a_26_, x3
	slli	x12, x10, 2
# was:	slli	_tmp_35_, _size_27_, 2
	addi	x12, x12, 4
# was:	addi	_tmp_35_, _tmp_35_, 4
	add	x3, x3, x12
# was:	add	x3, x3, _tmp_35_
	sw	x10, 0(x18)
# was:	sw	_size_27_, 0(_let_a_26_)
	addi	x13, x18, 4
# was:	addi	_addr_29_, _let_a_26_, 4
	mv	x12, x0
# was:	mv	_i_30_, x0
l.loop_beg_33_:
	bge	x12, x10, l.loop_end_34_
# was:	bge	_i_30_, _size_27_, l.loop_end_34_
	sw	x11, 0(x13)
# was:	sw	_a_28_, 0(_addr_29_)
	addi	x13, x13, 4
# was:	addi	_addr_29_, _addr_29_, 4
	addi	x12, x12, 1
# was:	addi	_i_30_, _i_30_, 1
	j	l.loop_beg_33_
l.loop_end_34_:
	li	x10, 0
# was:	li	_arr_ind_38_, 0
	addi	x11, x18, 4
# was:	addi	_arr_data_39_, _let_a_26_, 4
	bge	x10, x0, l.nonneg_42_
# was:	bge	_arr_ind_38_, x0, l.nonneg_42_
l.error_41_:
	li	x10, 7
# was:	li	x10, 7
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_42_:
	lw	x12, 0(x18)
# was:	lw	_size_40_, 0(_let_a_26_)
	bge	x10, x12, l.error_41_
# was:	bge	_arr_ind_38_, _size_40_, l.error_41_
	slli	x10, x10, 2
# was:	slli	_arr_ind_38_, _arr_ind_38_, 2
	add	x11, x11, x10
# was:	add	_arr_data_39_, _arr_data_39_, _arr_ind_38_
	lw	x10, 0(x11)
# was:	lw	_tmp_37_, 0(_arr_data_39_)
# 	mv	_let_tmp_36_,_tmp_37_
# 	mv	x10,_tmp_37_
	jal	p.putstring
# was:	jal	p.putstring, x10
	li	x11, 1
# was:	li	_arr_ind_45_, 1
	addi	x10, x18, 4
# was:	addi	_arr_data_46_, _let_a_26_, 4
	bge	x11, x0, l.nonneg_49_
# was:	bge	_arr_ind_45_, x0, l.nonneg_49_
l.error_48_:
	li	x10, 8
# was:	li	x10, 8
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_49_:
	lw	x12, 0(x18)
# was:	lw	_size_47_, 0(_let_a_26_)
	bge	x11, x12, l.error_48_
# was:	bge	_arr_ind_45_, _size_47_, l.error_48_
	slli	x11, x11, 2
# was:	slli	_arr_ind_45_, _arr_ind_45_, 2
	add	x10, x10, x11
# was:	add	_arr_data_46_, _arr_data_46_, _arr_ind_45_
	lw	x10, 0(x10)
# was:	lw	_tmp_44_, 0(_arr_data_46_)
# 	mv	_let_tmp_43_,_tmp_44_
# 	mv	x10,_tmp_44_
	jal	p.putstring
# was:	jal	p.putstring, x10
	li	x10, 0
# was:	li	_mainres_1_, 0
# 	mv	x10,_mainres_1_
	addi	x2, x2, 8
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
s.b_32_:
	.word	1
	.ascii	"b"
	.align	2
s.a_8_:
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