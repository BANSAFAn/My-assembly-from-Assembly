section .text
global get_new_threats

get_new_threats:
    push ebp
    mov ebp, esp
    sub esp, 0x20

    mov eax, API_URL
    mov [ebp - 4], eax

    mov eax, 4
    mov ebx, 1
    mov ecx, [ebp - 4]
    mov edx, 0x1000
    int 0x80

    cmp eax, 0
    jl error
    mov eax, [ebp - 4]
    mov ecx, [eax]
    mov edx, 0x1000
loop_parse:
    mov eax, 3
    mov ebx, 0
    mov ecx, 1
    int 0x80
    cmp [ebp - 9], 0x00
    je not_a_signature
    mov eax, DB_FILE
    mov ecx, [eax]
    mov [ecx], [ebp - 9]
    add [eax], 1

not_a_signature:
    add [ebp - 4], 1
    loop loop_parse
    mov esp, ebp
    pop ebp
    ret

error:
    mov eax, 1
    mov ebx, 0
    int 0x80