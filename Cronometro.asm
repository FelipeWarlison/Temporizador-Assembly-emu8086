; Felipe Andrade
;código que exiba no display de led’s uma temporização de 0m:0s a 59m:59s.
#start=led_display.exe#

ORG 100H
mov si, N2  
jmp start

N1 EQU 60
N2 EQU 100
N3 EQU 6000

start: 
    MOV DI, 0H ; inicia contagem dos segundos 

loop:
     INC DI
     cmp DI, N1
     je fim 
     MOV AX, BX ; loop infinito 
     OUT 0C7H, AX ; exibe contagem
     INC BX ; incrementa contagem 
     CALL delay ; delay de 0,5s
     JMP loop ; repete
     HLT ; para o programa
delay:
     MOV CX, 0007H ; carrega CX:DX com o valor do delay em us
     MOV DX, 0A120H
     MOV AH, 86H ; funcao de delay da BIOS
     INT 15H ; gera interrupcao
     RET ; retorna
fim: 
     jz minuto 


minuto:       
       MOV BX, si ; inicia contagem dos minutos
       cmp bx, N3
       je acabou
loop1:
     add si, N2
     MOV AX, BX ; loop infinito 
     OUT 0C7H, AX ; exibe contagem
     inc bx 
     CALL delay1 ; delay de 0,5s
     JMP loop1 ; repete
     HLT ; para o programa
delay1:
     MOV CX, 0007H ; carrega CX:DX com o valor do delay em us
     MOV DX, 0A120H
     MOV AH, 86H ; funcao de delay da BIOS
     INT 15H ; gera interrupcao
     je fim2
fim2: 
     jmp start
     
acabou:
     hlt



