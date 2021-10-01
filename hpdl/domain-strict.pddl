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
        A I B_T0 
        B_T1 B_T2 B_T3 
        DR_T1 DR_T2 DR_T3 DR_T4 
        WR_T1 WR_T2                                         ; Token

        split split_1 split_2 uninterrupted                 ; BreakType
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
    )

    ; =========================================================================
    ; FUNCTIONS
    ; =========================================================================

    (:functions
        (current_index_action) ; represnta el indice actual que apunta a la accion que hay que procesar en modo reconocer

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

        ; Time constants
        (hours_in_mins) ; = 60
    )

    ; =========================================================================
    ; DERIVED
    ; =========================================================================

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

    ; BiWeekly Driving
    ; (:task BWD
    ;   Comprobar que no se pasa de 90h
    ;   Tener en cuenta también que la secuencia se puede quedar vacía
    ;   Habría que tener en cuenta la compensación, por ahora ignorarla
    ; )

    ; Weekly Driving
    ; (:task WD
    ;   Comprobar que no se pasa de 56h
    ;   Tener en cuenta también que la secuencia se puede quedar vacía
    ;   Tener en cuenta que no puede haber más de dos EDD, ponerlos aquí y/o en la condición del método en DD
    ; )

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

        ; --------------------------------------------------------------
        ; Below: DayType not recognized
        ; --------------------------------------------------------------

        ; Don't tag a type of day, but try at least find the sequence
        (:method cdd
            :precondition (secuencia_entrada_no_vacia)
            :tasks (
                (reset_counters)

                (CDD ?d)
                (DD ?d)
            )
        )

        ; Anomaly? Hace que termine la secuencia no reconocida
        (:method rest_day
            :precondition (secuencia_entrada_no_vacia)
            :tasks (
                (REST ?d)
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

        ; --------------------------------------------------------------

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

                ; Because NDD is first in the tree: (9,10]h
                (:inline
                    (<= (dt_dd) (* 10.0 (hours_in_mins)))
                    ()
                )

                ; To ensure RD after CDD
                (:inline
                    (>= (bt_cdd) (* 3.0 (hours_in_mins)))
                    ()
                )

                ; Aumentar contador de EDD
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
                (b_breakType split_1)
                (CDD_SPLIT_1 ?d)
                (e_breakType split_1)

                (b_breakType split_2)
                (CDD_SPLIT_2 ?d)
                (e_breakType split_2)

                (:inline
                    ()
                    (and
                        (assign (dt_cdd) (+ (dt_cdd_split1) (dt_cdd_split2)))
                        (assign (bt_cdd) (+ (bt_cdd_split1) (bt_cdd_split2)))
                    )
                )
            )
        )
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

        (:method REST
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

                (REST ?d)

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

                (REST ?d)

                (:inline
                    ()
                    (assign (bt_cdd_unint) (current_bt))
                )
            )
        )
    )
    
    ; ****************************
    ; Rests
    ; ****************************

    (:task REST
        :parameters (?d - Driver)
        (:method Daily
            :precondition ()
            :tasks (
                (RD ?d)

                (:inline
                    (< (current_bt) (* 24 (hours_in_mins)))
                    ()
                )
                ; Comprobar que se ha realizado en menos de 24h
                ; Habría que tener en cuenta en equipo, por ahora los vamos a ignorar
            )
        )
        (:method Weekly
            :precondition ()
            :tasks (
                (WR ?d)
                ; Comprobar que se ha realizado en menos de 6 períodos de 24h
                ; Resear contador de DR_T2
            )
        )
    )

    ; Daily rest
    (:task RD
        :parameters (?d - Driver) 
        (:method DR_T1
            :precondition ()
            :tasks (
                (b_token DR_T1)
                (B ?d ?dur)
                (:inline
                    (>= ?dur (* 11 (hours_in_mins)))
                    ()
                )
                (e_token DR_T1)

                (:inline
                    ()
                    (and
                        (assign (current_bt) ?dur)
                        (assign (dt_activity) 0)
                    )
                )
            )
        ) 
        
        (:method DR_T2
            :precondition ()
            :tasks (
                (b_token DR_T2)
                (B ?d ?dur)
                (:inline
                    (and (>= ?dur (* 9 (hours_in_mins))) (< ?dur (* 11 (hours_in_mins))))
                    ()
                )
                (e_token DR_T2)

                (:inline
                    ()
                    (and
                        (assign (current_bt) ?dur)
                        (assign (dt_activity) 0)
                    )
                )
                ; Aumentar contador DR_T2
            )
        )

        (:method DR_T3
            :precondition ()
            :tasks (
                (b_token DR_T3)
                (B ?d ?dur)
                (:inline
                    (>= ?dur (* 3 (hours_in_mins)))
                    ()
                )
                (e_token DR_T3)

                (:inline
                    ()
                    (and
                        (assign (current_bt) ?dur)
                        (assign (dt_activity) 0)
                    )
                )
            )
        )

        (:method DR_T4
            ; :precondition (split-rest) No entraría aquí por las otras, ponerlo el primero y añadirle una precondición para asegurarse que es un split
            :precondition ()
            :tasks (
                (b_token DR_T4)
                (B ?d ?dur)
                (:inline
                    (>= ?dur (* 9 (hours_in_mins)))
                    ()
                )
                (e_token DR_T4)

                (:inline
                    ()
                    (and
                        (assign (current_bt) ?dur)
                        (assign (dt_activity) 0)
                    )
                )
            )
        )
    )

    ; Weakly rest
    (:task WD
        :parameters (?d - Driver) 
        (:method WR_T1
            :precondition ()
            :tasks (
                (b_token WR_T1)
                (B ?d ?dur)
                (:inline
                    (>= ?dur (* 45 (hours_in_mins)))
                    ()
                )
                (e_token WR_T1)

                (:inline
                    ()
                    (and
                        (assign (current_bt) ?dur)
                        (assign (dt_activity) 0)
                    )
                )
                ; Aumentar contador de WR_T1 y WR_T2
            )
        ) 
        
        (:method WR_T2
            :precondition ()
            :tasks (
                (b_token WR_T2)
                (B ?d ?dur)
                (:inline
                    (and (>= ?dur (* 24 (hours_in_mins))) (< ?dur (* 45 (hours_in_mins))))
                    ()
                )
                (e_token WR_T2)

                (:inline
                    ()
                    (and
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
                    (>= ?dur 45)
                    ()
                )
                (e_token B_T1)

                (:inline
                    ()
                    (and
                        (assign (current_bt) ?dur)
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
                    (>= ?dur 15)
                    ()
                )
                (e_token B_T2)

                (:inline
                    ()
                    (and
                        (assign (current_bt) ?dur)
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
                    (>= ?dur 30)
                    ()
                )
                (e_token B_T3)

                (:inline
                    ()
                    (and
                        (assign (current_bt) ?dur)
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
            :precondition (secuencia_entrada_no_vacia)
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
        (:method PAUSE_CONSIDERED_BREAK
            :precondition (current_action_is_a_break_greater_15) 
            :tasks ()
        ) 
        
        ; aquí se acabó la secuencia de acciones, cuando sale por aquí se le ha acabado la secuencia y CORRECTO Y DEBE TERMINAR
        (:method fin_secuencia_entrada
            :precondition (fin_secuencia_entrada)
            :tasks (
                EndOfSequece
            )
        ) 
        
        ; AQUÍ HA HABIDO UN FALLO: SE DAN las condiciones de recursión, pero NO SE HA PODIDO PROCESAR si continua recursion y no ha entrado en ninguno de los metodos anteriores
        (:method fallar
            :precondition ()
            :tasks ()
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
                        (assign (current_bt) ?dur)
                        (assign (current_dt) 0)
                        (assign (dt_activity) 0)
                    )
                )
            )
        ) 
        
        ; (:method B_T2 ; BREAK of [15min, 30min)
        ;     :precondition ()
        ;     :tasks (
        ;         (b_token B_T2)
        ;         (B ?d ?dur)
        ;         (:inline
        ;             (and (>= ?dur 15) (<= ?dur 50))
        ;             ()
        ;         )
        ;         (e_token B_T2)

        ;         (:inline
        ;             ()
        ;             (and
        ;                 (assign (current_bt) ?dur)
        ;                 (assign (current_dt) 0)
        ;                 (assign (dt_activity) 0)
        ;             )
        ;         )
        ;     )
        ; )
        
        ; (:method B_T3 ; BREAK OF [30min, 45min) - Está puesto hasta 3h
        ;     :precondition ()
        ;     :tasks (
        ;         (b_token B_T3)
        ;         (B ?d ?dur)
        ;         (:inline
        ;             ; (and (>= ?dur 30) (< ?dur (* (hours_in_mins) 3)))
        ;             (and (>= ?dur 30) (< ?dur 90))
        ;             ()
        ;         )
        ;         (e_token B_T3)

        ;         (:inline
        ;             ()
        ;             (and
        ;                 (assign (current_bt) ?dur)
        ;                 (assign (current_dt) 0)
        ;                 (assign (dt_activity) 0)
        ;             )
        ;         )
        ;     )
        ; )
                
        ; (:method B_T1 ; BREAK OF [45min, 3h)
        ;     :precondition ()
        ;     :tasks (
        ;         (b_token B_T1)
        ;         (B ?d ?dur)
        ;         (:inline
        ;             (and (>= ?dur 45) (< ?dur (* (hours_in_mins) 3.5)))
        ;             ()
        ;         )
        ;         (e_token B_T1)

        ;         (:inline
        ;             ()
        ;             (and
        ;                 (assign (current_bt) ?dur)
        ;                 (assign (current_dt) 0)
        ;                 (assign (dt_activity) 0)
        ;             )
        ;         )
        ;     )
        ; )

        ; (:method B_T4 ; BREAK OF [3h, 9h)
        ;     :precondition ()
        ;     :tasks (
        ;         (b_token B_T4)
        ;         (B ?d ?dur)
        ;         (:inline
        ;             (and (>= ?dur (* (hours_in_mins) 3)) (< ?dur (* (hours_in_mins) 9)))
        ;             ()
        ;         )
        ;         (e_token B_T4)

        ;         (:inline
        ;             ()
        ;             (and
        ;                 (assign (current_bt) ?dur)
        ;                 (assign (current_dt) 0)
        ;                 (assign (dt_activity) 0)
        ;             )
        ;         )
        ;     )
        ; )
        
        ; Idle
        (:method IXX
            :precondition ()
            :tasks (
                (b_token I)
                (I ?d ?dur)
                (e_token I)

                (:inline
                    ()
                    (and
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
        :precondition ()
        :effect ()
    )

    ; -------------------------------------------------------------------------

    (:action EndOfSequece ;
        :parameters ()
        :precondition ()
        :effect ()
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

    (:task B
        :parameters (?d - Driver ?dur - number) 
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

    (:task I
        :parameters (?d - Driver ?dur - number) 
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
            :effect ()
    )

    ; -------------------------------------------------------------------------
    ; OTHER WORK

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
            :effect ()
    )

    ; -------------------------------------------------------------------------
    ; BREAK

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
            :effect ()
    )

    ; -------------------------------------------------------------------------
    ; IDLE

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
            :effect ()
    )
)