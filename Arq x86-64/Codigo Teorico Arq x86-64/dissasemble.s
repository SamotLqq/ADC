.global main
main:
    movq $1, %rax
    addq $1, %rax
    ret

/*
al ejecutar disassemble de esta funcion obtenemos la siguiente salida:
    0x0000555555555129 <+0>:	mov $0x1,%rax
    0x0000555555555130 <+7>:	add $0x1,%rax
    0x0000555555555134 <+11>:	ret
    donde la primer columna marca la direccion de la primer instruccion y el desplazamiento en bytes de su ubicacion desde
    el comienzo del programa.
    al lado se encuentra la instruccion respectiva
si al comando disassemble le agregamos /r, es decir, si usamos el comando disassemble/r obtenemos la siguiente salida:
    0x0000555555555129 <+0>:	48 c7 c0 01 00 00 00	mov $0x1,%rax
    0x0000555555555130 <+7>:	48 83 c0 01	            add $0x1,%rax
    0x0000555555555134 <+11>:	c3	                    ret
    donde se agrega una nueva columna con el codigo maquina equivalente a nuestro codigo ensamblador.
