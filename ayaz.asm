INCLUDE C:\Irvine\Irvine32.inc
INCLUDELIB C:\Irvine\Irvine32.lib


.data
    marksPrompt BYTE "Input Marks % value: ", 0
    gradePrompt BYTE 0dh, 0ah, "Your Letter Grade: ", 0
    gpaPrompt BYTE 0dh, 0ah, "Your GPA: ", 0
    gradeAplusString BYTE "A+ (Plus)", 0
    gradeAString BYTE "A (Plain)", 0
    gradeAminusString BYTE "A- (Minus)", 0
    gradeBplusString BYTE "B+ (Plus)", 0
    gradeBString BYTE "B (Plain)", 0
    gradeBminusString BYTE "B- (Minus)", 0
    gradeCplusString BYTE "C+ (Plus)", 0
    gradeCString BYTE "C (Plain)", 0
    gradeDString BYTE "D (Plain)", 0
    gradeFString BYTE "F (Fail)", 0

    GPA_SCALE DWORD 10  ; Scale factor to convert float GPA to integer (e.g., 4.0 * 10 = 40)

.code
main PROC
    mov edx, OFFSET marksPrompt
    call WriteString
    call ReadInt ; Input marks percentage
    mov ecx, eax

    call Crlf
    mov edx, OFFSET gradePrompt
    call WriteString

    ; Determine letter grade
    cmp cx, 80
    jge gradeAplus
    cmp cx, 75
    jge gradeA
    cmp cx, 70
    jge gradeAminus
    cmp cx, 65
    jge gradeBplus
    cmp cx, 60
    jge gradeB
    cmp cx, 55
    jge gradeBminus
    cmp cx, 50
    jge gradeCplus
    cmp cx, 45
    jge gradeC
    cmp cx, 40
    jge gradeD
    jmp gradeF

gradeAplus:
    mov edx, OFFSET gradeAplusString
    call WriteString
    mov eax, 40  ; GPA for A+ is 4.0 * 10
    jmp displayGPA

gradeA:
    mov edx, OFFSET gradeAString
    call WriteString
    mov eax, 40  ; GPA for A is 4.0 * 10
    jmp displayGPA

gradeAminus:
    mov edx, OFFSET gradeAminusString
    call WriteString
    mov eax, 37  ; GPA for A- is 3.7 * 10
    jmp displayGPA

gradeBplus:
    mov edx, OFFSET gradeBplusString
    call WriteString
    mov eax, 30  ; GPA for B+ is 3.0 * 10
    jmp displayGPA

gradeB:
    mov edx, OFFSET gradeBString
    call WriteString
    mov eax, 30  ; GPA for B is 3.0 * 10
    jmp displayGPA

gradeBminus:
    mov edx, OFFSET gradeBminusString
    call WriteString
    mov eax, 27  ; GPA for B- is 2.7 * 10
    jmp displayGPA

gradeCplus:
    mov edx, OFFSET gradeCplusString
    call WriteString
    mov eax, 20  ; GPA for C+ is 2.0 * 10
    jmp displayGPA

gradeC:
    mov edx, OFFSET gradeCString
    call WriteString
    mov eax, 20  ; GPA for C is 2.0 * 10
    jmp displayGPA

gradeD:
    mov edx, OFFSET gradeDString
    call WriteString
    mov eax, 10  ; GPA for D is 1.0 * 10
    jmp displayGPA

gradeF:
    mov edx, OFFSET gradeFString
    call WriteString
    mov eax, 0   ; GPA for F is 0
    jmp displayGPA

displayGPA:
    ; Display GPA by dividing the scaled GPA by the GPA_SCALE factor
    mov ebx, GPA_SCALE
    xor edx, edx  ; Clear edx before division
    div ebx
    call WriteDec  ; Display the GPA
    jmp stop

stop:
    call Crlf
    exit
main ENDP

END main