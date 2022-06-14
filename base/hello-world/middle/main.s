global _start

section .data
msg db "Hello world", endl, 0
endl equ 0xA

section .text
_start:
  mov rax, msg
  call print_string
  call exit

; | input:
; rax = string
print_string:
  push rax
  push rbx
  push rcx
  push rdx
  mov rcx, rax
  call length_string
  mov rdx, rax
  mov rax, 4
  mov rbx, 1
  int 0x80
  pop rax
  pop rbx
  pop rcx
  pop rdx
  ret

; | input:
; rex = string
; | outpus:
; rax = length
length_string:
  push rdx
  xor rdx, rdx
  .next_iter:
    cmp [rax + rdx], byte 0
    je .close
    inc rdx
    jmp .next_iter
  .close:
    mov rax, rdx
    pop rdx
    ret
  ret

exit:
  mov rax, 1
  mov rbx, 1
  int 0x80

