.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14	sdk_version 10, 14
	.intel_syntax noprefix
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## ».0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 32	------------------------------------alociranje na stogu za poc
	mov	eax, 16
	mov	edi, eax
	call	_operator new(unsigned long)------------alocira se za pb na heapu - poziva se funkcija new
	mov	rdi, rax
	mov	qword ptr [rbp - 24], rax ## 8-byte Spill
	call	_CoolClass::CoolClass()-----------------poziv konstruktora klase na taj alocirani prostor na heapu
	mov	rax, qword ptr [rbp - 24] ## 8-byte Reload
	mov	qword ptr [rbp - 16], rax
	lea	rdi, [rbp - 8]
	mov	esi, 42
	call	_PlainOldClass::set(int)----------------poc.set - on se moze inlineat jer je compile time binding a virtualne su runtime
	mov	rax, qword ptr [rbp - 16]
	mov	rdi, qword ptr [rax]
	mov	qword ptr [rbp - 32], rdi ## 8-byte Spill
	mov	rdi, rax
	mov	esi, 42
	mov	rax, qword ptr [rbp - 32] ## 8-byte Reload
	call	qword ptr [rax]-------------------------pb->set
	xor	eax, eax
	add	rsp, 32
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_CoolClass::CoolClass()      ## -- Begin function CoolClass::CoolClass()
	.weak_def_can_be_hidden	_CoolClass::CoolClass()
	.p2align	4, 0x90
_CoolClass::CoolClass():                     ## @CoolClass::CoolClass()
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
	call	_CoolClass::CoolClass()
	add	rsp, 16
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_PlainOldClass::set(int) ## -- Begin function PlainOldClass::set(int)
	.weak_definition	_PlainOldClass::set(int)
	.p2align	4, 0x90
_PlainOldClass::set(int):              ## @PlainOldClass::set(int)
	.cfi_startproc
## ».0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	mov	qword ptr [rbp - 8], rdi
	mov	dword ptr [rbp - 12], esi
	mov	rdi, qword ptr [rbp - 8]
	mov	esi, dword ptr [rbp - 12]
	mov	dword ptr [rdi], esi
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_CoolClass::CoolClass()      ## -- Begin function CoolClass::CoolClass()
	.weak_def_can_be_hidden	_CoolClass::CoolClass()
	.p2align	4, 0x90
_CoolClass::CoolClass():                     ## @CoolClass::CoolClass()
	.cfi_startproc
## ».0:
	push	rbp-----------------------------------------------stari base pointer
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp----------------------------------------------rbp pointa na stack pointer
	.cfi_def_cfa_register rbp
	sub	rsp, 16-----------------------------------------------a stack pointer micemo da zauzmemo mjesta za argumente
	mov	qword ptr [rbp - 8], rdi
	mov	rdi, qword ptr [rbp - 8]
	mov	rax, rdi
	mov	qword ptr [rbp - 16], rdi ## 8-byte Spill
	mov	rdi, rax
	call	_Base::Base()--------------------------------------poziv base konstruktora iz nasljedenog
	mov	rax, qword ptr [rip   __ZTV9CoolClass@GOTPCREL]--------adresa vtable for CoolClass
	add	rax, 16------------------------------------------------+16 na to iznad
	mov	rdi, qword ptr [rbp - 16] ## 8-byte Reload-------------adresa objekta
	mov	qword ptr [rdi], rax-----------------------------------na adresu objekta adresa tablice
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
	mov	rax, qword ptr [rip   __ZTV4Base@GOTPCREL]
	add	rax, 16
	mov	qword ptr [rbp - 8], rdi
	mov	rdi, qword ptr [rbp - 8]
	mov	qword ptr [rdi], rax
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_CoolClass::set(int)    ## -- Begin function CoolClass::set(int)
	.weak_def_can_be_hidden	_CoolClass::set(int)
	.p2align	4, 0x90
_CoolClass::set(int):                   ## @CoolClass::set(int)
	.cfi_startproc
## ».0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	mov	qword ptr [rbp - 8], rdi
	mov	dword ptr [rbp - 12], esi
	mov	rdi, qword ptr [rbp - 8]
	mov	esi, dword ptr [rbp - 12]
	mov	dword ptr [rdi   8], esi
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_CoolClass::get()    ## -- Begin function CoolClass::get()
	.weak_def_can_be_hidden	_CoolClass::get()
	.p2align	4, 0x90
_CoolClass::get():                   ## @CoolClass::get()
	.cfi_startproc
## ».0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	mov	qword ptr [rbp - 8], rdi
	mov	rdi, qword ptr [rbp - 8]
	mov	eax, dword ptr [rdi   8]
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.section	__DATA,__const
	.globl	_vtable for CoolClass         ## @vtable for CoolClass
	.weak_def_can_be_hidden	_vtable for CoolClass
	.p2align	3
_vtable for CoolClass:
	.quad	0
	.quad	_typeinfo for CoolClass
	.quad	_CoolClass::set(int)
	.quad	_CoolClass::get()

	.section	__TEXT,__const
	.globl	_typeinfo name for CoolClass         ## @typeinfo name for CoolClass
	.weak_definition	_typeinfo name for CoolClass
_typeinfo name for CoolClass:
	.asciz	"9CoolClass"

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

	.globl	_typeinfo for CoolClass         ## @typeinfo for CoolClass
	.weak_definition	_typeinfo for CoolClass
	.p2align	4
_typeinfo for CoolClass:
	.quad	_vtable for __cxxabiv1::__si_class_type_info 16
	.quad	_typeinfo name for CoolClass
	.quad	_typeinfo for Base

	.globl	_vtable for Base              ## @vtable for Base
	.weak_def_can_be_hidden	_vtable for Base
	.p2align	3
_vtable for Base:
	.quad	0
	.quad	_typeinfo for Base
	.quad	___cxa_pure_virtual
	.quad	___cxa_pure_virtual


.subsections_via_symbols