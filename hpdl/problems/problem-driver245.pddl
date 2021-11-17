(define (problem prueba0) (:domain GantaBi)
	(:customization
		(= :time-format "%d/%m/%Y %H:%M")
		(= :time-horizon-relative 86400) ;; que son los minutos que tienen 2 meses
		(= :time-start "01/01/2017 00:00")
		(= :time-unit :minutes)
	)
	(:objects
		driver245 - Driver

		
 - TaskInstanceSymbol
		
 - TaskInstanceSymbol
		B13020
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

		(= (current_index_action) 38332)

		(= (last_dr) "15/01/2017 11:04")
		(= (last_wr) "15/01/2017 11:04")
		(= (actual-timestamp) "15/01/2017 11:04")

		; Events
		(index_action B13020 38332)
		(is_action B13020)
		(is_typeB B13020)
		(start_action B13020 "15/01/2017 11:04")
		(end_action B13020 "16/01/2017 05:48")
		(duration_action B13020 1124)
		(parameters_typeB B13020 driver245)

	)
	(:tasks-goal
		:tasks (
			(WD driver245)
		)
	)
)