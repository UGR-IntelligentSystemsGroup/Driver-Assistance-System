(define (domain GantaBi)
    (:requirements :adl :typing :fluents :derived-predicates :htn-expansion :durative-actions :equality :metatags :timed-initial-literals)

    ; =========================================================================
    ; TYPES
    ; =========================================================================
    (:types
        TaskSymbol
        TaskInstanceSymbol
        TipoAccion
        Driver
        Semana
        Mensaje
        context 
            - object
    )

    ; =========================================================================
    ; CONSTANTS
    ; =========================================================================

    (:constants
        DIA_CONSUMIDO SECUENCIA_TERMINADA BREAK_CONSIDERED_REST PAUSE_CONSIDERED_BREAK FALLO_LATASK- Mensaje

        Procesa_Accion - TaskSymbol

        typeD typeO typeB typeI - TipoAccion

        ; Contexts
        A I B_T0 B_T1 B_T2 B_T3 B_T4 B_T5 B_T6 B_T7 B_T10   ; Token
        split split_1 split_2 uninterrupted                                 ; BreakType
        first second third unique                           ; Sequence
        ndd edd                                             ; DayType
        wd bwd month none - context
    )

    ; =========================================================================
    ; PREDICATES
    ; =========================================================================

    (:predicates
        (modo_generar)
        (modo_reconocer)

        (dia_consumido)

        (task_failed ?t - TaskSymbol) ;para saber si una task ha fallado, se añade como efecto en los métodos de fallo de tarea

        (inicio_semana ?s - Semana ?i - number)
        (fin_semana ?s - Semana ?f - number)

        ; Contexts
        (token-context ?tkctxt - context)
        (sequence-context ?seqctxt - context)
        (breakType-context ?drivctxt - context)
        (dayType-context ?dayctxt - context)
        (weekly-context ?weectxt - context)
        (monthly-context ?monctxt - context)

        ;;***********************************
        ;; TOKEN conditions
        ;;**********************************
        (current_action_is_a_break_greater_15)

        ;;**********************************
        ;;	 FEASIBILITIY conditions
        ;;**********************************
        (conditions_NDD ?d - Driver)
        (less_than_15min ?d)

        (puede_otros_NORMAL ?d - Driver)
        (puede_parada_NORMAL ?d - Driver)
        (puede_espera_NORMAL ?d - Driver)

        (puede_conducir_AMPLIADA ?d - Driver)
        (puede_otros_AMPLIADA ?d - Driver)
        (puede_parada_AMPLIADA ?d - Driver)
        (puede_espera_AMPLIADA ?d - Driver)

        (continuar_recursion)

        (secuencia_entrada_vacia)
        (secuencia_entrada_no_vacia)
        (fin_secuencia_entrada)

        ;REPRESENTACION DE UNA ACCION PRIMITIVA EN EL PROBLEMA
        (is_action ?sa - TaskInstanceSymbol) ; cada accion tiene un simbolo asociado este simbolo es de tipo accion 
        (index_action ?sa - TaskInstanceSymbol ?i - number); UN array simulado: cada simbolo de accion tiene asociado un indice, que empieza en 0, el indice indica la posición en la secuencia
        
        ;(= (start_action C1) "01/07/2018 00:00:00"); las acciones tienen un punto de inicio. Ejemplo de Representación como funcion
        (start_action ?sa - TaskInstanceSymbol ?s - number); Todavía no se que representacion es mejor: como predicado o commo funcion
        ;(= (end_action C1) "01/07/2018 00:37:00"); ... y un punto de fin
        (end_action ?sa - TaskInstanceSymbol ?e - number)
        ;(= (duration_action C1) 37); ... y una duracion
        (duration_action ?sa - TaskInstanceSymbol ?d - number)

        ;PREDICADOS PARA REPRESENTAR DE QUÉ TIPO ES CADA ACCION
        (is_typeD ?sa - TaskInstanceSymbol) ; es una accion de tipo conducir
        (is_typeO ?sa - TaskInstanceSymbol) ; es una accion de tipo OTROS
        (is_typeB ?sa - TaskInstanceSymbol) ; es una accion de tipo PAUSA
        (is_typeI ?sa - TaskInstanceSymbol) ; es una accion de tipo ESPERA

        ;asi es como se representa un "hecho de tipo accion"
        (parameters_typeD ?sa - TaskInstanceSymbol ?d - Driver); interpretese: los parametros CONCRETOS (estado inicial) de la accion ?sa son: ?d - Driver. 
        (parameters_typeO ?sa - TaskInstanceSymbol ?d - Driver); interpretese: los parametros CONCRETOS (estado inicial) de la accion ?sa son: ?d - Driver. 
        (parameters_typeB ?sa - TaskInstanceSymbol ?d - Driver); interpretese: los parametros CONCRETOS (estado inicial) de la accion ?sa son: ?d - Driver. 
        (parameters_typeI ?sa - TaskInstanceSymbol ?d - Driver); interpretese: los parametros CONCRETOS (estado inicial) de la accion ?sa son: ?d - Driver. 

        (currentindex_is_typeD ?k - number ?sa - TaskInstanceSymbol)
        (currentindex_is_typeO ?k - number ?sa - TaskInstanceSymbol)
        (currentindex_is_typeB ?k - number ?sa - TaskInstanceSymbol)
        (currentindex_is_typeI ?k - number ?sa - TaskInstanceSymbol)

        ; Depuración
        (modo_depuracion)
        (DEBUG ?msg - Mensaje)
    )

    ; =========================================================================
    ; FUNCTIONS
    ; =========================================================================

    (:functions
        (current_index_action) ; represnta el indice actual que apunta a la accion que hay que procesar en modo reconocer

        ;ACUMULADORES TOTALES
        (tiempo_conduccion ?d - Driver)
        (tiempo_otros ?d - Driver)
        (tiempo_parada ?d - Driver)
        (tiempo_espera ?d - Driver)

        ;ACUMULADORES POR SEMANA
        (tiempo_conduccion_semana ?d - Driver)
        (tiempo_otros_semana ?d - Driver)
        (tiempo_parada_semana ?d - Driver)
        (tiempo_espera_semana ?d - Driver)

        ;ACUMULADORES POR DIA
        (dt_dd)         ; Driving time for a daily drive
        (dt_cdd)        ; Driving time for a continuous daily drive (<4.5h)
        (dt_cdd_unint)  ; Driving time for an uninterrupted cdd   
        (dt_cdd_split1) ; Driving time for the first split of a cdd   
        (dt_cdd_split2)
        (dt_activity)   ; Driving time for a sequence of activities

        (bt_dd)
        (bt_cdd)
        (bt_cdd_unint)
        (bt_cdd_split1)
        (bt_cdd_split2)
        ; (bt_activity)

        (current_bt) ;tiempo de descanso actual, se entiende que el recién reconocido
        (current_dt) ;current driving time of the recently recognized activity

        (dt_day ?d - Driver)
        (dt_current_slice) ;driving time current detected subsequence 
        (bt_current_slice)
        (dt_last_slice) ;driving time last detected subsequence
        (dt_current_cdd_t2_slice)
        (bt_current_cdd_t2_slice)
        (dt_current_cdd_t2_sequence) ;accumulated driving time of the current cdd_t2 sequence detected
        (bt_current_cdd_t2_sequence) ;accumulated break time of the current cdd_t2 sequence detected
        (dt_current_CDD_T1_start)
        (dt_current_CDD_T1_END)
        (dt_current_CDD_T2_END)
        (dt_current_CDD_T2_START)
        (dt_current_CDDs_E)
        (dt_current_CDDs_S)
        (dt_last_CDDs_S)
        (dt_current_cdd)

        (tiempo_otros_dia ?d - Driver)
        (tiempo_parada_dia ?d - Driver)
        (tiempo_espera_dia ?d - Driver)


        (minutos_consumidos)

        (contador_veces_AMPLIADA_en_semana)

        ; en el  modo generar la duración de la conducción dependerá del tipo de conductor
        ; esto es un ejemplo y se podría hacer directamente sin codigo python 
        ; PINTA QUE ESTÁ INCOMPLETO, NO? Debería calcular la duración en base al tiempo restante
        (calcula_duracion_C ?d) { return 4 }
        (calcula_duracion_O ?d) { return 2 } ; lo mismo para OPE
        (calcula_duracion_P ?d) { return 2 }
        (calcula_duracion_E ?d) { return 2 }

        ; Time constants
        ; (one_year) { return 365.0*24.0 }
        ; (one_month) { return 30.0*24.0 }
        (hours_in_mins)
    )

    ; =========================================================================
    ; DERIVED
    ; =========================================================================

    ; Depuración
    (:derived (task_failed ?p) { 
            print "HA FALLADO", ?p 
            return 1 
        }
    )

    ; -------------------------------------------------------------------------
    ; Condiciones para realizar una acción

    (:derived (conditions_NDD ?d)
        (AND
            (<= (dt_day ?d) (* 9 (hours_in_mins)))
        )
    )

    (:derived (puede_otros_NORMAL ?d)
        (AND
            (<= (tiempo_otros_dia ?d) (* 5 (hours_in_mins)))
        )
    )

    (:derived (puede_parada_NORMAL ?d)
        (AND
            (<= (tiempo_parada_dia ?d) (* 5 (hours_in_mins)))
        )
    )

    (:derived (puede_espera_NORMAL ?d)
        (AND
            (<= (tiempo_espera_dia ?d) (* 5 (hours_in_mins)))
        )
    )

    (:derived (puede_conducir_AMPLIADA ?d)
        (AND
            (<= (dt_day ?d) (* 10 (hours_in_mins)))
            (<= (contador_veces_AMPLIADA_en_semana) 2)
        )
    )

    ; -------------------------------------------------------------------------

    (:derived (fin_secuencia_entrada)
        (AND
            (bind ?k
                (current_index_action));calcula el valor del  index ACTUAL
            (not (index_action ?una_accion ?k));comprueba que no  hay alguna accion con index+1 asociado
        )
    )

    (:derived (secuencia_entrada_no_vacia)
        (AND
            (bind ?k
                (current_index_action));calcula el valor de index
            (index_action ?una_accion ?k);comprueba si hay alguna accion con index asociado
        )
    )

    (:derived (dia_consumido)
        (AND
            ( > (minutos_consumidos) (* 24 (hours_in_mins)))
        )
    )

    (:derived (continuar_recursion)
        (AND
            ( <= (minutos_consumidos) (* 24 (hours_in_mins)))
            (secuencia_entrada_no_vacia)
        )
    )

    (:derived (less_than_15min ?d)
        (AND
            (<= (dt_day ?d) (* 9 (hours_in_mins)))
        )
    )

    (:derived (current_action_is_a_break_greater_15)
        (AND
            (currentindex_is_typeB ?k ?sa)
            (duration_action ?sa ?dur)
            (>= ?dur 15)
        )
    )

    ; =========================================================================
    ; TASKS
    ; =========================================================================

    ; Daily Driving
    (:task DD
        :parameters (?d - Driver)
        (:method ndd
            :precondition (secuencia_entrada_no_vacia)
            :tasks (
                (reset_counters)

                (b_dayType NDD)
                (NDD ?d)
                (e_dayType NDD)

                (print_new_day)
                (DD ?d)
            )
        )
        
        (:method edd
            :precondition (secuencia_entrada_no_vacia)
            :tasks (
                (reset_counters)

                (b_dayType EDD)
                (EDD ?d)
                (e_dayType EDD)

                (print_new_day)
                (DD ?d)
            )
        )

        ; Anomaly? Hace que termine la secuencia no reconocida
        (:method rest_day
            :precondition (secuencia_entrada_no_vacia)
            :tasks (
                (RD ?d)
                (print_new_day)
                (DD ?d)
            )
        )

        ; PUEDE QUE NO FUNCIONE
        (:method ignore_action ;anomaly
            :precondition (secuencia_entrada_no_vacia)
            :tasks (
                (reset_counters)
                (Process_A ?d)
                (DD ?d)
            )
        )

        (:method end
            :precondition ()
            :tasks (
                (:inline
                    (:print "# Salgo\n")
                    ()
                )
            )
        )
    )

    ; -------------------------------------------------------------------------

    ; Search for new sequence
    (:task reset_counters
        :parameters () 
        (:method SINGLE
            :precondition ()
            :tasks (
                (:inline
                    ()
                    (and
                        (assign (dt_dd) 0)
                        (assign (dt_cdd) 0)
                        (assign (dt_cdd_unint) 0)
                        (assign (dt_cdd_split1) 0)
                        (assign (dt_cdd_split2) 0)
                        (assign (dt_activity) 0)

                        (assign (bt_dd) 0)
                        (assign (bt_cdd) 0)
                        (assign (bt_cdd_unint) 0)
                        (assign (bt_cdd_split1) 0)
                        (assign (bt_cdd_split2) 0)
                    )
                )
            )
        )
    )

    ; -------------------------------------------------------------------------

    ; Normal Daily Driving - <9h driving total
    (:task NDD
        :parameters (?d - Driver) 
        (:method SINGLE
            :precondition()
            :tasks (
                (b_sequence first)
                (CDD ?d)
                (e_sequence first)

                (:inline
                    ()
                    (and
                        (assign (dt_dd) (dt_cdd))
                        (assign (bt_dd) (bt_cdd))
                    )
                )

                ; To ensure no RD in first CDD
                (:inline
                    (<= (bt_dd) (* 3.0 (hours_in_mins)))
                    ()
                )

                ; -------------------------------------------

                (b_sequence second)
                (CDD ?d)
                (e_sequence second)

                (:inline
                    ()
                    (and
                        (increase (dt_dd) (dt_cdd))
                        (increase (bt_dd) (bt_cdd))
                    )
                )

                ; -------------------------------------------

                (:inline
                    (<= (dt_dd) (* 9.0 (hours_in_mins)))
                    ()
                )

                ; To ensure RD after second CDD
                (:inline
                    (>= (bt_cdd) (* 9.0 (hours_in_mins)))
                    ()
                )
            )
        )

        ; No breaks, ending in RD
        (:method unique
        	:precondition()
        	:tasks ( 
                (b_sequence unique)
                (CDD ?d)
                (e_sequence unique)

        		(:inline
                    ()
                    (and
                        (assign (dt_dd) (dt_cdd))
                        (assign (bt_dd) (bt_cdd))
                    )
                )

                ; Similar to break periods, rest periods can also be taken in two parts, whereas the first part must have a duration of at least three hours and the second part must have a duration of at least nine hours.
                ; To ensure RD after CDD
                (:inline
                    (>= (bt_dd) (* 9.0 (hours_in_mins)))
                    ()
                )
            )
        )
    )
    
    ; -------------------------------------------------------------------------

    ; Extended Daily Driving - <10h driving total
    (:task EDD
        :parameters (?d - Driver) 
        (:method edd
            :precondition()
            :tasks (
                (b_sequence first)
                (CDD ?d)
                (e_sequence first)

                (:inline
                    ()
                    (and
                        (assign (dt_dd) (dt_cdd))
                        (assign (bt_dd) (bt_cdd))
                    )
                )

                ; -------------------------------------------

                (b_sequence second)
                (CDD ?d)
                (e_sequence second)

                (:inline
                    ()
                    (and
                        (increase (dt_dd) (dt_cdd))
                        (increase (bt_dd) (bt_cdd))
                    )
                )

                ; -------------------------------------------

                (b_sequence third)
                (CDD ?d)
                (e_sequence third)

                (:inline
                    ()
                    (and
                        (increase (dt_dd) (dt_cdd))
                        (increase (bt_dd) (bt_cdd))
                    )
                )

                ; -------------------------------------------

                (:inline
                    (<= (dt_dd) (* 10.0 (hours_in_mins)))
                    ()
                )

                ; To ensure RD after CDD
                (:inline
                    (>= (bt_cdd) (* 3.0 (hours_in_mins)))
                    ()
                )
            )
        )
    )

    ; -------------------------------------------------------------------------

    ; Continuous Daily Driving -> <4.5h
    (:task CDD
        :parameters (?d - Driver) 
        ; Uninterr (normal, no splits)
        (:method uninterrupted
            :precondition()
            :tasks (
                (b_breakType uninterrupted)
                (CDD_UNINT ?d)
                (e_breakType uninterrupted)

                (:inline
                    ()
                    (and
                        (assign (dt_cdd) (dt_cdd_unint))
                        (assign (bt_cdd) (bt_cdd_unint))
                    )
                )
            )
        )

        ; Type 2 (with a split)
        (:method split
            :precondition()
            :tasks (
                ; (b_breakType split)
                (b_breakType split_1)
                (CDD_SPLIT_1 ?d)
                (e_breakType split_1)
                (b_breakType split_2)
                (CDD_SPLIT_2 ?d)
                (e_breakType split_2)
                ; (e_breakType split)

                (:inline
                    ()
                    (and
                        (assign (dt_cdd) (+ (dt_cdd_split1) (dt_cdd_split2)))
                        (assign (bt_cdd) (+ (bt_cdd_split1) (bt_cdd_split2)))
                    )
                )
            )
        )

        ; Technically the splits are not permutable
        ; (:method split2
        ;     :precondition()
        ;     :tasks (
        ;         ; Reset CDD counters
        ;         (:inline
        ;             ()
        ;             (and
        ;                 (assign (dt_cdd) 0)
        ;                 (assign (bt_cdd) 0)
        ;             )
        ;         )
            
        ;         (b_breakType split)
        ;         (CDD_SPLIT_2 ?d)
        ;         (CDD_SPLIT_1 ?d)
        ;         (e_breakType split)

        ;         (:inline
        ;             ()
        ;             (and
        ;                 (increase (dt_cdd) (+ (dt_cdd_split1) (dt_cdd_split2)))
        ;                 (increase (bt_cdd) (+ (bt_cdd_split1) (bt_cdd_split2)))
        ;             )
        ;         )
        ;     )
        ; )
    )

    ; -------------------------------------------------------------------------

    (:task CDD_Unint
        :parameters (?d - Driver) 
        (:method B_T1
            :precondition()
            :tasks (
                (A ?d)

                (:inline
                    (<= (dt_activity) (* 4.5 (hours_in_mins)))
                    ()
                )

                (:inline
                    ()
                    (assign (dt_cdd_unint) (dt_activity))
                )

                (B_T1 ?d)

                (:inline
                    ()
                    (assign (bt_cdd_unint) (current_bt))
                )
            )
        )

        (:method RD
            :precondition()
            :tasks (
                (A ?d)

                (:inline
                    (<= (dt_activity) (* 4.5 (hours_in_mins)))
                    ()
                )

                (:inline
                    ()
                    (assign (dt_cdd_unint) (dt_activity))
                )

                (RD ?d)

                (:inline
                    ()
                    (assign (bt_cdd_unint) (current_bt))
                )
            )
        )
    )

    ; -------------------------------------------------------------------------

    (:task CDD_SPLIT_1
        :parameters (?d - Driver)
        (:method B_T2
            :precondition()
            :tasks (
                (A ?d)

                (:inline
                    ()
                    (assign (dt_cdd_split1) (dt_activity))
                )

                (B_T2 ?d)

                (:inline
                    ()
                    (assign (bt_cdd_split1) (current_bt))
                )
            )
        )
    )

    ; -------------------------------------------------------------------------

    (:task CDD_SPLIT_2
        :parameters (?d - Driver)
        (:method B_T3
            :precondition()
            :tasks (
                (A ?d)

                (:inline
                    ()
                    (assign (dt_cdd_split2) (dt_activity))
                )

                (B_T3 ?d)

                (:inline
                    ()
                    (assign (bt_cdd_split1) (current_bt))
                )
            )
        ) 

        (:method RD
            :precondition()
            :tasks (
                (A ?d)

                (:inline
                    ()
                    (assign (dt_cdd_split2) (dt_activity))
                )

                (RD ?d)

                (:inline
                    ()
                    (assign (bt_cdd_unint) (current_bt))
                )

                ; (:inline
                ;     (AND
                ;         (<= (+ (dt_current_cdd_t2_sequence) (dt_last_slice)) 270); (* (hours_in_mins) 4.5))
                ;         (>= (bt_current_cdd_t2_sequence) 15))
                ;     ()
                ; )
                ; (:inline
                ;     ()
                ;     (assign
                ;         (dt_cdd_split2)
                ;         (+ (dt_current_cdd_t2_sequence) (dt_last_slice)))
                ; )
            )
        )
    )
    
    ; ****************************
    ; Rests
    ; ****************************

    ; Daily rest
    (:task RD
        :parameters (?d - Driver) 
        ; Reduced daily rest
        (:method B_T5 ; Break of [9h, 11h)
            :precondition ()
            :tasks (
                (b_token B_T5)
                (B ?d ?dur)
                (:inline
                    (and (>= ?dur (* 9 (hours_in_mins))) (< ?dur (* 11 (hours_in_mins))))
                    ()
                )
                (e_token B_T5)

                (:inline
                    ()
                    (and
                        (assign (minutos_consumidos) 0)
                        (increase (tiempo_parada_dia ?d) ?dur)
                        (assign (current_bt) ?dur)
                        (assign (dt_activity) 0)
                    )
                )
            )
        ) 
        
        ; Normal daily rest
        (:method B_T6 ; BREAK OF [11h, 24h)
            :precondition ()
            :tasks (
                (b_token B_T6)
                (B ?d ?dur)
                (:inline
                    (and (>= ?dur (* 11 (hours_in_mins))) (< ?dur (* 24 (hours_in_mins))))
                    ()
                )
                (e_token B_T6)

                (:inline
                    ()
                    (and
                        (assign (minutos_consumidos) 0)
                        (increase (tiempo_parada_dia ?d) ?dur)
                        (assign (current_bt) ?dur)
                        (assign (dt_activity) 0)
                    )
                )
            )
        )

        (:method B_T10 ; BREAK OF [45h,infty) Weekly rest
            :precondition ()
            :tasks (
                (b_token B_T10)
                (B ?d ?dur)
                (:inline
                    (>= ?dur (* 45 (hours_in_mins)))
                    ()
                )
                (e_token B_T10)

                (:inline
                    ()
                    (and
                        (assign (minutos_consumidos) 0)
                        (increase (tiempo_parada_dia ?d) ?dur)
                        (assign (current_bt) ?dur)
                        (assign (dt_activity) 0)
                    )
                )
            )
        )
    )


    ; ****************************
    ; Breaks
    ; ****************************

    ; BREAK OF [45min, 3h)
    (:task B_T1
        :parameters (?d - Driver)
        (:method B_T1
            :precondition ()
            :tasks (
                (b_token B_T1)		
                (B ?d ?dur)
                (:inline
                    (and (>= ?dur 45) (< ?dur (* (hours_in_mins) 3.5)))
                    ()
                )
                (e_token B_T1)

                (:inline
                    ()
                    (and
                        (increase (minutos_consumidos) ?dur)
                        (increase (tiempo_parada_dia ?d) ?dur)
                        (assign (current_bt) ?dur)
                        (assign (bt_current_slice) ?dur)
                        (assign (current_dt) 0)
                        (assign (dt_activity) 0)
                    )
                )
            )
        )
    )

    ; -------------------------------------------------------------------------

    ; BREAK OF [15min, 30) -> LO AMPLÍO PARA NO SER ESTRICTO
    (:task B_T2
        :parameters (?d - Driver) 
        (:method B_T2
            :precondition ()
            :tasks (
                (b_token B_T2)
                (B ?d ?dur)
                (:inline
                    (and (>= ?dur 15) (< ?dur 45))
                    ()
                )
                (e_token B_T2)

                (:inline
                    ()
                    (and
                        (increase (minutos_consumidos) ?dur)
                        (increase (tiempo_parada_dia ?d) ?dur)
                        (assign (current_bt) ?dur)
                        (assign (bt_current_slice) ?dur)
                        (assign (current_dt) 0)
                        (assign (dt_activity) 0)
                    )
                )
            )
        )
    )

    ; -------------------------------------------------------------------------

    ; BREAK OF [30min, 45min). Ahora lo he puesto [30min, 3h)
    (:task B_T3
        :parameters (?d - Driver) 
        (:method B_t3 
            :precondition ()
            :tasks (
                (b_token B_T3)
                (B ?d ?dur)
                (:inline
                    ; (and (>= ?dur 30) (< ?dur (* (hours_in_mins) 3)))
                    (and (>= ?dur 30) (< ?dur 60))
                    ()
                )
                (e_token B_T3)

                (:inline
                    ()
                    (and
                        (increase (minutos_consumidos) ?dur)
                        (increase (tiempo_parada_dia ?d) ?dur)
                        (assign (current_bt) ?dur)
                        (assign (bt_current_slice) ?dur)
                        (assign (current_dt) 0)
                        (assign (dt_activity) 0)
                    )
                )
            )
        )
    )
    
    ; -------------------------------------------------------------------------
    ; Recognizes a sequence of Activities (D|O|B|I) such that dur(B)< 15mins

    (:task A
        :parameters (?d - Driver) 
        (:method recurrir
            :precondition (continuar_recursion)
            :tasks (
                (Process_A ?d)

                (:inline
                    (< (current_bt) 15)
                    ()
                )

                (:inline
                    ()
                    (increase (dt_activity) (current_dt))
                );calculates driving time of current subsequence

                (A ?d))
        ) 
        
        ;aquí viene porque se encontró un B con una duración mayor de 15 mins
        (:method caso_base0
            :precondition (and 
                (current_action_is_a_break_greater_15) 
                ; (:print "PAUSE_CONSIDERED_BREAK\n")
            ) 
            :tasks(

            );(MSG_INFO PAUSE_CONSIDERED_BREAK) 
        ) 
        
        ; aquí se acabó el día. Cuando sale por aquí ha reconocido una secuencia de 24 horas. CORRECTO  Y DEBE CONTINUAR
        (:method dia_consumido
            :precondition (dia_consumido)
            :tasks (
                EndOfDay
            );(MSG_INFO DIA_CONSUMIDO))
        ) 
        
        ; aquí se acabó la secuencia de acciones, cuando sale por aquí se le ha acabado la secuencia y CORRECTO Y DEBE TERMINAR
        (:method fin_secuencia_entrada
            :precondition (fin_secuencia_entrada)
            :tasks (
                EndOfSequece
            );(MSG_INFO SECUENCIA_TERMINADA) )
        ) 
        
        ; AQUÍ HA HABIDO UN FALLO: SE DAN las condiciones de recursión, pero NO SE HA PODIDO PROCESAR si continua recursion y no ha entrado en ninguno de los metodos anteriores
        (:method fallar
            :precondition (
                ; :print "FALLO_LATASK\n"
            )
            :tasks (
                ; :inline
                ;     (task_failed task_A)
                ;     ()
            )
        )
    )

    ; -------------------------------------------------------------------------

    ; Process activity
    (:task Process_A
        :parameters (?d - Driver) 
        ; Driving
        (:method DXX
            :precondition ()
            :tasks (
                (b_token A)
                (D ?d ?dur)
                (e_token A)

                (:inline
                    ()
                    (and
                        (increase (minutos_consumidos) ?dur)
                        (increase (dt_day ?d) ?dur)
                        (assign (current_bt) 0)
                        (assign (current_dt) ?dur)
                    )
                )
            )
        ) 
        
        ; Other
        (:method OXX
            :precondition ()
            :tasks (
                (b_token A)
                (O ?d ?dur)
                (e_token A)

                (:inline
                    ()
                    (and
                        (increase (minutos_consumidos) ?dur)
                        (increase (tiempo_otros_dia ?d) ?dur)
                        (assign (current_bt) 0)
                        (assign (current_dt) 0)
                    )
                )
            )
        ) 
        
        ; Breaks
        (:method B_T0 ; BREAK of [0,15min)
            :precondition ()
            :tasks (
                (b_token B_T0)
                (B ?d ?dur)
                (:inline
                    (and (< ?dur 15))
                    ()
                )
                (e_token B_T0)

                (:inline
                    ()
                    (and
                        (increase (minutos_consumidos) ?dur)
                        (increase (tiempo_parada_dia ?d) ?dur)
                        (assign (current_bt) ?dur)
                        (assign (current_dt) 0)
                        ; (assign (dt_activity) 0)
                    )
                )
            )
        ) 
        
        (:method B_T2 ; BREAK of [15min, 30min)
            :precondition ()
            :tasks (
                (b_token B_T2)
                (B ?d ?dur)
                (:inline
                    (and (>= ?dur 15) (< ?dur 30))
                    ()
                )
                (e_token B_T2)

                (:inline
                    ()
                    (and
                        (increase (minutos_consumidos) ?dur)
                        (increase (tiempo_parada_dia ?d) ?dur)
                        (assign (current_bt) ?dur)
                        (assign (current_dt) 0)
                        (assign (dt_activity) 0)
                    )
                )
            )
        ) 
        
        (:method B_T3 ; BREAK OF [30min, 45min) - Está puesto hasta 3h
            :precondition ()
            :tasks (
                (b_token B_T3)
                (B ?d ?dur)
                (:inline
                    ; (and (>= ?dur 30) (< ?dur (* (hours_in_mins) 3)))
                    (and (>= ?dur 30) (< ?dur 60))
                    ()
                )
                (e_token B_T3)

                (:inline
                    ()
                    (and
                        (increase (minutos_consumidos) ?dur)
                        (increase (tiempo_parada_dia ?d) ?dur)
                        (assign (current_bt) ?dur)
                        (assign (current_dt) 0)
                        (assign (dt_activity) 0)
                    )
                )
            )
        )
                
        (:method B_T1 ; BREAK OF [45min, 3h)
            :precondition ()
            :tasks (
                (b_token B_T1)
                (B ?d ?dur)
                (:inline
                    (and (>= ?dur 45) (< ?dur (* (hours_in_mins) 3.5)))
                    ()
                )
                (e_token B_T1)

                (:inline
                    ()
                    (and
                        (increase (minutos_consumidos) ?dur)
                        (increase (tiempo_parada_dia ?d) ?dur)
                        (assign (current_bt) ?dur)
                        (assign (current_dt) 0)
                        (assign (dt_activity) 0)
                    )
                )
            )
        )

        (:method B_T4 ; BREAK OF [3h, 9h)
            :precondition ()
            :tasks (
                (b_token B_T4)
                (B ?d ?dur)
                (:inline
                    (and (>= ?dur (* (hours_in_mins) 3)) (< ?dur (* (hours_in_mins) 9)))
                    ()
                )
                (e_token B_T4)

                (:inline
                    ()
                    (and
                        (increase (minutos_consumidos) ?dur)
                        (increase (tiempo_parada_dia ?d) ?dur)
                        (assign (current_bt) ?dur)
                        (assign (current_dt) 0)
                        (assign (dt_activity) 0)
                    )
                )
            )
        )
        
        ; Idle
        (:method IXX
            :precondition (puede_espera_NORMAL ?d)
            :tasks (
                (b_token I)
                (I ?d ?dur)
                (e_token I)

                (:inline
                    ()
                    (and
                        (increase (minutos_consumidos) ?dur)
                        (increase (tiempo_espera_dia ?d) ?dur)
                        (assign (current_bt) 0)
                        (assign (current_dt) 0)
                    )
                )
            )
        )
    )

    ; -------------------------------------------------------------------------

    (:task break
        :parameters () 
        (:method unico
            :precondition ()
            :tasks ()
        )
    )

    ; -------------------------------------------------------------------------
    ; PROCESS ACTIVITY

    (:derived
        (DEBUG ?mensaje)
        (OR
            (AND
                (modo_depuracion)
                (:print ?mensaje)
            )
            ()
        )
    )

    ; -------------------------------------------------------------------------

    (:task MSG_INFO
        :parameters (?msg - object) 
        (:method unico
            :precondition (DEBUG ?msg)
            :tasks ()
        )
    )

    ; =========================================================================
    ; Debug
    ; =========================================================================

    (:durative-action print_new_day
	    :parameters ()
	    :meta (
            (:tag prettyprint "# ----------------------------------------------------NEW DAY----------------------------------------------------
#Driver	DateTimeStart	DateTimeEnd	Duration(min)	Activity	DayType	Sequence	BreakType	Token"))
            :duration ()
            :condition (:print "> One Driving Day processed\n")
            :effect ()
    )

    ; =========================================================================
    ; Actions
    ; =========================================================================

    (:action EndOfDay ;
        :parameters ()
        ;:duration (= ?duration ?dur)
        :precondition ()
        :effect ();(increase (tiempo_conduccion ?d) ?dur)
    )

    ; -------------------------------------------------------------------------

    (:action EndOfSequece ;
        :parameters ()
        ;:duration (= ?duration ?dur)
        :precondition ()
        :effect ();(increase (tiempo_conduccion ?d) ?dur)
    )

    ; -------------------------------------------------------------------------

    ;CADA tarea primitva PUEDE AÑADIRSE AL PLAN EN DOS MODOS DISTINTOS: modo reconocer "token" o modo generar
    ;Por tanto cada tarea primitiva tiene asociada una tarea compuesta con dos metodos, uno para el modo reconocer plan y otro para el modo generar plan
    ; el modo GENERAR plan es el de siempre: se añade directamente la primitiva al plan (y si no se pueden cumplir las restricciones/condiciones pues fallará ). 
    ; el modo RECONOCER parte de que en el estado inicial hay una secuencia de acciones que hay que reconocer
    ; IMPORTANTE: estos dos metodos no son alternativas de hacer una tarea, son  dos formas excluyentes de hacer una tarea, e.d., si entra por un metodo y falla, 
    ; entonces no entra por el otro y la tarea compuesta directamente falla. Por eso tiene el simbolo ! (corte alla PROLOG)

    (:task D
        :parameters (?d - Driver ?dur - number) 
        (!
            (:method modo_generar
                :precondition (modo_generar)
                :tasks
                (
                    (:inline
                        (bind ?dur
                            (calcula_duracion_C ?d))
                        ()
                    )
                    (D_p ?d ?dur))
            )
            (:method modo_reconocer
                :precondition (modo_reconocer)
                :tasks
                (
                    (add_the_current_action_to_plan typeD ?dur)
                    ;incrementar el current index para reconocer la siguiente accion de la secuencia)
                    (:inline
                        ()
                        (increase (current_index_action) 1)
                    )
                )

            )
        )
    ) ; observar, ESTO SIGNIFICA lo siguiente

    ;add_the corrent action to plan consiste en:
    ; k = current_index
    ; Comprobar la condicion de  reconocimiento de token
    ; accion(k) es de tipo Conducir (en el caso de :task C...
    ; Si se cumple la condicion de reconocimiento de token
    ; capturar parametros (parameters_typeD (symbol(accion(k))) ?p1 ?p2 ... ?pn) , hay que saber cuantos parameters tiene cada accion
    ; capturar inicio, fin, duracion
    ; ( (AND (=?start inicio)(= ?end fin) (= ?duration duracion))
    ;	 (D_p ?p1 ?p2 ... ?pn)
    ; Si se inserta con exito, entonces es cuando hay que INCREMENTAR_CURRENT_INDEX para capturar la siguiente acción del plan

    ; ES IMPORTANTE, CRUCIAL, PASARLE EL TIPO "TypoConduccion" porque la interpretación aquí es:
    ; "El planificador espera que, para que la accion se reconozca como parte de una secuencia <del_tipo_qu_sea>, 
    ;	(1) la accion tiene que ser NECESARIAMENTE de tipo <typeD> y
    ;  (2) las restricciones temporales de la accion tienen que ser satisfacibles con el estado actual del plan reconocido"

    ;*********************************************************************************************************
    ; POR CADA TIPO DE ACCION PRIMITIVA ASOCIAR UNA TAREA COMPUESTA QUE TENGA MODO RECONOCER Y MODO GENERAR
    ;*********************************************************************************************************

    (:task O
        :parameters (?d - Driver ?dur - number) 
        (!
            (:method modo_generar
                :precondition (modo_generar)
                :tasks (
                    (:inline
                        (bind ?dur
                            (calcula_duracion_O ?d))
                        ()
                    )
                    (O_p ?d ?dur)
                )
            )

            (:method modo_reconocer
                :precondition (modo_reconocer)
                :tasks (
                    (add_the_current_action_to_plan typeO ?dur)
                    ;incrementar el current index para reconocer la siguiente accion de la secuencia)
                    (:inline
                        ()
                        (increase (current_index_action) 1)
                    )
                )
            )
        )
    )

    (:task B
        :parameters (?d - Driver ?dur - number) 
        (!
            (:method modo_generar
                :precondition (modo_generar)
                :tasks (
                    (:inline
                        (bind ?dur
                            (calcula_duracion_P ?d))
                        ()
                    )
                    (B_p ?d ?dur)
                )
            )
            (:method modo_reconocer
                :precondition (modo_reconocer)
                :tasks (
                    (add_the_current_action_to_plan typeB ?dur)
                    ;incrementar el current index para reconocer la siguiente accion de la secuencia)
                    (:inline
                        ()
                        (increase (current_index_action) 1)
                    )				
                )
            )
        )
    )

    (:task I
        :parameters (?d - Driver ?dur - number) 
        (!
            (:method modo_generar
                :precondition (modo_generar)
                :tasks (
                    (:inline
                        (bind ?dur
                            (calcula_duracion_E ?d))
                        ()
                    )
                    (I_p ?d ?dur)
                )
            )
            (:method modo_reconocer
                :precondition (modo_reconocer)
                :tasks (
                    (add_the_current_action_to_plan typeI ?dur)
                    ;incrementar el current index para reconocer la siguiente accion de la secuencia)
                    (:inline
                        ()
                        (increase (current_index_action) 1)
                    )
                )
            )
        )
    )

    ; =========================================================================
    ; PREDICADOS DERIVADOS QUE REPRESENTAN LA "CONDICION DE RECONOCIMIENTO DE TOKEN"
    ; 
    ; SE REPLICA LA MISMA CONDICION PARA CADA TIPO DE ACCION PRIMITIVA (DOBI)
    ; Solo cambia el (is_type)
    ; =========================================================================

    (:derived
        (currentindex_is_typeD ?k ?sa)	; ?K y ?sa se pasan "POR REFERENCIA" (en HPDL se puede, en OTROS PDDL lenguajes no), ES DECIR, se calculan dentro
        (and (bind ?k
                (current_index_action))	; CAPTURO EL INDICE ACTUAL DE SECUENCIA DE ACCIONES
            (index_action ?sa ?k)		; CAPTURO EL SIMBOLO DE LA ACCIONES(K)
            (is_typeD ?sa)				; PREGUNTO SI EL SIMBOLO ES typeD
        )
    )

    (:derived
        (currentindex_is_typeO ?k ?sa)
        (and (bind ?k
                (current_index_action))
            (index_action ?sa ?k)
            (is_typeO ?sa)
        )
    )

    (:derived
        (currentindex_is_typeB ?k ?sa)
        (and (bind ?k
                (current_index_action))
            (index_action ?sa ?k)
            (is_typeB ?sa)
        )
    )

    (:derived
        (currentindex_is_typeI ?k ?sa)
        (and (bind ?k
                (current_index_action))
            (index_action ?sa ?k)
            (is_typeI ?sa)
        )
    )

    ; -------------------------------------------------------------------------

    (:task add_the_current_action_to_plan
        :parameters (?tact - TipoAccion ?dur - number) (!
        (:method type_Driving
            ; captura el indice actual de la secuencia de acciones y el simbolo de accion asociado
            ; si en la secuencia de entrada hay una accion typeD y "me espero" una acción typeD
            :precondition (and (currentindex_is_typeD ?k ?sa) (= ?tact typeD))
            :tasks (
                (:inline
                    (and (parameters_typeD ?sa ?driver)
                        (start_action ?sa ?inicio)
                        (end_action ?sa ?final)
                        (duration_action ?sa ?dur))
                    ()
                )
                ;captura el contexto
                (:inline
                    (and (token-context ?tkctxt)
                        (breakType-context ?drivctxt)
                        (sequence-context ?seqctxt)
                        (dayType-context ?dayctxt)
                        (weekly-context ?weectxt)
                        (monthly-context ?monctxt))
                    ()
                )
                (
                    (and (= ?start ?inicio) (= ?end ?final) (= ?duration ?dur))
                    (D_p2 ?driver ?dur ?tkctxt ?drivctxt ?seqctxt ?dayctxt ?weectxt ?monctxt)
                )
            )
        )

        (:method type_Other
            :precondition (and (currentindex_is_typeO ?k ?sa) (= ?tact typeO)); captura el indice actual de la secuencia de acciones y el simbolo de accion asociado
            :tasks (
                (:inline
                    (and (parameters_typeO ?sa ?driver)
                        (start_action ?sa ?inicio)
                        (end_action ?sa ?final)
                        (duration_action ?sa ?dur))
                    ()
                )
                ;captura el contexto
                (:inline
                    (and (token-context ?tkctxt)
                        (breakType-context ?drivctxt)
                        (sequence-context ?seqctxt)
                        (dayType-context ?dayctxt)
                        (weekly-context ?weectxt)
                        (monthly-context ?monctxt))
                    ()
                )
                (
                    (and (= ?start ?inicio) (= ?end ?final) (= ?duration ?dur))
                    (O_p2 ?driver ?dur ?tkctxt ?drivctxt ?seqctxt ?dayctxt ?weectxt ?monctxt)
                )
            )
        )

        (:method type_Break
            :precondition (and (currentindex_is_typeB ?k ?sa) (= ?tact typeB)); captura el indice actual de la secuencia de acciones y el simbolo de accion asociado
            :tasks (
                (:inline
                    (and (parameters_typeB ?sa ?driver)
                        (start_action ?sa ?inicio)
                        (end_action ?sa ?final)
                        (duration_action ?sa ?dur))
                    ()
                )
                ;captura el contexto
                (:inline
                    (and (token-context ?tkctxt)
                        (breakType-context ?drivctxt)
                        (sequence-context ?seqctxt)
                        (dayType-context ?dayctxt)
                        (weekly-context ?weectxt)
                        (monthly-context ?monctxt))
                    ()
                )
                (
                    (and (= ?start ?inicio) (= ?end ?final) (= ?duration ?dur))
                    (B_p2 ?driver ?dur ?tkctxt ?drivctxt ?seqctxt ?dayctxt ?weectxt ?monctxt)
                )
            )
        )

        (:method type_Idle
            :precondition (and (currentindex_is_typeI ?k ?sa) (= ?tact typeI)); captura el indice actual de la secuencia de acciones y el simbolo de accion asociado
            :tasks (
                (:inline
                    (and (parameters_typeI ?sa ?driver)
                        (start_action ?sa ?inicio)
                        (end_action ?sa ?final)
                        (duration_action ?sa ?dur))
                    ()
                )
                ;captura el contexto
                (:inline
                    (and (token-context ?tkctxt)
                        (breakType-context ?drivctxt)
                        (sequence-context ?seqctxt)
                        (dayType-context ?dayctxt)
                        (weekly-context ?weectxt)
                        (monthly-context ?monctxt))
                    ()
                )
                (
                    (and (= ?start ?inicio) (= ?end ?final) (= ?duration ?dur))
                    (I_p2 ?driver ?dur ?tkctxt ?drivctxt ?seqctxt ?dayctxt ?weectxt ?monctxt)
                )
            )
        )
        )
    )

    ; (:durative-action b_token 
    ; 	:parameters (?ctxt - context)
    ; 	:meta( 
    ; 		(:tag prettyprint "");BEGIN TOKEN ?ctxt")
    ; 		)
    ; 	:duration (= ?duration 0)
    ; 	:condition (token-context ?current)
    ; 	:effect (and (token-context ?ctxt) (not (token-context ?current))))

    ; (:durative-action e_token 
    ; 	:parameters (?ctxt - context)
    ; 	:meta( 
    ; 		(:tag prettyprint "");END TOKEN ?ctxt")
    ; 		)
    ; 	:duration (= ?duration 0)
    ; 	:condition()
    ; 	:effect (and (not (token-context ?ctxt)) (token-context none)))

    ; -------------------------------------------------------------------------
    ; Contexts
    ; -------------------------------------------------------------------------

    (:task b_token
        :parameters (?ctxt - context) 
        (:method unico
            :precondition ()
            :tasks (
                :inline (token-context ?current)
                (and (token-context ?ctxt) 
                    (not (token-context ?current))
                )
            )
        )
    )

    (:task e_token
        :parameters (?ctxt - context) 
        (:method unico
            :precondition ()
            :tasks (
                :inline ()
                (and (not (token-context ?ctxt)) (token-context none))
            )
        )
    )

    ; -------------------------------------------------------------------------

    (:task b_breakType
        :parameters (?ctxt - context) 
        (:method unico
            :precondition ()
            :tasks (
                :inline
                (breakType-context ?current)
                (and (breakType-context ?ctxt) (not (breakType-context ?current)))
            )
        )
    )

    (:task e_breakType
        :parameters (?ctxt - context) 
        (:method unico
            :precondition ()
            :tasks (
                :inline
                ()
                (and (not (breakType-context ?ctxt)) (breakType-context none))
            )

        )
    )

    ; -------------------------------------------------------------------------

    (:task b_sequence
        :parameters (?ctxt - context) 
        (:method unico
            :precondition ()
            :tasks (
                :inline
                (sequence-context ?current)
                (and (sequence-context ?ctxt) (not (sequence-context ?current)))
            )
        )
    )

    (:task e_sequence
        :parameters (?ctxt - context) 
        (:method unico
            :precondition ()
            :tasks (
                :inline
                ()
                (and (not (sequence-context ?ctxt)) (sequence-context none))
            )

        )
    )

    ; -------------------------------------------------------------------------

    (:task b_dayType
        :parameters (?ctxt - context) 
        (:method unico
            :precondition ()
            :tasks (
                :inline
                (dayType-context ?current)
                (and (dayType-context ?ctxt) (not (dayType-context ?current)))
            )
        )
    )

    (:task e_dayType
        :parameters (?ctxt - context) 
        (:method unico
            :precondition ()
            :tasks (
                :inline
                ()
                (and (not (dayType-context ?ctxt)) (dayType-context none))
            )

        )
    )

    ; -------------------------------------------------------------------------
    ; Primitives
    ; -------------------------------------------------------------------------
    ; DRIVING

    (:durative-action D_p ;_p es sufijo de primitiva
        :parameters (?d - Driver ?dur - number)
        :duration (= ?duration ?dur)
        :condition ()
        :effect (increase (tiempo_conduccion ?d) ?dur)
    )

    (:durative-action D_p2 ;_p es sufijo de primitiva; 2 is because action as contexts in parameters
        :parameters (?d - Driver ?dur - number ?tkctxt ?drivctxt ?seqctxt ?dayctxt ?weectxt ?monctxt - context)
        :meta (
            (:tag prettyprint "?d	?start	?end	?duration	Driving	?dayctxt	?seqctxt	?drivctxt	?tkctxt"))
            :duration (= ?duration ?dur)
            :condition()
            ; :condition (and
            ; 	(:print "Recognized [DRIVING] task for driver ")
            ; 	(:print ?d)
            ; 	(:print " of ")
            ; 	(:print ?dur)
            ; 	(:print "minutes\n")
            ; )
            :effect (increase (tiempo_conduccion ?d) ?dur)
    )

    ; -------------------------------------------------------------------------
    ; OTHER WORK

    (:durative-action O_p
        :parameters (?d - Driver ?dur - number)
        :duration (= ?duration ?dur)
        :condition ()
        :effect (increase (tiempo_otros ?d) ?dur)
    )

    (:durative-action O_p2
        :parameters (?d - Driver ?dur - number ?tkctxt ?drivctxt ?seqctxt ?dayctxt ?weectxt ?monctxt - context)
        :meta (
            (:tag prettyprint "?d	?start	?end	?duration	Other	?dayctxt	?seqctxt	?drivctxt	?tkctxt"))
            :duration (= ?duration ?dur)
            :condition()
            ; :condition (and
            ; 	(:print "Recognized [OTHER] task for driver ")
            ; 	(:print ?d)
            ; 	(:print " of ")
            ; 	(:print ?dur)
            ; 	(:print "minutes\n")
            ; )
            :effect (increase (tiempo_otros ?d) ?dur)
    )

    ; -------------------------------------------------------------------------
    ; BREAK

    (:durative-action B_p
        :parameters (?d - Driver ?dur - number)
        :duration (= ?duration ?dur)
        :condition ()
        :effect (increase (tiempo_parada ?d) ?dur)
    )

    (:durative-action B_p2
        :parameters (?d - Driver ?dur - number ?tkctxt ?drivctxt ?seqctxt ?dayctxt ?weectxt ?monctxt - context)
        :meta (
            (:tag prettyprint "?d	?start	?end	?duration	Break	?dayctxt	?seqctxt	?drivctxt	?tkctxt"))
            :duration (= ?duration ?dur)
            :condition()
            ; :condition (and
            ; 	(:print "Recognized [BREAK] task for driver ")
            ; 	(:print ?d)
            ; 	(:print " of ")
            ; 	(:print ?dur)
            ; 	(:print "minutes\n")
            ; )
            :effect (increase (tiempo_parada ?d) ?dur)
    )

    ; -------------------------------------------------------------------------
    ; IDLE

    (:durative-action I_p
        :parameters (?d - Driver ?dur - number)
        :duration (= ?duration ?dur)
        :condition ()
        :effect (increase (tiempo_espera ?d) ?dur)
    )

    (:durative-action I_p2
        :parameters (?d - Driver ?dur - number ?tkctxt ?drivctxt ?seqctxt ?dayctxt ?weectxt ?monctxt - context)
        :meta (
            (:tag prettyprint "?d	?start	?end	?duration	Idle	?dayctxt	?seqctxt	?drivctxt	?tkctxt"))
            :duration (= ?duration ?dur)
            :condition()
            ; :condition (and
            ; 	(:print "Recognized [IDLE] task for driver ")
            ; 	(:print ?d)
            ; 	(:print " of ")
            ; 	(:print ?dur)
            ; 	(:print "minutes\n")
            ; )
            :effect (increase (tiempo_espera ?d) ?dur)
    )
)