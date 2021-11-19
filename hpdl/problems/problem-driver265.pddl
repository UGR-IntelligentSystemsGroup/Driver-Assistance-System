(define (problem prueba0) (:domain GantaBi)
	(:customization
		(= :time-format "%d/%m/%Y %H:%M")
		(= :time-horizon-relative 86400) ;; que son los minutos que tienen 2 meses
		(= :time-start "01/01/2017 00:00")
		(= :time-unit :minutes)
	)
	(:objects
		driver265 - Driver

		
 - TaskInstanceSymbol
		
 - TaskInstanceSymbol
		B14057 B14058
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

		(= (current_index_action) 41197)

		(= (last_dr) "15/01/2017 11:00")
		(= (last_wr) "15/01/2017 11:00")
		(= (actual-timestamp) "15/01/2017 11:00")

		; Events
		(index_action B14057 41197)
		(is_action B14057)
		(is_typeB B14057)
		(start_action B14057 "15/01/2017 11:00")
		(end_action B14057 "15/01/2017 18:09")
		(duration_action B14057 429)
		(parameters_typeB B14057 driver265)

		(index_action B14058 41198)
		(is_action B14058)
		(is_typeB B14058)
		(start_action B14058 "15/01/2017 18:12")
		(end_action B14058 "16/01/2017 06:51")
		(duration_action B14058 759)
		(parameters_typeB B14058 driver265)

	)
	(:tasks-goal
		:tasks (
			(WD driver265)
		)
	)
)