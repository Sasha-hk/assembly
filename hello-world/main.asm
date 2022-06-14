section .text
global _start
_start:
  mov eax, 0x4
  mov ebx, 1
  mov ecx, msg
  mov edx, len
  int 0x80

  mov eax, 0x1
  mov ebx, o
  int 0x80

section .data
msg db  'Hello world', 0xA
len equ $ - msg
