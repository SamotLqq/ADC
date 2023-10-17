	.file	"15.c"
	.text
	.section	.rodata
.LC0:
	.string	"a: %p\n"
.LC1:
	.string	"b: %p\n"
.LC2:
	.string	"c: %p\n"
.LC3:
	.string	"d: %p\n"
.LC4:
	.string	"e: %p\n"
.LC5:
	.string	"f: %p\n"
.LC6:
	.string	"g: %p\n"
.LC7:
	.string	"h: %p\n"
	.text
	.globl	f
	.type	f, @function
f:
.LFB0:
	.cfi_startproc
	endbr64
	# proceso reorganizacion de pila, ya que, como printf no preserva los registros donde tenemos guardados los argumentos de f los tenemos que almacenar en pila.
	pushq	%rbp # puntero a base. en teoria vimos que, por convencion, rbp + 8 es la direccion de retorno, rbp + 16 es el argumento 7, rbp + 24 el argumento 8, etc
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp # ¿?
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%esi, -8(%rbp) # segundo argumento de f (2) a la base de la pila -8 (de -8 a -4)
	movq	%rcx, -24(%rbp) # cuarto argumento de f (4) a la base de la pila -24 (de -24 a -16)
	movl	%r8d, %esi # quinto argumento de f ('5') a esi
	movl	%r9d, %eax # sexto argumento de f (6) a esi
	movl	%edi, %ecx # primer argumento de f ('1') a ecx
	movb	%cl, -4(%rbp) # primer argumento de f a la base de la pila -4 bytes (de -4 a -3)
	movb	%dl, -12(%rbp) # tercer argumento de f ('3') a la base de la pila - 12 (de -12 a -11)
	movl	%esi, %edx # esi (quinto argumento de f) a edx
	movb	%dl, -16(%rbp) # quinto argumento de f a base de pila -16 (de -16 a -15)
	movw	%ax, -28(%rbp) # sexto argumento de f a base de pila - 28 (de -28 a -26)
	# proceso ejecución printf(s)
	leaq	-4(%rbp), %rax # primer argumento de f a rax
	movq	%rax, %rsi # segundo argumento de printf a rsi ('1' == 49)
	leaq	.LC0(%rip), %rax # obtenemos la cadena de formato
	movq	%rax, %rdi # primer argumento la cadena de formato
	movl	$0, %eax # 0 argumentos flotantes
	call	printf@PLT
	leaq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-28(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	16(%rbp), %rsi # septimo argumento de f como segundo argumento de printf
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	24(%rbp), %rax # octavo argumento de f como segundo argumento de printf
	movq	%rax, %rsi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	f, .-f
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	$8
	pushq	$7
	movl	$6, %r9d
	movl	$53, %r8d
	movl	$4, %ecx
	movl	$51, %edx
	movl	$2, %esi
	movl	$49, %edi
	call	f
	addq	$16, %rsp
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
