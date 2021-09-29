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
        split uninterrupted                                 ; BreakType
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
                        ; (assign (dt_current_cdd_t2_slice) 0)
                        ; (assign (dt_current_cdd_t2_sequence) 0)
                        ; (assign (dt_cdd_unint) 0)
                        ; (assign (dt_current_CDD_T1_end) 0)
                        ; (assign (dt_cdd_split1) 0)
                        ; (assign (dt_cdd_split2) 0)
                        ; (assign (dt_cdd) 0)
                        ; (assign (dt_current_cdds_e) 0)
                        ; (assign (dt_dd) 0)
                        ; (assign (bt_current_slice) 0)
                        ; (assign (bt_current_cdd_t2_slice) 0)
                        ; (assign (bt_current_cdd_t2_sequence) 0)

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
                    (>= (bt_cdd) (* 3.0 (hours_in_mins)))
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

                ; To ensure RD after CDD
                (:inline
                    (>= (bt_dd) (* 3.0 (hours_in_mins)))
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
                (b_breakType split)
                (CDD_SPLIT_1 ?d)
                (CDD_SPLIT_2 ?d)
                (e_breakType split)

                (:inline
                    ()
                    (and
                        (increase (dt_cdd) (+ (dt_cdd_split1) (dt_cdd_split2)))
                        (increase (bt_cdd) (+ (bt_cdd_split1) (bt_cdd_split2)))
                    )
                )
            )
        )
    )

    ; -------------------------------------------------------------------------

    ; Continuous Daily Driving - Start - <4.5h
    ; (:task CDDs_S
    ;     :parameters (?d - Driver)
    ;     ; Type 1 (normal, no splits)
    ;     (:method t1
    ;         :precondition()
    ;         :tasks (
    ;             (b_breakType uninterrupted)
    ;             (CDD_T1_START ?d)
    ;             (CDD_T1_END ?d)
    ;             (e_breakType uninterrupted)
    ;             (:inline
    ;                 ()
    ;                 (assign
    ;                     (dt_current_CDDs_S)
    ;                     (+ (dt_current_CDD_T1_start) (dt_current_CDD_T1_END)))
    ;             )
    ;         )
    ;     )

    ;     ; Type 2 (with a split)
    ;     (:method t2
    ;         :precondition()
    ;         :tasks (
    ;             (b_breakType split)
    ;             (CDD_T2_START ?d)
    ;             (CDD_T2_END ?d)
    ;             (e_breakType split)
    ;             (:inline
    ;                 ()
    ;                 (assign
    ;                     (dt_current_CDDs_S)
    ;                     (+ (dt_current_CDD_T2_start) (dt_current_CDD_T2_END)))
    ;             )
    ;         )
    ;     )
    ; )

    ; -------------------------------------------------------------------------

    ; Continuous Daily Driving - End
    ; (:task CDDs_E
    ;     :parameters (?d - Driver)
    ;     ; Type 1 (normal, no splits)
    ;     (:method t1
    ;         :precondition()
    ;         :tasks (
    ;             (b_breakType uninterrupted)
    ;             (CDD_T1_END ?d)
    ;             (e_breakType uninterrupted)
    ;             (:inline
    ;                 ()
    ;                 (assign
    ;                     (dt_current_CDDs_E)
    ;                     (dt_current_CDD_T1_END))
    ;             )
    ;         )
    ;     ) 

    ;     ; Type 2 (with a split)
    ;     (:method t2
    ;         :precondition()
    ;         :tasks (
    ;             (b_breakType split)
    ;             (CDD_T2_END ?d)
    ;             (e_breakType split)
    ;             (:inline
    ;                 ()
    ;                 (assign
    ;                     (dt_current_CDDs_E)
    ;                     (dt_current_CDD_T2_END))
    ;             )
    ;         )
    ;     )
    ; )
    
    ; -------------------------------------------------------------------------

    (:task CDD_Unint
        :parameters (?d - Driver) 
        (:method SINGLE
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

        (:method SINGLE
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

    ; (:task CDD_T1_END
    ;     :parameters (?d - Driver) 
    ;     (:method SINGLE
    ;         :precondition()
    ;         :tasks (
    ;             (A ?d)

    ;             (:inline
    ;                 (<= (dt_current_slice) (* (hours_in_mins) 4.5))
    ;                 ()
    ;             )
    ;             (:inline
    ;                 ()
    ;                 (assign (dt_last_slice) (dt_current_slice))
    ;             )

    ;             (RD ?d)

    ;             (:inline
    ;                 ()
    ;                 (assign (dt_current_CDD_T1_END) (dt_last_slice))
    ;             )
    ;         )
    ;     )
    ; )

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

        (:method SINGLE
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

    ; -------------------------------------------------------------------------

    ; (:task CDD_T2_SEQUENCE
    ;     :parameters (?d - Driver) 
    ;     (:method caso_base0
    ;         :precondition()
    ;         :tasks (
    ;             (CDD_T2_slice ?d)
    ;             (:inline
    ;                 ()
    ;                 (increase
    ;                     (dt_current_cdd_t2_sequence)
    ;                     (dt_current_cdd_t2_slice))
    ;             )
    ;             (:inline
    ;                 ()
    ;                 (increase
    ;                     (bt_current_cdd_t2_sequence)
    ;                     (bt_current_cdd_t2_slice))
    ;             )
    ;         )
    ;     ) 
        
    ;     (:method recurre
    ;         :precondition ()
    ;         :tasks (
    ;             (CDD_T2_slice ?d)
    ;             (:inline
    ;                 ()
    ;                 (increase
    ;                     (dt_current_cdd_t2_sequence)
    ;                     (dt_current_cdd_t2_slice))
    ;             )
    ;             (:inline
    ;                 ()
    ;                 (increase
    ;                     (bt_current_cdd_t2_sequence)
    ;                     (bt_current_cdd_t2_slice))
    ;             )

    ;             (CDD_T2_SEQUENCE ?d))
    ;     )
    ; )

    ;***************************************************************************************
    ;** AQUI es donde se añaden tareas para marcar el inicio y fin de cada contexto

    ; (:task CDD_T2_Slice
    ;     :parameters (?d - Driver) 
    ;     (:method B_T2
    ;         :precondition()
    ;         :tasks (
    ;             (A ?d)

    ;             (:inline
    ;                 ()
    ;                 (assign (dt_last_slice) (dt_activity))
    ;             )

    ;             (B_T2 ?d)

    ;             (:inline
    ;                 ()
    ;                 (assign (dt_current_cdd_t2_slice) (dt_last_slice))
    ;             )
    ;             (:inline
    ;                 ()
    ;                 (assign
    ;                     (bt_current_cdd_t2_slice)
    ;                     (bt_current_slice))
    ;             )
    ;         )
    ;     ) 

    ;     (:method B_T3
    ;         :precondition()
    ;         :tasks (
    ;             (A ?d)

    ;             (:inline
    ;                 ()
    ;                 (assign (dt_last_slice) (dt_activity))
    ;             )

    ;             (B_T3 ?d)

    ;             (:inline
    ;                 ()
    ;                 (assign (dt_current_cdd_t2_slice) (dt_last_slice))
    ;             )
    ;             (:inline
    ;                 ()
    ;                 (assign
    ;                     (bt_current_cdd_t2_slice)
    ;                     (bt_current_slice))
    ;             )
    ;         )
    ;     ) 
        
    ;     (:method B_T1
    ;         :precondition()
    ;         :tasks (
    ;             (A ?d)

    ;             (:inline
    ;                 ()
    ;                 (assign (dt_last_slice) (dt_activity))
    ;             )

    ;             (B_T1 ?d)

    ;             (:inline
    ;                 ()
    ;                 (assign (dt_current_cdd_t2_slice) (dt_last_slice))
    ;             )
    ;             (:inline
    ;                 ()
    ;                 (assign
    ;                     (bt_current_cdd_t2_slice)
    ;                     (bt_current_slice))
    ;             )
    ;         )
    ;     )

    ;     (:method RD
    ;         :precondition()
    ;         :tasks (
    ;             (A ?d)

    ;             (:inline
    ;                 ()
    ;                 (assign (dt_last_slice) (dt_activity))
    ;             )

    ;             (RD ?d)

    ;             (:inline
    ;                 ()
    ;                 (assign (dt_current_cdd_t2_slice) (dt_last_slice))
    ;             )
    ;             (:inline
    ;                 ()
    ;                 (assign
    ;                     (bt_current_cdd_t2_slice)
    ;                     (bt_current_slice))
    ;             )
    ;         )
    ;     )
    ; )
    
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
                    (and (>= ?dur (* (hours_in_mins) 9)) (< ?dur (* (hours_in_mins) 11)))
                    ()
                )
                (e_token B_T5)

                (:inline
                    ()
                    (assign (minutos_consumidos) 0))

                (:inline
                    ()
                    (increase (tiempo_parada_dia ?d) ?dur)
                )
                (:inline
                    ()
                    (assign (current_bt) ?dur)
                )
                (:inline
                    ()
                    (assign (dt_activity) 0)
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
                    (and (>= ?dur (* (hours_in_mins) 11)) (< ?dur (* (hours_in_mins) 24)))
                    ()
                )
                (e_token B_T6)

                (:inline
                    ()
                    (assign (minutos_consumidos) 0))

                (:inline
                    ()
                    (increase (tiempo_parada_dia ?d) ?dur)
                )
                (:inline
                    ()
                    (assign (current_bt) ?dur)
                )
                (:inline
                    ()
                    (assign (dt_activity) 0)
                )
            )
        )

        (:method B_T10 ; BREAK OF [45h,infty) Weekly rest
            :precondition ()
            :tasks (
                (b_token B_T10)
                (B ?d ?dur)
                (:inline
                    (>= ?dur (* (hours_in_mins) 45))
                    ()
                )
                (e_token B_T10)

                (:inline
                    ()
                    (assign (minutos_consumidos) 0))

                (:inline
                    ()
                    (increase (tiempo_parada_dia ?d) ?dur)
                )
                (:inline
                    ()
                    (assign (current_bt) ?dur)
                )
                (:inline
                    ()
                    (assign (dt_activity) 0)
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
                    (and (>= ?dur 45) (< ?dur (* (hours_in_mins) 3)))
                    ()
                )
                (e_token B_T1)

                (:inline
                    ()
                    (increase (minutos_consumidos) ?dur))
                (:inline
                    ()
                    (increase (tiempo_parada_dia ?d) ?dur)
                )
                (:inline
                    ()
                    (assign (current_bt) ?dur)
                )
                (:inline
                    ()
                    (assign (bt_current_slice) ?dur)
                )
                (:inline
                    ()
                    (assign (current_dt) 0)
                )
                (:inline
                    ()
                    (assign (dt_activity) 0)
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
                    (increase (minutos_consumidos) ?dur))
                (:inline
                    ()
                    (increase (tiempo_parada_dia ?d) ?dur)
                )
                (:inline
                    ()
                    (assign (current_bt) ?dur)
                )
                (:inline
                    ()
                    (assign (bt_current_slice) ?dur)
                )
                (:inline
                    ()
                    (assign (current_dt) 0)
                )
                (:inline
                    ()
                    (assign (dt_activity) 0)
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
                    (and (>= ?dur 30) (< ?dur (* (hours_in_mins) 3)))
                    ()
                )
                (e_token B_T3)

                (:inline
                    ()
                    (increase (minutos_consumidos) ?dur))
                (:inline
                    ()
                    (increase (tiempo_parada_dia ?d) ?dur)
                )
                (:inline
                    ()
                    (assign (current_bt) ?dur)
                )
                (:inline
                    ()
                    (assign (bt_current_slice) ?dur)
                )
                (:inline
                    ()
                    (assign (current_dt) 0)
                )
                (:inline
                    ()
                    (assign (dt_activity) 0)
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
                    (increase (minutos_consumidos) ?dur))
                (:inline
                    ()
                    (increase (dt_day ?d) ?dur))
                (:inline
                    ()
                    (assign (current_bt) 0)
                )
                (:inline
                    ()
                    (assign (current_dt) ?dur)
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
                    (increase (minutos_consumidos) ?dur))
                (:inline
                    ()
                    (increase (tiempo_otros_dia ?d) ?dur)
                )
                (:inline
                    ()
                    (assign (current_bt) 0)
                )
                (:inline
                    ()
                    (assign (current_dt) 0)
                )
            )
        ) 
        
        (:method B_T0 ; BREAK of [0,15min)
            :precondition ()
            :tasks (
                (b_token B_T0)
                (B ?d ?dur)
                (e_token B_T0)

                (:inline
                    (and (< ?dur 15))
                    ()
                )
                (:inline
                    ()
                    (increase (minutos_consumidos) ?dur))
                (:inline
                    ()
                    (increase (tiempo_parada_dia ?d) ?dur)
                )
                (:inline
                    ()
                    (assign (current_bt) ?dur)
                )
                (:inline
                    ()
                    (assign (current_dt) 0)
                )
                ;(:inline () (assign (dt_activity) 0))
            )
        ) 
        
        (:method B_T2 ; BREAK of [15min, 30min)
            :precondition ()
            :tasks (
                (b_token B_T2)
                (B ?d ?dur)
                (e_token B_T2)

                (:inline
                    (and (>= ?dur 15) (< ?dur 30))
                    ()
                )
                (:inline
                    ()
                    (increase (minutos_consumidos) ?dur))
                (:inline
                    ()
                    (increase (tiempo_parada_dia ?d) ?dur)
                )
                (:inline
                    ()
                    (assign (current_bt) ?dur)
                )
                (:inline
                    ()
                    (assign (current_dt) 0)
                )
                (:inline
                    ()
                    (assign (dt_activity) 0)
                )
            )
        ) 
        
        (:method B_T3 ; BREAK OF [30min, 45min) - Está puesto hasta 3h
            :precondition ()
            :tasks (
                (b_token B_T3)
                (B ?d ?dur)
                (e_token B_T3)

                (:inline
                    (and (>= ?dur 30) (< ?dur (* (hours_in_mins) 3)))
                    ()
                )
                (:inline
                    ()
                    (increase (minutos_consumidos) ?dur))
                (:inline
                    ()
                    (increase (tiempo_parada_dia ?d) ?dur)
                )
                (:inline
                    ()
                    (assign (current_bt) ?dur)
                )
                (:inline
                    ()
                    (assign (current_dt) 0)
                )
                (:inline
                    ()
                    (assign (dt_activity) 0)
                )
            )
        )

        (:method B_T4 ; BREAK OF [3h, 9h)
            :precondition ()
            :tasks (
                (b_token B_T4)
                (B ?d ?dur)
                (e_token B_T4)
                
                (:inline
                    (and (>= ?dur (* (hours_in_mins) 3)) (< ?dur (* (hours_in_mins) 9)))
                    ()
                )
                (:inline
                    ()
                    (increase (minutos_consumidos) ?dur))
                (:inline
                    ()
                    (increase (tiempo_parada_dia ?d) ?dur)
                )
                (:inline
                    ()
                    (assign (current_bt) ?dur)
                )
                (:inline
                    ()
                    (assign (current_dt) 0)
                )
                (:inline
                    ()
                    (assign (dt_activity) 0)
                )
            )
        )
        
        (:method B_T1 ; BREAK OF [45min, 3h)
            :precondition ()
            :tasks (
                (b_token B_T1)
                (B ?d ?dur)
                (e_token B_T1)

                (:inline
                    (and (>= ?dur 45) (< ?dur (* (hours_in_mins) 3)))
                    ()
                )
                (:inline
                    ()
                    (increase (minutos_consumidos) ?dur))
                (:inline
                    ()
                    (increase (tiempo_parada_dia ?d) ?dur)
                )
                (:inline
                    ()
                    (assign (current_bt) ?dur)
                )
                (:inline
                    ()
                    (assign (current_dt) 0)
                )
                (:inline
                    ()
                    (assign (dt_activity) 0)
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
                    (increase (minutos_consumidos) ?dur))
                (:inline
                    ()
                    (increase (tiempo_espera_dia ?d) ?dur)
                )
                (:inline
                    ()
                    (assign (current_bt) 0)
                )
                (:inline
                    ()
                    (assign (current_dt) 0)
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

    (:task print_result
        :parameters (?dt - number) 
        (:method SINGLE
            :precondition (
                bind ?dt
                (dt_cdd_split2)
            )
            :tasks (
                result ?dt
            )
        )
    )

    (:durative-action print_new_day
	    :parameters ()
	    :meta (
            (:tag prettyprint "# ----------------------------------------------------NEW DAY----------------------------------------------------
#Driver	DateTimeStart	DateTimeEnd	Duration(min)	Activity	DayType	Sequence	BreakType	Token"))
            ; (:tag prettyprint "# Driver DateTimeStart   DateTimeEnd Duration (min)  Activity    DrivingDatyType DrivingPeriod   Sequence    Token"))
            :duration ()
            :condition (:print "> One Driving Day processed\n")
            :effect ()
    )

    ; -------------------------------------------------------------------------

    (:durative-action result
        :parameters (?x - number)
        :meta
        (
            (:tag prettyprint "Current driving time cdd_t2_end: ?x"
            )
        )
        :duration (= ?duration 0)
        :condition ()
        :effect ()
    )

    ; -------------------------------------------------------------------------

    (:durative-action print_breaking_time
        :parameters (?x - number)
        :meta
        (
            (:tag prettyprint "Current breaking time: ?x"
            )
        )
        :duration (= ?duration 0)
        :condition (bind ?x
            (bt_current_cdd_t2_slice))
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

    (:import "primitives.pddl")
)