(define (problem prueba0) (:domain GantaBi)
	(:customization
		(= :time-format "%d/%m/%Y %H:%M")
		(= :time-horizon-relative 86400) ;; que son los minutos que tienen 2 meses
		(= :time-start "01/01/2017 00:00")
		(= :time-unit :minutes)
	)
	(:objects
		driver49 - Driver

		D3438 D3439 D3440
 - TaskInstanceSymbol
		O1903 O1904 O1905
 - TaskInstanceSymbol
		B2629
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

		(= (current_index_action) 7982)

		(= (last_dr) "04/01/2017 11:30")
		(= (last_wr) "04/01/2017 11:30")
		(= (actual-timestamp) "04/01/2017 11:30")

		; Events
		(index_action D3438 7982)
		(is_action D3438)
		(is_typeD D3438)
		(start_action D3438 "04/01/2017 11:30")
		(end_action D3438 "04/01/2017 11:32")
		(duration_action D3438 2)
		(parameters_typeD D3438 driver49)

		(index_action O1903 7983)
		(is_action O1903)
		(is_typeO O1903)
		(start_action O1903 "04/01/2017 11:32")
		(end_action O1903 "04/01/2017 11:35")
		(duration_action O1903 3)
		(parameters_typeO O1903 driver49)

		(index_action D3439 7984)
		(is_action D3439)
		(is_typeD D3439)
		(start_action D3439 "04/01/2017 11:35")
		(end_action D3439 "04/01/2017 11:48")
		(duration_action D3439 13)
		(parameters_typeD D3439 driver49)

		(index_action O1904 7985)
		(is_action O1904)
		(is_typeO O1904)
		(start_action O1904 "04/01/2017 11:48")
		(end_action O1904 "04/01/2017 12:02")
		(duration_action O1904 14)
		(parameters_typeO O1904 driver49)

		(index_action D3440 7986)
		(is_action D3440)
		(is_typeD D3440)
		(start_action D3440 "04/01/2017 12:02")
		(end_action D3440 "04/01/2017 12:07")
		(duration_action D3440 5)
		(parameters_typeD D3440 driver49)

		(index_action O1905 7987)
		(is_action O1905)
		(is_typeO O1905)
		(start_action O1905 "04/01/2017 12:07")
		(end_action O1905 "04/01/2017 12:10")
		(duration_action O1905 3)
		(parameters_typeO O1905 driver49)

		(index_action B2629 7988)
		(is_action B2629)
		(is_typeB B2629)
		(start_action B2629 "04/01/2017 12:10")
		(end_action B2629 "04/01/2017 12:32")
		(duration_action B2629 22)
		(parameters_typeB B2629 driver49)

	)
	(:tasks-goal
		:tasks (
			(WD driver49)
		)
	)
)