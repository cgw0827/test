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
	subq	$352, %rsp              ## imm = 0x160
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movl	$0, -276(%rbp)
	callq	_luaL_newstate
	movq	%rax, -288(%rbp)
	movq	-288(%rbp), %rdi
	callq	_luaL_openlibs
LBB0_1:                                 ## =>This Inner Loop Header: Depth=1
	movl	$256, %esi              ## imm = 0x100
	movq	___stdinp@GOTPCREL(%rip), %rax
	leaq	-272(%rbp), %rdi
	movq	(%rax), %rdx
	callq	_fgets
	cmpq	$0, %rax
	je	LBB0_7
## BB#2:                                ##   in Loop: Header=BB0_1 Depth=1
	leaq	L_.str(%rip), %rcx
	xorl	%eax, %eax
	movl	%eax, %r8d
	leaq	-272(%rbp), %rdx
	movq	-288(%rbp), %rdi
	movq	%rdi, -296(%rbp)        ## 8-byte Spill
	movq	%rdx, %rdi
	movq	%rcx, -304(%rbp)        ## 8-byte Spill
	movq	%r8, -312(%rbp)         ## 8-byte Spill
	movq	%rdx, -320(%rbp)        ## 8-byte Spill
	callq	_strlen
	movq	-296(%rbp), %rdi        ## 8-byte Reload
	movq	-320(%rbp), %rsi        ## 8-byte Reload
	movq	%rax, %rdx
	movq	-304(%rbp), %rcx        ## 8-byte Reload
	movq	-312(%rbp), %r8         ## 8-byte Reload
	callq	_luaL_loadbufferx
	movb	$1, %r9b
	cmpl	$0, %eax
	movb	%r9b, -321(%rbp)        ## 1-byte Spill
	jne	LBB0_4
## BB#3:                                ##   in Loop: Header=BB0_1 Depth=1
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	movl	%ecx, %edx
	movq	-288(%rbp), %rdi
	movl	%eax, %esi
	movq	%rdx, -336(%rbp)        ## 8-byte Spill
	movl	%eax, %edx
	movl	%eax, %ecx
	movq	-336(%rbp), %r8         ## 8-byte Reload
	movq	-336(%rbp), %r9         ## 8-byte Reload
	callq	_lua_pcallk
	cmpl	$0, %eax
	setne	%r10b
	movb	%r10b, -321(%rbp)       ## 1-byte Spill
LBB0_4:                                 ##   in Loop: Header=BB0_1 Depth=1
	movb	-321(%rbp), %al         ## 1-byte Reload
	andb	$1, %al
	movzbl	%al, %ecx
	movl	%ecx, -280(%rbp)
	cmpl	$0, -280(%rbp)
	je	LBB0_6
## BB#5:                                ##   in Loop: Header=BB0_1 Depth=1
	movl	$4294967295, %esi       ## imm = 0xFFFFFFFF
	xorl	%eax, %eax
	movl	%eax, %edx
	movq	___stderrp@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rdi
	movq	-288(%rbp), %rcx
	movq	%rdi, -344(%rbp)        ## 8-byte Spill
	movq	%rcx, %rdi
	callq	_lua_tolstring
	leaq	L_.str.1(%rip), %rsi
	movq	-344(%rbp), %rdi        ## 8-byte Reload
	movq	%rax, %rdx
	movb	$0, %al
	callq	_fprintf
	movl	$4294967294, %esi       ## imm = 0xFFFFFFFE
	movq	-288(%rbp), %rdi
	movl	%eax, -348(%rbp)        ## 4-byte Spill
	callq	_lua_settop
LBB0_6:                                 ##   in Loop: Header=BB0_1 Depth=1
	jmp	LBB0_1
LBB0_7:
	movq	-288(%rbp), %rdi
	callq	_lua_close
	movq	___stack_chk_guard@GOTPCREL(%rip), %rdi
	movq	(%rdi), %rdi
	cmpq	-8(%rbp), %rdi
	jne	LBB0_9
## BB#8:
	xorl	%eax, %eax
	addq	$352, %rsp              ## imm = 0x160
	popq	%rbp
	retq
LBB0_9:
	callq	___stack_chk_fail
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"line"

L_.str.1:                               ## @.str.1
	.asciz	"%s"


.subsections_via_symbols
