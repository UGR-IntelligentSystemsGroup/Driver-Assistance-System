(define (problem prueba0) (:domain GantaBi)
	(:customization
		(= :time-format "%d/%m/%Y %H:%M")
		(= :time-horizon-relative 86400) ;; que son los minutos que tienen 2 meses
		(= :time-start "01/01/2017 00:00")
		(= :time-unit :minutes)
	)
	(:objects
		driver250 - Driver

		
 - TaskInstanceSymbol
		
 - TaskInstanceSymbol
		B13206
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

		(= (current_index_action) 38863)

		(= (last_dr) "15/01/2017 11:04")
		(= (last_wr) "15/01/2017 11:04")
		(= (actual-timestamp) "15/01/2017 11:04")

		; Events
		(index_action B13206 38863)
		(is_action B13206)
		(is_typeB B13206)
		(start_action B13206 "15/01/2017 11:04")
		(end_action B13206 "16/01/2017 19:34")
		(duration_action B13206 1950)
		(parameters_typeB B13206 driver250)

	)
	(:tasks-goal
		:tasks (
			(WD driver250)
		)
	)
)