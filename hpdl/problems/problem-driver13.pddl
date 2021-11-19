(define (problem prueba0) (:domain GantaBi)
	(:customization
		(= :time-format "%d/%m/%Y %H:%M")
		(= :time-horizon-relative 86400) ;; que son los minutos que tienen 2 meses
		(= :time-start "01/01/2017 00:00")
		(= :time-unit :minutes)
	)
	(:objects
		driver13 - Driver

		D898 D899
 - TaskInstanceSymbol
		O468 O469
 - TaskInstanceSymbol
		B679
 - TaskInstanceSymbol
		I5 - TaskInstanceSymbol
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

		(= (current_index_action) 2046)

		(= (last_dr) "15/01/2017 18:45")
		(= (last_wr) "15/01/2017 18:45")
		(= (actual-timestamp) "15/01/2017 18:45")

		; Events
		(index_action B679 2046)
		(is_action B679)
		(is_typeB B679)
		(start_action B679 "15/01/2017 18:45")
		(end_action B679 "15/01/2017 18:52")
		(duration_action B679 7)
		(parameters_typeB B679 driver13)

		(index_action D898 2047)
		(is_action D898)
		(is_typeD D898)
		(start_action D898 "15/01/2017 18:52")
		(end_action D898 "15/01/2017 18:53")
		(duration_action D898 1)
		(parameters_typeD D898 driver13)

		(index_action I5 2048)
		(is_action I5)
		(is_typeI I5)
		(start_action I5 "15/01/2017 18:53")
		(end_action I5 "15/01/2017 18:54")
		(duration_action I5 1)
		(parameters_typeI I5 driver13)

		(index_action O468 2049)
		(is_action O468)
		(is_typeO O468)
		(start_action O468 "15/01/2017 18:54")
		(end_action O468 "15/01/2017 18:56")
		(duration_action O468 2)
		(parameters_typeO O468 driver13)

		(index_action D899 2050)
		(is_action D899)
		(is_typeD D899)
		(start_action D899 "15/01/2017 18:56")
		(end_action D899 "15/01/2017 19:06")
		(duration_action D899 10)
		(parameters_typeD D899 driver13)

		(index_action O469 2051)
		(is_action O469)
		(is_typeO O469)
		(start_action O469 "15/01/2017 19:06")
		(end_action O469 "15/01/2017 19:07")
		(duration_action O469 1)
		(parameters_typeO O469 driver13)

	)
	(:tasks-goal
		:tasks (
			(WD driver13)
		)
	)
)