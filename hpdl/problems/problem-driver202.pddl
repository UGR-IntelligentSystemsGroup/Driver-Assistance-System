(define (problem prueba0) (:domain GantaBi)
	(:customization
		(= :time-format "%d/%m/%Y %H:%M")
		(= :time-horizon-relative 86400) ;; que son los minutos que tienen 2 meses
		(= :time-start "01/01/2017 00:00")
		(= :time-unit :minutes)
	)
	(:objects
		driver202 - Driver

		D12486 D12487 D12488 D12489
 - TaskInstanceSymbol
		O7390 O7391 O7392
 - TaskInstanceSymbol
		B10886 B10887 B10888 B10889
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

		(= (current_index_action) 31943)

		(= (last_dr) "09/01/2017 18:00")
		(= (last_wr) "09/01/2017 18:00")
		(= (actual-timestamp) "09/01/2017 18:00")

		; Events
		(index_action B10886 31943)
		(is_action B10886)
		(is_typeB B10886)
		(start_action B10886 "09/01/2017 18:00")
		(end_action B10886 "13/01/2017 12:47")
		(duration_action B10886 5447)
		(parameters_typeB B10886 driver202)

		(index_action D12486 31944)
		(is_action D12486)
		(is_typeD D12486)
		(start_action D12486 "13/01/2017 12:47")
		(end_action D12486 "13/01/2017 14:12")
		(duration_action D12486 85)
		(parameters_typeD D12486 driver202)

		(index_action B10887 31945)
		(is_action B10887)
		(is_typeB B10887)
		(start_action B10887 "13/01/2017 14:12")
		(end_action B10887 "13/01/2017 14:22")
		(duration_action B10887 10)
		(parameters_typeB B10887 driver202)

		(index_action D12487 31946)
		(is_action D12487)
		(is_typeD D12487)
		(start_action D12487 "13/01/2017 14:22")
		(end_action D12487 "13/01/2017 15:27")
		(duration_action D12487 65)
		(parameters_typeD D12487 driver202)

		(index_action O7390 31947)
		(is_action O7390)
		(is_typeO O7390)
		(start_action O7390 "13/01/2017 15:27")
		(end_action O7390 "13/01/2017 15:35")
		(duration_action O7390 8)
		(parameters_typeO O7390 driver202)

		(index_action D12488 31948)
		(is_action D12488)
		(is_typeD D12488)
		(start_action D12488 "13/01/2017 15:35")
		(end_action D12488 "13/01/2017 15:40")
		(duration_action D12488 5)
		(parameters_typeD D12488 driver202)

		(index_action O7391 31949)
		(is_action O7391)
		(is_typeO O7391)
		(start_action O7391 "13/01/2017 15:40")
		(end_action O7391 "13/01/2017 15:42")
		(duration_action O7391 2)
		(parameters_typeO O7391 driver202)

		(index_action D12489 31950)
		(is_action D12489)
		(is_typeD D12489)
		(start_action D12489 "13/01/2017 15:42")
		(end_action D12489 "13/01/2017 15:43")
		(duration_action D12489 1)
		(parameters_typeD D12489 driver202)

		(index_action O7392 31951)
		(is_action O7392)
		(is_typeO O7392)
		(start_action O7392 "13/01/2017 15:43")
		(end_action O7392 "13/01/2017 15:45")
		(duration_action O7392 2)
		(parameters_typeO O7392 driver202)

		(index_action B10888 31952)
		(is_action B10888)
		(is_typeB B10888)
		(start_action B10888 "13/01/2017 15:45")
		(end_action B10888 "14/01/2017 11:50")
		(duration_action B10888 1205)
		(parameters_typeB B10888 driver202)

		(index_action B10889 31953)
		(is_action B10889)
		(is_typeB B10889)
		(start_action B10889 "15/01/2017 20:46")
		(end_action B10889 "16/01/2017 06:03")
		(duration_action B10889 557)
		(parameters_typeB B10889 driver202)

	)
	(:tasks-goal
		:tasks (
			(WD driver202)
		)
	)
)