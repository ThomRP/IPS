	.text	0x00400000
	la	x3, d.heap
	jal	f.main
	jal	p.stop
# User functions
# Function write_int
f.write_int:
	sw	x1, -4(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -8
# 	mv	_param_x_1_,x10
	mv	x18, x10
# was:	mv	_tmp_3_, _param_x_1_
# 	mv	_write_intres_2_,_tmp_3_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x18, x0, l.wBoolF_4_
# was:	bne	_write_intres_2_, x0, l.wBoolF_4_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_4_:
	jal	p.putstring
# was:	jal	p.putstring, x10
	mv	x10, x18
# was:	mv	x10, _write_intres_2_
	addi	x2, x2, 8
	lw	x18, -8(x2)
	lw	x1, -4(x2)
	jr	x1
# Function write_int_arr
f.write_int_arr:
	sw	x1, -4(x2)
	sw	x22, -24(x2)
	sw	x21, -20(x2)
	sw	x20, -16(x2)
	sw	x19, -12(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -24
# 	mv	_param_x_5_,x10
# 	mv	_arr_8_,_param_x_5_
	lw	x18, 0(x10)
# was:	lw	_size_7_, 0(_arr_8_)
	mv	x19, x3
# was:	mv	_write_int_arrres_6_, x3
	addi	x11, x18, 3
# was:	addi	_tmp_16_, _size_7_, 3
	andi	x11, x11, -4
# was:	andi	_tmp_16_, _tmp_16_, -4
	addi	x11, x11, 4
# was:	addi	_tmp_16_, _tmp_16_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_16_
	sw	x18, 0(x19)
# was:	sw	_size_7_, 0(_write_int_arrres_6_)
	addi	x20, x19, 4
# was:	addi	_addrg_11_, _write_int_arrres_6_, 4
	mv	x21, x0
# was:	mv	_i_12_, x0
	addi	x22, x10, 4
# was:	addi	_elem_9_, _arr_8_, 4
l.loop_beg_13_:
	bge	x21, x18, l.loop_end_14_
# was:	bge	_i_12_, _size_7_, l.loop_end_14_
	lbu	x10, 0(x22)
# was:	lbu	_res_10_, 0(_elem_9_)
	addi	x22, x22, 1
# was:	addi	_elem_9_, _elem_9_, 1
# 	mv	x10,_res_10_
	jal	f.write_int
# was:	jal	f.write_int, x10
# 	mv	_tmp_15_,x10
# 	mv	_res_10_,_tmp_15_
	sb	x10, 0(x20)
# was:	sb	_res_10_, 0(_addrg_11_)
	addi	x20, x20, 1
# was:	addi	_addrg_11_, _addrg_11_, 1
	addi	x21, x21, 1
# was:	addi	_i_12_, _i_12_, 1
	j	l.loop_beg_13_
l.loop_end_14_:
	mv	x10, x19
# was:	mv	x10, _write_int_arrres_6_
	addi	x2, x2, 24
	lw	x22, -24(x2)
	lw	x21, -20(x2)
	lw	x20, -16(x2)
	lw	x19, -12(x2)
	lw	x18, -8(x2)
	lw	x1, -4(x2)
	jr	x1
# Function main
f.main:
	sw	x1, -4(x2)
	addi	x2, x2, -4
	li	x12, 7
# was:	li	_size_19_, 7
	li	x11, 1
# was:	li	_a_20_, 1
	bge	x12, x0, l.safe_21_
# was:	bge	_size_19_, x0, l.safe_21_
	li	x10, 7
# was:	li	x10, 7
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_21_:
	mv	x10, x3
# was:	mv	_let_x_18_, x3
	addi	x13, x12, 3
# was:	addi	_tmp_26_, _size_19_, 3
	andi	x13, x13, -4
# was:	andi	_tmp_26_, _tmp_26_, -4
	addi	x13, x13, 4
# was:	addi	_tmp_26_, _tmp_26_, 4
	add	x3, x3, x13
# was:	add	x3, x3, _tmp_26_
	sw	x12, 0(x10)
# was:	sw	_size_19_, 0(_let_x_18_)
	addi	x13, x10, 4
# was:	addi	_addr_22_, _let_x_18_, 4
	mv	x14, x0
# was:	mv	_i_23_, x0
l.loop_beg_24_:
	bge	x14, x12, l.loop_end_25_
# was:	bge	_i_23_, _size_19_, l.loop_end_25_
	sb	x11, 0(x13)
# was:	sb	_a_20_, 0(_addr_22_)
	addi	x13, x13, 1
# was:	addi	_addr_22_, _addr_22_, 1
	addi	x14, x14, 1
# was:	addi	_i_23_, _i_23_, 1
	j	l.loop_beg_24_
l.loop_end_25_:
# 	mv	_arg_27_,_let_x_18_
# 	mv	x10,_arg_27_
	jal	f.write_int_arr
# was:	jal	f.write_int_arr, x10
# 	mv	_mainres_17_,x10
# 	mv	x10,_mainres_17_
	addi	x2, x2, 4
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