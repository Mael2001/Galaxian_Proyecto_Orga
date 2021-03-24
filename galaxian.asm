.global galaxian
    .data
    out_string: ;.asciiz "\Desea Continuar?\n"
    .text
galaxian:
    addi $t0, $zero, 1
    bne $t0, $a0, salir
    
    li $s7, 0;highscore
    li $s6, 51; pos player
    li $s5, 90; pos player
    li $s4, 1; stage
    li $s3, 3; lives
    li $s2, 48;pos bala
    li $s1, 90;pos bala
    li $s0, 0; pos enemigo
    li $t9, 0; existe bala
    li $t7, 0; contador para quitar vidas

allocar_enemigos:
    li $t8, 1; allocar enemigos en stack para validaciones

    addi $sp, $sp, -604; reservando espacio
    ;allocando una posicion para cada enemigo
    sw $t8, 0($sp)
    sw $t8, 4($sp)
    sw $t8, 8($sp)
    sw $t8, 12($sp)
    sw $t8, 16($sp)
    sw $t8, 20($sp)
    sw $t8, 24($sp)
    sw $t8, 28($sp)
    sw $t8, 32($sp)
    sw $t8, 36($sp)
    sw $t8, 40($sp)
    sw $t8, 44($sp)
    sw $t8, 48($sp)
    sw $t8, 52($sp)
    sw $t8, 56($sp)
    sw $t8, 60($sp)
    sw $t8, 64($sp)
    sw $t8, 68($sp)
    sw $t8, 72($sp)
    sw $t8, 76($sp)
    sw $t8, 80($sp)
    sw $t8, 84($sp)
    sw $t8, 88($sp)
    sw $t8, 92($sp)
    sw $t8, 96($sp)
    sw $t8, 100($sp)
    sw $t8, 104($sp)
    sw $t8, 108($sp)
    sw $t8, 112($sp)
    sw $t8, 116($sp)
    sw $t8, 120($sp)
    sw $t8, 124($sp)
    sw $t8, 128($sp)
    sw $t8, 132($sp)
    sw $t8, 136($sp)
    sw $t8, 140($sp)
    sw $t8, 144($sp)
    sw $t8, 148($sp)
    sw $t8, 152($sp)
    sw $t8, 156($sp)
    sw $t8, 160($sp)
    sw $t8, 164($sp)
    sw $t8, 168($sp)
    sw $t8, 172($sp)
    sw $t8, 176($sp)
    sw $t8, 180($sp)
    sw $t8, 184($sp)
    sw $t8, 188($sp)
    sw $t8, 192($sp)
    sw $t8, 196($sp)
    sw $t8, 200($sp)
    sw $t8, 204($sp)
    sw $t8, 208($sp)
    sw $t8, 212($sp)
    sw $t8, 216($sp)
    sw $t8, 220($sp)
    sw $t8, 224($sp)
    sw $t8, 228($sp)
    sw $t8, 232($sp)
    sw $t8, 236($sp)
    sw $t8, 240($sp)
    sw $t8, 244($sp)
    sw $t8, 248($sp)
    sw $t8, 252($sp)
    sw $t8, 256($sp)
    sw $t8, 260($sp)
    sw $t8, 264($sp)
    sw $t8, 268($sp)
    sw $t8, 272($sp)
    sw $t8, 276($sp)
    sw $t8, 280($sp)
    sw $t8, 284($sp)
    sw $t8, 288($sp)
    sw $t8, 292($sp)
    sw $t8, 296($sp)
    sw $t8, 300($sp)
    sw $t8, 304($sp)
    sw $t8, 308($sp)
    sw $t8, 312($sp)
    sw $t8, 316($sp)
    sw $t8, 320($sp)
    sw $t8, 324($sp)
    sw $t8, 328($sp)
    sw $t8, 332($sp)
    sw $t8, 336($sp)
    sw $t8, 340($sp)
    sw $t8, 344($sp)
    sw $t8, 348($sp)
    sw $t8, 352($sp)
    sw $t8, 356($sp)
    sw $t8, 360($sp)
    sw $t8, 364($sp)
    sw $t8, 368($sp)
    sw $t8, 372($sp)
    sw $t8, 376($sp)
    sw $t8, 380($sp)
    sw $t8, 384($sp)
    sw $t8, 388($sp)
    sw $t8, 392($sp)
    sw $t8, 396($sp)
    sw $t8, 400($sp)
    sw $t8, 404($sp)
    sw $t8, 408($sp)
    sw $t8, 412($sp)
    sw $t8, 416($sp)
    sw $t8, 420($sp)
    sw $t8, 424($sp)
    sw $t8, 428($sp)
    sw $t8, 432($sp)
    sw $t8, 436($sp)
    sw $t8, 440($sp)
    sw $t8, 444($sp)
    sw $t8, 448($sp)
    sw $t8, 452($sp)
    sw $t8, 456($sp)
    sw $t8, 460($sp)
    sw $t8, 464($sp)
    sw $t8, 468($sp)
    sw $t8, 472($sp)
    sw $t8, 476($sp)
    sw $t8, 480($sp)
    sw $t8, 484($sp)
    sw $t8, 488($sp)
    sw $t8, 492($sp)
    sw $t8, 496($sp)
    sw $t8, 500($sp)
    sw $t8, 504($sp)
    sw $t8, 508($sp)
    sw $t8, 512($sp)
    sw $t8, 516($sp)
    sw $t8, 520($sp)
    sw $t8, 524($sp)
    sw $t8, 528($sp)
    sw $t8, 532($sp)
    sw $t8, 536($sp)
    sw $t8, 540($sp)
    sw $t8, 544($sp)
    sw $t8, 548($sp)
    sw $t8, 552($sp)
    sw $t8, 556($sp)
    sw $t8, 560($sp)
    sw $t8, 564($sp)
    sw $t8, 568($sp)
    sw $t8, 572($sp)
    sw $t8, 576($sp)
    sw $t8, 580($sp)
    sw $t8, 584($sp)
    sw $t8, 588($sp)
    sw $t8, 592($sp)
    sw $t8, 596($sp)
    sw $t8, 600($sp)
    j print_enemies

print_enemies:
    li $v0,20
    syscall
hud:
    li $a1,0
    li $a0, 0
    li $v0, 22
    syscall
    li $s1, 6;score
    li $v0, 21
    syscall
    li $a1, 55
    li $a0, 2
    li $v0, 22
    syscall
    move $a0,$s7
    li $v0, 1 
    syscall
    li $a0, 80
    li $a1, 0
    li $v0, 22
    syscall
    li $s1, 7;vidas
    li $v0, 21
    syscall
    li $a1, 170
    li $a0, 80
    li $v0, 22
    syscall
    li $s1, 8;stages
    li $v0, 21
    syscall
    j begin_for
begin_for:
    li $a0, 15
    li $a1, 30
    li $a2, 30
    li $a3, 147
    j for
for:    ;imprimir enemigos
    addi $t0,$zero, 0
    addi $t1,$zero, 1
    slt $t0,$a2,$a0
    beq $t0, $t1, for_end
    li $a1, 30
    j for2
for2:
    addi $t3,$zero, 0
    addi $t4,$zero, 1
    slt $t3,$a3,$a1
    beq $t4, $t3, for2_end

    li $v0, 22
    syscall
    li $s1,5
    li $v0,21
    syscall
    addi $a1, $a1, 4
    j for2

for2_end:
    addi $a0, $a0, 3
    j for

for_end:
    move $a0,$s6; jugador
    move $a1,$s5
    li $v0, 22
    syscall
    li $s1,9
    li $v0,21
    syscall

empieza:
    li $v0, 25
    syscall
    bne $v0,$zero, key 
    j empieza
key:

    li $t6, 1
    mult $t6, $s4; dificultad
    mflo $t6
    add $t7, $t7, $t6
    addi $t5, $zero, 100
    slt $t6, $t5, $t7  
    bne $t6, $zero, quitar_vida


    addi $t5, $zero, 1000
    slt $t6, $t5, $s7  
    bne $t6, $zero, agregar_vida

    
    li $v0, 26
    syscall

    bne $v0,$zero, imprimir_der
    beq $v0,$zero, imprimir_izq


    j key

print_bala:
    slti $v0, $s2, 30
    addi $s2, $s2, -3
    add $s1, $zero, $s5
    move $a0,$s2
    move $a1,$s1
    li $v0, 22
    syscall
    li $a0, 124
    li $v0, 11
    syscall 
    beq $v0, $zero, hit_bala

    jr $ra

hit_bala:
    move $s2, $s6
    addi $s7,$s7, 200;highscore
    jr $ra
    
imprimir_izq:
    addi $s7,$s7, 1;highscore

    jal upd_hud
    li $a0, 15
    li $a1, 22
    li $a2, 30
    li $a3, 143
    add $s0, $zero, $a1
    jal upd_enemigo
    
    addi $s5, $s5,-4    
    j print_player
    
imprimir_der:
    addi $s7,$s7, 1;highscore

    jal upd_hud
    li $a0, 15
    li $a1, 30
    li $a2, 30
    li $a3, 151
    add $s0, $zero, $a1
    jal upd_enemigo

    addi $s5, $s5,4
    j print_player

print_player:
    jal print_bala

    move $a0,$s6; jugador
    move $a1,$s5
    li $v0, 22
    syscall
    li $s1,9
    li $v0,21
    syscall
    li $a0, 10
    li $v0, 11
    syscall 
    j empieza

upd_enemigo:
    for_upd:    ;imprimir enemigos
    addi $t0,$zero, 0
    addi $t1,$zero, 1
    slt $t0,$a2,$a0
    beq $t0, $t1, for_end_upd
    add $a1, $zero, $s0
    j for2_upd
    for2_upd:
    addi $t3,$zero, 0
    addi $t4,$zero, 1
    slt $t3,$a3,$a1
    beq $t4, $t3, for2_end_upd

    li $v0, 22
    syscall
    li $s1,5
    li $v0,21
    syscall
    addi $a1, $a1, 4
    j for2_upd

    for2_end_upd:
    addi $a0, $a0, 3
    j for_upd

    for_end_upd:
    jr $ra

agregar_vida:
    addi $s3, $s3, 1
    bne $v0,$zero, imprimir_der
    beq $v0,$zero, imprimir_izq


quitar_vida:
    addi $t7, $zero, 0
    addi $s3, $s3, -1
    #show $t3
    beq $s3,$zero, salir
    bne $v0,$zero, imprimir_der
    beq $v0,$zero, imprimir_izq

upd_hud:
    li $v0,20
    syscall
    li $a1,0
    li $a0, 0
    li $v0, 22
    syscall
    li $s1, 6;score
    li $v0, 21
    syscall
    li $a1, 55
    li $a0, 2
    li $v0, 22
    syscall
    move $a0,$s7
    li $v0, 1 
    syscall
    li $a0, 80
    li $a1, 0
    li $v0, 22
    syscall
    li $s1, 7;vidas
    li $v0, 21
    syscall
    li $a1, 170
    li $a0, 80
    li $v0, 22
    syscall
    li $s1, 8;stages
    li $v0, 21
    syscall
    jr $ra

salir:
    ;li $v0,20;limpiar
    ;syscall

    addi $sp, $sp,604; liberando espacio

    ;la $a0, out_string;mensaje de volver a jugar
    ;li $v0,4
    ;syscall
    ;li $v0,5;ver si quiere jugar de nuevo
    ;syscall
    ;bne $zero, $t0, galaxian
