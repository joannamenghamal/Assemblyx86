;Program name: "Triangle".  This program takes two sides of a triangle to determine the third side *
;some basic math operations using float numbers.  Copyright (C) 2025 Joanna Alyssa Menghamal.                                        *
;                                                                                                                          *
;This file is part of the software program "Triangle".                                                        *
;Triangle is a free software: you can redistribute it and/or modify it under the terms of the GNU General Public*
;License version 3 as published by the Free Software Foundation.                                                            *
;Triangle is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the       *
;implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more      *
;details.  A copy of the GNU General Public License v3 is available here:  <https:;www.gnu.org/licenses/>.                  *
;****************************************************************
;
;Author information
;  Author name: Joanna Alyssa Menghamal
;  Author email: jmenghamal@csu.fullerton.edu
;
;Program information
;  Program name: Triangle
;  Programming languages: One modules in C and one module in X86
;  Date program began: 2025-Jan-26
;  Date of last update: 
;  Date comments upgraded: 2025-Jan-26
;  Date open source license added: 2025-Jan-26
;  Date Basic Float Operations 2.0 released: 2020-November-6
;  Files in this program: geometry.c triangle.asm
;  Status: Finished.
;  References consulted: Seyfarth, Chapter 11
;  Future upgrade possible: software to validate inputs and reject non-float inputs
;
;Purpose
;  This program will demonstrate how to determine the third side of a triangle. 
;
;This file
;  File name: geometry.c
;  Language: C
;  Max page width: 132 columns  [132 column width may not be strictly adhered to.]
;  Compile this file: g++ -c -m64 -Wall -o fp-io-driver.o fp-io-driver.cpp -fno-pie -no-pie -std=c++17
;     [As the time of upgrade to this program C++ standard 2020 was not available.]
;  Link this program: gcc -m64 -o geometry.out geometry.o -fno-pie -no-pie -o geometry.out geometry.o


;===== Begin code area ========================================================

; Declarations
global triangle
max equ 40
extern printf
extern scanf
extern fgets	
extern stdin
extern atof
extern cos


pi dq 3.141592653589793238462643383279502884197
two dq 2.0
straight dq 180.0

segment .data
;Declare initialized array

promptname db 10, "Please enter your name: ", 0
prompt_title db 10, "Please enter your title (Engineer, Doctor, Nurse, Student, etc): ", 0
greeting_msg db 10, "Hello %s%sWe can solve your triangle.", 0

side_a db 10, "Please enter the length of the first triangle side: ", 0
side_b db 10, "Please enter the length of the second triangle side: ", 0
prompt_angle db 10, "Please enter the angle of the triangle: ", 0
format_in db 10, "%lf", 0 	;input format for 1 float
format_out db 10, "The angle you entered is: %lf", 0


side_c db 10, "The length of the third side of the triangle is %.6lf ", 0

float_format db 10, "%lf", 0 ;format string for scanf and printf



segment .bss ;declare empty arrays

name resb 50
title resb 50



segment .text

triangle: 

;Block to backup GPRs (push all GPRs except rax(used to transport int), rip, )
	push rbp
	mov rbp, rsp
	push rbx
	push rcx
	push rdx
	push rdi
	push rsi
	push r8
	push r9
	push r10
	push r11
	push r12
	push r13
	push r14
	push r15
	pushf

	;backup other registers
	mov rax,7
	mov rdx,0

;Prompt user for name
	mov rax, 0
	mov rdi, promptname
	call printf
	
;Get user name input 
	mov rax, 0
	mov rdi, name
	mov rsi, 50
	mov rdx, [stdin]
	call fgets
	
;Get user title
	mov rax, 0
	mov rdi, prompt_title
	call printf

;Get user title input
	mov rax, 0
	mov rdi, title
	mov rsi, 50
	mov rdx, [stdin]
	call fgets

	
;Print "User greeting"
	mov rax, 0
	mov rdi, greeting_msg
	mov rsi, name
	mov rdx, title
	call printf
	
;Get user's first side of triangle (side A)
	mov rax, 0
	mov rdi, side_a
	call printf
	
; Read float from user
	mov rax, 0
	push qword 0
	push qword 0
	mov rdi, float_format
	mov rsi, rsp
	call scanf
	movsd xmm11, [rsp]
	pop rax
	pop rax
	
;Print side_a
	mov rax, 1
	mov rdi, float_format
	movsd xmm0, xmm11
	call printf
	
;Get user's second side of triangle (side b)
	mov rax, 0
	mov rdi, side_b
	call printf
	
; Read float from user
	mov rax, 0
	push qword 0
	push qword 0
	mov rdi, float_format
	mov rsi, rsp	
	call scanf
	movsd xmm12, [rsp]
	pop rax
	pop rax
		
;Print side_b
	mov rax, 1
	mov rdi, float_format
	movsd xmm0, xmm12
	call printf

;Prompt user for triangle angle in degrees
	mov rax, 0
	mov rdi, prompt_angle
	call printf
	
;Read float 
	mov rax, 0
	push qword 0
	push qword 0
	mov rdi, format_in
	mov rsi, rsp
	call scanf
	movsd xmm13, [rsp]
	pop rax
	pop rax

;Print float angle
	mov rax, 1
	mov rdi, format_out
	movsd xmm0, xmm13
	call printf
	
;Square side a
	mulsd xmm11, xmm11
	
;Square side b
	mulsd xmm12, xmm12
 	
;Multiply 2*side A * side B
	movsd xmm10, xmm11
	mulsd xmm10, xmm12
	mulsd xmm10, [two]

;Compute degrees to radians
	mulsd xmm13, [pi]
	divsd xmm13, [straight]

;Get COS of angle
	mov rax, 1
	movsd xmm0, xmm13
	call cos
	movsd xmm13, xmm0

;Calculate missing side
	movsd xmm15, xmm11
	addsd xmm15, xmm12
	subsd xmm15, xmm13
	sqrtsd xmm15, xmm15
	
;Print result
	mov rax, 1
	movsd xmm0, xmm15
	mov rdi, side_c
	call printf

	
;Block that restore GPRs
popf
pop r15
pop r14
pop r13
pop r12
pop r11
pop r10
pop r9
pop r8
pop rsi
pop rdi
pop rdx
pop rcx
pop rbx
pop rbp ;Restore rbp to the base of the activation record of the caller program
ret
