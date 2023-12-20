.data
array: .word 0,1,2,3,4,5,6,7,8,9,10,11
.text
.global main
main:
    mov r1, #4
    @movemos array[7] + y(r1) a x(r0) -> r0 = 
    ldr r2, =array
    ldr r0, [r2, #28] @ r0 = array[7]
    add r0, r1 @ r0 = array[0] + y
    @movemos a array[10] el valor de array[8] + y = 12
    LDR r0, [r2, #32] @ r0 = array[8] 
    add r0, r1 @ r0 = array[8] + y
    STR r0, [r2, #36] @ array[10] = array[8] + y
    bx lr
