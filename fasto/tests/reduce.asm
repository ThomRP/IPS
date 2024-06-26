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
	li	x12, 3
# was:	li	_size_9_, 3
	mv	x10, x3
# was:	mv	_arr_3_, x3
	slli	x11, x12, 2
# was:	slli	_tmp_12_, _size_9_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_12_, _tmp_12_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_12_
	sw	x12, 0(x10)
# was:	sw	_size_9_, 0(_arr_3_)
	addi	x12, x10, 4
# was:	addi	_addr_10_, _arr_3_, 4
	li	x11, 1
# was:	li	_tmp_11_, 1
	sw	x11, 0(x12)
# was:	sw	_tmp_11_, 0(_addr_10_)
	addi	x12, x12, 4
# was:	addi	_addr_10_, _addr_10_, 4
	li	x11, 2
# was:	li	_tmp_11_, 2
	sw	x11, 0(x12)
# was:	sw	_tmp_11_, 0(_addr_10_)
	addi	x12, x12, 4
# was:	addi	_addr_10_, _addr_10_, 4
	li	x11, 3
# was:	li	_tmp_11_, 3
	sw	x11, 0(x12)
# was:	sw	_tmp_11_, 0(_addr_10_)
	addi	x12, x12, 4
# was:	addi	_addr_10_, _addr_10_, 4
	lw	x11, 0(x10)
# was:	lw	_size_4_, 0(_arr_3_)
	li	x12, 0
# was:	li	_let_n_2_, 0
	addi	x10, x10, 4
# was:	addi	_arr_3_, _arr_3_, 4
	mv	x13, x0
# was:	mv	_ind_var_5_, x0
l.loop_beg_7_:
	bge	x13, x11, l.loop_end_8_
# was:	bge	_ind_var_5_, _size_4_, l.loop_end_8_
	lw	x14, 0(x10)
# was:	lw	_tmp_6_, 0(_arr_3_)
	addi	x10, x10, 4
# was:	addi	_arr_3_, _arr_3_, 4
# 	mv	_plus_L_14_,_let_n_2_
# 	mv	_plus_R_15_,_tmp_6_
	add	x12, x12, x14
# was:	add	_fun_arg_res_13_, _plus_L_14_, _plus_R_15_
# 	mv	_let_n_2_,_fun_arg_res_13_
	addi	x13, x13, 1
# was:	addi	_ind_var_5_, _ind_var_5_, 1
	j	l.loop_beg_7_
l.loop_end_8_:
# 	mv	_tmp_16_,_let_n_2_
	mv	x18, x12
# was:	mv	_mainres_1_, _tmp_16_
	mv	x10, x18
# was:	mv	x10, _mainres_1_
	jal	p.putint
# was:	jal	p.putint, x10
	mv	x10, x18
# was:	mv	x10, _mainres_1_
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