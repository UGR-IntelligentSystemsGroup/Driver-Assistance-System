(define (domain GantaBi)
    (:requirements :adl :typing :fluents :derived-predicates :htn-expansion :durative-actions :equality :metatags :timed-initial-literals)

    ; =========================================================================
    ; TYPES
    ; =========================================================================
    (:types
        Jornada ; cada simbolo de tipo Jornada representa una jornada diaria de trabajo
        TaskSymbol
        TaskInstanceSymbol
        TipoAccion
        TipoConduccion
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
        task_A conduce_un_dia conduce_un_dia_NORMAL conduce_un_dia_AMPLIADA Procesa_Accion - TaskSymbol
        conduccion_diaria_normal conduccion_diaria_ampliada - TipoConduccion
        typeC typeO typeP typeE - TipoAccion
        A B_T1 B_T2 B_T3 R_g3 R_g9 R_g11 R_g24 R_g45
        cdd_t2_slice cdd_t2_sequence 
        cdd_t1_start cdd_t1_end cdd_t2_start cdd_t2_end

        ndd edd 
        wd bwd
        month
        na - context
    )

    ; =========================================================================
    ; PREDICATES
    ; =========================================================================

    (:predicates
        (modo_generar)
        (modo_reconocer)

        (dia_consumido)

        (es_jornada ?j - Jornada); predicado usado en los timed initial literals
        (task_failed ?t - TaskSymbol) ;para saber si una task ha fallado, se añade como efecto en los métodos de fallo de tarea
        (modo_conduccion ?c - Driver ?modo - TipoConduccion)

        (inicio_semana ?s - Semana ?i - number)
        (fin_semana ?s - Semana ?f - number)

        ; Contextos
        (token-context ?tkctxt - context)
        (slice-context ?slctxt - context)
        (legal-slice-context ?lsctxt - context)
        (daily-context ?dayctxt - context)
        (weekly-context ?weectxt - context)
        (monthly-context ?monctxt - context)

        ;;***********************************
        ;; TOKEN conditions
        ;;**********************************
        (current_action_is_a_break_greater_15)

        ;;**********************************
        ;;	 FEASIBILITIY conditions
        ;;**********************************
        (conditions_NDD ?c - Driver)
        (less_than_15min ?c)

        (puede_otros_NORMAL ?c - Driver)
        (puede_parada_NORMAL ?c - Driver)
        (puede_espera_NORMAL ?c - Driver)

        (puede_conducir_AMPLIADA ?c - Driver)
        (puede_otros_AMPLIADA ?c - Driver)
        (puede_parada_AMPLIADA ?c - Driver)
        (puede_espera_AMPLIADA ?c - Driver)

        (continuar_recursion)
        (continuar_recursion_A)

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
        (is_typeC ?sa - TaskInstanceSymbol) ; es una accion de tipo conducir ... 
        (is_typeO ?sa - TaskInstanceSymbol) ; es una accion de tipo OTROS    ... 
        (is_typeP ?sa - TaskInstanceSymbol) ; es una accion de tipo PAUSA   ... 	
        (is_typeE ?sa - TaskInstanceSymbol) ; es una accion de tipo ESPERA; 

        ;asi es como se representa un "hecho de tipo accion"
        (parameters_typeC ?sa - TaskInstanceSymbol ?d - Driver); interpretese: los parametros CONCRETOS (estado inicial) de la accion ?sa son: ?d - Driver. 
        (parameters_typeO ?sa - TaskInstanceSymbol ?d - Driver); interpretese: los parametros CONCRETOS (estado inicial) de la accion ?sa son: ?d - Driver. 
        (parameters_typeP ?sa - TaskInstanceSymbol ?d - Driver); interpretese: los parametros CONCRETOS (estado inicial) de la accion ?sa son: ?d - Driver. 
        (parameters_typeE ?sa - TaskInstanceSymbol ?d - Driver); interpretese: los parametros CONCRETOS (estado inicial) de la accion ?sa son: ?d - Driver. 

        (currentindex_es_typeC ?k - number ?sa - TaskInstanceSymbol)
        (currentindex_es_typeO ?k - number ?sa - TaskInstanceSymbol)
        (currentindex_es_typeP ?k - number ?sa - TaskInstanceSymbol)
        (currentindex_es_typeE ?k - number ?sa - TaskInstanceSymbol)

        ; Depuración
        (write_hola ?p - number)
        (write_debug ?p - number)
        (modo_depuracion)
        (DEBUG ?msg - Mensaje)
    )

    ; =========================================================================
    ; FUNCTIONS
    ; =========================================================================

    (:functions
        (current_index_action) ; represnta el indice actual que apunta a la accion que hay que procesar en modo reconocer

        ;ACUMULADORES TOTALES
        (tiempo_conduccion ?c - Driver)
        (tiempo_otros ?c - Driver)
        (tiempo_parada ?c - Driver)
        (tiempo_espera ?c - Driver)

        ;ACUMULADORES POR SEMANA
        (tiempo_conduccion_semana ?c - Driver)
        (tiempo_otros_semana ?c - Driver)
        (tiempo_parada_semana ?c - Driver)
        (tiempo_espera_semana ?c - Driver)

        ;ACUMULADORES POR DIA
        (dt_day ?c - Driver)
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

        (tiempo_otros_dia ?c - Driver)
        (tiempo_parada_dia ?c - Driver)
        (tiempo_espera_dia ?c - Driver)

        (current_rt) ;tiempo de descanso actual, se entiende que el recién reconocido
        (current_dt) ;current driving time of the recently recognized activity

        (duracion_conduccion ?c - Driver)

        (minutos_consumidos)

        (contador_veces_AMPLIADA_en_semana)

        ; en el  modo generar la duración de la conducción dependerá del tipo de conductor
        ; esto es un ejemplo y se podría hacer directamente sin codigo python 
        (calcula_duracion_C ?c) { return 4 }
        (calcula_duracion_O ?c) { return 2 } ; lo mismo para OPE
        (calcula_duracion_P ?c) { return 2 }
        (calcula_duracion_E ?c) { return 2 }

        ; Valores constantes
        (one_year) { return 365.0*24.0 }
        (one_month) { return 30.0*24.0 }
        (hours_in_mins ?hs) { return ?hs*60 }
        (horas_en_minutos ?horas) { return ?horas*60 }
        (hora_en_minutos) { return 60 }

        (mensaje_fulfill ?x) {
	    	if (?x == 2):
	    		s = "Unable to fullfill all administration preferences, trying format and medication_time"
	    		print s
	    		return ?x
	    	elif (?x == 1):
	    		s = "Unable to fullfill all administration preferences, trying medication_time"
	    		print s
	    		return ?x
	    	elif (?x == 0):
	    		s = "Unable to fullfill any administration preference, trying a valid Treatment" 
            
			print s 
			return ?x
		}

        ; Depuración ?
        (comor) {
            print "imprimo S "
            print s 
            return 0
        }

        (no_hay_mas) {
            print "NO HAY MAS"
            s = raw_input("Continuar?: (0/1)")
            return int(s)
        }

	    (entra_en ?x) {
            print "ENTRA EN ", ?x
            return ?x
	    }
    )

    ; =========================================================================
    ; DERIVED
    ; =========================================================================

    ; Depuración
    (:derived (write_hola ?p) { 
            print "falla con prioridad", ?p 
            return true 
        }
    )

    (:derived (write_debug ?p) { 
            print "va con prioridad", ?p 
            return 1 
        }
    )

    (:derived (task_failed ?p) { 
            print "HA FALLADO", ?p 
            return 1 
        }
    )

    ; -------------------------------------------------------------------------

    (:derived (conditions_NDD ?c)
        (AND
            (<= (dt_day ?c) (* 9 (hora_en_minutos)))
        )
    )

    (:derived (puede_otros_NORMAL ?c)
        (AND
            (<= (tiempo_otros_dia ?c) (* 5 (hora_en_minutos)))
        )
    )

    (:derived (puede_parada_NORMAL ?c)
        (AND
            (<= (tiempo_parada_dia ?c) (* 5 (hora_en_minutos)))
        )
    )

    (:derived (puede_espera_NORMAL ?c)
        (AND
            (<= (tiempo_espera_dia ?c) (* 5 (hora_en_minutos)))
        )
    )

    (:derived (puede_conducir_AMPLIADA ?c)
        (AND
            (<= (dt_day ?c) (* 10 (hora_en_minutos)))
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
            ( > (minutos_consumidos) (* 24 (hora_en_minutos)))
        )
    )

    (:derived (continuar_recursion)
        (AND
            ( <= (minutos_consumidos) (* 24 (hora_en_minutos)))
            (:print "TODAVÍA no ha consumido 24 horas\n")
            (secuencia_entrada_no_vacia)
            (:print "TODAVÍA NO HA LLEGADO AL FIN DE LA SECUENCIA\n")
        )
    )

    (:derived (less_than_15min ?c)
        (AND
            (<= (dt_day ?c) (* 9 (hora_en_minutos)))
        )
    )

    (:derived (current_action_is_a_break_greater_15)
        (AND
            (currentindex_es_typeP ?k ?sa)
            (duration_action ?sa ?dur)
            (>= ?dur 15)
        )
    )

    ;***********************************************

    ; (:task conduce_un_dia
    ; 	:parameters (?c - Driver)
    ; 	(:method normal
    ; 		:precondition ()
    ; 		:tasks (
    ; 				;INICIALIZAR ACUMULADORES DE CADA DIA
    ; 				(:inline () (and (assign (minutos_consumidos) 0)
    ; 								 (assign (dt_day ?c) 0)
    ; 								 (assign (tiempo_otros_dia ?c) 0)
    ; 								 (assign (tiempo_parada_dia ?c) 0)
    ; 								 (assign (tiempo_espera_dia ?c) 0)))
    ; 				;(NDD ?c)
    ; 				(NDD ?c))
    ; 		)

    ; 	(:method ampliada
    ; 		:precondition ()
    ; 		:tasks (
    ; 				;INICIALIZAR ACUMULADORES DE CADA DIA
    ; 				(:inline () (and (assign (minutos_consumidos) 0)
    ; 								 (assign (dt_day ?c) 0)
    ; 								 (assign (tiempo_otros_dia ?c) 0)
    ; 								 (assign (tiempo_parada_dia ?c) 0)
    ; 								 (assign (tiempo_espera_dia ?c) 0)))
    ; 				(conduce_un_dia_AMPLIADA ?c))
    ; 		)

    ; )

    ; =========================================================================
    ; TASKS
    ; =========================================================================

    ; DailyDriving
    (:task DD
        :parameters (?d - Driver)
        (:method ndd
            :precondition ()
            :tasks ( 
                (NDD ?d)
                (DD ?d)
            )
        )

        (:method ndd
            :precondition ()
            :tasks ( 
                (NDD ?d)
                (DD ?d)
            )
        )

        (:method base
            :precondition ()
            :tasks ()
        )
    )

    ; -------------------------------------------------------------------------

    ; Normal Daily Driving
    (:task NDD
        :parameters (?d - Driver) 
        (:method SINGLE
            :precondition()
            :tasks (
                (reset_counters)
                (b_daily_context NDD)
                (CDD ?d)
                (:inline
                    (<= (dt_current_cdd) (hours_in_mins 9.0))
                    ()
                )
                (e_daily_context NDD)
            )
        )
    )

    ; -------------------------------------------------------------------------

    ; Extended Daily Driving - <10h total
    (:task EDD
        :parameters (?d - Driver) 
        (:method SINGLE
            :precondition()
            :tasks (
                (reset_counters)
                (CDDs_S ?d)
                (:inline
                    ()
                    (assign (dt_last_CDDs_S) (dt_current_CDDs_S))
                )
                (reset_counters)
                (CDDs_S ?d)
                (b_tk A)
                (A ?d)
                (e_tk A)
                (:inline
                    ()
                    (assign (dt_last_slice) (dt_current_slice))
                )
                (RD ?d)
                (:inline
                    (<= ( + (+ (dt_current_cdds_S) (dt_last_CDDs_S)) (dt_last_slice)) (hours_in_mins 10.0))
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
                        (assign (dt_current_cdd_t2_slice) 0)
                        (assign (dt_current_cdd_t2_sequence) 0)
                        (assign (dt_current_CDD_T1_start) 0)
                        (assign (dt_current_CDD_T1_end) 0)
                        (assign (dt_current_CDD_T2_start) 0)
                        (assign (dt_current_CDD_T2_end) 0)
                        (assign (dt_current_cdds_S) 0)
                        (assign (dt_current_cdds_e) 0)
                        (assign (dt_current_cdd) 0)
                        (assign (bt_current_slice) 0)
                        (assign (bt_current_cdd_t2_slice) 0)
                        (assign (bt_current_cdd_t2_sequence) 0)
                    )
                )
            )
        )
    )

    ; -------------------------------------------------------------------------

    ; Continuos Daily Driving
    (:task CDD
        :parameters (?d - Driver) 
        (:method SINGLE
            :precondition()
            :tasks (
                (CDDs_S ?d)
                (CDDs_E ?d)
                (:inline
                    ()
                    (assign
                        (dt_current_cdd)
                        (+ (dt_current_CDDs_S) (dt_current_CDDs_E))
                    )
                )
            )
        )

        ; (:method alt_2
        ; 	:precondition()
        ; 	:tasks ( (CDDs_E ?d) 
        ; 			(:inline ()(assign (dt_current_cdd) (dt_current_CDDs_E))) )
        ; 	)
    )

    ; -------------------------------------------------------------------------

    ; Continuos Daily Driving - Start
    (:task CDDs_S
        :parameters (?d - Driver)
        ; Type 1 (normal, no splits)
        (:method t1
            :precondition()
            :tasks (
                (b_legal_slice CDD_T1_START)
                (CDD_T1_START ?d)
                (e_legal_slice CDD_T1_START)
                (:inline
                    ()
                    (assign
                        (dt_current_CDDs_S)
                        (dt_current_CDD_T1_start))
                )
            )
        )

        ; Type 2 (with a split)
        (:method t2
            :precondition()
            :tasks (
                (b_legal_slice CDD_T2_START)
                (CDD_T2_START ?d)
                (e_legal_slice CDD_T2_START)
                (:inline
                    ()
                    (assign
                        (dt_current_CDDs_S)
                        (dt_current_CDD_T2_start))
                )
            )
        )
    )

    ; -------------------------------------------------------------------------

    ; Continuos Daily Driving - End
    (:task CDDs_E
        :parameters (?d - Driver)
        ; Type 1 (normal, no splits)
        (:method t1
            :precondition()
            :tasks (
                (b_legal_slice CDD_T1_END)
                (CDD_T1_END ?d)
                (e_legal_slice CDD_T1_END)
                (:inline
                    ()
                    (assign
                        (dt_current_CDDs_E)
                        (dt_current_CDD_T1_END))
                )
            )
        ) 

        ; Type 2 (with a split)
        (:method t2
            :precondition()
            :tasks (
                (b_legal_slice CDD_T2_END)
                (CDD_T2_END ?d)
                (e_legal_slice CDD_T2_END)
                (:inline
                    ()
                    (assign
                        (dt_current_CDDs_E)
                        (dt_current_CDD_T2_END))
                )
            )
        )
    )
    
    ; -------------------------------------------------------------------------

    (:task CDD_T1_START
        :parameters (?d - Driver) 
        (:method SINGLE
            :precondition()
            :tasks (
                (b_tk A)
                (A ?d)
                (:inline
                    (<= (dt_current_slice) (hours_in_mins 4.5))
                    ()
                )
                (:inline
                    ()
                    (assign (dt_last_slice) (dt_current_slice))
                )
                (e_tk A)

                (b_tk B_T1)
                (B_T1 ?d)
                (:inline
                    ()
                    (assign (dt_current_CDD_T1_start) (dt_last_slice))
                )
                (e_tk B_T1)
            )
        )
    )

    ; -------------------------------------------------------------------------

    (:task CDD_T1_END
        :parameters (?d - Driver) 
        (:method SINGLE
            :precondition()
            :tasks (
                (b_tk A)
                (A ?d)
                (:inline
                    (<= (dt_current_slice) (hours_in_mins 4.5))
                    ()
                )
                (:inline
                    ()
                    (assign (dt_last_slice) (dt_current_slice))
                )
                (e_tk A)

                (RD ?d)
                (:inline
                    ()
                    (assign (dt_current_CDD_T1_END) (dt_last_slice))
                )
            )
        )
    )

    ; -------------------------------------------------------------------------

    (:task CDD_T2_START
        :parameters (?d - Driver) 
        (:method SINGLE
            :precondition()
            :tasks (
                (CDD_T2_SEQUENCE ?d)
                (:inline
                    (AND
                        (<= (dt_current_cdd_t2_sequence) (hours_in_mins 4.5))
                        (>= (bt_current_cdd_t2_sequence) 45))
                    ()
                )
                (:inline
                    ()
                    (assign
                        (dt_current_CDD_T2_START)
                        (dt_current_cdd_t2_sequence)
                        )
                )
            )
        )
    )

    ; -------------------------------------------------------------------------

    (:task CDD_T2_END
        :parameters (?d - Driver) 
        (:method SINGLE
            :precondition()
            :tasks (
                (CDD_T2_SEQUENCE ?d)
                ;(print_result ?x)
                (b_tk A)
                (A ?d)
                (e_tk A)
                (:inline
                    ()
                    (assign (dt_last_slice) (dt_current_slice))
                )
                (RD ?d)
                (:inline
                    (AND
                        (<= (+ (dt_current_cdd_t2_sequence) (dt_last_slice)) 270); (hours_in_mins 4.5))
                        (>= (bt_current_cdd_t2_sequence) 15))
                    ()
                )
                (:inline
                    ()
                    (assign
                        (dt_current_CDD_T2_END)
                        (+ (dt_current_cdd_t2_sequence) (dt_last_slice)))
                )
            )
        )
    )

    ; -------------------------------------------------------------------------

    (:task CDD_T2_SEQUENCE
        :parameters (?d - Driver) 
        (:method caso_base0
            :precondition()
            :tasks (
                (b_slice CDD_T2_slice)
                (CDD_T2_slice ?d)
                (e_slice CDD_T2_Slice)
                (:inline
                    ()
                    (assign
                        (dt_current_cdd_t2_sequence)
                        (dt_current_cdd_t2_slice))
                )
                (:inline
                    ()
                    (assign
                        (bt_current_cdd_t2_sequence)
                        (bt_current_cdd_t2_slice))
                )
            )
        ) 
        
        (:method recurre
            :precondition ()
            :tasks (
                (b_slice CDD_T2_slice)
                (CDD_T2_slice ?d)
                (e_slice CDD_T2_Slice)
                (:inline
                    ()
                    (increase
                        (dt_current_cdd_t2_sequence)
                        (dt_current_cdd_t2_slice))
                )
                (:inline
                    ()
                    (increase
                        (bt_current_cdd_t2_sequence)
                        (bt_current_cdd_t2_slice))
                )

                (CDD_T2_SEQUENCE ?d))
        )
    )

    ;***************************************************************************************
    ;** AQUI es donde se añaden tareas para marcar el inicio y fin de cada contexto

    (:task CDD_T2_Slice
        :parameters (?d - Driver) 
        (:method Alt_1
            :precondition()
            :tasks (
                (b_tk A)
                (A ?d)
                (e_tk A)
                (:inline
                    ()
                    (assign (dt_last_slice) (dt_current_slice))
                )
                (b_tk B_T2)
                (B_T2 ?d)
                (e_tk B_T2)
                (:inline
                    ()
                    (assign (dt_current_cdd_t2_slice) (dt_last_slice))
                )
                (:inline
                    ()
                    (assign
                        (bt_current_cdd_t2_slice)
                        (bt_current_slice))
                )
            )
        ) 

        (:method Alt_2
            :precondition()
            :tasks (
                (b_tk A)
                (A ?d)
                (e_tk A)
                (:inline
                    ()
                    (assign (dt_last_slice) (dt_current_slice))
                )

                (b_tk B_T3)
                (B_T3 ?d)
                (e_tk B_T3)
                (:inline
                    ()
                    (assign (dt_current_cdd_t2_slice) (dt_last_slice))
                )
                (:inline
                    ()
                    (assign
                        (bt_current_cdd_t2_slice)
                        (bt_current_slice))
                )
            )
        ) 
        
        (:method Alt_3
            :precondition()
            :tasks (
                (b_tk A)
                (A ?d)
                (e_tk A)
                (:inline
                    ()
                    (assign (dt_last_slice) (dt_current_slice))
                )
                (b_tk B_T1)
                (B_T1 ?d)
                (e_tk B_T1)
                (:inline
                    ()
                    (assign (dt_current_cdd_t2_slice) (dt_last_slice))
                )
                (:inline
                    ()
                    (assign
                        (bt_current_cdd_t2_slice)
                        (bt_current_slice))
                )
            )
        )
    )

    ; -------------------------------------------------------------------------
    
    ; ****************************
    ; Rests
    ; ****************************

    ; Daily rest
    (:task RD
        :parameters (?c - Driver) 
        ; Reduced daily rest
        (:method B_T5 ;B_T4: break of [9h, 11h)
            :precondition ()
            :tasks (
                (b_tk R_g9)
                (B ?c ?dur)
                (:inline
                    (and (>= ?dur (hours_in_mins 9)) (< ?dur (hours_in_mins 11)))
                    ()
                )
                (e_tk R_g9)

                (:inline
                    ()
                    (assign (minutos_consumidos) 0))

                (:inline
                    ()
                    (increase (tiempo_parada_dia ?c) ?dur)
                )
                (:inline
                    ()
                    (assign (current_rt) ?dur)
                )
                (:inline
                    ()
                    (assign (dt_current_slice) 0)
                )
            )
        ) 
        
        ; Normal daily rest
        (:method B_T6 ;B_T3: BREAK OF [11h, 24h)
            :precondition ()
            :tasks (
                (b_tk R_g11)
                (B ?c ?dur)
                (:inline
                    (and (>= ?dur (hours_in_mins 11)) (< ?dur (hours_in_mins 24)))
                    ()
                )
                (e_tk R_g11)

                (:inline
                    ()
                    (assign (minutos_consumidos) 0))

                (:inline
                    ()
                    (increase (tiempo_parada_dia ?c) ?dur)
                )
                (:inline
                    ()
                    (assign (current_rt) ?dur)
                )
                (:inline
                    ()
                    (assign (dt_current_slice) 0)
                )
            )
        )
    )


    ; ****************************
    ; Breaks
    ; ****************************

    ; Break tipo 1
    (:task B_T1
        :parameters (?c - Driver)
        (:method B_T1;B_T1: BREAK OF [45min, 3h)
            :precondition ()
            :tasks (
                ;(b_tk B_T1)		
                (B ?c ?dur)
                (:inline
                    (and (>= ?dur 45) (< ?dur (hours_in_mins 3)))
                    ()
                )
                ;(e_tk B_T1)

                (:inline
                    ()
                    (increase (minutos_consumidos) ?dur))
                (:inline
                    ()
                    (increase (tiempo_parada_dia ?c) ?dur)
                )
                (:inline
                    ()
                    (assign (current_rt) ?dur)
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
                    (assign (dt_current_slice) 0)
                )
            )
        )
    )

    ; -------------------------------------------------------------------------

    ; Break tipo 2
    (:task B_T2
        :parameters (?c - Driver) 
        (:method SINGLE
            :precondition ()
            :tasks (
                ;(b_tk B_T2)
                (B ?c ?dur)
                (:inline
                    (and (>= ?dur 15) (< ?dur 30))
                    ()
                )
                ;(e_tk B_T2)

                (:inline
                    ()
                    (increase (minutos_consumidos) ?dur))
                (:inline
                    ()
                    (increase (tiempo_parada_dia ?c) ?dur)
                )
                (:inline
                    ()
                    (assign (current_rt) ?dur)
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
                    (assign (dt_current_slice) 0)
                )
            )
        )
    )

    ; -------------------------------------------------------------------------

    ; Break tipo 3
    (:task B_T3
        :parameters (?c - Driver) 
        (:method SINGLE ;B_T3: BREAK OF [30min, 45min); ahora lo he puesto  [30min, 3h)
            :precondition ()
            :tasks (
                ;(b_tk B_T3)		
                (B ?c ?dur)
                (:inline
                    (and (>= ?dur 30) (< ?dur (hours_in_mins 3)))
                    ()
                )
                ;(e_tk B_T3)

                (:inline
                    ()
                    (increase (minutos_consumidos) ?dur))
                (:inline
                    ()
                    (increase (tiempo_parada_dia ?c) ?dur)
                )
                (:inline
                    ()
                    (assign (current_rt) ?dur)
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
                    (assign (dt_current_slice) 0)
                )
            )
        )
    )
    
    ; -------------------------------------------------------------------------

    ;recognizes a sequence of activities (D|O|B|I) such that dur(B)< 15mins
    (:task A
        :parameters (?c - Driver) 
        (:method recurrir
            :precondition (continuar_recursion)
            :tasks (
                (P_A ?c)

                (:inline
                    (:print "pASA POR AQUI\n")
                    ()
                )
                (:inline
                    (< (current_rt) 15)
                    ()
                )
                (:inline
                    (:print "Menor que 15\n")
                    ()
                )

                (:inline
                    ()
                    (increase (dt_current_slice) (current_dt))
                );calculates driving time of current subsequence
                (A ?c))
        ) 
        
        ;aquí viene porque se encontró una P con una duración mayor de 15 mins
        (:method caso_base0
            :precondition (and 
                (current_action_is_a_break_greater_15) 
                (:print "PAUSE_CONSIDERED_BREAK\n")
            ) 
            :tasks(

            );(MSG_INFO PAUSE_CONSIDERED_BREAK) 
        ) 
        
        ; aquí se acabó el día. Cuando sale por aquí ha reconocido una secuencia de 24 horas. CORRECTO  Y DEBE CONTINUAR
        (:method caso_base1
            :precondition (dia_consumido)
            :tasks (
                EndOfDay
            );(MSG_INFO DIA_CONSUMIDO))
        ) 
        
        ; aquí se acabó la secuencia de acciones, cuando sale por aquí se le ha acabado la secuencia y CORRECTO Y DEBE TERMINAR
        (:method caso_base2
            :precondition (fin_secuencia_entrada)
            :tasks
            (EndOfSequece);(MSG_INFO SECUENCIA_TERMINADA) )
        ) 
        
        ; AQUÍ HA HABIDO UN FALLO: SE DAN las condiciones de recursión, pero NO SE HA PODIDO PROCESAR si continua recursion y no ha entrado en ninguno de los metodos anteriores
        (:method fallar
            :precondition (
                :print "FALLO_LATASK\n"
            )
            :tasks (
                :inline
                    (task_failed task_A)
                    ()
            )
        )
    )

    ; -------------------------------------------------------------------------

    (:task P_A
        :parameters (?c - Driver) 
        ; Driving
        (:method DXX
            :precondition ()
            :tasks (
                (D ?c ?dur)
                (:inline
                    ()
                    (increase (minutos_consumidos) ?dur))
                (:inline
                    ()
                    (increase (dt_day ?c) ?dur))
                (:inline
                    ()
                    (assign (current_rt) 0)
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
                (O ?c ?dur)
                (:inline
                    ()
                    (increase (minutos_consumidos) ?dur))
                (:inline
                    ()
                    (increase (tiempo_otros_dia ?c) ?dur)
                )
                (:inline
                    ()
                    (assign (current_rt) 0)
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
                ;(break)	
                (B ?c ?dur)
                ;(break)
                (:inline
                    (and (< ?dur 15))
                    ()
                )
                (:inline
                    ()
                    (increase (minutos_consumidos) ?dur))
                (:inline
                    ()
                    (increase (tiempo_parada_dia ?c) ?dur)
                )
                (:inline
                    ()
                    (assign (current_rt) ?dur)
                )
                (:inline
                    ()
                    (assign (current_dt) 0)
                )
                ;(:inline () (assign (dt_current_slice) 0))
            )
        ) 
        
        (:method B_T2 ;B_T2: BREAK of [15min, 30min)
            :precondition ()
            :tasks (
                (B ?c ?dur)
                (:inline
                    (and (>= ?dur 15) (< ?dur 30))
                    ()
                )
                (:inline
                    ()
                    (increase (minutos_consumidos) ?dur))
                (:inline
                    ()
                    (increase (tiempo_parada_dia ?c) ?dur)
                )
                (:inline
                    ()
                    (assign (current_rt) ?dur)
                )
                (:inline
                    ()
                    (assign (current_dt) 0)
                )
                (:inline
                    ()
                    (assign (dt_current_slice) 0)
                )
            )
        ) 
        
        (:method B_T3;B_T3: BREAK OF [30min, 45min)
            :precondition ()
            :tasks (
                (B ?c ?dur)
                (:inline
                    (and (>= ?dur 30) (< ?dur (hours_in_mins 3)))
                    ()
                )
                (:inline
                    ()
                    (increase (minutos_consumidos) ?dur))
                (:inline
                    ()
                    (increase (tiempo_parada_dia ?c) ?dur)
                )
                (:inline
                    ()
                    (assign (current_rt) ?dur)
                )
                (:inline
                    ()
                    (assign (current_dt) 0)
                )
                (:inline
                    ()
                    (assign (dt_current_slice) 0)
                )
            )
        ) 
        
        (:method B_T1;B_T1: BREAK OF [45min, 3h)
            :precondition ()
            :tasks (
                (B ?c ?dur)
                (:inline
                    (and (>= ?dur 45) (< ?dur (hours_in_mins 3)))
                    ()
                )
                (:inline
                    ()
                    (increase (minutos_consumidos) ?dur))
                (:inline
                    ()
                    (increase (tiempo_parada_dia ?c) ?dur)
                )
                (:inline
                    ()
                    (assign (current_rt) ?dur)
                )
                (:inline
                    ()
                    (assign (current_dt) 0)
                )
                (:inline
                    ()
                    (assign (dt_current_slice) 0)
                )
            )
        ) 
        
        ; Idle
        (:method IXX
            :precondition (puede_espera_NORMAL ?c)
            :tasks (
                (I ?c ?dur)
                (:inline
                    ()
                    (increase (minutos_consumidos) ?dur))
                (:inline
                    ()
                    (increase (tiempo_espera_dia ?c) ?dur)
                )
                (:inline
                    ()
                    (assign (current_rt) 0)
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

    ; -------------------------------------------------------------------------

    ;SUBSECUENCIA TERMINADA EN B_T3

    (:task A_B_T3
        :parameters (?d - Driver) 
        (:method unico
            :precondition ()
            :tasks (
                (cdd_t2_slice ?d); (A ?d)  (B_T3 ?d) 
                (cdd ?d) ;(A ?d) (B_T1 ?d) (A ?d) (RD ?d)
                ;(ndd ?d);  
                (A ?d)
                (RD ?d) ;2º descanso diario, row 21 excel, index 19 pddl
                ;(ndd ?d)	
                (CDD_T2_START ?d)
                ; (CDD_T2_slice ?d);(A ?d) (B_T2 ?d) ; excel 23, indez 21
                ; (print_result ?x)
                ; (CDD_T2_slice ?d);(A ?d) (B_T1 ?d) ; excel 26, index 24
                ; (print_result ?y)
                ; (cdd_t2_slice ?d);(A ?d) (B_T2 ?d) ;excel 28, index 26
                ; (print_result ?z)
                ; (cdd_t2_slice ?d);(A ?d) (B_T1 ?d) ; EXCEL 30, index 28
                ; (print_result ?w)
                (CDD_T1_END ?d);(A ?d) (RD ?d); EXCEL 33, index 31 DESCANSO DIARIO DE 9 HORAS Y SOLO SE PODRÍAN HACER 3 POR SEMANA
                ;(reset_counters)   
                (ndd ?d)
                ;(cdds_s ?d)	
                ;(CDD_T2_START ?d)
                ;(:inline () (assign (dt_current_cdd_t2_sequence) 0))
                ;(:inline () (assign (bt_current_cdd_t2_sequence) 0));
                ; (CDD_T2_SLICE ?D); (A ?d) (B_T2 ?d) 
                ; (print_result ?x)
                ; (print_breaking_time ?x1)

                ; (CDD_T2_SLICE ?d);(A ?d) (B_T3 ?d); 
                ;(reset_counters)												
                ; (print_result ?y)
                ; (print_breaking_time ?x2)
                ;(cdds_s ?d)			
                ;(CDD_T2_END ?d)
                ;(A ?d) (B_T3 ?d) (A ?d) (B_T3 ?d) 
                ;(A ?d) (RD ?d); excel 49, index 47
            )
        )

        ; (:method unico2
        ; 	:precondition ()
        ; 	:tasks  ((A ?d) (B_T3 ?d) (A ?d) (B_T1 ?d) (A ?d) (RD ?d)
        ; 		     (A ?d) 
        ; 			  )
        ; 	)	
    )

    ; -------------------------------------------------------------------------

    (:task print_result
        :parameters (?dt - number) 
        (:method SINGLE
            :precondition (
                bind ?dt
                (dt_current_cdd_t2_end)
            )
            :tasks (
                result ?dt
            )
        )
    )

    ; =========================================================================
    ; Actions
    ; =========================================================================

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

    ; -------------------------------------------------------------------------

    (:action EndOfDay ;
        :parameters ()
        ;:duration (= ?duration ?dur)
        :precondition ()
        :effect ();(increase (tiempo_conduccion ?c) ?dur)
    )

    ; -------------------------------------------------------------------------

    (:action EndOfSequece ;
        :parameters ()
        ;:duration (= ?duration ?dur)
        :precondition ()
        :effect ();(increase (tiempo_conduccion ?c) ?dur)
    )

    ; -------------------------------------------------------------------------

    (:import "primitives.pddl")
)