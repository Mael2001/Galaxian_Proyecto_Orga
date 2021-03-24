.global main

main:   
    li $v0, 20
    syscall
    li $a1, 500
    li $a0, 2
    li $v0, 22
    syscall
    li $s1, 1
    li $v0,21
    syscall 


    li $a1, 30
    li $a0, 14
    li $v0, 22
    syscall
    li $s1, 2
    li $v0,21
    syscall

    li $a1, 30
    li $a0, 26
    li $v0, 22
    syscall
    li $s1, 3
    li $v0,21
    syscall
    
    li $a1, 190
    li $a0, 38
    li $v0, 22
    syscall
    li $s1, 4
    li $v0,21
    syscall

    li $v0, 5
    syscall

    #show $v0
    add $a0, $zero, $v0

    ;j galaxian