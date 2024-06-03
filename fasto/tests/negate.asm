	.text	0x00400000
	la	x3, d.heap
	jal	f.main
	jal	p.stop
# User functions
# Function main
f.main:
	sw	x1, -4(x2)
	sw	x21, -20(x2)
	sw	x20, -16(x2)
	sw	x19, -12(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -20
	li	x18, 1
# was:	li	_tmp_4_, 1
# 	mv	_let_res_3_,_tmp_4_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x18, x0, l.wBoolF_5_
# was:	bne	_let_res_3_, x0, l.wBoolF_5_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_5_:
	jal	p.putstring
# was:	jal	p.putstring, x10
	la	x10, s.X_8_
# was:	la	_tmp_7_, s.X_8_
# s.X_8_: string "\n"
# 	mv	_let_tmp_6_,_tmp_7_
# 	mv	x10,_tmp_7_
	jal	p.putstring
# was:	jal	p.putstring, x10
# 	mv	_let_x0_2_,_let_res_3_
	li	x10, 3
# was:	li	_NEGATE_exp_15_, 3
	sub	x10, x0, x10
# was:	sub	_divide_L_13_, x0, _NEGATE_exp_15_
	li	x11, 2
# was:	li	_divide_R_14_, 2
	bne	x11, x0, l.safe_16_
# was:	bne	_divide_R_14_, x0, l.safe_16_
	li	x10, 8
# was:	li	x10, 8
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.safe_16_:
	div	x10, x10, x11
# was:	div	_eq_L_11_, _divide_L_13_, _divide_R_14_
	li	x11, 2
# was:	li	_NEGATE_exp_17_, 2
	sub	x11, x0, x11
# was:	sub	_eq_R_12_, x0, _NEGATE_exp_17_
	li	x12, 0
# was:	li	_let_b_I2_10_, 0
	bne	x10, x11, l.false_18_
# was:	bne	_eq_L_11_, _eq_R_12_, l.false_18_
	li	x12, 1
# was:	li	_let_b_I2_10_, 1
l.false_18_:
# 	mv	_let_b_19_,_let_b_I2_10_
	mv	x19, x12
# was:	mv	_tmp_21_, _let_b_19_
# 	mv	_let_res_20_,_tmp_21_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x19, x0, l.wBoolF_22_
# was:	bne	_let_res_20_, x0, l.wBoolF_22_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_22_:
	jal	p.putstring
# was:	jal	p.putstring, x10
	la	x10, s.X_25_
# was:	la	_tmp_24_, s.X_25_
# s.X_25_: string "\n"
# 	mv	_let_tmp_23_,_tmp_24_
# 	mv	x10,_tmp_24_
	jal	p.putstring
# was:	jal	p.putstring, x10
# 	mv	_let_x1_9_,_let_res_20_
	li	x10, 3
# was:	li	_divide_L_30_, 3
	li	x11, 2
# was:	li	_NEGATE_exp_32_, 2
	sub	x11, x0, x11
# was:	sub	_divide_R_31_, x0, _NEGATE_exp_32_
	bne	x11, x0, l.safe_33_
# was:	bne	_divide_R_31_, x0, l.safe_33_
	li	x10, 9
# was:	li	x10, 9
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.safe_33_:
	div	x10, x10, x11
# was:	div	_eq_L_28_, _divide_L_30_, _divide_R_31_
	li	x11, 2
# was:	li	_NEGATE_exp_34_, 2
	sub	x11, x0, x11
# was:	sub	_eq_R_29_, x0, _NEGATE_exp_34_
	li	x12, 0
# was:	li	_let_b_I3_27_, 0
	bne	x10, x11, l.false_35_
# was:	bne	_eq_L_28_, _eq_R_29_, l.false_35_
	li	x12, 1
# was:	li	_let_b_I3_27_, 1
l.false_35_:
# 	mv	_let_b_36_,_let_b_I3_27_
	mv	x20, x12
# was:	mv	_tmp_38_, _let_b_36_
# 	mv	_let_res_37_,_tmp_38_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x20, x0, l.wBoolF_39_
# was:	bne	_let_res_37_, x0, l.wBoolF_39_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_39_:
	jal	p.putstring
# was:	jal	p.putstring, x10
	la	x10, s.X_42_
# was:	la	_tmp_41_, s.X_42_
# s.X_42_: string "\n"
# 	mv	_let_tmp_40_,_tmp_41_
# 	mv	x10,_tmp_41_
	jal	p.putstring
# was:	jal	p.putstring, x10
# 	mv	_let_x2_26_,_let_res_37_
	li	x10, 3
# was:	li	_NEGATE_exp_49_, 3
	sub	x10, x0, x10
# was:	sub	_divide_L_47_, x0, _NEGATE_exp_49_
	li	x11, 2
# was:	li	_NEGATE_exp_50_, 2
	sub	x11, x0, x11
# was:	sub	_divide_R_48_, x0, _NEGATE_exp_50_
	bne	x11, x0, l.safe_51_
# was:	bne	_divide_R_48_, x0, l.safe_51_
	li	x10, 10
# was:	li	x10, 10
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.safe_51_:
	div	x12, x10, x11
# was:	div	_eq_L_45_, _divide_L_47_, _divide_R_48_
	li	x10, 1
# was:	li	_eq_R_46_, 1
	li	x11, 0
# was:	li	_let_b_I4_44_, 0
	bne	x12, x10, l.false_52_
# was:	bne	_eq_L_45_, _eq_R_46_, l.false_52_
	li	x11, 1
# was:	li	_let_b_I4_44_, 1
l.false_52_:
# 	mv	_let_b_53_,_let_b_I4_44_
	mv	x21, x11
# was:	mv	_tmp_55_, _let_b_53_
# 	mv	_let_res_54_,_tmp_55_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x21, x0, l.wBoolF_56_
# was:	bne	_let_res_54_, x0, l.wBoolF_56_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_56_:
	jal	p.putstring
# was:	jal	p.putstring, x10
	la	x10, s.X_59_
# was:	la	_tmp_58_, s.X_59_
# s.X_59_: string "\n"
# 	mv	_let_tmp_57_,_tmp_58_
# 	mv	x10,_tmp_58_
	jal	p.putstring
# was:	jal	p.putstring, x10
# 	mv	_let_x3_43_,_let_res_54_
# 	mv	_and_L_65_,_let_x0_2_
	beq	x0, x18, l.sc_l_68_
# was:	beq	x0, _and_L_65_, l.sc_l_68_
# 	mv	_NOT_exp_67_,_let_x1_9_
	xori	x10, x19, 1
# was:	xori	_and_R_66_, _NOT_exp_67_, 1
	and	x10, x18, x10
# was:	and	_and_L_63_, _and_L_65_, _and_R_66_
	j	l.end_l_69_
l.sc_l_68_:
	mv	x10, x0
# was:	mv	_and_L_63_, x0
l.end_l_69_:
	beq	x0, x10, l.sc_l_71_
# was:	beq	x0, _and_L_63_, l.sc_l_71_
# 	mv	_NOT_exp_70_,_let_x2_26_
	xori	x11, x20, 1
# was:	xori	_and_R_64_, _NOT_exp_70_, 1
	and	x10, x10, x11
# was:	and	_and_L_61_, _and_L_63_, _and_R_64_
	j	l.end_l_72_
l.sc_l_71_:
	mv	x10, x0
# was:	mv	_and_L_61_, x0
l.end_l_72_:
	beq	x0, x10, l.sc_l_73_
# was:	beq	x0, _and_L_61_, l.sc_l_73_
# 	mv	_and_R_62_,_let_x3_43_
	and	x10, x10, x21
# was:	and	_let_b_I5_60_, _and_L_61_, _and_R_62_
	j	l.end_l_74_
l.sc_l_73_:
	mv	x10, x0
# was:	mv	_let_b_I5_60_, x0
l.end_l_74_:
# 	mv	_let_b_75_,_let_b_I5_60_
# 	mv	_tmp_77_,_let_b_75_
	mv	x18, x10
# was:	mv	_let_res_76_, _tmp_77_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x18, x0, l.wBoolF_78_
# was:	bne	_let_res_76_, x0, l.wBoolF_78_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_78_:
	jal	p.putstring
# was:	jal	p.putstring, x10
	la	x10, s.X_81_
# was:	la	_tmp_80_, s.X_81_
# s.X_81_: string "\n"
# 	mv	_let_tmp_79_,_tmp_80_
# 	mv	x10,_tmp_80_
	jal	p.putstring
# was:	jal	p.putstring, x10
	mv	x10, x18
# was:	mv	_mainres_1_, _let_res_76_
# 	mv	x10,_mainres_1_
	addi	x2, x2, 20
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
s.X_81_:
	.word	1
	.ascii	"\n"
	.align	2
s.X_59_:
	.word	1
	.ascii	"\n"
	.align	2
s.X_42_:
	.word	1
	.ascii	"\n"
	.align	2
s.X_25_:
	.word	1
	.ascii	"\n"
	.align	2
s.X_8_:
	.word	1
	.ascii	"\n"
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