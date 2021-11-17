(define (problem prueba0) (:domain GantaBi)
	(:customization
		(= :time-format "%d/%m/%Y %H:%M")
		(= :time-horizon-relative 86400) ;; que son los minutos que tienen 2 meses
		(= :time-start "01/01/2017 00:00")
		(= :time-unit :minutes)
	)
	(:objects
		driver158 - Driver

		D9842
 - TaskInstanceSymbol
		
 - TaskInstanceSymbol
		B8310
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

		(= (current_index_action) 24444)

		(= (last_dr) "15/01/2017 10:58")
		(= (last_wr) "15/01/2017 10:58")
		(= (actual-timestamp) "15/01/2017 10:58")

		; Events
		(index_action B8310 24444)
		(is_action B8310)
		(is_typeB B8310)
		(start_action B8310 "15/01/2017 10:58")
		(end_action B8310 "15/01/2017 21:43")
		(duration_action B8310 645)
		(parameters_typeB B8310 driver158)

		(index_action D9842 24445)
		(is_action D9842)
		(is_typeD D9842)
		(start_action D9842 "15/01/2017 21:43")
		(end_action D9842 "16/01/2017 02:07")
		(duration_action D9842 264)
		(parameters_typeD D9842 driver158)

	)
	(:tasks-goal
		:tasks (
			(WD driver158)
		)
	)
)