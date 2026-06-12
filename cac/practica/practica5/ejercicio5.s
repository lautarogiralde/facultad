Registros      Nombres      ¿Para que se los utiliza?                           ¿Preservado? 
    r0          $zero           Siempre 0                                           Si
    r1          $at             Reservado para uso del ensamblado                   No
    r2-r3       $v0-$v1         Valor retornado por subrutina                       No
    r4-r7       $a0-$a3         Argumentos de subrutinas                            No
    r8-r15      $t0-$t7         Temporales                                          No
    r16-r23     $s0-$s7         Variables de subrutinas                             Si
    r24-r25     $t8-$t9         Temporales                                          No
    r26-r27     $k0-$k1         Usados por el manejador de interrupciones           No
    R28         $gp             Puntero global (acceso a static/extern)             Si
    R29         $sp             Puntero de pila                                     Si
    R30         $fp             Frame pointer                                       Si
    R31         $ra             Retorno de subrutinas                               No