# Garrett Lo
# 015983422

# CS 2640
# Program 1: Getting Familiar with Assembly

# My first public repo raahhhhhh
# https://github.com/Synthereal/MIPS_Assembly

.data
	prompt1: 	.asciiz "First integer now: "
	prompt2:	.asciiz "Gimme your second integer: "
	result:		.asciiz "Your integers sir: "
	newline:	.asciiz "\n"
	add_prompt:	.asciiz " + "
	sub_prompt:	.asciiz " - "
	mul_prompt:	.asciiz " x "
	div_prompt:	.asciiz " / "
	equ_prompt:	.asciiz " = "
	r_format:	.asciiz "R"
	num_same:	.asciiz "Yo Mr. White! These numbers are the same, yo."
	num_diff:	.asciiz "These two could not be farther apart."
	
    
.text
main:
	
	# TASK 1: User Input and Output
	
	# print prompt for first int
	li $v0, 4
	la $a0, prompt1
	syscall

	# get first int from user
	li $v0, 5
	syscall
	move $s0, $v0		# s0 = first int

	# print prompt for the second int
	li $v0, 4
	la $a0, prompt2
	syscall

	# get second int from user
	li $v0, 5
	syscall
	move $s1, $v0		# s1 = second int

	# print integer prompt
	li $v0, 4
	la $a0, result
	syscall

	# print first int
	li $v0, 1
	move $a0, $s0
	syscall

	# print space
	li $v0, 11
	la $a0, ' '
	syscall

	# print second int
	li $v0, 1
	move $a0, $s1
	syscall
	
	# print 2 new lines
	li $v0, 4
	la $a0, newline
	syscall
	la $a0, newline
	syscall
	
	
	# TASK 2: Arithmetic Operation Practice
	
	# addition
	add $t0, $s0, $s1	# addition operation
	li $v0, 1
	move $a0, $s0		# print first int
	syscall
	li $v0, 4
	la $a0, add_prompt	# print operand ( + )
	syscall
	li $v0, 1
	move $a0, $s1		# print first int
	syscall
	li $v0, 4
	la $a0, equ_prompt	# print equal ( = )
	syscall
	li $v0, 1
	move $a0, $t0		# print solution
	syscall
	
	li $v0, 4
	la $a0, newline		# print new line
	syscall
	
	# subtraction
	sub $t1, $s0, $s1	# subtraction operation
	li $v0, 1
	move $a0, $s0		# print first int
	syscall
	li $v0, 4
	la $a0, sub_prompt	# print operand ( - )
	syscall
	li $v0, 1
	move $a0, $s1		# print first int
	syscall
	li $v0, 4
	la $a0, equ_prompt	# print equal ( = )
	syscall
	li $v0, 1
	move $a0, $t1		# print solution
	syscall
	
	li $v0, 4
	la $a0, newline		# print new line
	syscall
	
	# multiplication
	mul $t2, $s0, $s1	# subtraction operation
	li $v0, 1
	move $a0, $s0		# print first int
	syscall
	li $v0, 4
	la $a0, mul_prompt	# print operand ( x )
	syscall
	li $v0, 1
	move $a0, $s1		# print first int
	syscall
	li $v0, 4
	la $a0, equ_prompt	# print equal ( = )
	syscall
	li $v0, 1
	move $a0, $t2		# print solution
	syscall
	
	li $v0, 4
	la $a0, newline		# print new line
	syscall
	
	# division
	div $s0, $s1		# division operation
    	mflo $t3		# store quotient
    	mfhi $t4		# store remainder
	li $v0, 1
	move $a0, $s0		# print first int
	syscall
	li $v0, 4
	la $a0, div_prompt	# print operand ( / )
	syscall
	li $v0, 1
	move $a0, $s1		# print first int
	syscall
	li $v0, 4
	la $a0, equ_prompt	# print equal ( = )
	syscall
	
	li $v0, 1
	move $a0, $t3		# print quotient
	syscall
	li $v0, 4
	la $a0, r_format	# print remainder format
	syscall
	li $v0, 1
	move $a0, $t4		# print remainder
	syscall
	
	# print 2 new lines
	li $v0, 4
	la $a0, newline
	syscall
	la $a0, newline
	syscall
	
	
	# TASK 3: Conditions

	# what an if statement
	beq $s0, $s1, equal	# branch on equal
	li $v0, 4		# perform only if numbers are not equal
	la $a0, num_diff
	syscall
	
	# end the program
	j end

equal:
	li $v0, 4
	la $a0, num_same	# print if numbers are same
	syscall

end:
	# exit program
	li $v0, 10
	syscall
