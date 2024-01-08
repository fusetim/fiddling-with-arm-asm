.global main

.section .data
a:      .word 5         // Example value for 'a'
b:      .word 7         // Example value for 'b'

.section .text
main:
    LDR R0, =a          // Load the address of 'a' into R0
    LDR R0, [R0]        // Load the value of 'a' into R0

    LDR R1, =b          // Load the address of 'b' into R1
    LDR R1, [R1]        // Load the value of 'b' into R1

    MOV R2, #0          // Initialize the result to 0

multiply_loop:
    CMP R1, #0      // Check if 'b' is zero
    BEQ end_multiply  // If 'b' is zero, exit the loop

    AND R3, R1, #1  // Get the least significant bit of 'b'
    CMP R3, #0      // Check if the least significant bit is 0
    BEQ skip_add    // If it's 0, skip the addition

    ADD R2, R2, R0  // Add 'a' to the result when the bit is 1

skip_add:
    LSR R1, R1, #1  // Right shift 'b' by 1 (divide by 2)
    B multiply_loop  // Repeat the loop

end_multiply:
    // At this point, R2 contains the result of 'a' multiplied by 'b'

    // Set the exit code
MOV R0, R2

    // Exit the program
SWI 0
