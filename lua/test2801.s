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

	.globl	_loadfile
	.align	4, 0x90
_loadfile:                              ## @loadfile
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
	xorl	%eax, %eax
	movl	%eax, %edx
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rsi
	callq	_luaL_loadfilex
	cmpl	$0, %eax
	jne	LBB1_2
## BB#1:
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	movl	%ecx, %edx
	movq	-8(%rbp), %rdi
	movl	%eax, %esi
	movq	%rdx, -24(%rbp)         ## 8-byte Spill
	movl	%eax, %edx
	movl	%eax, %ecx
	movq	-24(%rbp), %r8          ## 8-byte Reload
	movq	-24(%rbp), %r9          ## 8-byte Reload
	callq	_lua_pcallk
	cmpl	$0, %eax
	je	LBB1_3
LBB1_2:
	movl	$4294967295, %esi       ## imm = 0xFFFFFFFF
	xorl	%eax, %eax
	movl	%eax, %edx
	movq	-8(%rbp), %rdi
	movq	-8(%rbp), %rcx
	movq	%rdi, -32(%rbp)         ## 8-byte Spill
	movq	%rcx, %rdi
	callq	_lua_tolstring
	leaq	L_.str(%rip), %rsi
	movq	-32(%rbp), %rdi         ## 8-byte Reload
	movq	%rax, %rdx
	movb	$0, %al
	callq	_error
LBB1_3:
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_call_lua
	.align	4, 0x90
_call_lua:                              ## @call_lua
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
	subq	$720, %rsp              ## imm = 0x2D0
	testb	%al, %al
	movaps	%xmm7, -256(%rbp)       ## 16-byte Spill
	movaps	%xmm6, -272(%rbp)       ## 16-byte Spill
	movaps	%xmm5, -288(%rbp)       ## 16-byte Spill
	movaps	%xmm4, -304(%rbp)       ## 16-byte Spill
	movaps	%xmm3, -320(%rbp)       ## 16-byte Spill
	movaps	%xmm2, -336(%rbp)       ## 16-byte Spill
	movaps	%xmm1, -352(%rbp)       ## 16-byte Spill
	movaps	%xmm0, -368(%rbp)       ## 16-byte Spill
	movq	%rdi, -376(%rbp)        ## 8-byte Spill
	movq	%r9, -384(%rbp)         ## 8-byte Spill
	movq	%r8, -392(%rbp)         ## 8-byte Spill
	movq	%rcx, -400(%rbp)        ## 8-byte Spill
	movq	%rdx, -408(%rbp)        ## 8-byte Spill
	movq	%rsi, -416(%rbp)        ## 8-byte Spill
	je	LBB2_54
## BB#53:
	movaps	-368(%rbp), %xmm0       ## 16-byte Reload
	movaps	%xmm0, -192(%rbp)
	movaps	-352(%rbp), %xmm1       ## 16-byte Reload
	movaps	%xmm1, -176(%rbp)
	movaps	-336(%rbp), %xmm2       ## 16-byte Reload
	movaps	%xmm2, -160(%rbp)
	movaps	-320(%rbp), %xmm3       ## 16-byte Reload
	movaps	%xmm3, -144(%rbp)
	movaps	-304(%rbp), %xmm4       ## 16-byte Reload
	movaps	%xmm4, -128(%rbp)
	movaps	-288(%rbp), %xmm5       ## 16-byte Reload
	movaps	%xmm5, -112(%rbp)
	movaps	-272(%rbp), %xmm6       ## 16-byte Reload
	movaps	%xmm6, -96(%rbp)
	movaps	-256(%rbp), %xmm7       ## 16-byte Reload
	movaps	%xmm7, -80(%rbp)
LBB2_54:
	movq	-384(%rbp), %rax        ## 8-byte Reload
	movq	%rax, -200(%rbp)
	movq	-392(%rbp), %rcx        ## 8-byte Reload
	movq	%rcx, -208(%rbp)
	movq	-400(%rbp), %rdx        ## 8-byte Reload
	movq	%rdx, -216(%rbp)
	movq	-408(%rbp), %rsi        ## 8-byte Reload
	movq	-416(%rbp), %rdi        ## 8-byte Reload
	movq	-376(%rbp), %r8         ## 8-byte Reload
	leaq	-32(%rbp), %r9
	movq	___stack_chk_guard@GOTPCREL(%rip), %r10
	movq	(%r10), %r10
	movq	%r10, -8(%rbp)
	movq	%r8, -40(%rbp)
	movq	%rdi, -48(%rbp)
	movq	%rsi, -56(%rbp)
	leaq	-240(%rbp), %rsi
	movq	%rsi, 16(%r9)
	leaq	16(%rbp), %rsi
	movq	%rsi, 8(%r9)
	movl	$48, 4(%r9)
	movl	$24, (%r9)
	movq	-40(%rbp), %rdi
	movq	-48(%rbp), %rsi
	callq	_lua_getglobal
	movl	$0, -60(%rbp)
	movl	%eax, -420(%rbp)        ## 4-byte Spill
LBB2_1:                                 ## =>This Inner Loop Header: Depth=1
	movq	-56(%rbp), %rax
	cmpb	$0, (%rax)
	je	LBB2_19
## BB#2:                                ##   in Loop: Header=BB2_1 Depth=1
	movq	-40(%rbp), %rdi
	leaq	L_.str.1(%rip), %rdx
	movl	$1, %esi
	callq	_luaL_checkstack
	movq	-56(%rbp), %rdx
	movq	%rdx, %rdi
	incq	%rdi
	movq	%rdi, -56(%rbp)
	movsbl	(%rdx), %esi
	movl	%esi, %eax
	subl	$62, %eax
	movl	%esi, -424(%rbp)        ## 4-byte Spill
	movl	%eax, -428(%rbp)        ## 4-byte Spill
	je	LBB2_15
	jmp	LBB2_48
LBB2_48:                                ##   in Loop: Header=BB2_1 Depth=1
	movl	-424(%rbp), %eax        ## 4-byte Reload
	subl	$100, %eax
	movl	%eax, -432(%rbp)        ## 4-byte Spill
	je	LBB2_3
	jmp	LBB2_49
LBB2_49:                                ##   in Loop: Header=BB2_1 Depth=1
	movl	-424(%rbp), %eax        ## 4-byte Reload
	subl	$105, %eax
	movl	%eax, -436(%rbp)        ## 4-byte Spill
	je	LBB2_7
	jmp	LBB2_50
LBB2_50:                                ##   in Loop: Header=BB2_1 Depth=1
	movl	-424(%rbp), %eax        ## 4-byte Reload
	subl	$115, %eax
	movl	%eax, -440(%rbp)        ## 4-byte Spill
	je	LBB2_11
	jmp	LBB2_16
LBB2_3:                                 ##   in Loop: Header=BB2_1 Depth=1
	leaq	-32(%rbp), %rax
	movq	-40(%rbp), %rdi
	movq	%rax, %rcx
	addq	$4, %rcx
	movl	-28(%rbp), %edx
	cmpl	$160, %edx
	movq	%rax, -448(%rbp)        ## 8-byte Spill
	movq	%rdi, -456(%rbp)        ## 8-byte Spill
	movq	%rcx, -464(%rbp)        ## 8-byte Spill
	movl	%edx, -468(%rbp)        ## 4-byte Spill
	ja	LBB2_5
## BB#4:                                ##   in Loop: Header=BB2_1 Depth=1
	movl	-468(%rbp), %eax        ## 4-byte Reload
	movslq	%eax, %rcx
	movq	-448(%rbp), %rdx        ## 8-byte Reload
	addq	16(%rdx), %rcx
	addl	$16, %eax
	movq	-464(%rbp), %rsi        ## 8-byte Reload
	movl	%eax, (%rsi)
	movq	%rcx, -480(%rbp)        ## 8-byte Spill
	jmp	LBB2_6
LBB2_5:                                 ##   in Loop: Header=BB2_1 Depth=1
	movq	-448(%rbp), %rax        ## 8-byte Reload
	movq	8(%rax), %rcx
	movq	%rcx, %rdx
	addq	$8, %rcx
	movq	%rcx, 8(%rax)
	movq	%rdx, -480(%rbp)        ## 8-byte Spill
LBB2_6:                                 ##   in Loop: Header=BB2_1 Depth=1
	movq	-480(%rbp), %rax        ## 8-byte Reload
	movsd	(%rax), %xmm0           ## xmm0 = mem[0],zero
	movq	-456(%rbp), %rdi        ## 8-byte Reload
	callq	_lua_pushnumber
	jmp	LBB2_17
LBB2_7:                                 ##   in Loop: Header=BB2_1 Depth=1
	leaq	-32(%rbp), %rax
	movq	-40(%rbp), %rdi
	movl	-32(%rbp), %ecx
	cmpl	$40, %ecx
	movq	%rax, -488(%rbp)        ## 8-byte Spill
	movq	%rdi, -496(%rbp)        ## 8-byte Spill
	movl	%ecx, -500(%rbp)        ## 4-byte Spill
	ja	LBB2_9
## BB#8:                                ##   in Loop: Header=BB2_1 Depth=1
	movl	-500(%rbp), %eax        ## 4-byte Reload
	movslq	%eax, %rcx
	movq	-488(%rbp), %rdx        ## 8-byte Reload
	addq	16(%rdx), %rcx
	addl	$8, %eax
	movl	%eax, (%rdx)
	movq	%rcx, -512(%rbp)        ## 8-byte Spill
	jmp	LBB2_10
LBB2_9:                                 ##   in Loop: Header=BB2_1 Depth=1
	movq	-488(%rbp), %rax        ## 8-byte Reload
	movq	8(%rax), %rcx
	movq	%rcx, %rdx
	addq	$8, %rcx
	movq	%rcx, 8(%rax)
	movq	%rdx, -512(%rbp)        ## 8-byte Spill
LBB2_10:                                ##   in Loop: Header=BB2_1 Depth=1
	movq	-512(%rbp), %rax        ## 8-byte Reload
	movslq	(%rax), %rsi
	movq	-496(%rbp), %rdi        ## 8-byte Reload
	callq	_lua_pushinteger
	jmp	LBB2_17
LBB2_11:                                ##   in Loop: Header=BB2_1 Depth=1
	leaq	-32(%rbp), %rax
	movq	-40(%rbp), %rdi
	movl	-32(%rbp), %ecx
	cmpl	$40, %ecx
	movq	%rax, -520(%rbp)        ## 8-byte Spill
	movq	%rdi, -528(%rbp)        ## 8-byte Spill
	movl	%ecx, -532(%rbp)        ## 4-byte Spill
	ja	LBB2_13
## BB#12:                               ##   in Loop: Header=BB2_1 Depth=1
	movl	-532(%rbp), %eax        ## 4-byte Reload
	movslq	%eax, %rcx
	movq	-520(%rbp), %rdx        ## 8-byte Reload
	addq	16(%rdx), %rcx
	addl	$8, %eax
	movl	%eax, (%rdx)
	movq	%rcx, -544(%rbp)        ## 8-byte Spill
	jmp	LBB2_14
LBB2_13:                                ##   in Loop: Header=BB2_1 Depth=1
	movq	-520(%rbp), %rax        ## 8-byte Reload
	movq	8(%rax), %rcx
	movq	%rcx, %rdx
	addq	$8, %rcx
	movq	%rcx, 8(%rax)
	movq	%rdx, -544(%rbp)        ## 8-byte Spill
LBB2_14:                                ##   in Loop: Header=BB2_1 Depth=1
	movq	-544(%rbp), %rax        ## 8-byte Reload
	movq	(%rax), %rsi
	movq	-528(%rbp), %rdi        ## 8-byte Reload
	callq	_lua_pushstring
	movq	%rax, -552(%rbp)        ## 8-byte Spill
	jmp	LBB2_17
LBB2_15:
	jmp	LBB2_20
LBB2_16:                                ##   in Loop: Header=BB2_1 Depth=1
	leaq	L_.str.2(%rip), %rsi
	movq	-40(%rbp), %rdi
	movq	-56(%rbp), %rax
	movsbl	-1(%rax), %edx
	movb	$0, %al
	callq	_error
LBB2_17:                                ##   in Loop: Header=BB2_1 Depth=1
	jmp	LBB2_18
LBB2_18:                                ##   in Loop: Header=BB2_1 Depth=1
	movl	-60(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -60(%rbp)
	jmp	LBB2_1
LBB2_19:
	jmp	LBB2_20
LBB2_20:
	leaq	L_.str.3(%rip), %rdi
	movq	-56(%rbp), %rax
	movq	%rdi, -560(%rbp)        ## 8-byte Spill
	movq	%rax, %rdi
	callq	_strlen
	movl	%eax, %ecx
	movl	%ecx, -64(%rbp)
	movq	-56(%rbp), %rsi
	movl	-60(%rbp), %edx
	movl	-64(%rbp), %ecx
	movq	-560(%rbp), %rdi        ## 8-byte Reload
	movb	$0, %al
	callq	_printf
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	%edx, %esi
	movq	-40(%rbp), %rdi
	movl	-60(%rbp), %edx
	movl	-64(%rbp), %r8d
	movq	%rsi, -568(%rbp)        ## 8-byte Spill
	movl	%edx, %esi
	movl	%r8d, %edx
	movq	-568(%rbp), %r8         ## 8-byte Reload
	movq	-568(%rbp), %r9         ## 8-byte Reload
	movl	%eax, -572(%rbp)        ## 4-byte Spill
	callq	_lua_pcallk
	cmpl	$0, %eax
	je	LBB2_22
## BB#21:
	movl	$4294967295, %esi       ## imm = 0xFFFFFFFF
	xorl	%eax, %eax
	movl	%eax, %edx
	movq	-40(%rbp), %rdi
	movq	-48(%rbp), %rcx
	movq	-40(%rbp), %r8
	movq	%rdi, -584(%rbp)        ## 8-byte Spill
	movq	%r8, %rdi
	movq	%rcx, -592(%rbp)        ## 8-byte Spill
	callq	_lua_tolstring
	leaq	L_.str.4(%rip), %rsi
	movq	-584(%rbp), %rdi        ## 8-byte Reload
	movq	-592(%rbp), %rdx        ## 8-byte Reload
	movq	%rax, %rcx
	movb	$0, %al
	callq	_error
LBB2_22:
	leaq	L_.str.5(%rip), %rdi
	xorl	%eax, %eax
	subl	-64(%rbp), %eax
	movl	%eax, -64(%rbp)
	movq	-56(%rbp), %rsi
	movl	-64(%rbp), %edx
	movb	$0, %al
	callq	_printf
	movl	%eax, -596(%rbp)        ## 4-byte Spill
LBB2_23:                                ## =>This Inner Loop Header: Depth=1
	movq	-56(%rbp), %rax
	cmpb	$0, (%rax)
	je	LBB2_45
## BB#24:                               ##   in Loop: Header=BB2_23 Depth=1
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	incq	%rcx
	movq	%rcx, -56(%rbp)
	movsbl	(%rax), %edx
	movl	%edx, %esi
	subl	$100, %esi
	movl	%edx, -600(%rbp)        ## 4-byte Spill
	movl	%esi, -604(%rbp)        ## 4-byte Spill
	je	LBB2_25
	jmp	LBB2_51
LBB2_51:                                ##   in Loop: Header=BB2_23 Depth=1
	movl	-600(%rbp), %eax        ## 4-byte Reload
	subl	$105, %eax
	movl	%eax, -608(%rbp)        ## 4-byte Spill
	je	LBB2_31
	jmp	LBB2_52
LBB2_52:                                ##   in Loop: Header=BB2_23 Depth=1
	movl	-600(%rbp), %eax        ## 4-byte Reload
	subl	$115, %eax
	movl	%eax, -612(%rbp)        ## 4-byte Spill
	je	LBB2_37
	jmp	LBB2_43
LBB2_25:                                ##   in Loop: Header=BB2_23 Depth=1
	movq	-40(%rbp), %rdi
	movl	-64(%rbp), %esi
	callq	_lua_isnumber
	cmpl	$0, %eax
	jne	LBB2_27
## BB#26:                               ##   in Loop: Header=BB2_23 Depth=1
	leaq	L_.str.6(%rip), %rsi
	movq	-40(%rbp), %rdi
	movb	$0, %al
	callq	_error
LBB2_27:                                ##   in Loop: Header=BB2_23 Depth=1
	xorl	%eax, %eax
	movl	%eax, %edx
	movq	-40(%rbp), %rdi
	movl	-64(%rbp), %esi
	callq	_lua_tonumberx
	leaq	-32(%rbp), %rdx
	movl	-32(%rbp), %eax
	cmpl	$40, %eax
	movsd	%xmm0, -624(%rbp)       ## 8-byte Spill
	movq	%rdx, -632(%rbp)        ## 8-byte Spill
	movl	%eax, -636(%rbp)        ## 4-byte Spill
	ja	LBB2_29
## BB#28:                               ##   in Loop: Header=BB2_23 Depth=1
	movl	-636(%rbp), %eax        ## 4-byte Reload
	movslq	%eax, %rcx
	movq	-632(%rbp), %rdx        ## 8-byte Reload
	addq	16(%rdx), %rcx
	addl	$8, %eax
	movl	%eax, (%rdx)
	movq	%rcx, -648(%rbp)        ## 8-byte Spill
	jmp	LBB2_30
LBB2_29:                                ##   in Loop: Header=BB2_23 Depth=1
	movq	-632(%rbp), %rax        ## 8-byte Reload
	movq	8(%rax), %rcx
	movq	%rcx, %rdx
	addq	$8, %rcx
	movq	%rcx, 8(%rax)
	movq	%rdx, -648(%rbp)        ## 8-byte Spill
LBB2_30:                                ##   in Loop: Header=BB2_23 Depth=1
	movq	-648(%rbp), %rax        ## 8-byte Reload
	movq	(%rax), %rax
	movsd	-624(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	movsd	%xmm0, (%rax)
	jmp	LBB2_44
LBB2_31:                                ##   in Loop: Header=BB2_23 Depth=1
	movq	-40(%rbp), %rdi
	movl	-64(%rbp), %esi
	callq	_lua_isnumber
	cmpl	$0, %eax
	jne	LBB2_33
## BB#32:                               ##   in Loop: Header=BB2_23 Depth=1
	leaq	L_.str.7(%rip), %rsi
	movq	-40(%rbp), %rdi
	movb	$0, %al
	callq	_error
LBB2_33:                                ##   in Loop: Header=BB2_23 Depth=1
	xorl	%eax, %eax
	movl	%eax, %edx
	movq	-40(%rbp), %rdi
	movl	-64(%rbp), %esi
	callq	_lua_tointegerx
	leaq	-32(%rbp), %rdx
	movl	%eax, %esi
	movl	-32(%rbp), %ecx
	cmpl	$40, %ecx
	movq	%rdx, -656(%rbp)        ## 8-byte Spill
	movl	%esi, -660(%rbp)        ## 4-byte Spill
	movl	%ecx, -664(%rbp)        ## 4-byte Spill
	ja	LBB2_35
## BB#34:                               ##   in Loop: Header=BB2_23 Depth=1
	movl	-664(%rbp), %eax        ## 4-byte Reload
	movslq	%eax, %rcx
	movq	-656(%rbp), %rdx        ## 8-byte Reload
	addq	16(%rdx), %rcx
	addl	$8, %eax
	movl	%eax, (%rdx)
	movq	%rcx, -672(%rbp)        ## 8-byte Spill
	jmp	LBB2_36
LBB2_35:                                ##   in Loop: Header=BB2_23 Depth=1
	movq	-656(%rbp), %rax        ## 8-byte Reload
	movq	8(%rax), %rcx
	movq	%rcx, %rdx
	addq	$8, %rcx
	movq	%rcx, 8(%rax)
	movq	%rdx, -672(%rbp)        ## 8-byte Spill
LBB2_36:                                ##   in Loop: Header=BB2_23 Depth=1
	movq	-672(%rbp), %rax        ## 8-byte Reload
	movq	(%rax), %rax
	movl	-660(%rbp), %ecx        ## 4-byte Reload
	movl	%ecx, (%rax)
	jmp	LBB2_44
LBB2_37:                                ##   in Loop: Header=BB2_23 Depth=1
	movq	-40(%rbp), %rdi
	movl	-64(%rbp), %esi
	callq	_lua_isstring
	cmpl	$0, %eax
	jne	LBB2_39
## BB#38:                               ##   in Loop: Header=BB2_23 Depth=1
	leaq	L_.str.8(%rip), %rsi
	movq	-40(%rbp), %rdi
	movb	$0, %al
	callq	_error
LBB2_39:                                ##   in Loop: Header=BB2_23 Depth=1
	xorl	%eax, %eax
	movl	%eax, %edx
	movq	-40(%rbp), %rdi
	movl	-64(%rbp), %esi
	callq	_lua_tolstring
	leaq	-32(%rbp), %rdx
	movl	-32(%rbp), %esi
	cmpl	$40, %esi
	movq	%rax, -680(%rbp)        ## 8-byte Spill
	movq	%rdx, -688(%rbp)        ## 8-byte Spill
	movl	%esi, -692(%rbp)        ## 4-byte Spill
	ja	LBB2_41
## BB#40:                               ##   in Loop: Header=BB2_23 Depth=1
	movl	-692(%rbp), %eax        ## 4-byte Reload
	movslq	%eax, %rcx
	movq	-688(%rbp), %rdx        ## 8-byte Reload
	addq	16(%rdx), %rcx
	addl	$8, %eax
	movl	%eax, (%rdx)
	movq	%rcx, -704(%rbp)        ## 8-byte Spill
	jmp	LBB2_42
LBB2_41:                                ##   in Loop: Header=BB2_23 Depth=1
	movq	-688(%rbp), %rax        ## 8-byte Reload
	movq	8(%rax), %rcx
	movq	%rcx, %rdx
	addq	$8, %rcx
	movq	%rcx, 8(%rax)
	movq	%rdx, -704(%rbp)        ## 8-byte Spill
LBB2_42:                                ##   in Loop: Header=BB2_23 Depth=1
	movq	-704(%rbp), %rax        ## 8-byte Reload
	movq	(%rax), %rax
	movq	-680(%rbp), %rcx        ## 8-byte Reload
	movq	%rcx, (%rax)
	jmp	LBB2_44
LBB2_43:                                ##   in Loop: Header=BB2_23 Depth=1
	leaq	L_.str.9(%rip), %rsi
	movq	-40(%rbp), %rdi
	movq	-56(%rbp), %rax
	movsbl	-1(%rax), %edx
	movb	$0, %al
	callq	_error
LBB2_44:                                ##   in Loop: Header=BB2_23 Depth=1
	movl	-64(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -64(%rbp)
	jmp	LBB2_23
LBB2_45:
	leaq	-32(%rbp), %rax
	movq	-40(%rbp), %rdi
	movq	%rax, -712(%rbp)        ## 8-byte Spill
	callq	_stackDump
	xorl	%esi, %esi
	movq	-40(%rbp), %rdi
	callq	_lua_settop
	movq	-40(%rbp), %rdi
	callq	_stackDump
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-8(%rbp), %rax
	jne	LBB2_47
## BB#46:
	addq	$720, %rsp              ## imm = 0x2D0
	popq	%rbp
	retq
LBB2_47:
	callq	___stack_chk_fail
	.cfi_endproc

	.align	4, 0x90
_stackDump:                             ## @stackDump
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
LBB3_1:                                 ## =>This Inner Loop Header: Depth=1
	movl	-12(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jg	LBB3_9
## BB#2:                                ##   in Loop: Header=BB3_1 Depth=1
	movq	-8(%rbp), %rdi
	movl	-12(%rbp), %esi
	callq	_lua_type
	movl	%eax, -20(%rbp)
	movl	%eax, %esi
	subl	$1, %eax
	movl	%esi, -28(%rbp)         ## 4-byte Spill
	movl	%eax, -32(%rbp)         ## 4-byte Spill
	je	LBB3_4
	jmp	LBB3_10
LBB3_10:                                ##   in Loop: Header=BB3_1 Depth=1
	movl	-28(%rbp), %eax         ## 4-byte Reload
	subl	$3, %eax
	movl	%eax, -36(%rbp)         ## 4-byte Spill
	je	LBB3_5
	jmp	LBB3_11
LBB3_11:                                ##   in Loop: Header=BB3_1 Depth=1
	movl	-28(%rbp), %eax         ## 4-byte Reload
	subl	$4, %eax
	movl	%eax, -40(%rbp)         ## 4-byte Spill
	jne	LBB3_6
	jmp	LBB3_3
LBB3_3:                                 ##   in Loop: Header=BB3_1 Depth=1
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
	jmp	LBB3_7
LBB3_4:                                 ##   in Loop: Header=BB3_1 Depth=1
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
	jmp	LBB3_7
LBB3_5:                                 ##   in Loop: Header=BB3_1 Depth=1
	xorl	%eax, %eax
	movl	%eax, %edx
	movq	-8(%rbp), %rdi
	movl	-12(%rbp), %esi
	callq	_lua_tonumberx
	leaq	L_.str.18(%rip), %rdi
	movb	$1, %al
	callq	_printf
	movl	%eax, -52(%rbp)         ## 4-byte Spill
	jmp	LBB3_7
LBB3_6:                                 ##   in Loop: Header=BB3_1 Depth=1
	movq	-8(%rbp), %rdi
	movl	-20(%rbp), %esi
	callq	_lua_typename
	leaq	L_.str.19(%rip), %rdi
	movq	%rax, %rsi
	movb	$0, %al
	callq	_printf
	movl	%eax, -56(%rbp)         ## 4-byte Spill
LBB3_7:                                 ##   in Loop: Header=BB3_1 Depth=1
	leaq	L_.str.20(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	%eax, -60(%rbp)         ## 4-byte Spill
## BB#8:                                ##   in Loop: Header=BB3_1 Depth=1
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	LBB3_1
LBB3_9:
	leaq	L_.str.21(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	%eax, -64(%rbp)         ## 4-byte Spill
	addq	$64, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.section	__TEXT,__literal8,8byte_literals
	.align	3
LCPI4_0:
	.quad	4647556485771952128     ## double 503
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_luaopen_array
	.align	4, 0x90
_luaopen_array:                         ## @luaopen_array
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
	subq	$16, %rsp
	leaq	L_.str.10(%rip), %rsi
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	callq	_luaL_newmetatable
	movl	$4294967295, %esi       ## imm = 0xFFFFFFFF
	movq	-8(%rbp), %rdi
	movl	%eax, -12(%rbp)         ## 4-byte Spill
	callq	_lua_pushvalue
	movl	$4294967294, %esi       ## imm = 0xFFFFFFFE
	leaq	L_.str.11(%rip), %rdx
	movq	-8(%rbp), %rdi
	callq	_lua_setfield
	leaq	_arraylib_m(%rip), %rsi
	xorl	%edx, %edx
	movq	-8(%rbp), %rdi
	callq	_luaL_setfuncs
	movsd	LCPI4_0(%rip), %xmm0    ## xmm0 = mem[0],zero
	movl	$136, %eax
	movl	%eax, %esi
	movq	-8(%rbp), %rdi
	callq	_luaL_checkversion_
	xorl	%esi, %esi
	movl	$1, %edx
	movq	-8(%rbp), %rdi
	callq	_lua_createtable
	leaq	_arraylib_f(%rip), %rsi
	xorl	%edx, %edx
	movq	-8(%rbp), %rdi
	callq	_luaL_setfuncs
	movl	$1, %eax
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
Ltmp15:
	.cfi_def_cfa_offset 16
Ltmp16:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp17:
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	leaq	L_.str.12(%rip), %rdi
	movl	$32, %eax
	movl	%eax, %esi
	movl	$4, %eax
	movl	%eax, %edx
	movl	$0, -4(%rbp)
	movb	$0, %al
	callq	_printf
	movl	%eax, -28(%rbp)         ## 4-byte Spill
	callq	_luaL_newstate
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rdi
	callq	_luaL_openlibs
	leaq	_lualibs(%rip), %rax
	movq	%rax, -24(%rbp)
LBB5_1:                                 ## =>This Inner Loop Header: Depth=1
	movq	-24(%rbp), %rax
	cmpq	$0, 8(%rax)
	je	LBB5_4
## BB#2:                                ##   in Loop: Header=BB5_1 Depth=1
	movl	$1, %ecx
	movq	-16(%rbp), %rdi
	movq	-24(%rbp), %rax
	movq	(%rax), %rsi
	movq	-24(%rbp), %rax
	movq	8(%rax), %rdx
	callq	_luaL_requiref
	xorl	%esi, %esi
	movq	-16(%rbp), %rdi
	callq	_lua_settop
## BB#3:                                ##   in Loop: Header=BB5_1 Depth=1
	movq	-24(%rbp), %rax
	addq	$16, %rax
	movq	%rax, -24(%rbp)
	jmp	LBB5_1
LBB5_4:
	leaq	L_.str.13(%rip), %rsi
	movq	-16(%rbp), %rdi
	callq	_loadfile
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.align	4, 0x90
_setarray:                              ## @setarray
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
	leaq	-12(%rbp), %rsi
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	callq	_getindex
	movl	$3, %esi
	movq	%rax, -24(%rbp)
	movq	-8(%rbp), %rdi
	callq	_luaL_checkany
	movl	$3, %esi
	movq	-8(%rbp), %rdi
	callq	_lua_toboolean
	cmpl	$0, %eax
	je	LBB6_2
## BB#1:
	movl	-12(%rbp), %eax
	movq	-24(%rbp), %rcx
	orl	(%rcx), %eax
	movl	%eax, (%rcx)
	jmp	LBB6_3
LBB6_2:
	xorl	%eax, %eax
	subl	-12(%rbp), %eax
	movq	-24(%rbp), %rcx
	andl	(%rcx), %eax
	movl	%eax, (%rcx)
LBB6_3:
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.align	4, 0x90
_getarray:                              ## @getarray
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp21:
	.cfi_def_cfa_offset 16
Ltmp22:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp23:
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	leaq	-12(%rbp), %rsi
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	callq	_getindex
	movq	%rax, -24(%rbp)
	movq	-8(%rbp), %rdi
	movq	-24(%rbp), %rax
	movl	(%rax), %ecx
	andl	-12(%rbp), %ecx
	movl	%ecx, %esi
	callq	_lua_pushboolean
	movq	-8(%rbp), %rdi
	callq	_stackDump
	movl	$1, %eax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.align	4, 0x90
_getsize:                               ## @getsize
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp24:
	.cfi_def_cfa_offset 16
Ltmp25:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp26:
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	$1, %esi
	leaq	L_.str.10(%rip), %rdx
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	callq	_luaL_checkudata
	movb	$1, %cl
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	movb	%cl, -17(%rbp)          ## 1-byte Spill
	jne	LBB8_2
## BB#1:
	movl	$1, %esi
	leaq	L_.str.25(%rip), %rdx
	movq	-8(%rbp), %rdi
	callq	_luaL_argerror
	cmpl	$0, %eax
	setne	%cl
	movb	%cl, -17(%rbp)          ## 1-byte Spill
LBB8_2:
	movb	-17(%rbp), %al          ## 1-byte Reload
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rcx
	movslq	(%rcx), %rsi
	movb	%al, -18(%rbp)          ## 1-byte Spill
	callq	_lua_pushinteger
	movl	$1, %eax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.align	4, 0x90
_getindex:                              ## @getindex
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp27:
	.cfi_def_cfa_offset 16
Ltmp28:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp29:
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movl	$1, %eax
	leaq	L_.str.10(%rip), %rdx
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rdi
	movl	%eax, %esi
	callq	_luaL_checkudata
	movb	$1, %cl
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	movb	%cl, -29(%rbp)          ## 1-byte Spill
	jne	LBB9_2
## BB#1:
	movl	$1, %esi
	leaq	L_.str.25(%rip), %rdx
	movq	-8(%rbp), %rdi
	callq	_luaL_argerror
	cmpl	$0, %eax
	setne	%cl
	movb	%cl, -29(%rbp)          ## 1-byte Spill
LBB9_2:
	movb	-29(%rbp), %al          ## 1-byte Reload
	movl	$2, %esi
	movq	-8(%rbp), %rdi
	movb	%al, -30(%rbp)          ## 1-byte Spill
	callq	_luaL_checkinteger
	xorl	%esi, %esi
	subq	$1, %rax
	movl	%eax, %ecx
	movl	%ecx, -28(%rbp)
	cmpl	-28(%rbp), %esi
	jg	LBB9_4
## BB#3:
	movb	$1, %al
	movl	-28(%rbp), %ecx
	movq	-24(%rbp), %rdx
	cmpl	(%rdx), %ecx
	movb	%al, -31(%rbp)          ## 1-byte Spill
	jle	LBB9_5
LBB9_4:
	movl	$2, %esi
	leaq	L_.str.26(%rip), %rdx
	movq	-8(%rbp), %rdi
	callq	_luaL_argerror
	cmpl	$0, %eax
	setne	%cl
	movb	%cl, -31(%rbp)          ## 1-byte Spill
LBB9_5:
	movb	-31(%rbp), %al          ## 1-byte Reload
	movl	$1, %ecx
	movl	-28(%rbp), %edx
	movl	%edx, %esi
	andq	$31, %rsi
	movl	%esi, %edx
	movl	%ecx, -36(%rbp)         ## 4-byte Spill
	movl	%edx, %ecx
                                        ## 
	movl	-36(%rbp), %edx         ## 4-byte Reload
	shll	%cl, %edx
	movq	-16(%rbp), %rsi
	movl	%edx, (%rsi)
	movl	-28(%rbp), %edx
	movl	%edx, %esi
	shrq	$5, %rsi
	movq	-24(%rbp), %rdi
	addq	$4, %rdi
	shlq	$2, %rsi
	addq	%rsi, %rdi
	movb	%al, -37(%rbp)          ## 1-byte Spill
	movq	%rdi, %rax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.align	4, 0x90
_newarray:                              ## @newarray
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp30:
	.cfi_def_cfa_offset 16
Ltmp31:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp32:
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movl	$1, %esi
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	callq	_luaL_checkinteger
	movb	$1, %cl
	movl	%eax, %esi
	movl	%esi, -28(%rbp)
	cmpl	$1, -28(%rbp)
	movb	%cl, -33(%rbp)          ## 1-byte Spill
	jge	LBB10_2
## BB#1:
	movl	$1, %esi
	leaq	L_.str.28(%rip), %rdx
	movq	-8(%rbp), %rdi
	callq	_luaL_argerror
	cmpl	$0, %eax
	setne	%cl
	movb	%cl, -33(%rbp)          ## 1-byte Spill
LBB10_2:
	movb	-33(%rbp), %al          ## 1-byte Reload
	movl	-28(%rbp), %ecx
	subl	$1, %ecx
	movl	%ecx, %ecx
	movl	%ecx, %edx
	shrq	$5, %rdx
	shlq	$2, %rdx
	addq	$8, %rdx
	movq	%rdx, -16(%rbp)
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rsi
	movb	%al, -34(%rbp)          ## 1-byte Spill
	callq	_lua_newuserdata
	movq	%rax, -24(%rbp)
	movl	-28(%rbp), %ecx
	movq	-24(%rbp), %rax
	movl	%ecx, (%rax)
	movl	$0, -32(%rbp)
LBB10_3:                                ## =>This Inner Loop Header: Depth=1
	movslq	-32(%rbp), %rax
	movl	-28(%rbp), %ecx
	subl	$1, %ecx
	movl	%ecx, %ecx
	movl	%ecx, %edx
	shrq	$5, %rdx
	cmpq	%rdx, %rax
	jae	LBB10_6
## BB#4:                                ##   in Loop: Header=BB10_3 Depth=1
	movslq	-32(%rbp), %rax
	movq	-24(%rbp), %rcx
	movl	$0, 4(%rcx,%rax,4)
## BB#5:                                ##   in Loop: Header=BB10_3 Depth=1
	movl	-32(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -32(%rbp)
	jmp	LBB10_3
LBB10_6:
	movl	$4293966296, %esi       ## imm = 0xFFF0B9D8
	leaq	L_.str.10(%rip), %rdx
	movq	-8(%rbp), %rdi
	callq	_lua_getfield
	movl	$4294967294, %esi       ## imm = 0xFFFFFFFE
	movq	-8(%rbp), %rdi
	movl	%eax, -40(%rbp)         ## 4-byte Spill
	callq	_lua_setmetatable
	movl	$1, %esi
	movl	%eax, -44(%rbp)         ## 4-byte Spill
	movl	%esi, %eax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"cannot run config.file:%s"

L_.str.1:                               ## @.str.1
	.asciz	"too many arguments"

L_.str.2:                               ## @.str.2
	.asciz	"invalid option(%c)"

L_.str.3:                               ## @.str.3
	.asciz	"111 sig %s narg %d nres %d \n"

L_.str.4:                               ## @.str.4
	.asciz	"error calling '%s':%s "

L_.str.5:                               ## @.str.5
	.asciz	"222 sig %s nres %d \n"

L_.str.6:                               ## @.str.6
	.asciz	"wrong result type "

L_.str.7:                               ## @.str.7
	.asciz	"wrong result type of i "

L_.str.8:                               ## @.str.8
	.asciz	"wrong result type string"

L_.str.9:                               ## @.str.9
	.asciz	" invalid option (%c) *,"

L_.str.10:                              ## @.str.10
	.asciz	"LuaBook.array"

L_.str.11:                              ## @.str.11
	.asciz	"__index"

	.section	__DATA,__const
	.align	4                       ## @arraylib_m
_arraylib_m:
	.quad	L_.str.22
	.quad	_setarray
	.quad	L_.str.23
	.quad	_getarray
	.quad	L_.str.24
	.quad	_getsize
	.space	16

	.align	4                       ## @arraylib_f
_arraylib_f:
	.quad	L_.str.27
	.quad	_newarray
	.space	16

	.section	__TEXT,__cstring,cstring_literals
L_.str.12:                              ## @.str.12
	.asciz	" BITS_PER_WORD = %ld sizeof(unsigned int) = %ld \n"

	.section	__DATA,__const
	.align	4                       ## @lualibs
_lualibs:
	.quad	L_.str.29
	.quad	_luaopen_array
	.space	16

	.section	__TEXT,__cstring,cstring_literals
L_.str.13:                              ## @.str.13
	.asciz	"test2801.lua"

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

L_.str.22:                              ## @.str.22
	.asciz	"set"

L_.str.23:                              ## @.str.23
	.asciz	"get"

L_.str.24:                              ## @.str.24
	.asciz	"size"

L_.str.25:                              ## @.str.25
	.asciz	"'array' expected"

L_.str.26:                              ## @.str.26
	.asciz	"index out of range"

L_.str.27:                              ## @.str.27
	.asciz	"new"

L_.str.28:                              ## @.str.28
	.asciz	"invalid size"

L_.str.29:                              ## @.str.29
	.asciz	"array"


.subsections_via_symbols
