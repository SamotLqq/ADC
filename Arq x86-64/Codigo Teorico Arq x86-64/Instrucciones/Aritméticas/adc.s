.global main
main:
    xorq %rax, %rax
    movb $0xf0, %al
    adcb $0xf0, %al
    // el resultado de esto es equivalente a ejecutar la instruccion addb $0xf0, %al ya que suma el la cf con el valor anterior a ejecutar la instruccion
    adcb $1, %al
    // luego de ejecutar la linea de arriba podemos ver que si se le suma el acarreo ya que la operacion anterior encendio la carryflag
    ret

/*
basicamente la idea es que cuando sepamos o necesitemos que cuando se prenda la carryflag luego de una operacion la podamos guardar y luego operar con ella.
su equivalente para la resta es sbb

obs: suma la actual carry con la suma que se quiera realizar, es decir, no es que realiza la suma y si se prende la cf la sumna
sino que suma la cf si la instruccion anterior la encendio
*/