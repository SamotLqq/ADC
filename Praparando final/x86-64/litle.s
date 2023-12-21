.data
dato: .quad 0x1122334455667788
.text
.global main
main:
    movq $0x1122334455667788, %rax
    pushq %rax # solo se pueden pushear registros
    popq %rax # por cada push hay un pop (como malloc y free)
    ret

/*
este ejemplo se hizo para visualizar como se guarda dato y el valor pusheado
en memoria, se puede ver que en ambos es lo mismo, 0x88 en el bit mas significativo
y decreciente hasta 0x11 en el bit mas significativo (little endian)
como las direcciones decrecen en pila, la forma de guardar es la sigueinte:
0x11 en rsp-1
0x22 en rsp-2
...
0x88 en rsp-8
luego
rsp = rsp-8
por otro lado, en el segmento data, la forma de guardar el dato es la siguiente
0x88 en *dato
0x77 en *dato+1
...
0x11 en *dato+7
Y NO SE ACTUALIZA DATO, AHI ESTA LA DIFERENCIA.-
*/