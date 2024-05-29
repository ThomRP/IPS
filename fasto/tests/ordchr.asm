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
# was:	mv	_let_n_3_, _let_n_2_
# 	mv	_size_8_,_let_n_3_
	bge	x12, x0, l.safe_9_
# was:	bge	_size_8_, x0, l.safe_9_
	li	x10, 3
# was:	li	x10, 3
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_9_:
	mv	x10, x3
# was:	mv	_arr_5_, x3
	slli	x11, x12, 2
# was:	slli	_tmp_14_, _size_8_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_14_, _tmp_14_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_14_
	sw	x12, 0(x10)
# was:	sw	_size_8_, 0(_arr_5_)
	addi	x13, x10, 4
# was:	addi	_addr_10_, _arr_5_, 4
	mv	x11, x0
# was:	mv	_i_11_, x0
l.loop_beg_12_:
	bge	x11, x12, l.loop_end_13_
# was:	bge	_i_11_, _size_8_, l.loop_end_13_
	sw	x11, 0(x13)
# was:	sw	_i_11_, 0(_addr_10_)
	addi	x13, x13, 4
# was:	addi	_addr_10_, _addr_10_, 4
	addi	x11, x11, 1
# was:	addi	_i_11_, _i_11_, 1
	j	l.loop_beg_12_
l.loop_end_13_:
	lw	x18, 0(x10)
# was:	lw	_size_4_, 0(_arr_5_)
	mv	x19, x3
# was:	mv	_mainres_1_, x3
	addi	x11, x18, 3
# was:	addi	_tmp_20_, _size_4_, 3
	andi	x11, x11, -4
# was:	andi	_tmp_20_, _tmp_20_, -4
	addi	x11, x11, 4
# was:	addi	_tmp_20_, _tmp_20_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_20_
	sw	x18, 0(x19)
# was:	sw	_size_4_, 0(_mainres_1_)
	addi	x20, x19, 4
# was:	addi	_addrg_15_, _mainres_1_, 4
	mv	x21, x0
# was:	mv	_i_16_, x0
	addi	x22, x10, 4
# was:	addi	_elem_6_, _arr_5_, 4
l.loop_beg_17_:
	bge	x21, x18, l.loop_end_18_
# was:	bge	_i_16_, _size_4_, l.loop_end_18_
	lw	x10, 0(x22)
# was:	lw	_res_7_, 0(_elem_6_)
	addi	x22, x22, 4
# was:	addi	_elem_6_, _elem_6_, 4
	jal	p.getchar
# was:	jal	p.getchar, 
# 	mv	_fun_arg_res_19_,x10
# 	mv	_res_7_,_fun_arg_res_19_
	sb	x10, 0(x20)
# was:	sb	_res_7_, 0(_addrg_15_)
	addi	x20, x20, 1
# was:	addi	_addrg_15_, _addrg_15_, 1
	addi	x21, x21, 1
# was:	addi	_i_16_, _i_16_, 1
	j	l.loop_beg_17_
l.loop_end_18_:
	mv	x10, x19
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