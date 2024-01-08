.global main

.section .data
x:      .word 0
y:      .word 1
t:      .word 0

.section .text
main:
    LDR R0, =1        // Load 1 into R0
    LDR R1, =100      // Load 100 into R1

    MOV R2, #0        // Initialize x = 0
    MOV R3, #1        // Initialize y = 1

loop_start:
    CMP R2, R1        // Compare x with 100
    BGE end_loop      // If x >= 100, exit loop

    LDR R4, [R3]      // Load the value of y into R4
    STR R4, [R2]      // Store the value of y into x

    LDR R5, [R2]      // Load the value of x into R5
    ADD R4, R4, R5    // Calculate x + y
    STR R4, [R3]      // Store the result into y

    MOV R5, R3        // Copy the value of y into R5
    MOV R3, R2        // Copy the value of x into R3
    MOV R2, R5        // Copy the value of y (in R5) into x

    B loop_start      // Branch back to the beginning of the loop

end_loop:
    // At this point, R3 contains the final value of y
    // You can add further instructions as needed for your specific requirements

    MOV R0, R3        // Set the return value
    SWI 0              // Software interrupt to exit the program
