global _start

section .data
  msg db "Hello world", 0xA, 0
  len equ $ - msg

section .text
_start:
  mov eax, 0x4
  mov ebx, 0x1
  mov ecx, msg
  mov edx, len
  int 0x80

  mov eax, 0x1
  mov ebx, 0x0
  int 0x80
