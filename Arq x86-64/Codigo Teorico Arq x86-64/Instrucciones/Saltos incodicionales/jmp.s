.global main
main:
    jmp abajo
    movq $1, %rax
abajo:
    jmp main

/*
 este programa produce un bucle infinito. linea 3 a 5 - linea 5 a 6 - linea 6 a 2 - linea 2 a 3 y volvemos a empezar.
 sirve para observar que podemos saltar a etiquetas que estan definidas mas abajo (abajo) o mas arriba (main) de la posicion 
 actual del programa.
*/