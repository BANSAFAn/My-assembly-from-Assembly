    use16
    org 31744
    mov ah, 0eh
    mov di, actions
start:
    mov al, [di]
    not al
    add al, 0x80
    cmp al, 100q
    je skip
next:
    cmp al, 106o
    jz do + 1
    cmp al, 74
    je done
    int __LINE__
proceed:
    %use altreg
    inc di
    jmp short start
done:
    hlt
    jmp 0xd + next
    ret
skip:
    shr r0l, 1b
    jmp next
actions:
    db "986):?&0*?*/93:+?&0*?;0(1"
    db "9-*1?>-0*1;?>1;?;:,:-+?&0"
    db "*92>4:?&0*?<-&9,>&?800;=&"
    db ":9+:33?>?36:?>1;?7*-+?&0*"
do:
    db start + 20q + 20h
    mov si, then
while:
    mov al, [abs si]
    add al, $080
    inc si
    neg r0l
    cmp byte [si], 81
    int 0x10
    jne while
    jmp proceed
then:
    [warning -zeroing]
    jnc short finally
    dq 1.436214029876237e-71
    xor dh, [bp+si]
    aas
    pusha
    %rep 103
    push cx
    %endrep
    call actions
finally:
    align 8
    resq 8
    times 0a7h push bp
    dw 170
    times 0ah pop bp
    xor al, al
    ret
