(define (problem prueba0) (:domain GantaBi)
	(:customization
		(= :time-format "%d/%m/%Y %H:%M")
		(= :time-horizon-relative 86400) ;; que son los minutos que tienen 2 meses
		(= :time-start "01/01/2017 00:00")
		(= :time-unit :minutes)
	)
	(:objects
		driver276 - Driver

		
 - TaskInstanceSymbol
		
 - TaskInstanceSymbol
		B14486
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

		(= (current_index_action) 42365)

		(= (last_dr) "15/01/2017 10:57")
		(= (last_wr) "15/01/2017 10:57")
		(= (actual-timestamp) "15/01/2017 10:57")

		; Events
		(index_action B14486 42365)
		(is_action B14486)
		(is_typeB B14486)
		(start_action B14486 "15/01/2017 10:57")
		(end_action B14486 "16/01/2017 08:43")
		(duration_action B14486 1306)
		(parameters_typeB B14486 driver276)

	)
	(:tasks-goal
		:tasks (
			(WD driver276)
		)
	)
)