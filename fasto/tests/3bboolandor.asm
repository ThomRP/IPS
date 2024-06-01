	.text	0x00400000
	la	x3, d.heap
	jal	f.main
	jal	p.stop
# User functions
# Function main
f.main:
	sw	x1, -4(x2)
	addi	x2, x2, -4
	jal	p.getint
# was:	jal	p.getint, 
# 	mv	_let_n_2_,x10
	li	x11, 1
# was:	li	_and_L_5_, 1
	beq	x0, x11, l.sc_l_7_
# was:	beq	x0, _and_L_5_, l.sc_l_7_
	li	x10, 0
# was:	li	_and_R_6_, 0
	and	x11, x11, x10
# was:	and	_tmp_4_, _and_L_5_, _and_R_6_
	j	l.end_l_8_
l.sc_l_7_:
	mv	x11, x0
# was:	mv	_tmp_4_, x0
l.end_l_8_:
# 	mv	_let_x1_3_,_tmp_4_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x11, x0, l.wBoolF_9_
# was:	bne	_let_x1_3_, x0, l.wBoolF_9_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_9_:
	jal	p.putstring
# was:	jal	p.putstring, x10
	li	x11, 0
# was:	li	_and_L_12_, 0
	beq	x0, x11, l.sc_l_14_
# was:	beq	x0, _and_L_12_, l.sc_l_14_
	li	x10, 1
# was:	li	_and_R_13_, 1
	and	x11, x11, x10
# was:	and	_tmp_11_, _and_L_12_, _and_R_13_
	j	l.end_l_15_
l.sc_l_14_:
	mv	x11, x0
# was:	mv	_tmp_11_, x0
l.end_l_15_:
# 	mv	_let_x2_10_,_tmp_11_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x11, x0, l.wBoolF_16_
# was:	bne	_let_x2_10_, x0, l.wBoolF_16_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_16_:
	jal	p.putstring
# was:	jal	p.putstring, x10
	li	x11, 1
# was:	li	_and_L_19_, 1
	beq	x0, x11, l.sc_l_21_
# was:	beq	x0, _and_L_19_, l.sc_l_21_
	li	x10, 1
# was:	li	_and_R_20_, 1
	and	x11, x11, x10
# was:	and	_tmp_18_, _and_L_19_, _and_R_20_
	j	l.end_l_22_
l.sc_l_21_:
	mv	x11, x0
# was:	mv	_tmp_18_, x0
l.end_l_22_:
# 	mv	_let_x3_17_,_tmp_18_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x11, x0, l.wBoolF_23_
# was:	bne	_let_x3_17_, x0, l.wBoolF_23_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_23_:
	jal	p.putstring
# was:	jal	p.putstring, x10
	li	x11, 0
# was:	li	_and_L_26_, 0
	beq	x0, x11, l.sc_l_28_
# was:	beq	x0, _and_L_26_, l.sc_l_28_
	li	x10, 0
# was:	li	_and_R_27_, 0
	and	x11, x11, x10
# was:	and	_tmp_25_, _and_L_26_, _and_R_27_
	j	l.end_l_29_
l.sc_l_28_:
	mv	x11, x0
# was:	mv	_tmp_25_, x0
l.end_l_29_:
# 	mv	_let_x4_24_,_tmp_25_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x11, x0, l.wBoolF_30_
# was:	bne	_let_x4_24_, x0, l.wBoolF_30_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_30_:
	jal	p.putstring
# was:	jal	p.putstring, x10
	li	x11, 1
# was:	li	_or_L_33_, 1
	bne	x0, x11, l.sc_l_35_
# was:	bne	x0, _or_L_33_, l.sc_l_35_
	li	x10, 0
# was:	li	_or_R_34_, 0
	or	x11, x11, x10
# was:	or	_tmp_32_, _or_L_33_, _or_R_34_
	j	l.end_l_36_
l.sc_l_35_:
	addi	x11, x0, 1
# was:	addi	_tmp_32_, x0, 1
l.end_l_36_:
# 	mv	_let_y1_31_,_tmp_32_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x11, x0, l.wBoolF_37_
# was:	bne	_let_y1_31_, x0, l.wBoolF_37_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_37_:
	jal	p.putstring
# was:	jal	p.putstring, x10
	li	x11, 0
# was:	li	_or_L_40_, 0
	bne	x0, x11, l.sc_l_42_
# was:	bne	x0, _or_L_40_, l.sc_l_42_
	li	x10, 1
# was:	li	_or_R_41_, 1
	or	x11, x11, x10
# was:	or	_tmp_39_, _or_L_40_, _or_R_41_
	j	l.end_l_43_
l.sc_l_42_:
	addi	x11, x0, 1
# was:	addi	_tmp_39_, x0, 1
l.end_l_43_:
# 	mv	_let_y2_38_,_tmp_39_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x11, x0, l.wBoolF_44_
# was:	bne	_let_y2_38_, x0, l.wBoolF_44_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_44_:
	jal	p.putstring
# was:	jal	p.putstring, x10
	li	x11, 1
# was:	li	_or_L_47_, 1
	bne	x0, x11, l.sc_l_49_
# was:	bne	x0, _or_L_47_, l.sc_l_49_
	li	x10, 1
# was:	li	_or_R_48_, 1
	or	x11, x11, x10
# was:	or	_tmp_46_, _or_L_47_, _or_R_48_
	j	l.end_l_50_
l.sc_l_49_:
	addi	x11, x0, 1
# was:	addi	_tmp_46_, x0, 1
l.end_l_50_:
# 	mv	_let_y3_45_,_tmp_46_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x11, x0, l.wBoolF_51_
# was:	bne	_let_y3_45_, x0, l.wBoolF_51_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_51_:
	jal	p.putstring
# was:	jal	p.putstring, x10
	li	x11, 0
# was:	li	_or_L_54_, 0
	bne	x0, x11, l.sc_l_56_
# was:	bne	x0, _or_L_54_, l.sc_l_56_
	li	x10, 0
# was:	li	_or_R_55_, 0
	or	x11, x11, x10
# was:	or	_tmp_53_, _or_L_54_, _or_R_55_
	j	l.end_l_57_
l.sc_l_56_:
	addi	x11, x0, 1
# was:	addi	_tmp_53_, x0, 1
l.end_l_57_:
# 	mv	_let_y4_52_,_tmp_53_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x11, x0, l.wBoolF_58_
# was:	bne	_let_y4_52_, x0, l.wBoolF_58_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_58_:
	jal	p.putstring
# was:	jal	p.putstring, x10
	li	x10, 1
# was:	li	_mainres_1_, 1
# 	mv	x10,_mainres_1_
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