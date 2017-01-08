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

	.globl	_getfield
	.align	4, 0x90
_getfield:                              ## @getfield
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
	subq	$32, %rsp
	movl	$4294967295, %eax       ## imm = 0xFFFFFFFF
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rdx
	movl	%eax, %esi
	callq	_lua_getfield
	movq	-8(%rbp), %rdi
	movl	%eax, -24(%rbp)         ## 4-byte Spill
	callq	_stackDump
	movl	$4294967295, %esi       ## imm = 0xFFFFFFFF
	movq	-8(%rbp), %rdi
	callq	_lua_isnumber
	cmpl	$0, %eax
	jne	LBB1_2
## BB#1:
	leaq	L_.str.5(%rip), %rsi
	movq	-8(%rbp), %rdi
	movb	$0, %al
	callq	_error
LBB1_2:
	movl	$4294967295, %esi       ## imm = 0xFFFFFFFF
	xorl	%eax, %eax
	movl	%eax, %edx
	movq	-8(%rbp), %rdi
	callq	_lua_tonumberx
	movl	$4294967294, %esi       ## imm = 0xFFFFFFFE
	cvttsd2si	%xmm0, %eax
	imull	$255, %eax, %eax
	movl	%eax, -20(%rbp)
	movq	-8(%rbp), %rdi
	callq	_lua_settop
	movl	-20(%rbp), %eax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.align	4, 0x90
_stackDump:                             ## @stackDump
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
	subq	$64, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	callq	_lua_gettop
	leaq	L_.str.14(%rip), %rdi
	movl	%eax, -16(%rbp)
	movl	-16(%rbp), %esi
	movb	$0, %al
	callq	_printf
	movl	$1, -12(%rbp)
	movl	%eax, -24(%rbp)         ## 4-byte Spill
LBB2_1:                                 ## =>This Inner Loop Header: Depth=1
	movl	-12(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jg	LBB2_9
## BB#2:                                ##   in Loop: Header=BB2_1 Depth=1
	movq	-8(%rbp), %rdi
	movl	-12(%rbp), %esi
	callq	_lua_type
	movl	%eax, -20(%rbp)
	movl	%eax, %esi
	subl	$1, %eax
	movl	%esi, -28(%rbp)         ## 4-byte Spill
	movl	%eax, -32(%rbp)         ## 4-byte Spill
	je	LBB2_4
	jmp	LBB2_10
LBB2_10:                                ##   in Loop: Header=BB2_1 Depth=1
	movl	-28(%rbp), %eax         ## 4-byte Reload
	subl	$3, %eax
	movl	%eax, -36(%rbp)         ## 4-byte Spill
	je	LBB2_5
	jmp	LBB2_11
LBB2_11:                                ##   in Loop: Header=BB2_1 Depth=1
	movl	-28(%rbp), %eax         ## 4-byte Reload
	subl	$4, %eax
	movl	%eax, -40(%rbp)         ## 4-byte Spill
	jne	LBB2_6
	jmp	LBB2_3
LBB2_3:                                 ##   in Loop: Header=BB2_1 Depth=1
	xorl	%eax, %eax
	movl	%eax, %edx
	movq	-8(%rbp), %rdi
	movl	-12(%rbp), %esi
	callq	_lua_tolstring
	leaq	L_.str.15(%rip), %rdi
	movq	%rax, %rsi
	movb	$0, %al
	callq	_printf
	movl	%eax, -44(%rbp)         ## 4-byte Spill
	jmp	LBB2_7
LBB2_4:                                 ##   in Loop: Header=BB2_1 Depth=1
	movq	-8(%rbp), %rdi
	movl	-12(%rbp), %esi
	callq	_lua_toboolean
	leaq	L_.str.17(%rip), %rdi
	leaq	L_.str.16(%rip), %rcx
	cmpl	$0, %eax
	cmovneq	%rcx, %rdi
	movb	$0, %al
	callq	_printf
	movl	%eax, -48(%rbp)         ## 4-byte Spill
	jmp	LBB2_7
LBB2_5:                                 ##   in Loop: Header=BB2_1 Depth=1
	xorl	%eax, %eax
	movl	%eax, %edx
	movq	-8(%rbp), %rdi
	movl	-12(%rbp), %esi
	callq	_lua_tonumberx
	leaq	L_.str.18(%rip), %rdi
	movb	$1, %al
	callq	_printf
	movl	%eax, -52(%rbp)         ## 4-byte Spill
	jmp	LBB2_7
LBB2_6:                                 ##   in Loop: Header=BB2_1 Depth=1
	movq	-8(%rbp), %rdi
	movl	-20(%rbp), %esi
	callq	_lua_typename
	leaq	L_.str.19(%rip), %rdi
	movq	%rax, %rsi
	movb	$0, %al
	callq	_printf
	movl	%eax, -56(%rbp)         ## 4-byte Spill
LBB2_7:                                 ##   in Loop: Header=BB2_1 Depth=1
	leaq	L_.str.20(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	%eax, -60(%rbp)         ## 4-byte Spill
## BB#8:                                ##   in Loop: Header=BB2_1 Depth=1
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	LBB2_1
LBB2_9:
	leaq	L_.str.21(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	%eax, -64(%rbp)         ## 4-byte Spill
	addq	$64, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_load
	.align	4, 0x90
_load:                                  ## @load
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp9:
	.cfi_def_cfa_offset 16
Ltmp10:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp11:
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	xorl	%eax, %eax
	movl	%eax, %edx
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rsi
	callq	_luaL_loadfilex
	cmpl	$0, %eax
	jne	LBB3_2
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
	je	LBB3_3
LBB3_2:
	movl	$4294967295, %esi       ## imm = 0xFFFFFFFF
	xorl	%eax, %eax
	movl	%eax, %edx
	movq	-8(%rbp), %rdi
	movq	-8(%rbp), %rcx
	movq	%rdi, -48(%rbp)         ## 8-byte Spill
	movq	%rcx, %rdi
	callq	_lua_tolstring
	leaq	L_.str.6(%rip), %rsi
	movq	-48(%rbp), %rdi         ## 8-byte Reload
	movq	%rax, %rdx
	movb	$0, %al
	callq	_error
LBB3_3:
	leaq	L_.str.7(%rip), %rsi
	movq	-8(%rbp), %rdi
	callq	_lua_getglobal
	movl	$4294967295, %esi       ## imm = 0xFFFFFFFF
	movq	-8(%rbp), %rdi
	movl	%eax, -52(%rbp)         ## 4-byte Spill
	callq	_lua_type
	cmpl	$5, %eax
	je	LBB3_5
## BB#4:
	leaq	L_.str.8(%rip), %rsi
	movq	-8(%rbp), %rdi
	movb	$0, %al
	callq	_error
LBB3_5:
	leaq	L_.str.9(%rip), %rsi
	movq	-8(%rbp), %rdi
	callq	_getfield
	leaq	L_.str.10(%rip), %rsi
	movl	%eax, -20(%rbp)
	movq	-8(%rbp), %rdi
	callq	_getfield
	leaq	L_.str.11(%rip), %rsi
	movl	%eax, -24(%rbp)
	movq	-8(%rbp), %rdi
	callq	_getfield
	leaq	L_.str.12(%rip), %rdi
	movl	%eax, -28(%rbp)
	movl	-20(%rbp), %esi
	movl	-24(%rbp), %edx
	movl	-28(%rbp), %ecx
	movb	$0, %al
	callq	_printf
	movl	%eax, -56(%rbp)         ## 4-byte Spill
	addq	$64, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.section	__TEXT,__literal8,8byte_literals
	.align	3
LCPI4_0:
	.quad	4643176031446892544     ## double 255
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_setfield
	.align	4, 0x90
_setfield:                              ## @setfield
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp12:
	.cfi_def_cfa_offset 16
Ltmp13:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp14:
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movsd	LCPI4_0(%rip), %xmm0    ## xmm0 = mem[0],zero
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	%edx, -20(%rbp)
	movq	-8(%rbp), %rdi
	cvtsi2sdl	-20(%rbp), %xmm1
	divsd	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	callq	_lua_pushnumber
	movq	-8(%rbp), %rdi
	callq	_stackDump
	movl	$4294967294, %esi       ## imm = 0xFFFFFFFE
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rdx
	callq	_lua_setfield
	movq	-8(%rbp), %rdi
	callq	_stackDump
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_setcolor
	.align	4, 0x90
_setcolor:                              ## @setcolor
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp15:
	.cfi_def_cfa_offset 16
Ltmp16:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp17:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	xorl	%eax, %eax
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rdi
	movl	%eax, %esi
	movl	%eax, %edx
	callq	_lua_createtable
	leaq	L_.str.9(%rip), %rsi
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rcx
	movzbl	8(%rcx), %edx
	callq	_setfield
	leaq	L_.str.10(%rip), %rsi
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rcx
	movzbl	9(%rcx), %edx
	callq	_setfield
	leaq	L_.str.11(%rip), %rsi
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rcx
	movzbl	10(%rcx), %edx
	callq	_setfield
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rcx
	movq	(%rcx), %rsi
	callq	_lua_setglobal
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp18:
	.cfi_def_cfa_offset 16
Ltmp19:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp20:
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	$0, -4(%rbp)
	callq	_luaL_newstate
	movq	%rax, -16(%rbp)
	movl	$0, -20(%rbp)
LBB6_1:                                 ## =>This Inner Loop Header: Depth=1
	leaq	_colortable(%rip), %rax
	movslq	-20(%rbp), %rcx
	shlq	$4, %rcx
	addq	%rcx, %rax
	cmpq	$0, (%rax)
	je	LBB6_3
## BB#2:                                ##   in Loop: Header=BB6_1 Depth=1
	leaq	_colortable(%rip), %rax
	movq	-16(%rbp), %rdi
	movl	-20(%rbp), %ecx
	movl	%ecx, %edx
	addl	$1, %edx
	movl	%edx, -20(%rbp)
	movslq	%ecx, %rsi
	shlq	$4, %rsi
	addq	%rsi, %rax
	movq	%rax, %rsi
	callq	_setcolor
	jmp	LBB6_1
LBB6_3:
	leaq	L_.str.13(%rip), %rsi
	movq	-16(%rbp), %rdi
	callq	_load
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"WHITE"

L_.str.1:                               ## @.str.1
	.asciz	"RED"

L_.str.2:                               ## @.str.2
	.asciz	"GREDD"

L_.str.3:                               ## @.str.3
	.asciz	"BLUE"

L_.str.4:                               ## @.str.4
	.asciz	"NULL"

	.section	__DATA,__data
	.globl	_colortable             ## @colortable
	.align	4
_colortable:
	.quad	L_.str
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.space	5
	.quad	L_.str.1
	.byte	255                     ## 0xff
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
	.space	5
	.quad	L_.str.2
	.byte	0                       ## 0x0
	.byte	255                     ## 0xff
	.byte	0                       ## 0x0
	.space	5
	.quad	L_.str.3
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
	.byte	255                     ## 0xff
	.space	5
	.quad	L_.str.4
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
	.space	5

	.section	__TEXT,__cstring,cstring_literals
L_.str.5:                               ## @.str.5
	.asciz	"invilid component in background color"

L_.str.6:                               ## @.str.6
	.asciz	"cannot run config.file:%s"

L_.str.7:                               ## @.str.7
	.asciz	"background"

L_.str.8:                               ## @.str.8
	.asciz	"background is not a table\n"

L_.str.9:                               ## @.str.9
	.asciz	"r"

L_.str.10:                              ## @.str.10
	.asciz	"g"

L_.str.11:                              ## @.str.11
	.asciz	"b"

L_.str.12:                              ## @.str.12
	.asciz	"red = %d green = %d blue = %d \n"

L_.str.13:                              ## @.str.13
	.asciz	"test.lua"

L_.str.14:                              ## @.str.14
	.asciz	"top = %d\n  "

L_.str.15:                              ## @.str.15
	.asciz	"'%s'"

L_.str.16:                              ## @.str.16
	.asciz	"true"

L_.str.17:                              ## @.str.17
	.asciz	"false"

L_.str.18:                              ## @.str.18
	.asciz	"%g"

L_.str.19:                              ## @.str.19
	.asciz	"%s"

L_.str.20:                              ## @.str.20
	.asciz	"  "

L_.str.21:                              ## @.str.21
	.asciz	"\n"


.subsections_via_symbols
