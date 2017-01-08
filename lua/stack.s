	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 12
	.section	__TEXT,__literal8,8byte_literals
	.align	3
LCPI0_0:
	.quad	4621819117588971520     ## double 10
	.section	__TEXT,__text,regular,pure_instructions
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
	movl	$0, -4(%rbp)
	callq	_luaL_newstate
	movl	$1, %esi
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rdi
	callq	_lua_pushboolean
	movsd	LCPI0_0(%rip), %xmm0    ## xmm0 = mem[0],zero
	movq	-16(%rbp), %rdi
	callq	_lua_pushnumber
	movq	-16(%rbp), %rdi
	callq	_lua_pushnil
	leaq	L_.str(%rip), %rsi
	movq	-16(%rbp), %rdi
	callq	_lua_pushstring
	movq	-16(%rbp), %rdi
	movq	%rax, -24(%rbp)         ## 8-byte Spill
	callq	_stackDump
	movl	$4294967292, %esi       ## imm = 0xFFFFFFFC
	movq	-16(%rbp), %rdi
	callq	_lua_pushvalue
	movq	-16(%rbp), %rdi
	callq	_stackDump
	movl	$4294967295, %esi       ## imm = 0xFFFFFFFF
	movl	$3, %edx
	movq	-16(%rbp), %rdi
	callq	_lua_copy
	movl	$4294967294, %esi       ## imm = 0xFFFFFFFE
	movq	-16(%rbp), %rdi
	callq	_lua_settop
	movq	-16(%rbp), %rdi
	callq	_stackDump
	movl	$6, %esi
	movq	-16(%rbp), %rdi
	callq	_lua_settop
	movq	-16(%rbp), %rdi
	callq	_stackDump
	movl	$4294967293, %esi       ## imm = 0xFFFFFFFD
	movl	$4294967295, %edx       ## imm = 0xFFFFFFFF
	movq	-16(%rbp), %rdi
	callq	_lua_rotate
	movl	$4294967294, %esi       ## imm = 0xFFFFFFFE
	movq	-16(%rbp), %rdi
	callq	_lua_settop
	movq	-16(%rbp), %rdi
	callq	_stackDump
	movq	-16(%rbp), %rdi
	callq	_lua_gettop
	leaq	L_.str.1(%rip), %rdi
	movl	%eax, %esi
	movb	$0, %al
	callq	_printf
	movl	$4294967291, %esi       ## imm = 0xFFFFFFFB
	movq	-16(%rbp), %rdi
	movl	%eax, -28(%rbp)         ## 4-byte Spill
	callq	_lua_settop
	movq	-16(%rbp), %rdi
	callq	_stackDump
	movq	-16(%rbp), %rdi
	callq	_lua_close
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.align	4, 0x90
_stackDump:                             ## @stackDump
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
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	callq	_lua_gettop
	leaq	L_.str.2(%rip), %rdi
	movl	%eax, -16(%rbp)
	movl	-16(%rbp), %esi
	movb	$0, %al
	callq	_printf
	movl	$1, -12(%rbp)
	movl	%eax, -24(%rbp)         ## 4-byte Spill
LBB1_1:                                 ## =>This Inner Loop Header: Depth=1
	movl	-12(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jg	LBB1_9
## BB#2:                                ##   in Loop: Header=BB1_1 Depth=1
	movq	-8(%rbp), %rdi
	movl	-12(%rbp), %esi
	callq	_lua_type
	movl	%eax, -20(%rbp)
	movl	%eax, %esi
	subl	$1, %eax
	movl	%esi, -28(%rbp)         ## 4-byte Spill
	movl	%eax, -32(%rbp)         ## 4-byte Spill
	je	LBB1_4
	jmp	LBB1_10
LBB1_10:                                ##   in Loop: Header=BB1_1 Depth=1
	movl	-28(%rbp), %eax         ## 4-byte Reload
	subl	$3, %eax
	movl	%eax, -36(%rbp)         ## 4-byte Spill
	je	LBB1_5
	jmp	LBB1_11
LBB1_11:                                ##   in Loop: Header=BB1_1 Depth=1
	movl	-28(%rbp), %eax         ## 4-byte Reload
	subl	$4, %eax
	movl	%eax, -40(%rbp)         ## 4-byte Spill
	jne	LBB1_6
	jmp	LBB1_3
LBB1_3:                                 ##   in Loop: Header=BB1_1 Depth=1
	xorl	%eax, %eax
	movl	%eax, %edx
	movq	-8(%rbp), %rdi
	movl	-12(%rbp), %esi
	callq	_lua_tolstring
	leaq	L_.str.3(%rip), %rdi
	movq	%rax, %rsi
	movb	$0, %al
	callq	_printf
	movl	%eax, -44(%rbp)         ## 4-byte Spill
	jmp	LBB1_7
LBB1_4:                                 ##   in Loop: Header=BB1_1 Depth=1
	movq	-8(%rbp), %rdi
	movl	-12(%rbp), %esi
	callq	_lua_toboolean
	leaq	L_.str.5(%rip), %rdi
	leaq	L_.str.4(%rip), %rcx
	cmpl	$0, %eax
	cmovneq	%rcx, %rdi
	movb	$0, %al
	callq	_printf
	movl	%eax, -48(%rbp)         ## 4-byte Spill
	jmp	LBB1_7
LBB1_5:                                 ##   in Loop: Header=BB1_1 Depth=1
	xorl	%eax, %eax
	movl	%eax, %edx
	movq	-8(%rbp), %rdi
	movl	-12(%rbp), %esi
	callq	_lua_tonumberx
	leaq	L_.str.6(%rip), %rdi
	movb	$1, %al
	callq	_printf
	movl	%eax, -52(%rbp)         ## 4-byte Spill
	jmp	LBB1_7
LBB1_6:                                 ##   in Loop: Header=BB1_1 Depth=1
	movq	-8(%rbp), %rdi
	movl	-20(%rbp), %esi
	callq	_lua_typename
	leaq	L_.str.7(%rip), %rdi
	movq	%rax, %rsi
	movb	$0, %al
	callq	_printf
	movl	%eax, -56(%rbp)         ## 4-byte Spill
LBB1_7:                                 ##   in Loop: Header=BB1_1 Depth=1
	leaq	L_.str.8(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	%eax, -60(%rbp)         ## 4-byte Spill
## BB#8:                                ##   in Loop: Header=BB1_1 Depth=1
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	LBB1_1
LBB1_9:
	leaq	L_.str.9(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	%eax, -64(%rbp)         ## 4-byte Spill
	addq	$64, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"hello"

L_.str.1:                               ## @.str.1
	.asciz	"top= %d\n"

L_.str.2:                               ## @.str.2
	.asciz	"top is %d\n  "

L_.str.3:                               ## @.str.3
	.asciz	"'%s'"

L_.str.4:                               ## @.str.4
	.asciz	"true"

L_.str.5:                               ## @.str.5
	.asciz	"false"

L_.str.6:                               ## @.str.6
	.asciz	"%g"

L_.str.7:                               ## @.str.7
	.asciz	"%s"

L_.str.8:                               ## @.str.8
	.asciz	"  "

L_.str.9:                               ## @.str.9
	.asciz	"\n"


.subsections_via_symbols
