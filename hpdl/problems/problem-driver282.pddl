(define (problem prueba0) (:domain GantaBi)
	(:customization
		(= :time-format "%d/%m/%Y %H:%M")
		(= :time-horizon-relative 86400) ;; que son los minutos que tienen 2 meses
		(= :time-start "01/01/2017 00:00")
		(= :time-unit :minutes)
	)
	(:objects
		driver282 - Driver

		
 - TaskInstanceSymbol
		
 - TaskInstanceSymbol
		B14687
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

		(= (current_index_action) 42924)

		(= (last_dr) "15/01/2017 11:01")
		(= (last_wr) "15/01/2017 11:01")
		(= (actual-timestamp) "15/01/2017 11:01")

		; Events
		(index_action B14687 42924)
		(is_action B14687)
		(is_typeB B14687)
		(start_action B14687 "15/01/2017 11:01")
		(end_action B14687 "16/01/2017 09:37")
		(duration_action B14687 1356)
		(parameters_typeB B14687 driver282)

	)
	(:tasks-goal
		:tasks (
			(WD driver282)
		)
	)
)