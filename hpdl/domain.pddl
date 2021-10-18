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

        ; Zenotravel
        box
        city
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

        ; Zenotravel
        (at ?o - object ?c - city)
        (in ?b - box ?d - Driver)
        (destination ?b - box ?c - city)
        (enough-fuel ?d - Driver ?c1 ?c2 - city)
        (enough-transport-time ?d - Driver ?b - box)
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



        ;***********************************
        ; Generate mode
        ;***********************************
        ; 4.5 - dt_activity
        ; 9 - dt_dd      si dt_dd < 9
        ; 10 - dt_dd    si dt_dd > 9 < 10
        ; TODO: Can't surpass (<= (dt_wd) (* 56.0 (hours_in_mins)))
        (calculate_duration_D ?d ?dt_dd ?dt_activity) {
            dur = -1

            # Deciding between NDD or EDD
            max_hours = 10 if (?dt_dd > (9*60)) else 9

            # If dt_dd already bigger than 10, returning negative value
            dur = (max_hours * 60) - ?dt_dd

            # Do not surpass CDD time limit
            cdd_remaining = (4.5*60) - ?dt_activity

            # Return the smallest
            dur = dur if (dur < cdd_remaining) else cdd_remaining

            # Bigger than 0
            dur = dur if (dur > 0) else -1

            return dur
        }
        

        ; If dt_dd > 4.5 -> DR o WR
        ; Else B_T1 = 45m
                ; #if ((?actual_timestamp + 45) > (24*60 + ?last_dr))
        (calculate_duration_B ?d ?dt_dd ?dt_activity ?actual_timestamp ?last_dr ?last_wr) {
            dur = -1

            # If end of CDD -> DR o WR
            if (?dt_dd >= (4.5*60)):
                # A WR is needed
                if ((?actual_timestamp + 45) > (6*24*60 + ?last_wr)):
                    dur = 45 * 60
                else:
                    dur = 11 * 60
            else:
                dur = 45    # B_T1

            return dur
        }

        (next_break_is_rest)

        ; Zenotravel
        (total-fuel-used ?d - Driver)
        (actual-fuel ?d - Driver)
		(fuel-consumption-rate ?d - Driver)
		(fuel-limit ?d - Driver)
        (speed ?d - Driver)

        (max-load ?d - Driver)
        (load ?d - Driver)
        (weight ?b - box)

        (distance ?c1 ?c2 - city)

        (remaining_transport_dt)
        (next_transport_dt)
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

        ; Finished activity recognition a WD, start with Zenotravel actions
        (:method transport
            :precondition (destination ?b - box ?c - city)
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
            :precondition (or
                (secuencia_entrada_no_vacia)
                (destination ?b - box ?c - city)
            )

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
                (or
                    (secuencia_entrada_no_vacia)
                    (destination ?b - box ?c - city)
                )
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
        ; Should also work in (modo_generar)
        (:method cdd
            :precondition (or
                (secuencia_entrada_no_vacia)
                (destination ?b - box ?c - city)
            )
            :tasks (
                (:inline (:print "CDD---------------------------------\n")())
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
                        (next_break_is_rest)
                    )
                )

                ; -------------------------------------------

                (b_sequence second)
                (CDD ?d)
                (e_sequence second)

                (:inline
                    ; TODO: Arreglar esto
                    ; (> (dt_cdd) 0)
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
            )
        )

        ; No breaks, ending in RD
        (:method unique
        	:precondition()
        	:tasks (
                ; To ensure RD after CDD
                (:inline
                    ()
                    (next_break_is_rest)
                )

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
                        (next_break_is_rest)
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

                ; Because NDD is placed before in the tree: (9,10]h
                (:inline
                    (<= (dt_dd) (* 10.0 (hours_in_mins)))
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
            :precondition ()
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
            :precondition ()
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
        (:method REST
            :precondition (next_break_is_rest)
            :tasks (
                (A ?d)

                (:inline
                    (and
                        ; (> (dt_activity) 0) ; If included it loops. See commit Part 4
                        (<= (dt_activity) (* 4.5 (hours_in_mins)))
                    )
                    ()
                )

                (:inline
                    ()
                    (assign (dt_cdd_unint) (dt_activity))
                )

                (REST ?d)

                (:inline
                    ()
                    (and
                        (assign (bt_cdd_unint) (current_bt))
                        (not (next_break_is_rest))
                    )
                )
            )
        )

        (:method B_T1
            :precondition (not (next_break_is_rest))
            :tasks (
                (A ?d)

                (:inline
                    (and
                        ; (> (dt_activity) 0)
                        (<= (dt_activity) (* 4.5 (hours_in_mins)))
                    )
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
                    (and
                        ; (> (dt_activity) 0)
                        (<= (dt_activity) (* 4.5 (hours_in_mins)))
                    )
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
        (:method RD
            :precondition (next_break_is_rest)
            :tasks (
                (A ?d)

                (:inline
                    (and
                        ; (> (dt_activity) 0)
                        (<= (dt_activity) (* 4.5 (hours_in_mins)))
                    )
                    (assign (dt_cdd_split2) (dt_activity))
                )

                (REST ?d)

                (:inline
                    ()
                    (and
                        (assign (bt_cdd_split2) (current_bt))
                        (not (next_break_is_rest))
                    )
                )
            )
        )

        (:method B_T3
            :precondition (not (next_break_is_rest))
            :tasks (
                (A ?d)

                (:inline
                    (and
                        ; (> (dt_activity) 0)
                        (<= (dt_activity) (* 4.5 (hours_in_mins)))
                    )
                    (assign (dt_cdd_split2) (dt_activity))
                )

                (B_T3 ?d)

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
                        (not (next_dr_is_t4))
                        (assign (last_dr) ?final)
                        (assign (last_wr) ?final)
                    )
                )
            )
        )


        (:method illegal_daily
            :precondition ()
            :tasks (
                ; Indicate illegality
                (:inline ()
                    (and
                        (not (legal-context yes))
                        (legal-context no)
                    )
                )

                (DR ?d)

                (:inline ()
                    (and
                        (not (legal-context no))
                        (legal-context yes)
                    )
                )

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
                ; Indicate illegality
                (:inline ()
                    (and
                        (not (legal-context yes))
                        (legal-context no)
                    )
                )

                (WR ?d)

                (:inline ()
                    (and
                        (not (legal-context no))
                        (legal-context yes)
                    )
                )

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
                        (not (next_dr_is_t4))
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
        (:method B_T3 
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

        ; Start Zenotravel actions
        (:method transport
            :precondition (and (modo_generar) (destination ?b - box ?c - city))
            :tasks (
                (transport ?d)
            )
        )
        
        ;aquí viene porque se encontró un B con una duración mayor de 15 mins
        (:method PAUSE_CONSIDERED_BREAK
            :precondition (current_action_is_a_break_greater_15) 
            :tasks ()
        ) 
        
        ; aquí se acabó la secuencia de acciones, cuando sale por aquí se le ha acabado la secuencia y CORRECTO Y DEBE TERMINAR
        (:method fin_secuencia_entrada
            :precondition (and (fin_secuencia_entrada) (modo_reconocer))
            :tasks (
                (:inline ()
                    (and
                        (not (modo_reconocer))
                        (modo_generar)
                    )
                )
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
        :parameters (?d - Driver ?dur - number) (!
        (:method modo_generar
            :precondition (modo_generar)
            :tasks (
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

                ; Get duration
                (:inline
                    (and
                        (bind ?dt_dd (dt_dd))
                        (bind ?dt_activity (dt_activity))
                        (bind ?dur (calculate_duration_D ?d ?dt_dd ?dt_activity))
                    )
                    ()
                )

                (D_suggested ?d ?dur ?tkctxt ?drivctxt ?seqctxt ?dayctxt ?weekcount ?daycount ?legalctxt)
            )
        )
        (:method modo_reconocer
            :precondition (modo_reconocer)
            :tasks (
                (add_the_current_action_to_plan typeD ?dur)
                
                ;incrementar el current index para reconocer la siguiente accion de la secuencia)
                (:inline () (increase (current_index_action) 1))
            )

        ))
    )

    (:task O
        :parameters (?d - Driver ?dur - number)
        (:method modo_reconocer
            :precondition (modo_reconocer)
            :tasks (
                (add_the_current_action_to_plan typeO ?dur)
                
                ;incrementar el current index para reconocer la siguiente accion de la secuencia)
                (:inline () (increase (current_index_action) 1))
            )
        )
    )

    (:task B
        :parameters (?d - Driver ?dur - number) (!
        (:method modo_generar
            :precondition (modo_generar)
            :tasks (
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

                ; Get duration
                ; TODO: Fix. If activiy is 0 (a bug) and next break is a rest it can't continue
                (:inline ()
                    (when (next_break_is_rest) (assign (dt_dd) (* 4.5 (hours_in_mins))))
                )
                (:inline
                    (and
                        ; Get actual timestamp
                        (bind ?k (- (current_index_action) 1))
                        (index_action ?sa ?k)
                        (start_action ?sa ?final)
                        (bind ?start (+ ?final (dt_dd)))

                        ; Get duration
                        (bind ?dt_dd (dt_dd))
                        (bind ?dt_activity (dt_activity))
                        (bind ?last_dr (last_dr))
                        (bind ?last_wr (last_wr))
                        (bind ?dur (calculate_duration_B ?d ?dt_dd ?dt_activity ?start ?last_dr ?last_wr))
                    )
                    ()
                )

                (B_suggested ?d ?dur ?tkctxt ?drivctxt ?seqctxt ?dayctxt ?weekcount ?daycount ?legalctxt)
            )
        )
        (:method modo_reconocer
            :precondition (modo_reconocer)
            :tasks (
                (add_the_current_action_to_plan typeB ?dur)

                ;incrementar el current index para reconocer la siguiente accion de la secuencia)
                (:inline () (increase (current_index_action) 1))				
            )
        ))
    )

    (:task I
        :parameters (?d - Driver ?dur - number)
        (:method modo_reconocer
            :precondition (modo_reconocer)
            :tasks (
                (add_the_current_action_to_plan typeI ?dur)

                ;incrementar el current index para reconocer la siguiente accion de la secuencia)
                (:inline () (increase (current_index_action) 1))
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

    ; -------------------------------------------------------------------------
    ; Generating mode
    ; -------------------------------------------------------------------------

    ; Could be OtherWork too
    (:durative-action D_suggested
        :parameters (?d - Driver ?dur - number ?tkctxt ?drivctxt ?seqctxt ?dayctxt ?weekcount ?daycount ?legalctxt  - context)
        :meta ((:tag prettyprint "?d	?start	?end	?duration	Sug-Driving	?weekcount	?daycount	?dayctxt	?seqctxt	?drivctxt	?tkctxt	?legalctxt"))
        :duration (= ?duration ?dur)
        :condition ()
        :effect ()
    )

    ; -------------------------------------------------------------------------

    (:durative-action B_suggested
        :parameters (?d - Driver ?dur - number ?tkctxt ?drivctxt ?seqctxt ?dayctxt ?weekcount ?daycount ?legalctxt  - context)
        :meta ((:tag prettyprint "?d	?start	?end	?duration	Sug-Break	?weekcount	?daycount	?dayctxt	?seqctxt	?drivctxt	?tkctxt	?legalctxt"))
        :duration (= ?duration ?dur)
        :condition ()
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


    ; =========================================================================
    ; Zenotravel
    ; =========================================================================

    (:derived (enough-transport-time ?d - Driver ?b - box)
        (and
            (at ?b - box ?c1 - city)
            (destination ?b - box ?c2 - city)
            (bind ?dt_dd (dt_dd))
            (bind ?dt_activity (dt_activity))
            (bind ?dur (calculate_duration_D ?d ?dt_dd ?dt_activity))
            
            ; See if enough time to complete transport
            (>= ?dur (+ (* (hours_in_mins) (/ (distance ?c1 ?c2) (speed ?d))) 5)) ; +5 min margin
        )
    )

    (:task transport
        :parameters (?d - Driver)
        (:method delivery
            :precondition (destination ?b - box ?c - city)
            :tasks (
                (transport-box ?b ?c)
                (transport ?d)
            )
        )

        (:method finished
            :precondition ()
            :tasks ()
        )
    )

    ; ---------------------------------------------------------------------------

    (:task transport-box
        :parameters (?b - box ?c_final - city)
        (:method BoxAtDestination
            :precondition (at ?b ?c_final)
            :tasks (:inline () (not (destination ?b ?c)))
        )

        (:method UnloadBox
            :precondition (and (at ?d - driver ?c_final) (in ?b ?d))
            :tasks (
                (unload ?d ?c_final)
            )
        )
        
        (:method BoxAndDriverAtCity ; If package and driver in the same city
            :precondition (and  
                (at ?b - box ?c1 - city)
                (at ?d - driver ?c1 - city)
            )
                
            :tasks (
                (load ?d ?c1 ?c_final)
                (drive ?d ?c1 ?c_final)
            )
        )
        
        (:method ContinuingSplitDriving
            :precondition (and
                (> (remaining_transport_dt) 0)
                (in ?b - box ?d - driver)
                (at ?d - driver ?c1 - city)
            )                
            :tasks (
                (drive ?d ?c1 ?c_final)
            )
        )

        (:method BoxAlreadyLoaded ; Package already loaded in the truck
            :precondition (and
                (at ?d - driver ?c1 - city)
                (in ?b ?d)
                (destination ?b ?c_final)
            )
            :tasks (
                (load ?d ?c1 ?c_final)
                (drive ?d ?c1 ?c_final)
            )
        )

        (:method DriverInOtherCity ; If driver in another city, bring him back
            :precondition (and 
                (at ?b - box ?c1 - city)
                (at ?d - driver ?c2 - city)
                (not (= ?c1 ?c2))
            )
            :tasks (
                (load ?d ?c2 ?c1)   ; Bring all packages from other city        
                (drive ?d ?c2 ?c1)
            )
        )
    )


    ; ---------------------------------------------------------------------------

    ; There should be an option to optimize total-fuel-used and an additional
    ; method to check if all packages should be loaded
    (:task load ; Load all packages in actual city
        :parameters (?d - driver ?c1 - city ?c2 - city)
        (:method load
            :precondition (and
                (at ?b - box ?c1)
                (at ?d ?c1)
            )
            :tasks (
                (board ?b ?d ?c1)
                (load ?d ?c1 ?c2)
            )
        )

        (:method end
            :precondition ()
            :tasks ()
        )
    )

    (:task unload ; Unload all packages whose destination is actual city
        :parameters (?d - driver ?c - city)
        (:method unload
            :precondition (and
                (in ?b - box ?d)
                (at ?d ?c)
                (destination ?b - box ?c)
            )
            :tasks (
                (debark ?b ?d ?c)
                (unload ?d ?c)
            )
        )

        (:method end
            :precondition ()
            :tasks ()
        )
    )

    ; ---------------------------------------------------------------------------

    (:task board
        :parameters (?b - box ?d - Driver ?c - city)
        (:method unique
            :precondition (and
                (at ?b ?c)
                (at ?d ?c)
                (> (max-load ?d) (load ?d))
            )
            :tasks (
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

                (load_p ?d ?b ?c ?tkctxt ?drivctxt ?seqctxt ?dayctxt ?weekcount ?daycount ?legalctxt)
            )
        )
    )

    (:task debark
        :parameters (?b - box ?d - Driver ?c - city)
        (:method unique
            :precondition (and
                (in ?b ?d)
                (at ?d ?c)
            )
            :tasks (
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

                (unload_p ?d ?b ?c ?tkctxt ?drivctxt ?seqctxt ?dayctxt ?weekcount ?daycount ?legalctxt)
            )
        )
    )

    ; -------------------------------------------------------------------------

    (:task drive
        :parameters (?d - Driver ?c1 - city ?c2 - city)
        (:method no-refuel ; Al estar primero priorizamos el volar deprisa
            :precondition ()
            :tasks (        
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

                (drive-sequence ?d ?c1 ?c2)

                (:inline
                    (>= (actual-fuel ?d) 0)
                    ()
                )
            )
        )

        (:method refuel ; Probamos repostando
            :precondition ()
            :tasks (
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

                (refuel ?d ?tkctxt ?drivctxt ?seqctxt ?dayctxt ?weekcount ?daycount ?legalctxt)
                (drive-sequence ?d ?c1 ?c2)

                (:inline
                    (>= (actual-fuel ?d) 0)
                    ()
                )
            )
        )

        ; Needs to refuel mid-way (more than one time in total)
        (:method refuel-mid-way
            :precondition ()
            :tasks (
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

                (refuel-on-the-way ?d ?c1 ?c2 ?tkctxt ?drivctxt ?seqctxt ?dayctxt ?weekcount ?daycount ?legalctxt)
                (drive-sequence ?d ?c1 ?c2)

                (:inline
                    (>= (actual-fuel ?d) 0)
                    ()
                )
            )
        )

        ; Layover don't needed thanks to the breaks
        ; (:method layover
            ; :precondition (and
                ; (> (distance ?c1 ?c3 - city) 0)
                ; (> (distance ?c1 ?c2 - city) (distance ?c1 ?c3))
                ; (> (distance ?c1 ?c2 - city) (distance ?c3 ?c2))

                ; (not (= ?c2 ?c3))
                ; (not (= ?c1 ?c3))
            ; )
    )

    ; ---------------------------------------------------------------------------

    ; Para comprobar si hay suficiente fuel
    (:derived   
        (enough-fuel ?d - Driver ?c1 - city ?c2 - city)
        (>= (actual-fuel ?d) (* (distance ?c1 ?c2) (fuel-consumption-rate ?d)) )
    )

    (:task drive-sequence
        :parameters (?d - Driver ?c1 ?c2 - city)        
        (:method break2
            :precondition (> (remaining_transport_dt) 0)
            :tasks (
                ; Get duration before break
                (:inline
                    (and
                        (bind ?dt_dd (dt_dd))
                        (bind ?dt_activity (dt_activity))
                        (bind ?dur (calculate_duration_D ?d ?dt_dd ?dt_activity))
                        (> ?dur 0)
                    )
                    ; See if enough time to complete transport
                    (and
                        (assign (next_transport_dt) ?dur)
                        (when (< (remaining_transport_dt) ?dur) (assign (next_transport_dt) (remaining_transport_dt)))
                    )
                )

                ; If duration is less than full DD (4.5), indicate the correct value
                ; dur2 will be <= dur 
                (:inline
                    (bind ?dur2 (next_transport_dt))
                    (and
                        (decrease (remaining_transport_dt) ?dur2)
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

                (drive_p_fixed_duration ?d ?c1 ?c2 ?dur2 ?tkctxt ?drivctxt ?seqctxt ?dayctxt ?weekcount ?daycount ?legalctxt)
            )
        )

        (:method no_break
            :precondition ()
            :tasks (
                ; Get max duration before break
                (:inline
                    (and
                        (bind ?dt_dd (dt_dd))
                        (bind ?dt_activity (dt_activity))
                        (bind ?dur (calculate_duration_D ?d ?dt_dd ?dt_activity))
                        (> ?dur 0)
                        
                        ; See if enough time to complete transport
                        (>= ?dur (* (hours_in_mins) (/ (distance ?c1 ?c2) (speed ?d))))
                    )
                    ()
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

                (drive_p ?d ?c1 ?c2 ?tkctxt ?drivctxt ?seqctxt ?dayctxt ?weekcount ?daycount ?legalctxt)
            )
        )

        (:method break
            :precondition ()
            :tasks (
                ; Get duration before break
                (:inline
                    (and
                        (bind ?dt_dd (dt_dd))
                        (bind ?dt_activity (dt_activity))
                        (bind ?dur (calculate_duration_D ?d ?dt_dd ?dt_activity))
                        (> ?dur 0)
                    )
                    (and
                        ; Get total duration
                        (when (<= (remaining_transport_dt) 0)
                            (assign (remaining_transport_dt) (* (hours_in_mins) (/ (distance ?c1 ?c2) (speed ?d))))
                        )
                        (decrease (remaining_transport_dt) ?dur)
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

                (drive_p_fixed_duration ?d ?c1 ?c2 ?dur ?tkctxt ?drivctxt ?seqctxt ?dayctxt ?weekcount ?daycount ?legalctxt)
            )
        )
    )

    ; ---------------------------------------------------------------------------

    (:durative-action load_p
        :parameters (?d - Driver ?b - box ?c - city ?tkctxt ?drivctxt ?seqctxt ?dayctxt ?weekcount ?daycount ?legalctxt  - context)
        :meta ((:tag prettyprint "?d	?start	?end	?duration	Sug-Load	?weekcount	?daycount	?dayctxt	?seqctxt	?drivctxt	A	?legalctxt	?b"))
        :duration (= ?duration 15)
        :condition ()
        :effect (and  
            (not (at ?b ?c))
            (in ?b ?d)
            (increase (load ?d) (weight ?b))
        )
    )
    
    (:durative-action unload_p
        :parameters (?d - Driver ?b - box ?c - city ?tkctxt ?drivctxt ?seqctxt ?dayctxt ?weekcount ?daycount ?legalctxt  - context)
        :meta ((:tag prettyprint "?d	?start	?end	?duration	Sug-Unload	?weekcount	?daycount	?dayctxt	?seqctxt	?drivctxt	A	?legalctxt	?b"))
        :duration (= ?duration 15)
        :condition (:print "- Package delivered\n")
        :effect (and  
            (at ?b ?c)
            (not (in ?b ?d))
            (not (destination ?b ?c))
            (decrease (load ?d) (weight ?b))
        )
    )

    (:durative-action drive_p
        :parameters (?d - Driver ?c1 ?c2 - city ?tkctxt ?drivctxt ?seqctxt ?dayctxt ?weekcount ?daycount ?legalctxt  - context)
        :meta ((:tag prettyprint "?d	?start	?end	?duration	Sug-Driving	?weekcount	?daycount	?dayctxt	?seqctxt	?drivctxt	A	?legalctxt	?c1 ?c2"))
        :duration (= ?duration (* (hours_in_mins) (/ (distance ?c1 ?c2) (speed ?d))))
        :condition (bind ?dur (* (hours_in_mins) (/ (distance ?c1 ?c2) (speed ?d))))
        :effect (and 
            (not (at ?d ?c1))
            (at ?d ?c2)
            (increase (total-fuel-used ?d)
                        (* (distance ?c1 ?c2) (fuel-consumption-rate ?d)))
            (decrease (actual-fuel ?d)
                        (* (distance ?c1 ?c2) (fuel-consumption-rate ?d)))

            (increase (dt_activity) ?dur)
        )
    )

    (:durative-action drive_p_fixed_duration
        :parameters (?d - Driver ?c1 ?c2 - city ?dur - number ?tkctxt ?drivctxt ?seqctxt ?dayctxt ?weekcount ?daycount ?legalctxt  - context)
        :meta ((:tag prettyprint "?d	?start	?end	?duration	Sug-Driving	?weekcount	?daycount	?dayctxt	?seqctxt	?drivctxt	A	?legalctxt	?c1 ?c2"))
        :duration (= ?duration ?dur)
        :condition ()
        :effect (and
            (when (<= (remaining_transport_dt) 0)
                (and
                    (not (at ?d ?c1))
                    (at ?d ?c2)
                )
            )

            (increase (dt_activity) ?dur)
            (assign (current_dt) ?dur)

            (increase (total-fuel-used ?d) 
                (* (/ (* (fuel-consumption-rate ?d) (speed ?d)) 60) ?dur))
            (decrease (actual-fuel ?d)
                (* (/ (* (fuel-consumption-rate ?d) (speed ?d)) 60) ?dur))
        )
    )

    (:durative-action refuel
        :parameters (?d - Driver ?tkctxt ?drivctxt ?seqctxt ?dayctxt ?weekcount ?daycount ?legalctxt  - context)
        :meta ((:tag prettyprint "?d	?start	?end	?duration	Sug-Refuel	?weekcount	?daycount	?dayctxt	?seqctxt	?drivctxt	A	?legalctxt"))
        :duration (= ?duration 10)
        :condition ()
        :effect (assign (actual-fuel ?d) (fuel-limit ?d))
    )

    (:durative-action refuel-on-the-way
        :parameters (?d - Driver ?c1 ?c2 - city ?tkctxt ?drivctxt ?seqctxt ?dayctxt ?weekcount ?daycount ?legalctxt  - context)
        :meta ((:tag prettyprint "?d	?start	?end	?duration	Sug-Refuelx?times	?weekcount	?daycount	?dayctxt	?seqctxt	?drivctxt	A	?legalctxt"))
        :duration (= ?duration 10)
        :condition (bind ?times (/ (* (distance ?c1 ?c2) (fuel-consumption-rate ?d)) (fuel-limit ?d)))
        :effect (and
            (assign (actual-fuel ?d) (* (fuel-limit ?d) ?times))
        )
    )
)