(define (problem prueba0) (:domain GantaBi)
	(:customization
		(= :time-format "%d/%m/%Y %H:%M")
		(= :time-horizon-relative 86400) ;; que son los minutos que tienen 2 meses
		(= :time-start "01/01/2017 00:00")
		(= :time-unit :minutes)
	)
	(:objects
		driver156 - Driver

		D9812
 - TaskInstanceSymbol
		
 - TaskInstanceSymbol
		B8285
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

		(= (current_index_action) 24379)

		(= (last_dr) "15/01/2017 11:04")
		(= (last_wr) "15/01/2017 11:04")
		(= (actual-timestamp) "15/01/2017 11:04")

		; Events
		(index_action B8285 24379)
		(is_action B8285)
		(is_typeB B8285)
		(start_action B8285 "15/01/2017 11:04")
		(end_action B8285 "15/01/2017 23:25")
		(duration_action B8285 741)
		(parameters_typeB B8285 driver156)

		(index_action D9812 24380)
		(is_action D9812)
		(is_typeD D9812)
		(start_action D9812 "15/01/2017 23:25")
		(end_action D9812 "16/01/2017 03:33")
		(duration_action D9812 248)
		(parameters_typeD D9812 driver156)

	)
	(:tasks-goal
		:tasks (
			(WD driver156)
		)
	)
)