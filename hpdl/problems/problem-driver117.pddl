(define (problem prueba0) (:domain GantaBi)
	(:customization
		(= :time-format "%d/%m/%Y %H:%M")
		(= :time-horizon-relative 86400) ;; que son los minutos que tienen 2 meses
		(= :time-start "01/01/2017 00:00")
		(= :time-unit :minutes)
	)
	(:objects
		driver117 - Driver

		
 - TaskInstanceSymbol
		
 - TaskInstanceSymbol
		B6244
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

		(= (current_index_action) 18267)

		(= (last_dr) "15/01/2017 11:52")
		(= (last_wr) "15/01/2017 11:52")
		(= (actual-timestamp) "15/01/2017 11:52")

		; Events
		(index_action B6244 18267)
		(is_action B6244)
		(is_typeB B6244)
		(start_action B6244 "15/01/2017 11:52")
		(end_action B6244 "16/01/2017 08:01")
		(duration_action B6244 1209)
		(parameters_typeB B6244 driver117)

	)
	(:tasks-goal
		:tasks (
			(WD driver117)
		)
	)
)