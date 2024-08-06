	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1"
	.file	"jumptab.cpp"
	.option	push
	.option	arch, +a, +c, +d, +f, +m, +zicsr
	.globl	_Z7jumptabi                     # -- Begin function _Z7jumptabi
	.p2align	1
	.type	_Z7jumptabi,@function
_Z7jumptabi:                            # @_Z7jumptabi
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	li	a1, 13
	sw	zero, 12(sp)
	bltu	a1, a0, .LBB0_15
# %bb.1:                                # %entry
	lui	a1, %hi(.LJTI0_0)
	addi	a1, a1, %lo(.LJTI0_0)
	auipc	a2, %hi(.LBB0_2)
	add	a3, a1, a0
	lb	a3, 0(a3)
	addi	a2, a2, %lo(.LBB0_2)
	add	a2, a2, a3
	jr	a2
.LBB0_2:                                # %sw.bb6
	li	a0, 7
	j	.LBB0_14
.LBB0_3:                                # %sw.bb13
	li	a0, 8
	j	.LBB0_14
.LBB0_4:                                # %sw.bb11
	li	a0, 12
	j	.LBB0_14
.LBB0_5:                                # %sw.bb4
	li	a0, 2
	addi	a0, a0, 2
	addi	a0, a0, 2
	addi	a0, a0, 2
	addi	a0, a0, 2
	addi	a0, a0, 2
	addi	a0, a0, 2
	addi	a0, a0, 2
	addi	a0, a0, 2
	addi	a0, a0, 2
	addi	a0, a0, 2
	addi	a0, a0, 2
	addi	a0, a0, 2
	addi	a0, a0, 2
	addi	a0, a0, 2
	addi	a0, a0, 2
	addi	a0, a0, 2
	addi	a0, a0, 2
	addi	a0, a0, 2
	addi	a0, a0, 2
	addi	a0, a0, 2
	addi	a0, a0, 2
	addi	a0, a0, 2
	addi	a0, a0, 2
	addi	a0, a0, 2
	addi	a0, a0, 2
	addi	a0, a0, 2
	addi	a0, a0, 2
	addi	a0, a0, 2
	addi	a0, a0, 2
	addi	a0, a0, 2
	j	.LBB0_14
.LBB0_6:                                # %sw.bb9
	li	a0, 10
	j	.LBB0_14
.LBB0_7:                                # %sw.bb2
	li	a0, 4
	j	.LBB0_14
.LBB0_8:                                # %sw.bb3
	li	a0, 3
	j	.LBB0_14
.LBB0_9:                                # %sw.bb
	li	a0, 6
	j	.LBB0_14
.LBB0_10:                               # %sw.bb1
	li	a0, 5
	j	.LBB0_14
.LBB0_11:                               # %sw.bb5
	li	a0, 1
	j	.LBB0_14
.LBB0_12:                               # %sw.bb10
	li	a0, 11
	j	.LBB0_14
.LBB0_13:                               # %sw.bb8
	li	a0, 9
.LBB0_14:                               # %sw.epilog
	sw	a0, 12(sp)
.LBB0_15:                               # %sw.epilog
	lw	a0, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end0:
	.size	_Z7jumptabi, .Lfunc_end0-_Z7jumptabi
	.cfi_endproc
	.section	.rodata,"a",@progbits
.LJTI0_0:
	.byte	.LBB0_9-.LBB0_2
	.byte	.LBB0_10-.LBB0_2
	.byte	.LBB0_7-.LBB0_2
	.byte	.LBB0_8-.LBB0_2
	.byte	.LBB0_5-.LBB0_2
	.byte	.LBB0_11-.LBB0_2
	.byte	.LBB0_2-.LBB0_2
	.byte	.LBB0_3-.LBB0_2
	.byte	.LBB0_13-.LBB0_2
	.byte	.LBB0_6-.LBB0_2
	.byte	.LBB0_12-.LBB0_2
	.byte	.LBB0_4-.LBB0_2
	.byte	.LBB0_2-.LBB0_2
	.byte	.LBB0_3-.LBB0_2
                                        # -- End function
	.option	pop
	.option	push
	.option	arch, +a, +c, +d, +f, +m, +zicsr
	.text
	.globl	main                            # -- Begin function main
	.p2align	1
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	li	a0, 0
	ret
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.option	pop
	.ident	"clang version 18.1.2 (https://github.com/llvm/llvm-project.git f09d2802d130f57d22117931f88939c194d21fcc)"
	.section	".note.GNU-stack","",@progbits
Name of function getJumpTableEncoding 
