        .section .rodata        @ declare une section donnees lecture seule
        .align 2                @ aligne le debut de section sur un mot de 32 bits
                                @ (2^2 = 4 octets)
message:                        @ label, etiquette (permet de conserver l'adresse)
        .string "Hello, world!" @ compile une chaîne de charactères


        .text                   @ declare une section de code
        .align 2
        .global main            @ declare un symbole global, visible par le linker
main:                           @ debut de la fonction main
        stmfd   sp!, {lr}       @ on sauvegarde l'adresse de retour sur la pile
        ldr     r0, =message    @ on charge dans r0 l'adresse de la chaine
        bl      puts            @ on saute au code de la fonction puts
        ldmfd   sp!, {lr}       @ on retablit l'adresse de retour
        bx      lr              @ on saute a l'adresse de retour                                                  
