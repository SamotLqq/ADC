.global main
main:
  movb $100, %al;
  addb $120, %al;
  
  movb $-63, %al;
  addb $-56, %al;
  
  movb $-63, %al;
  addb $-91, %al;
  
  movb $120, %al;
  subb $-56, %al;
  
  movb $-91, %al;
  subb $120, %al;
  
  ret

