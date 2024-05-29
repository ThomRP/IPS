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
# was:	li	_size_3_, 8
	bge	x11, x0, l.safe_4_
# was:	bge	_size_3_, x0, l.safe_4_
	li	x10, 10
# was:	li	x10, 10
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_4_:
	mv	x12, x3
# was:	mv	_let_itsp_2_, x3
	slli	x10, x11, 2
# was:	slli	_tmp_9_, _size_3_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_9_, _tmp_9_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_9_
	sw	x11, 0(x12)
# was:	sw	_size_3_, 0(_let_itsp_2_)
	addi	x10, x12, 4
# was:	addi	_addr_5_, _let_itsp_2_, 4
	mv	x13, x0
# was:	mv	_i_6_, x0
l.loop_beg_7_:
	bge	x13, x11, l.loop_end_8_
# was:	bge	_i_6_, _size_3_, l.loop_end_8_
	sw	x13, 0(x10)
# was:	sw	_i_6_, 0(_addr_5_)
	addi	x10, x10, 4
# was:	addi	_addr_5_, _addr_5_, 4
	addi	x13, x13, 1
# was:	addi	_i_6_, _i_6_, 1
	j	l.loop_beg_7_
l.loop_end_8_:
	mv	x10, x12
# was:	mv	_arr_11_, _let_itsp_2_
	lw	x19, 0(x10)
# was:	lw	_size_10_, 0(_arr_11_)
	mv	x18, x3
# was:	mv	_mainres_1_, x3
	slli	x11, x19, 2
# was:	slli	_tmp_31_, _size_10_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_31_, _tmp_31_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_31_
	sw	x19, 0(x18)
# was:	sw	_size_10_, 0(_mainres_1_)
	addi	x20, x18, 4
# was:	addi	_addrg_14_, _mainres_1_, 4
	mv	x21, x0
# was:	mv	_i_15_, x0
	addi	x22, x10, 4
# was:	addi	_elem_12_, _arr_11_, 4
l.loop_beg_16_:
	bge	x21, x19, l.loop_end_17_
# was:	bge	_i_15_, _size_10_, l.loop_end_17_
	lw	x23, 0(x22)
# was:	lw	_res_13_, 0(_elem_12_)
	addi	x22, x22, 4
# was:	addi	_elem_12_, _elem_12_, 4
	la	x10, s.Introdu_21_
# was:	la	_tmp_20_, s.Introdu_21_
# s.Introdu_21_: string "Introduce number "
# 	mv	_let_t_19_,_tmp_20_
# 	mv	x10,_tmp_20_
	jal	p.putstring
# was:	jal	p.putstring, x10
	mv	x10, x23
# was:	mv	_tmp_23_, _res_13_
# 	mv	_let_t_22_,_tmp_23_
# 	mv	x10,_let_t_22_
	jal	p.putint
# was:	jal	p.putint, x10
	la	x10, s.XX_26_
# was:	la	_tmp_25_, s.XX_26_
# s.XX_26_: string ": "
# 	mv	_let_t_24_,_tmp_25_
# 	mv	x10,_tmp_25_
	jal	p.putstring
# was:	jal	p.putstring, x10
	jal	p.getint
# was:	jal	p.getint, 
	mv	x23, x10
# was:	mv	_let_m_27_, x10
	la	x10, s.X_30_
# was:	la	_tmp_29_, s.X_30_
# s.X_30_: string "\n"
# 	mv	_let_t_28_,_tmp_29_
# 	mv	x10,_tmp_29_
	jal	p.putstring
# was:	jal	p.putstring, x10
# 	mv	_fun_arg_res_18_,_let_m_27_
# 	mv	_res_13_,_fun_arg_res_18_
	sw	x23, 0(x20)
# was:	sw	_res_13_, 0(_addrg_14_)
	addi	x20, x20, 4
# was:	addi	_addrg_14_, _addrg_14_, 4
	addi	x21, x21, 1
# was:	addi	_i_15_, _i_15_, 1
	j	l.loop_beg_16_
l.loop_end_17_:
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
s.X_30_:
	.word	1
	.ascii	"\n"
	.align	2
s.XX_26_:
	.word	2
	.ascii	": "
	.align	2
s.Introdu_21_:
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