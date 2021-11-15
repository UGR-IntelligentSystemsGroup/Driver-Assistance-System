(define (problem prueba0) (:domain GantaBi)
	(:customization
		(= :time-format "%d/%m/%Y %H:%M")
		(= :time-horizon-relative 86400) ;; que son los minutos que tienen 2 meses
		(= :time-start "01/01/2017 00:00")
		(= :time-unit :minutes)
	)
	(:objects
		driver33 - Driver

		
 - TaskInstanceSymbol
		
 - TaskInstanceSymbol
		B1848
 - TaskInstanceSymbol
		I7 I8 - TaskInstanceSymbol
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

		(= (current_index_action) 5872)

		(= (last_dr) "13/01/2017 16:44")
		(= (last_wr) "13/01/2017 16:44")
		(= (actual-timestamp) "13/01/2017 16:44")

		; Events
		(index_action I7 5872)
		(is_action I7)
		(is_typeI I7)
		(start_action I7 "13/01/2017 16:44")
		(end_action I7 "13/01/2017 17:21")
		(duration_action I7 37)
		(parameters_typeI I7 driver33)

		(index_action B1848 5873)
		(is_action B1848)
		(is_typeB B1848)
		(start_action B1848 "13/01/2017 17:21")
		(end_action B1848 "13/01/2017 17:47")
		(duration_action B1848 26)
		(parameters_typeB B1848 driver33)

		(index_action I8 5874)
		(is_action I8)
		(is_typeI I8)
		(start_action I8 "13/01/2017 17:47")
		(end_action I8 "13/01/2017 18:42")
		(duration_action I8 55)
		(parameters_typeI I8 driver33)

	)
	(:tasks-goal
		:tasks (
			(WD driver33)
		)
	)
)