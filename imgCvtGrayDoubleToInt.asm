; rcx = pointer to doubleArray
; rdx = pointer to uInt8Array
; r8  = row
; r9  = col

global imgCvtGrayDoubleToInt
section .text
bits 64
Default rel

imgCvtGrayDoubleToInt:
    test r8, r8
    mov rbx, r9
    jz .done

.loop:
    mov rdi, [rcx]
    mov rsi, [rdx]
    mov r9, rbx
    
    .inner_loop:
        movsd xmm0, [rdi]        
        mulsd xmm0, [rel scale]  
        cvttsd2si rax, xmm0      
        mov [rsi], al
  
        add rdi, 8               
        add rsi, 1               
        dec r9
        jnz .inner_loop
        
    add rcx, 8
    add rdx, 8
    dec r8
    jnz .loop

.done:
    ret

section .data
scale: dq 255.0