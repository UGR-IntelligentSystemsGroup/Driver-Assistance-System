(define (problem prueba0) (:domain GantaBi)
	(:customization
		(= :time-format "%d/%m/%Y %H:%M")
		(= :time-horizon-relative 86400) ;; que son los minutos que tienen 2 meses
		(= :time-start "01/01/2017 00:00")
		(= :time-unit :minutes)
	)
	(:objects
		driver61 - Driver

		
 - TaskInstanceSymbol
		
 - TaskInstanceSymbol
		B3309
 - TaskInstanceSymbol
	)
	(:init
		; Problem task: Recognize or Generate
		; (modo_generar)
		(modo_reconocer)

		; Initialize contexts
		(legal-context yes)
		(token-context none)
		(sequence-context none)
		(breakType-context none)
		(dayType-context none)
		(= (week-counter) 1)
		(= (day-counter) 1)

		; Initialize functions
		(= (hours_in_mins) 60)
		(= (dt_previous_wd) 0)
		(= (edds_in_week) 0)

		(= (current_index_action) 9887)

		(= (last_dr) "15/01/2017 11:03")
		(= (last_wr) "15/01/2017 11:03")
		(= (actual-timestamp) "15/01/2017 11:03")

		; Events
		(index_action B3309 9887)
		(is_action B3309)
		(is_typeB B3309)
		(start_action B3309 "15/01/2017 11:03")
		(end_action B3309 "16/01/2017 19:34")
		(duration_action B3309 1951)
		(parameters_typeB B3309 driver61)

	)
	(:tasks-goal
		:tasks (
			(WD driver61)
		)
	)
)