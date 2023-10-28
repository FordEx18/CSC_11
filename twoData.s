// Two int program
.global main

.align 4
.section .rodata
//Prompt Message
prompt:	.asciz "Please enter two signed integers: "

//response Message
response: .asciz "You entered %d and %d from the keyboard, now some operations on those values!\n"

//Pattern Format
pattern: .asciz "%d"

//Sum response
sResponse: .asciz "Sum of %d and %d is %d\n"

//Product response
pResponse: .asciz "Product of %d and %d is %d\n"

//Logical AND
lResponse: .asciz "Logical AND of %d and %d is %d\n"

//Logical OR
OrResponse: .asciz "Logical OR of %d and %d is %d\n"

.align 4
.data
//Scanf Number Read
value1:	.word 0
value2:	.word 0

.align 4
.text
main:
	push {lr}	//Save Return Address

	ldr r4, =value1	//R4 register loaded with address of value1
	ldr r5, =value2

	ldr r0, =prompt//R0 points to prompt
	bl printf	// Calling printf to output prompt

	ldr r0, =pattern
	mov r1, r4
	bl scanf

	ldr r0, =pattern
	mov r1, r5
	bl scanf
next:
	ldr r0, =response
	mov r1, r4
	mov r2, r5
	ldr r1, [r1]
	ldr r2, [r2]
	bl printf

	ldr r0, =sResponse
	mov r1, r4
	mov r2, r5
	ldr r1, [r1]
	ldr r2, [r2]
	add r3, r1, r2
	bl printf

	ldr r0, =pResponse
	mov r1, r4
	mov r2, r5
	ldr r1, [r1]
	ldr r2, [r2]
	mul r3, r1, r2
	bl printf

	ldr r0, =lResponse
	mov r1, r4
	mov r2, r5
	ldr r1, [r1]
	ldr r2,	[r2]
	and r3, r1, r2
	bl printf

	ldr r0, =OrResponse
	mov r1, r4
	mov r2, r5
	ldr r1, [r1]
	ldr r2, [r2]
	orr r3, r1, r2
	bl printf

	mov r0, #0
	pop {pc}

