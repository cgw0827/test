	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 12
	.globl	_error
	.align	4, 0x90
_error:                                 ## @error
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
	subq	$416, %rsp              ## imm = 0x1A0
	testb	%al, %al
	movaps	%xmm7, -240(%rbp)       ## 16-byte Spill
	movaps	%xmm6, -256(%rbp)       ## 16-byte Spill
	movaps	%xmm5, -272(%rbp)       ## 16-byte Spill
	movaps	%xmm4, -288(%rbp)       ## 16-byte Spill
	movaps	%xmm3, -304(%rbp)       ## 16-byte Spill
	movaps	%xmm2, -320(%rbp)       ## 16-byte Spill
	movaps	%xmm1, -336(%rbp)       ## 16-byte Spill
	movaps	%xmm0, -352(%rbp)       ## 16-byte Spill
	movq	%rdi, -360(%rbp)        ## 8-byte Spill
	movq	%r9, -368(%rbp)         ## 8-byte Spill
	movq	%r8, -376(%rbp)         ## 8-byte Spill
	movq	%rcx, -384(%rbp)        ## 8-byte Spill
	movq	%rdx, -392(%rbp)        ## 8-byte Spill
	movq	%rsi, -400(%rbp)        ## 8-byte Spill
	je	LBB0_2
## BB#1:
	movaps	-352(%rbp), %xmm0       ## 16-byte Reload
	movaps	%xmm0, -176(%rbp)
	movaps	-336(%rbp), %xmm1       ## 16-byte Reload
	movaps	%xmm1, -160(%rbp)
	movaps	-320(%rbp), %xmm2       ## 16-byte Reload
	movaps	%xmm2, -144(%rbp)
	movaps	-304(%rbp), %xmm3       ## 16-byte Reload
	movaps	%xmm3, -128(%rbp)
	movaps	-288(%rbp), %xmm4       ## 16-byte Reload
	movaps	%xmm4, -112(%rbp)
	movaps	-272(%rbp), %xmm5       ## 16-byte Reload
	movaps	%xmm5, -96(%rbp)
	movaps	-256(%rbp), %xmm6       ## 16-byte Reload
	movaps	%xmm6, -80(%rbp)
	movaps	-240(%rbp), %xmm7       ## 16-byte Reload
	movaps	%xmm7, -64(%rbp)
LBB0_2:
	movq	-368(%rbp), %rax        ## 8-byte Reload
	movq	%rax, -184(%rbp)
	movq	-376(%rbp), %rcx        ## 8-byte Reload
	movq	%rcx, -192(%rbp)
	movq	-384(%rbp), %rdx        ## 8-byte Reload
	movq	%rdx, -200(%rbp)
	movq	-392(%rbp), %rsi        ## 8-byte Reload
	movq	%rsi, -208(%rbp)
	movq	-400(%rbp), %rdi        ## 8-byte Reload
	movq	-360(%rbp), %r8         ## 8-byte Reload
	leaq	-48(%rbp), %r9
	movq	___stderrp@GOTPCREL(%rip), %r10
	movq	%r8, -8(%rbp)
	movq	%rdi, -16(%rbp)
	movq	%r9, %rdi
	leaq	-224(%rbp), %r8
	movq	%r8, 16(%rdi)
	leaq	16(%rbp), %r8
	movq	%r8, 8(%rdi)
	movl	$48, 4(%rdi)
	movl	$16, (%rdi)
	movq	(%r10), %rdi
	movq	-16(%rbp), %rsi
	movq	%r9, %rdx
	callq	_vfprintf
	movl	$1, %edi
	leaq	-48(%rbp), %rcx
	movl	%eax, -404(%rbp)        ## 4-byte Spill
	movq	%rcx, -416(%rbp)        ## 8-byte Spill
	callq	_exit
	.cfi_endproc

	.globl	_load
	.align	4, 0x90
_load:                                  ## @load
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp3:
	.cfi_def_cfa_offset 16
Ltmp4:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp5:
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	xorl	%eax, %eax
	movl	%eax, %r8d
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rsi
	movq	%r8, %rdx
	callq	_luaL_loadfilex
	cmpl	$0, %eax
	jne	LBB1_2
## BB#1:
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	movl	%ecx, %edx
	movq	-8(%rbp), %rdi
	movl	%eax, %esi
	movq	%rdx, -40(%rbp)         ## 8-byte Spill
	movl	%eax, %edx
	movl	%eax, %ecx
	movq	-40(%rbp), %r8          ## 8-byte Reload
	movq	-40(%rbp), %r9          ## 8-byte Reload
	callq	_lua_pcallk
	cmpl	$0, %eax
	je	LBB1_3
LBB1_2:
	movl	$4294967295, %esi       ## imm = 0xFFFFFFFF
	xorl	%eax, %eax
	movl	%eax, %edx
	movq	-8(%rbp), %rdi
	movq	-8(%rbp), %rcx
	movq	%rdi, -48(%rbp)         ## 8-byte Spill
	movq	%rcx, %rdi
	callq	_lua_tolstring
	leaq	L_.str(%rip), %rsi
	movq	-48(%rbp), %rdi         ## 8-byte Reload
	movq	%rax, %rdx
	movb	$0, %al
	callq	_error
LBB1_3:
	leaq	L_.str.1(%rip), %rsi
	movq	-8(%rbp), %rdi
	callq	_lua_getglobal
	leaq	L_.str.2(%rip), %rsi
	movq	-8(%rbp), %rdi
	movl	%eax, -52(%rbp)         ## 4-byte Spill
	callq	_lua_getglobal
	movl	$4294967294, %esi       ## imm = 0xFFFFFFFE
	movq	-8(%rbp), %rdi
	movl	%eax, -56(%rbp)         ## 4-byte Spill
	callq	_lua_isnumber
	cmpl	$0, %eax
	jne	LBB1_5
## BB#4:
	leaq	L_.str.3(%rip), %rsi
	movq	-8(%rbp), %rdi
	movb	$0, %al
	callq	_error
LBB1_5:
	movl	$4294967295, %esi       ## imm = 0xFFFFFFFF
	movq	-8(%rbp), %rdi
	callq	_lua_isnumber
	cmpl	$0, %eax
	jne	LBB1_7
## BB#6:
	leaq	L_.str.4(%rip), %rsi
	movq	-8(%rbp), %rdi
	movb	$0, %al
	callq	_error
LBB1_7:
	movl	$4294967294, %esi       ## imm = 0xFFFFFFFE
	xorl	%eax, %eax
	movl	%eax, %edx
	movq	-8(%rbp), %rdi
	callq	_lua_tointegerx
	movl	$4294967295, %esi       ## imm = 0xFFFFFFFF
	xorl	%ecx, %ecx
	movl	%ecx, %edx
	movl	%eax, %ecx
	movq	-24(%rbp), %rax
	movl	%ecx, (%rax)
	movq	-8(%rbp), %rdi
	callq	_lua_tointegerx
	movl	%eax, %ecx
	movq	-32(%rbp), %rax
	movl	%ecx, (%rax)
	addq	$64, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp6:
	.cfi_def_cfa_offset 16
Ltmp7:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp8:
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	$0, -4(%rbp)
	callq	_luaL_newstate
	leaq	L_.str.5(%rip), %rsi
	leaq	-8(%rbp), %rdx
	leaq	-12(%rbp), %rcx
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rdi
	callq	_load
	leaq	L_.str.6(%rip), %rdi
	movl	-8(%rbp), %esi
	movl	-12(%rbp), %edx
	movb	$0, %al
	callq	_printf
	xorl	%edx, %edx
	movl	%eax, -28(%rbp)         ## 4-byte Spill
	movl	%edx, %eax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"cannot run config.file:%s"

L_.str.1:                               ## @.str.1
	.asciz	"width"

L_.str.2:                               ## @.str.2
	.asciz	"height"

L_.str.3:                               ## @.str.3
	.asciz	"width should be a number \n"

L_.str.4:                               ## @.str.4
	.asciz	"height should be a number \n"

L_.str.5:                               ## @.str.5
	.asciz	"test.lua"

L_.str.6:                               ## @.str.6
	.asciz	"w = %d h = %d \n"


.subsections_via_symbols
