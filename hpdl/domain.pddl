(define (domain GantaBi)
    (:requirements :adl :fluents :derived-predicates :htn-expansion :durative-actions :equality :metatags :timed-initial-literals)

    ; =========================================================================
    ; TYPES
    ; =========================================================================
    (:types
        TaskSymbol
        TaskInstanceSymbol
        TipoAccion
        Driver
        context 
            - object
    )

    ; =========================================================================
    ; CONSTANTS
    ; =========================================================================

    (:constants
        Procesa_Accion - TaskSymbol

        typeD typeO typeB typeI - TipoAccion

        ; Contexts
        yes no                              ; Legal
        
        A I B_T0 
        B_T1 B_T2 B_T3 
        DR_T1 DR_T2 DR_T3 DR_T4 
        WR_T1 WR_T2                         ; Token

        split split_1 split_2 uninterrupted ; BreakType
        first second third unique           ; Sequence
        ndd edd                             ; DayType
        none - context
    )

    ; =========================================================================
    ; PREDICATES
    ; =========================================================================

    (:predicates
        (modo_generar)
        (modo_reconocer)

        ; Contexts
        (legal-context ?legalctxt - context)
        (token-context ?tkctxt - context)
        (sequence-context ?seqctxt - context)
        (breakType-context ?drivctxt - context)
        (dayType-context ?dayctxt - context)

        ;****************************************
        ; Activity representation in PDDL problem
        ;****************************************
        (is_action ?sa - TaskInstanceSymbol) ; cada accion tiene un simbolo asociado este simbolo es de tipo accion 
        (index_action ?sa - TaskInstanceSymbol ?i - number); UN array simulado: cada simbolo de accion tiene asociado un indice, que empieza en 0, el indice indica la posición en la secuencia
        
        ;(= (start_action C1) "01/07/2018 00:00:00"); las acciones tienen un punto de inicio
        ;(= (end_action C1) "01/07/2018 00:37:00"); ... y un punto de fin
        ;(= (duration_action C1) 37); ... y una duracion

        (start_action ?sa - TaskInstanceSymbol ?s - number)
        (end_action ?sa - TaskInstanceSymbol ?e - number)
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

        ;***********************************
        ; Derived
        ;***********************************

        (currentindex_is_typeD ?k - number ?sa - TaskInstanceSymbol)
        (currentindex_is_typeO ?k - number ?sa - TaskInstanceSymbol)
        (currentindex_is_typeB ?k - number ?sa - TaskInstanceSymbol)
        (currentindex_is_typeI ?k - number ?sa - TaskInstanceSymbol)

        ;; TOKEN conditions
        (current_action_is_a_break_greater_15)

        ;; FEASIBILITIY conditions        
        (secuencia_entrada_no_vacia)
        (fin_secuencia_entrada)

        (dr_in_less_than_24)    ; To check if a DR is taken each 24h
        (wr_in_less_than_6_24)  ; To check if a WR is taken each "week" (6 x 24h)

        (next_dr_is_t4) ; If a DR_T3 is found, next DR must be DR_T4

        (is_activity_illegal) ; To set legal context ("no" if some other context is none)
    )

    ; =========================================================================
    ; FUNCTIONS
    ; =========================================================================

    (:functions
        (current_index_action) ; represnta el indice actual que apunta a la accion que hay que procesar en modo reconocer

        ; Acumulators
        (dt_bwd)
        (dt_previous_wd) ; Driving time for last week
        (dt_wd)         ; Driving time for current week
        (dt_dd)        ; Driving time for a daily drive
        (dt_cdd)        ; Driving time for a continuous daily drive (<4.5h)
        (dt_cdd_unint)  ; Driving time for an uninterrupted cdd   
        (dt_cdd_split1) ; Driving time for the first split of a cdd   
        (dt_cdd_split2)
        (dt_activity)   ; Driving time for a sequence of activities

        (bt_wd)
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

        ; Activities counters
        (edds_in_week) ; Number of EDD sequences in current week
        (drt2_in_week)  ; Number of DR_T2 activities in current week

        (week-counter)
        (day-counter)

        ; Timestamps
        (last_dr) ; Last timestamp a Daily Rest was detected
        (last_wr) ; Last timestamp a Weekly Rest was detected
    )

    ; =========================================================================
    ; DERIVED
    ; =========================================================================

    ; To check a DR is taken each 24h
    (:derived (dr_in_less_than_24)
        (and
            ; Get actual stating timestamp
            (bind ?k (current_index_action))
            (index_action ?sa ?k)
            (start_action ?sa ?final)

            ; Compare with last DR
            (<= ?final
                (+ (* 24 (hours_in_mins)) (last_dr))
            )
        )
    )

    ; To check if a WR is taken each "week" (6 x 24h)
    (:derived (wr_in_less_than_6_24)
        (and
            ; Get actual starting timestamp
            (bind ?k (current_index_action))
            (index_action ?sa ?k)
            (start_action ?sa ?final)

            ; Compare with last DR
            (<= ?final
                (+ (* 6 (* 24 (hours_in_mins))) (last_dr))
            )
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

    ; -------------------------------------------------------------------------

    (:derived (current_action_is_a_break_greater_15)
        (AND
            (currentindex_is_typeB ?k ?sa)
            (duration_action ?sa ?dur)
            (>= ?dur 15)
        )
    )

    ; -------------------------------------------------------------------------

    ; If any context is none -> Illegal activity
    (:derived (is_activity_illegal)
        (OR
            (token-context none)
            (breakType-context none)
            (sequence-context none)
            (dayType-context none)
        )
    )

    
    ; =========================================================================
    ; PREDICADOS DERIVADOS QUE REPRESENTAN LA "CONDICION DE RECONOCIMIENTO DE TOKEN"
    ; 
    ; SE REPLICA LA MISMA CONDICION PARA CADA TIPO DE ACCION PRIMITIVA (DOBI)
    ; Solo cambia el (is_type)
    ; =========================================================================

    (:derived
        ; ?K y ?sa se pasan "POR REFERENCIA" (en HPDL se puede), ES DECIR, se calculan dentro
        (currentindex_is_typeD ?k ?sa)	
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

    ; =========================================================================
    ; TASKS
    ; =========================================================================

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
                        (assign (current_dt) 0)

                        (assign (bt_dd) 0)
                        (assign (bt_cdd) 0)
                        (assign (bt_cdd_unint) 0)
                        (assign (bt_cdd_split1) 0)
                        (assign (bt_cdd_split2) 0)
                        (assign (current_bt) 0)
                    )
                )
            )
        )
    )

    ; -------------------------------------------------------------------------

    ; BiWeekly Driving
    ; (:task BWD
    ;   Comprobar que no se pasa de 90h
    ;   Tener en cuenta también que la secuencia se puede quedar vacía
    ;   Habría que tener en cuenta la compensación, por ahora ignorarla
    ; )

    ; ****************************
    ; Weekly Driving
    ; ****************************

    (:task WD
        :parameters (?d - Driver)

        ; Last REST was a WR
        (:method WR
            :precondition (>= (current_bt) (* 24 (hours_in_mins)))
            :tasks (
                (print_new_week)
                (:inline
                    ()
                    (and
                        (assign (dt_bwd) 
                            (+ (dt_wd) (dt_previous_wd)))

                        (assign (dt_previous_wd) (dt_wd))

                        ; Reset functions
                        (assign (dt_wd) 0)
                        (assign (bt_wd) 0)
                        (assign (current_bt) 0)

                        (assign (edds_in_week) 0)
                        (increase (week-counter) 1)
                    )
                )

                ; At most 90h driving in two consecutives weeks
                (:inline
                    (<= (dt_bwd) (* 90 (hours_in_mins)))
                    ()
                )

                (WD ?d)
            )
        )

        (:method normal
            :precondition (secuencia_entrada_no_vacia)
            :tasks (
                (DD ?d)

                (:inline
                    (and
                        (<= (edds_in_week) 2)
                        (<= (dt_wd) (* 56.0 (hours_in_mins)))
                    )
                    ()
                )

                (WD ?d)
            )
        )

        (:method END
            :precondition ()
            :tasks (
                (:inline (:print "# Using WD method END\n") ())
            )
        )
    )

    ; ****************************
    ; Daily Driving
    ; ****************************

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

                (:inline
                    ()
                    (and
                        (increase (dt_wd) (dt_dd))
                        (increase (bt_wd) (bt_dd))
                        (increase (day-counter) 1)
                    )
                )
                (print_new_day)
            )
        )
        
        (:method edd
            :precondition (and
                (<= (edds_in_week) 2)
                (secuencia_entrada_no_vacia)
            )
            :tasks (
                (reset_counters)

                (b_dayType EDD)
                (EDD ?d)
                (e_dayType EDD)

                (:inline
                    ()
                    (and
                        (increase (dt_wd) (dt_dd))
                        (increase (bt_wd) (bt_dd))
                        (increase (edds_in_week) 1)
                        (increase (day-counter) 1)
                    )
                )
                (print_new_day)
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
            )
        )

        ; RD in non-recognized sequence
        (:method rest_day
            :precondition (secuencia_entrada_no_vacia)
            :tasks (
                (REST ?d)
                (:inline
                    ()
                    (increase (day-counter) 1)
                )
                (print_new_day)
            )
        )
        
        ; Action doesn't fit in any sequence
        (:method ignore_action
            :precondition (secuencia_entrada_no_vacia)
            :tasks (
                (IGNORE_ACTIVITY ?d)

                (DD ?d)
            )
        )

        ; --------------------------------------------------------------

        ; Empty input
        (:method END
            :precondition ()
            :tasks (
                (:inline (:print "# Using DD method END\n") ())
            )
        )
    )

    ; -------------------------------------------------------------------------

    ; If activity doesn't fit in any pattern, process it and ignore it
    (:task IGNORE_ACTIVITY
        :parameters (?d - Driver)
        (:method Activity
            :precondition ()
            :tasks (
                (Process_A ?d)
            )
        )
        (:method Unknown_Break
            :precondition ()
            :tasks (
                (B ?d ?dur)
            )
        )
    )

    ; -------------------------------------------------------------------------

    ; Normal Daily Driving - <9h driving total
    (:task NDD
        :parameters (?d - Driver) 
        (:method Two_CDDs
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

                ; To ensure no RD after first CDD
                (:inline
                    (<= (current_bt) (* 3.0 (hours_in_mins)))
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
                    (>= (current_bt) (* 3.0 (hours_in_mins)))
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
                    (>= (current_bt) (* 3.0 (hours_in_mins)))
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

                ; To ensure no RD after first CDD
                (:inline
                    (<= (current_bt) (* 3.0 (hours_in_mins)))
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

                ; To ensure no RD after first CDD
                (:inline
                    (<= (current_bt) (* 3.0 (hours_in_mins)))
                    ()
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

                ; Because NDD is placed before in the tree: (9,10]h
                (:inline
                    (<= (dt_dd) (* 10.0 (hours_in_mins)))
                    ()
                )

                ; To ensure RD after CDD
                (:inline
                    (>= (current_bt) (* 3.0 (hours_in_mins)))
                    ()
                )
            )
        )
    )

    ; ****************************
    ; Continuos Daily Driving
    ; ****************************

    ; Continuous Daily Driving -> <4.5h
    (:task CDD
        :parameters (?d - Driver) 
        ; Uninterrupted (normal, no splits)
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

    ; Uninterrupted. Ending in RD or B_T1
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

    ; First split of a CDD. Ending in B_T2
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

    ; Second split of a CDD. Ending in B_T3 or RD
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
                    (assign (bt_cdd_split2) (current_bt))
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
                    (assign (bt_cdd_split2) (current_bt))
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
            ; Comprobar que se ha realizado en menos de 24h
            ; Habría que tener en cuenta en equipo, por ahora los vamos a ignorar
            :precondition (dr_in_less_than_24)
            :tasks (
                (DR ?d)

                ; A daily rest is not bigger than 24h
                (:inline
                    (< (current_bt) (* 24 (hours_in_mins)))
                    ()
                )

                ; Save last DR timestamp
                (:inline
                    (and 
                        (bind ?k (- (current_index_action) 1))
                        (index_action ?sa ?k)
                        (end_action ?sa ?final)
                    )
                    (assign (last_dr) ?final)
                )
            )
        )

        (:method Weekly
            ; Comprobar que se ha realizado en menos de 6 períodos de 24h
            :precondition (wr_in_less_than_6_24)
            :tasks (
                (WR ?d)

                (:inline
                    ()
                    (and
                        (assign (edds_in_week) 0)
                        (assign (drt2_in_week) 0)
                        (assign (dt_wd) 0)
                    )
                )

                ; Save last WR timestamp
                (:inline
                    (and 
                        (bind ?k (- (current_index_action) 1))
                        (index_action ?sa ?k)
                        (end_action ?sa ?final)
                    )
                    (and
                        (assign (last_dr) ?final)
                        (assign (last_wr) ?final)
                    )
                )
            )
        )


        ; TODO: Indicate illegality in output
        (:method illegal_daily
            :precondition ()
            :tasks (
                (DR ?d)

                ; A daily rest is not bigger than 24h
                (:inline
                    (< (current_bt) (* 24 (hours_in_mins)))
                    ()
                )
                ; Save last DR timestamp
                (:inline
                    (and 
                        (bind ?k (- (current_index_action) 1))
                        (index_action ?sa ?k)
                        (end_action ?sa ?final)
                    )
                    (assign (last_dr) ?final)
                )
            )
        )

        (:method illegal_weekly
            :precondition ()
            :tasks (
                (WR ?d)

                (:inline
                    ()
                    (and
                        (assign (edds_in_week) 0)
                        (assign (drt2_in_week) 0)
                        (assign (dt_wd) 0)
                    )
                )

                ; Save last WR timestamp
                (:inline
                    (and 
                        (bind ?k (- (current_index_action) 1))
                        (index_action ?sa ?k)
                        (end_action ?sa ?final)
                    )
                    (and
                        (assign (last_dr) ?final)
                        (assign (last_wr) ?final)
                    )
                )
            )
        )
    )

    ; -------------------------------------------------------------------------

    ; Daily rest
    (:task DR
        :parameters (?d - Driver)
        (:method DR_T4
            :precondition (next_dr_is_t4)
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
                        (not (next_dr_is_t4))
                        (assign (current_bt) ?dur)
                        (assign (dt_activity) 0)
                    )
                )
            )
        )

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
                        (increase (drt2_in_week) 1)
                    )
                )
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

                ; Next DR must be T4 o WD
                (:inline 
                    (not (next_dr_is_t4))
                    (next_dr_is_t4)
                )
            )
        )
    )

    ; -------------------------------------------------------------------------

    ; Weekly rest
    (:task WR
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
                ; TODO: Aumentar contador de WR_T1 y WR_T2 (Biweekly)
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

    (:task B_T1
        :parameters (?d - Driver)
        (:method B_T1
            :precondition ()
            :tasks (
                (b_token B_T1)		
                (B ?d ?dur)
                (:inline
                    (and (>= ?dur 45) (< ?dur (* 3.0 (hours_in_mins))))
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

    (:task B_T2
        :parameters (?d - Driver) 
        (:method B_T2
            :precondition ()
            :tasks (
                (b_token B_T2)
                (B ?d ?dur)
                (:inline
                    (and (>= ?dur 15) (< ?dur (* 3.0 (hours_in_mins))))
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

    (:task B_T3
        :parameters (?d - Driver) 
        (:method B_t3 
            :precondition ()
            :tasks (
                (b_token B_T3)
                (B ?d ?dur)
                (:inline
                    (and (>= ?dur 30) (< ?dur (* 3.0 (hours_in_mins))))
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
    
    ; ****************************
    ; Activity
    ; ****************************

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

                (A ?d)
            )
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

    ; ****************************
    ; Basic Actions
    ; ****************************

    (:task D
        :parameters (?d - Driver ?dur - number) 
        (:method modo_reconocer
            :precondition (modo_reconocer)
            :tasks (
                (add_the_current_action_to_plan typeD ?dur)
                ;incrementar el current index para reconocer la siguiente accion de la secuencia)
                (:inline
                    ()
                    (increase (current_index_action) 1)
                )
            )

        )
    )

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

                ; Set legal context
                (:inline ()
                    (when (is_activity_illegal) 
                        (and
                            (not (legal-context yes))
                            (legal-context no)
                        )
                    )
                )

                ;captura el contexto
                (:inline
                    (and 
                        (legal-context ?legalctxt)
                        (token-context ?tkctxt)
                        (breakType-context ?drivctxt)
                        (sequence-context ?seqctxt)
                        (dayType-context ?dayctxt)
                        (bind ?weekcount (week-counter))
                        (bind ?daycount (day-counter))
                    )
                    ()
                )
                
                (
                    (and (= ?start ?inicio) (= ?end ?final) (= ?duration ?dur))
                    (D_p ?driver ?dur ?tkctxt ?drivctxt ?seqctxt ?dayctxt ?weekcount ?daycount ?legalctxt)
                )

                ; Set legal context
                (:inline ()
                    (when (is_activity_illegal) 
                        (and
                            (not (legal-context no))
                            (legal-context yes)
                        )
                    )
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

                ; Set legal context
                (:inline ()
                    (when (is_activity_illegal) 
                        (and
                            (not (legal-context yes))
                            (legal-context no)
                        )
                    )
                )

                ;captura el contexto
                (:inline
                    (and 
                        (legal-context ?legalctxt)
                        (token-context ?tkctxt)
                        (breakType-context ?drivctxt)
                        (sequence-context ?seqctxt)
                        (dayType-context ?dayctxt)
                        (bind ?weekcount (week-counter))
                        (bind ?daycount (day-counter))
                    )
                    ()
                )

                (
                    (and (= ?start ?inicio) (= ?end ?final) (= ?duration ?dur))
                    (O_p ?driver ?dur ?tkctxt ?drivctxt ?seqctxt ?dayctxt ?weekcount ?daycount ?legalctxt)
                )

                ; Set legal context
                (:inline ()
                    (when (is_activity_illegal) 
                        (and
                            (not (legal-context no))
                            (legal-context yes)
                        )
                    )
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

                ; Set legal context
                (:inline ()
                    (when (is_activity_illegal) 
                        (and
                            (not (legal-context yes))
                            (legal-context no)
                        )
                    )
                )

                ;captura el contexto
                (:inline
                    (and 
                        (legal-context ?legalctxt)
                        (token-context ?tkctxt)
                        (breakType-context ?drivctxt)
                        (sequence-context ?seqctxt)
                        (dayType-context ?dayctxt)
                        (bind ?weekcount (week-counter))
                        (bind ?daycount (day-counter))
                    )
                    ()
                )

                (
                    (and (= ?start ?inicio) (= ?end ?final) (= ?duration ?dur))
                    (B_p ?driver ?dur ?tkctxt ?drivctxt ?seqctxt ?dayctxt ?weekcount ?daycount ?legalctxt)
                )

                ; Set legal context
                (:inline ()
                    (when (is_activity_illegal) 
                        (and
                            (not (legal-context no))
                            (legal-context yes)
                        )
                    )
                )
            )
        )

        (:method type_Idle
            :precondition (and (currentindex_is_typeI ?k ?sa) (= ?tact typeI)); captura el indice actual de la secuencia de acciones y el simbolo de accion asociado
            :tasks (
                (:inline
                    (and
                        (parameters_typeI ?sa ?driver)
                        (start_action ?sa ?inicio)
                        (end_action ?sa ?final)
                        (duration_action ?sa ?dur))
                    ()
                )

                ; Set legal context
                (:inline ()
                    (when (is_activity_illegal) 
                        (and
                            (not (legal-context yes))
                            (legal-context no)
                        )
                    )
                )

                ;captura el contexto
                (:inline
                    (and 
                        (legal-context ?legalctxt)
                        (token-context ?tkctxt)
                        (breakType-context ?drivctxt)
                        (sequence-context ?seqctxt)
                        (dayType-context ?dayctxt)
                        (bind ?weekcount (week-counter))
                        (bind ?daycount (day-counter))
                    )
                    ()
                )

                (
                    (and (= ?start ?inicio) (= ?end ?final) (= ?duration ?dur))
                    (I_p ?driver ?dur ?tkctxt ?drivctxt ?seqctxt ?dayctxt ?weekcount ?daycount ?legalctxt)
                )

                ; Set legal context
                (:inline ()
                    (when (is_activity_illegal) 
                        (and
                            (not (legal-context no))
                            (legal-context yes)
                        )
                    )
                )
            )
        )) ; Two ")" due to the !
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
                :inline (breakType-context ?current)
                (and (breakType-context ?ctxt) (not (breakType-context ?current)))
            )
        )
    )

    (:task e_breakType
        :parameters (?ctxt - context) 
        (:method unico
            :precondition ()
            :tasks (
                :inline ()
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
                :inline ()
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
                :inline ()
                (and (not (dayType-context ?ctxt)) (dayType-context none))
            )

        )
    )

    ; =========================================================================
    ; Actions
    ; =========================================================================

    (:action EndOfDay
        :parameters ()
        :precondition ()
        :effect ()
    )

    ; -------------------------------------------------------------------------

    (:action EndOfSequece
        :parameters ()
        :precondition ()
        :effect ()
    )

    ; -------------------------------------------------------------------------

    ; DRIVING
    (:durative-action D_p
        :parameters (?d - Driver ?dur - number ?tkctxt ?drivctxt ?seqctxt ?dayctxt ?weekcount ?daycount ?legalctxt  - context)
        :meta ((:tag prettyprint "?d	?start	?end	?duration	Driving	?weekcount	?daycount	?dayctxt	?seqctxt	?drivctxt	?tkctxt	?legalctxt"))
        :duration (= ?duration ?dur)
        :condition()
        :effect ()
    )

    ; -------------------------------------------------------------------------

    ; OTHER WORK
    (:durative-action O_p
        :parameters (?d - Driver ?dur - number ?tkctxt ?drivctxt ?seqctxt ?dayctxt ?weekcount ?daycount ?legalctxt  - context)
        :meta ((:tag prettyprint "?d	?start	?end	?duration	Other	?weekcount	?daycount	?dayctxt	?seqctxt	?drivctxt	?tkctxt	?legalctxt"))
        :duration (= ?duration ?dur)
        :condition()
        :effect ()
    )

    ; -------------------------------------------------------------------------

    ; BREAK
    (:durative-action B_p
        :parameters (?d - Driver ?dur - number ?tkctxt ?drivctxt ?seqctxt ?dayctxt ?weekcount ?daycount ?legalctxt  - context)
        :meta ((:tag prettyprint "?d	?start	?end	?duration	Break	?weekcount	?daycount	?dayctxt	?seqctxt	?drivctxt	?tkctxt	?legalctxt"))
        :duration (= ?duration ?dur)
        :condition()
        :effect ()
    )

    ; -------------------------------------------------------------------------

    ; IDLE
    (:durative-action I_p
        :parameters (?d - Driver ?dur - number ?tkctxt ?drivctxt ?seqctxt ?dayctxt ?weekcount ?daycount ?legalctxt  - context)
        :meta ((:tag prettyprint "?d	?start	?end	?duration	Idle	?weekcount	?daycount	?dayctxt	?seqctxt	?drivctxt	?tkctxt	?legalctxt"))
        :duration (= ?duration ?dur)
        :condition()
        :effect ()
    )

    ; =========================================================================
    ; Debug
    ; =========================================================================

    (:durative-action print_new_day
	    :parameters ()
	    :meta (
            (:tag prettyprint "#-----------------------
# NEW DAY
#-----------------------
#Driver	DateTimeStart	DateTimeEnd	Duration(min)	Activity	Week	Day	DayType	Sequence	BreakType	Token	Legal"))
            :duration ()
            :condition (:print "> One Driving Day processed\n")
            :effect ()
    )

    (:durative-action print_new_week
	    :parameters ()
	    :meta (
            (:tag prettyprint "#=======================================
# NEW WEEK
#=======================================
#Driver	DateTimeStart	DateTimeEnd	Duration(min)	Activity	Week	Day	DayType	Sequence	BreakType	Token	Legal"))
            :duration ()
            :condition (:print ">> One Week processed\n")
            :effect ()
    )
)