(define (problem prueba0) (:domain GantaBi)
	(:customization
		(= :time-format "%d/%m/%Y %H:%M")
		(= :time-horizon-relative 86400) ;; que son los minutos que tienen 2 meses
		(= :time-start "01/01/2017 00:00")
		(= :time-unit :minutes)
	)
	(:objects
		driver279 - Driver

		
 - TaskInstanceSymbol
		
 - TaskInstanceSymbol
		B14601
 - TaskInstanceSymbol
		I2239 - TaskInstanceSymbol
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

		(= (current_index_action) 42673)

		(= (last_dr) "15/01/2017 11:00")
		(= (last_wr) "15/01/2017 11:00")
		(= (actual-timestamp) "15/01/2017 11:00")

		; Events
		(index_action B14601 42673)
		(is_action B14601)
		(is_typeB B14601)
		(start_action B14601 "15/01/2017 11:00")
		(end_action B14601 "15/01/2017 21:43")
		(duration_action B14601 643)
		(parameters_typeB B14601 driver279)

		(index_action I2239 42674)
		(is_action I2239)
		(is_typeI I2239)
		(start_action I2239 "15/01/2017 21:43")
		(end_action I2239 "16/01/2017 02:07")
		(duration_action I2239 264)
		(parameters_typeI I2239 driver279)

	)
	(:tasks-goal
		:tasks (
			(WD driver279)
		)
	)
)