	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 12
	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp0:
	.cfi_def_cfa_offset 16
Ltmp1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp2:
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	movq	%rcx, -8(%rbp)
	movl	$0, -12(%rbp)
	movl	$10, -16(%rbp)
	movq	%rsp, %rcx
	movq	%rcx, -24(%rbp)
	movl	$0, -12(%rbp)
	movq	-24(%rbp), %rcx
	movq	%rcx, %rsp
	movl	-12(%rbp), %edx
	movq	(%rax), %rax
	cmpq	-8(%rbp), %rax
	movl	%edx, -28(%rbp)         ## 4-byte Spill
	jne	LBB0_2
## BB#1:
	movl	-28(%rbp), %eax         ## 4-byte Reload
	movq	%rbp, %rsp
	popq	%rbp
	retq
LBB0_2:
	callq	___stack_chk_fail
	.cfi_endproc


.subsections_via_symbols
