.data
x1: .float 1.6 
x2: .float 1.0
y: .double 3.2
z: .double 0
.text
.global main
main:
    # dos valores a xmm0 ¿los ubica a los dos en slots diferentes o los pisa?
    movss x1, %xmm0 # mueve el valor en x en xmm0
    movss x2, %xmm0 # pisa el valor anterior (x1) no va al siguiente slot.
    # un double a xmm0 ¿copia el double en el slot que queda o pisa a los otros?
    movsd y, %xmm0 # mueve y a xmm0
    # en caso de no pisar xmm0, ¿cual de todos sus valores pasa a z?
    movsd %xmm0, z # mueve el valor de xmm0 a y
    # en caso de no pisar xmm0, ¿cual de todos sus valores mueve a xmm2?
    movsd %xmm0, %xmm2 # mueve de xmm0 a xmm2
    ret

/*
tamaños:
    s: simple precision
    d: double precision
valores de los registros: 
    al ejecutar el comando "i r xmmi", gdb nos lanza el contenido del registro entendido de diferentes formas.
    luego de ejecutar el comando "movss x1, %xmm0" al ejecutar el comando "i r xmm0" en gdb obtenemos la siguiente salida:
        {
        v8_bfloat16 = {0xcccd, 0x3fcc, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0}, 8 flotantes de 2 bytes cada uno.
        v8_half = {0xcccd, 0x3fcc, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0}, 8 flotantes de 2 bytes cada uno.
        v4_float = {0x3fcccccd, 0x0, 0x0, 0x0}, 4 flotantes de 4 bytes cada uno (float).
        v2_double = {0x3fcccccd, 0x0}, 2 flotantes de 8 bytes cada uno (double).
        v16_int8 = {0xcd, 0xcc, 0xcc, 0x3f, 0x0 <repeats 12 times>}, 16 enteros de 1 byte (char en c) (byte en ass y en .data) 
        v8_int16 = {0xcccd, 0x3fcc, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0}, 8 enteros de 2 bytes (short en c) (word en ass) (los dos en .data)
        v4_int32 = {0x3fcccccd, 0x0, 0x0, 0x0}, 4 enteros de 4 bytes (int en c) (double word en ass) (long en .data)
        v2_int64 = {0x3fcccccd, 0x0}, 2 enteros de 8 bytes (long en c) (quad word en ass) (quad en .data)
        uint128 = 0x3fcccccd, 1 entero de 16 bytes (? en c) (double quad word en ass) (? en ass)
        }
        notar que todas las representaciones ocupan los 16bytes-128bits de xmm0.
        notar también que la distribucion de bytes en siempre la misma, por lo tanto el resultado correcto/esperado lo tenemos
        guardado en v4_float. Es decir, el 1.6 es el primer elemento de v4_float, los demás no representan el 1.6.
        por lo tanto hay que tener cuidado cuando vayamos a buscar el dato, ya que debemos ir a la representacion correspondiente
        a la instrucción/tamaño utilizada(o)
seguimiento de v4_float , v2_double y etiquetas durante la ejecucion:

br main + r (ejecuta hasta main, carga .data y queda a la espera de la primera instruccion):
x1 = 0xcd 0xcc 0xcc 0x3f = 0x3fcccccd = 1.6 (ieee754)
x2 = 0x00 0x00 0x80 0x3f = 0x3f000000 = 1 (ieee754)
y = 0x9a 0x99 0x99 0x99	0x99 0x99 0x09 0x40 = 0x400999999999999a = 3.2(ieee754)
z = 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 = 0x0 = 0 (ieee754)
xmm0 = v4_float = {0x0, 0x0, 0x0, 0x0}, v2_double = {0x0, 0x0}
xmm2 = v4_float = {0x0, 0x0, 0x0, 0x0}, v2_double = {0x0, 0x0}

n (ejecuta la primera instruccion movss x1, %xmm0):
x1 = 0xcd 0xcc 0xcc 0x3f = 0x3fcccccd = 1.6 (ieee754)
x2 = 0x00 0x00 0x80 0x3f = 0x3f800000 = 1 (ieee754)
y = 0x9a 0x99 0x99 0x99	0x99 0x99 0x09 0x40 = 0x400999999999999a = 3.2(ieee754)
z = 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 = 0x0 = 0 (ieee754)
xmm0 = v4_float = {0x3fcccccd, 0x0, 0x0, 0x0}, v2_double = {0x3fcccccd, 0x0}
xmm2 = v4_float = {0x0, 0x0, 0x0, 0x0}, v2_double = {0x0, 0x0}

n (ejecuta la segunda instruccion movss x2, %xmm0):
x1 = 0xcd 0xcc 0xcc 0x3f = 0x3fcccccd = 1.6 (ieee754)
x2 = 0x00 0x00 0x80 0x3f = 0x3f800000 = 1 (ieee754)
y = 0x9a 0x99 0x99 0x99	0x99 0x99 0x09 0x40 = 0x400999999999999a = 3.2(ieee754)
z = 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 = 0x0 = 0 (ieee754)
y = 0x9a 0x99 0x99 0x99	0x99 0x99 0x09 0x40 = 0x400999999999999a = 3.2(ieee754)
z = 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 = 0x0 = 0 (ieee754)
xmm0 = v4_float = {0x3f800000, 0x0, 0x0, 0x0}, v2_double = {0x3f800000, 0x0}
xmm2 = v4_float = {0x0, 0x0, 0x0, 0x0}, v2_double = {0x0, 0x0}

n (ejecuta la tercera instruccion movsd y, %xmm0):
x1 = 0xcd 0xcc 0xcc 0x3f = 0x3fcccccd = 1.6 (ieee754)
x2 = 0x00 0x00 0x80 0x3f = 0x3f800000 = 1 (ieee754)
y = 0x9a 0x99 0x99 0x99	0x99 0x99 0x09 0x40 = 0x400999999999999a = 3.2(ieee754)
z = 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 = 0x0 = 0 (ieee754)
xmm0 = v4_float = {0x9999999a, 0x40099999, 0x0, 0x0}, v2_double = {0x400999999999999a, 0x0}
xmm2 = v4_float = {0x0, 0x0, 0x0, 0x0}, v2_double = {0x0, 0x0}

n (ejecuta la cuarta instruccion movsd %xmm0, z):
x1 = 0xcd 0xcc 0xcc 0x3f = 0x3fcccccd = 1.6 (ieee754)
x2 = 0x00 0x00 0x80 0x3f = 0x3f800000 = 1 (ieee754)
y = 0x9a 0x99 0x99 0x99	0x99 0x99 0x09 0x40 = 0x400999999999999a = 3.2(ieee754)
z = 0x9a 0x99 0x99 0x99 0x99 0x99 0x09 0x40 = 0x400999999999999a = 3.2(ieee754)
xmm0 = v4_float = {0x9999999a, 0x40099999, 0x0, 0x0}, v2_double = {0x400999999999999a, 0x0}
xmm2 = v4_float = {0x0, 0x0, 0x0, 0x0}, v2_double = {0x0, 0x0}

n (ejecuta la quinta instruccion movsd %xmm0, %xmm2):
x1 = 0xcd 0xcc 0xcc 0x3f = 0x3fcccccd = 1.6 (ieee754)
x2 = 0x00 0x00 0x80 0x3f = 0x3f800000 = 1 (ieee754)
y = 0x9a 0x99 0x99 0x99	0x99 0x99 0x09 0x40 = 0x400999999999999a = 3.2(ieee754)
z = 0x9a 0x99 0x99 0x99 0x99 0x99 0x09 0x40 = 0x400999999999999a = 3.2(ieee754)
xmm0 = v4_float = {0x9999999a, 0x40099999, 0x0, 0x0}, v2_double = {0x400999999999999a, 0x0}
xmm2 = v4_float = {0x9999999a, 0x40099999, 0x0, 0x0}, v2_double = {0x400999999999999a, 0x0}

conslusion:
    con estas instrucciones de movimiento no podemos aprovechar el espacio
    que nos brindan los registros xmmi ya que se van pisando los valores.
*/