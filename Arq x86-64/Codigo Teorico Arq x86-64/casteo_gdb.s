.global main
main:
    movb $0xff, %al
    ret
# para ver el formato decimal sin signo podemos usar printf pero como u mide 4 bytes entonces debemos operarlo con 0xff
# printf "el valor del registro al en decimal sin signo es: %u\n", $al & 0xff
# para otras longitudes igual o mas simple.
