.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14	sdk_version 10, 14
	.intel_syntax noprefix
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
Lfunc_begin0:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception0
## ».0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 48
	mov	eax, 8
	mov	edi, eax
	call	_operator new(unsigned long)
	mov	rdi, rax
	mov	rcx, rax
Ltmp0:
	mov	qword ptr [rbp - 32], rdi ## 8-byte Spill
	mov	rdi, rax
	mov	qword ptr [rbp - 40], rcx ## 8-byte Spill
	call	_Derived::Derived()
Ltmp1:
	jmp	LBB0_1
LBB0_1:
	mov	rax, qword ptr [rbp - 40] ## 8-byte Reload
	mov	qword ptr [rbp - 8], rax
	mov	rcx, qword ptr [rbp - 8]
	mov	rdi, rcx
	call	_Base::metoda()
	xor	eax, eax
	add	rsp, 48
	pop	rbp
	ret
LBB0_2:
Ltmp2:
	mov	ecx, edx
	mov	qword ptr [rbp - 16], rax
	mov	dword ptr [rbp - 20], ecx
	mov	rdi, qword ptr [rbp - 32] ## 8-byte Reload
	call	_operator delete(void*)
## ».3:
	mov	rdi, qword ptr [rbp - 16]
	call	__Unwind_Resume
	ud2
Lfunc_end0:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table0:
Lexception0:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	255                     ## @TType Encoding = omit
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end0-Lcst_begin0
Lcst_begin0:
	.uleb128 Lfunc_begin0-Lfunc_begin0 ## >> Call Site 1 <<
	.uleb128 Ltmp0-Lfunc_begin0     ##   Call between Lfunc_begin0 and Ltmp0
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp0-Lfunc_begin0     ## >> Call Site 2 <<
	.uleb128 Ltmp1-Ltmp0            ##   Call between Ltmp0 and Ltmp1
	.uleb128 Ltmp2-Lfunc_begin0     ##     jumps to Ltmp2
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp1-Lfunc_begin0     ## >> Call Site 3 <<
	.uleb128 Lfunc_end0-Ltmp1       ##   Call between Ltmp1 and Lfunc_end0
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end0:
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_Derived::Derived()        ## -- Begin function Derived::Derived()
	.weak_def_can_be_hidden	_Derived::Derived()
	.p2align	4, 0x90
_Derived::Derived():                       ## @Derived::Derived()
	.cfi_startproc
## ».0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 16
	mov	qword ptr [rbp - 8], rdi
	mov	rdi, qword ptr [rbp - 8]
	call	_Derived::Derived()
	add	rsp, 16
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_Base::metoda()      ## -- Begin function Base::metoda()
	.weak_definition	_Base::metoda()
	.p2align	4, 0x90
_Base::metoda():                     ## @Base::metoda()
	.cfi_startproc
## ».0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 32
	mov	qword ptr [rbp - 8], rdi
	mov	rdi, qword ptr [rbp - 8]
	lea	rax, [rip   L_.str.2]
	mov	qword ptr [rbp - 16], rdi ## 8-byte Spill
	mov	rdi, rax
	mov	al, 0
	call	_printf
	mov	rdi, qword ptr [rbp - 16] ## 8-byte Reload
	mov	rcx, qword ptr [rdi]
	mov	dword ptr [rbp - 20], eax ## 4-byte Spill
	call	qword ptr [rcx]
	add	rsp, 32
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_Derived::Derived()        ## -- Begin function Derived::Derived()
	.weak_def_can_be_hidden	_Derived::Derived()
	.p2align	4, 0x90
_Derived::Derived():                       ## @Derived::Derived()
	.cfi_startproc
## ».0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 16
	mov	qword ptr [rbp - 8], rdi
	mov	rdi, qword ptr [rbp - 8]
	mov	rax, rdi
	mov	qword ptr [rbp - 16], rdi ## 8-byte Spill
	mov	rdi, rax
	call	_Base::Base()---------------------------------zove se konstruktor bazne klase
	mov	rax, qword ptr [rip   __ZTV7Derived@GOTPCREL]-----virtualna tablica za Derived
	add	rax, 16
	mov	rdi, qword ptr [rbp - 16] ## 8-byte Reload
	mov	qword ptr [rdi], rax
	call	_Base::metoda()-------------------------------metoda() iz virtualne tablice za Derived
	add	rsp, 16
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_Base::Base()           ## -- Begin function Base::Base()
	.weak_def_can_be_hidden	_Base::Base()
	.p2align	4, 0x90
_Base::Base():                          ## @Base::Base()
	.cfi_startproc
## ».0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 16
	mov	rax, qword ptr [rip   __ZTV4Base@GOTPCREL]----------virutalna tablica za base
	add	rax, 16
	mov	qword ptr [rbp - 8], rdi
	mov	rdi, qword ptr [rbp - 8]
	mov	qword ptr [rdi], rax
	call	_Base::metoda()---------------------------------metoda() bazne klase
	add	rsp, 16
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_Derived::virtualnaMetoda() ## -- Begin function Derived::virtualnaMetoda()
	.weak_def_can_be_hidden	_Derived::virtualnaMetoda()
	.p2align	4, 0x90
_Derived::virtualnaMetoda():        ## @Derived::virtualnaMetoda()
	.cfi_startproc
## ».0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 16
	mov	qword ptr [rbp - 8], rdi
	lea	rdi, [rip   L_.str.1]
	mov	al, 0
	call	_printf
	mov	dword ptr [rbp - 12], eax ## 4-byte Spill
	add	rsp, 16
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_Base::virtualnaMetoda() ## -- Begin function Base::virtualnaMetoda()
	.weak_def_can_be_hidden	_Base::virtualnaMetoda()
	.p2align	4, 0x90
_Base::virtualnaMetoda():           ## @Base::virtualnaMetoda()
	.cfi_startproc
## ».0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 16
	mov	qword ptr [rbp - 8], rdi
	lea	rdi, [rip   L_.str]
	mov	al, 0
	call	_printf
	mov	dword ptr [rbp - 12], eax ## 4-byte Spill
	add	rsp, 16
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.section	__DATA,__const
	.globl	_vtable for Derived           ## @vtable for Derived
	.weak_def_can_be_hidden	_vtable for Derived
	.p2align	3
_vtable for Derived:
	.quad	0
	.quad	_typeinfo for Derived
	.quad	_Derived::virtualnaMetoda()

	.section	__TEXT,__const
	.globl	_typeinfo name for Derived           ## @typeinfo name for Derived
	.weak_definition	_typeinfo name for Derived
_typeinfo name for Derived:
	.asciz	"7Derived"

	.globl	_typeinfo name for Base              ## @typeinfo name for Base
	.weak_definition	_typeinfo name for Base
_typeinfo name for Base:
	.asciz	"4Base"

	.section	__DATA,__const
	.globl	_typeinfo for Base              ## @typeinfo for Base
	.weak_definition	_typeinfo for Base
	.p2align	3
_typeinfo for Base:
	.quad	_vtable for __cxxabiv1::__class_type_info 16
	.quad	_typeinfo name for Base

	.globl	_typeinfo for Derived           ## @typeinfo for Derived
	.weak_definition	_typeinfo for Derived
	.p2align	4
_typeinfo for Derived:
	.quad	_vtable for __cxxabiv1::__si_class_type_info 16
	.quad	_typeinfo name for Derived
	.quad	_typeinfo for Base

	.globl	_vtable for Base              ## @vtable for Base
	.weak_def_can_be_hidden	_vtable for Base
	.p2align	3
_vtable for Base:
	.quad	0
	.quad	_typeinfo for Base
	.quad	_Base::virtualnaMetoda()

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"ja sam bazna implementacija!\n"

L_.str.1:                               ## @.str.1
	.asciz	"ja sam izvedena implementacija!\n"

L_.str.2:                               ## @.str.2
	.asciz	"Metoda kaze: "


.subsections_via_symbols