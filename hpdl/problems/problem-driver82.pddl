(define (problem prueba0) (:domain GantaBi)
	(:customization
		(= :time-format "%d/%m/%Y %H:%M")
		(= :time-horizon-relative 86400) ;; que son los minutos que tienen 2 meses
		(= :time-start "01/01/2017 00:00")
		(= :time-unit :minutes)
	)
	(:objects
		driver82 - Driver

		D5470 D5471 D5472 D5473 D5474
 - TaskInstanceSymbol
		O2992 O2993 O2994 O2995 O2996
 - TaskInstanceSymbol
		B4423 B4424 B4425 B4426
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

		(= (current_index_action) 13026)

		(= (last_dr) "02/01/2017 08:54")
		(= (last_wr) "02/01/2017 08:54")
		(= (actual-timestamp) "02/01/2017 08:54")

		; Events
		(index_action O2992 13026)
		(is_action O2992)
		(is_typeO O2992)
		(start_action O2992 "02/01/2017 08:54")
		(end_action O2992 "02/01/2017 08:59")
		(duration_action O2992 5)
		(parameters_typeO O2992 driver82)

		(index_action D5470 13027)
		(is_action D5470)
		(is_typeD D5470)
		(start_action D5470 "02/01/2017 08:59")
		(end_action D5470 "02/01/2017 09:29")
		(duration_action D5470 30)
		(parameters_typeD D5470 driver82)

		(index_action O2993 13028)
		(is_action O2993)
		(is_typeO O2993)
		(start_action O2993 "02/01/2017 09:29")
		(end_action O2993 "02/01/2017 09:34")
		(duration_action O2993 5)
		(parameters_typeO O2993 driver82)

		(index_action B4423 13029)
		(is_action B4423)
		(is_typeB B4423)
		(start_action B4423 "02/01/2017 09:34")
		(end_action B4423 "02/01/2017 09:59")
		(duration_action B4423 25)
		(parameters_typeB B4423 driver82)

		(index_action D5471 13030)
		(is_action D5471)
		(is_typeD D5471)
		(start_action D5471 "02/01/2017 09:59")
		(end_action D5471 "02/01/2017 10:00")
		(duration_action D5471 1)
		(parameters_typeD D5471 driver82)

		(index_action B4424 13031)
		(is_action B4424)
		(is_typeB B4424)
		(start_action B4424 "02/01/2017 10:00")
		(end_action B4424 "02/01/2017 15:23")
		(duration_action B4424 323)
		(parameters_typeB B4424 driver82)

		(index_action D5472 13032)
		(is_action D5472)
		(is_typeD D5472)
		(start_action D5472 "02/01/2017 15:23")
		(end_action D5472 "02/01/2017 15:25")
		(duration_action D5472 2)
		(parameters_typeD D5472 driver82)

		(index_action O2994 13033)
		(is_action O2994)
		(is_typeO O2994)
		(start_action O2994 "02/01/2017 15:25")
		(end_action O2994 "02/01/2017 15:27")
		(duration_action O2994 2)
		(parameters_typeO O2994 driver82)

		(index_action B4425 13034)
		(is_action B4425)
		(is_typeB B4425)
		(start_action B4425 "02/01/2017 15:27")
		(end_action B4425 "02/01/2017 18:26")
		(duration_action B4425 179)
		(parameters_typeB B4425 driver82)

		(index_action O2995 13035)
		(is_action O2995)
		(is_typeO O2995)
		(start_action O2995 "02/01/2017 18:26")
		(end_action O2995 "02/01/2017 18:28")
		(duration_action O2995 2)
		(parameters_typeO O2995 driver82)

		(index_action D5473 13036)
		(is_action D5473)
		(is_typeD D5473)
		(start_action D5473 "02/01/2017 18:28")
		(end_action D5473 "02/01/2017 18:30")
		(duration_action D5473 2)
		(parameters_typeD D5473 driver82)

		(index_action O2996 13037)
		(is_action O2996)
		(is_typeO O2996)
		(start_action O2996 "02/01/2017 18:30")
		(end_action O2996 "02/01/2017 18:38")
		(duration_action O2996 8)
		(parameters_typeO O2996 driver82)

		(index_action D5474 13038)
		(is_action D5474)
		(is_typeD D5474)
		(start_action D5474 "02/01/2017 18:38")
		(end_action D5474 "02/01/2017 19:05")
		(duration_action D5474 27)
		(parameters_typeD D5474 driver82)

		(index_action B4426 13039)
		(is_action B4426)
		(is_typeB B4426)
		(start_action B4426 "02/01/2017 19:05")
		(end_action B4426 "03/01/2017 08:27")
		(duration_action B4426 802)
		(parameters_typeB B4426 driver82)

	)
	(:tasks-goal
		:tasks (
			(WD driver82)
		)
	)
)