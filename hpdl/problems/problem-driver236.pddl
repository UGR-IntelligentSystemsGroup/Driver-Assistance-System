(define (problem prueba0) (:domain GantaBi)
	(:customization
		(= :time-format "%d/%m/%Y %H:%M")
		(= :time-horizon-relative 86400) ;; que son los minutos que tienen 2 meses
		(= :time-start "01/01/2017 00:00")
		(= :time-unit :minutes)
	)
	(:objects
		driver236 - Driver

		
 - TaskInstanceSymbol
		
 - TaskInstanceSymbol
		B12600
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

		(= (current_index_action) 37114)

		(= (last_dr) "15/01/2017 11:01")
		(= (last_wr) "15/01/2017 11:01")
		(= (actual-timestamp) "15/01/2017 11:01")

		; Events
		(index_action B12600 37114)
		(is_action B12600)
		(is_typeB B12600)
		(start_action B12600 "15/01/2017 11:01")
		(end_action B12600 "16/01/2017 06:51")
		(duration_action B12600 1190)
		(parameters_typeB B12600 driver236)

	)
	(:tasks-goal
		:tasks (
			(WD driver236)
		)
	)
)