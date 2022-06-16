global _start

section .bss
  bss_char resb 1

section .text
_start:
  mov rax, 571
  mov rcx, 10
  sub rax, rcx
  call print_number

  call exit

; | input
; rax = number
print_number:
  push rax
  push rbx
  push rcx
  push rdx
  xor rcx, rcx           ; counter like i
  .next_iter:
    mov rbx, 10
    xor rdx, rdx
    div rbx
    add rdx, 0x30        ; "0" + 4 = 4 | covert number to ascii char
    push rdx
    inc rcx
    cmp rax, 0           ; check after first iteration to prevent 0 number
    je .print_iter
    jmp .next_iter
  .print_iter:
    cmp rcx, 0
    je .close
    pop rax
    call print_char
    dec rcx
    jmp .print_iter
  .close:
    pop rdx
    pop rcx
    pop rbx
    pop rax
    ret

; | input
; rax = char
print_char:
  push rax
  push rbx
  push rcx
  push rdx

  mov [bss_char], al
  mov rax, 4
  mov rbx, 1
  mov rcx, bss_char
  mov rdx, 1
  int 0x80

  pop rdx
  pop rcx
  pop rbx
  pop rax
  ret

exit:
  mov rax, 1
  mov rbx, 0
  int 0x80
