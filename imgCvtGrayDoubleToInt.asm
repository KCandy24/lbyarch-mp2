bits 64
global imgCvtGrayDoubleToInt
Default rel

section .data
scale: dq 255.0

section .text
imgCvtGrayDoubleToInt:
    ; rcx = row
    ; rdx = col
    ; r8 = doubleArray (pointer to array of pointers)
    ; r9 = uInt8Array (pointer to array of pointers)
    
    test rcx, rcx
    jz done

rowLoop:
    mov rsi, [r8]       ; load doubleArray[i] pointer
    mov rdi, [r9]       ; load uInt8Array[i] pointer
    mov rbx, rdx        ; column counter
    
colLoop:
    movsd xmm0, [rsi]       ; load double value
    mulsd xmm0, [scale]     ; multiply by 255.0
    cvtsd2si rax, xmm0      ; convert to integer
    mov [rdi], al           ; store uint8 value
    
    add rsi, 8      ; next double (8 bytes)
    add rdi, 1      ; next uint8 (1 byte)
    
    dec rbx
    jnz colLoop
    
    add r8, 8       ; next input row pointer
    add r9, 8       ; next output row pointer
    
    dec rcx
    jnz rowLoop

done:
    ret