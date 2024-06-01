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
	jal	p.getint
# was:	jal	p.getint, 
	mv	x12, x10
# was:	mv	_let_n_2_, x10
	li	x10, 3
# was:	li	_plus_L_6_, 3
# 	mv	_times_L_8_,_let_n_2_
	li	x11, 3
# was:	li	_times_R_9_, 3
	mul	x11, x12, x11
# was:	mul	_plus_R_7_, _times_L_8_, _times_R_9_
	add	x11, x10, x11
# was:	add	_minus_L_4_, _plus_L_6_, _plus_R_7_
	li	x10, 2
# was:	li	_minus_R_5_, 2
	sub	x12, x11, x10
# was:	sub	_let_y_3_, _minus_L_4_, _minus_R_5_
	li	x11, 2
# was:	li	_minus_L_13_, 2
# 	mv	_times_L_15_,_let_y_3_
	li	x10, 4
# was:	li	_times_R_16_, 4
	mul	x10, x12, x10
# was:	mul	_minus_R_14_, _times_L_15_, _times_R_16_
	sub	x10, x11, x10
# was:	sub	_plus_L_11_, _minus_L_13_, _minus_R_14_
	li	x11, 2
# was:	li	_plus_R_12_, 2
	add	x18, x10, x11
# was:	add	_tmp_10_, _plus_L_11_, _plus_R_12_
# 	mv	_mainres_1_,_tmp_10_
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