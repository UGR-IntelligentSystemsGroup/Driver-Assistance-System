(define (problem prueba0) (:domain GantaBi)
	(:customization
		(= :time-format "%d/%m/%Y %H:%M")
		(= :time-horizon-relative 86400) ;; que son los minutos que tienen 2 meses
		(= :time-start "01/01/2017 00:00")
		(= :time-unit :minutes)
	)
	(:objects
		driver146 - Driver

		
 - TaskInstanceSymbol
		
 - TaskInstanceSymbol
		B7731
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

		(= (current_index_action) 22599)

		(= (last_dr) "15/01/2017 11:05")
		(= (last_wr) "15/01/2017 11:05")
		(= (actual-timestamp) "15/01/2017 11:05")

		; Events
		(index_action B7731 22599)
		(is_action B7731)
		(is_typeB B7731)
		(start_action B7731 "15/01/2017 11:05")
		(end_action B7731 "18/01/2017 18:32")
		(duration_action B7731 4767)
		(parameters_typeB B7731 driver146)

	)
	(:tasks-goal
		:tasks (
			(WD driver146)
		)
	)
)