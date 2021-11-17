(define (problem prueba0) (:domain GantaBi)
	(:customization
		(= :time-format "%d/%m/%Y %H:%M")
		(= :time-horizon-relative 86400) ;; que son los minutos que tienen 2 meses
		(= :time-start "01/01/2017 00:00")
		(= :time-unit :minutes)
	)
	(:objects
		driver34 - Driver

		D2524 D2525 D2526 D2527
 - TaskInstanceSymbol
		O1497 O1498 O1499 O1500 O1501
 - TaskInstanceSymbol
		B1849 B1850 B1851
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

		(= (current_index_action) 5875)

		(= (last_dr) "11/01/2017 11:38")
		(= (last_wr) "11/01/2017 11:38")
		(= (actual-timestamp) "11/01/2017 11:38")

		; Events
		(index_action B1849 5875)
		(is_action B1849)
		(is_typeB B1849)
		(start_action B1849 "11/01/2017 11:38")
		(end_action B1849 "11/01/2017 11:42")
		(duration_action B1849 4)
		(parameters_typeB B1849 driver34)

		(index_action D2524 5876)
		(is_action D2524)
		(is_typeD D2524)
		(start_action D2524 "11/01/2017 11:42")
		(end_action D2524 "11/01/2017 11:43")
		(duration_action D2524 1)
		(parameters_typeD D2524 driver34)

		(index_action O1497 5877)
		(is_action O1497)
		(is_typeO O1497)
		(start_action O1497 "11/01/2017 11:43")
		(end_action O1497 "11/01/2017 11:46")
		(duration_action O1497 3)
		(parameters_typeO O1497 driver34)

		(index_action D2525 5878)
		(is_action D2525)
		(is_typeD D2525)
		(start_action D2525 "11/01/2017 11:46")
		(end_action D2525 "11/01/2017 11:50")
		(duration_action D2525 4)
		(parameters_typeD D2525 driver34)

		(index_action O1498 5879)
		(is_action O1498)
		(is_typeO O1498)
		(start_action O1498 "11/01/2017 11:50")
		(end_action O1498 "11/01/2017 12:24")
		(duration_action O1498 34)
		(parameters_typeO O1498 driver34)

		(index_action B1850 5880)
		(is_action B1850)
		(is_typeB B1850)
		(start_action B1850 "11/01/2017 12:24")
		(end_action B1850 "11/01/2017 13:03")
		(duration_action B1850 39)
		(parameters_typeB B1850 driver34)

		(index_action D2526 5881)
		(is_action D2526)
		(is_typeD D2526)
		(start_action D2526 "11/01/2017 13:03")
		(end_action D2526 "11/01/2017 13:04")
		(duration_action D2526 1)
		(parameters_typeD D2526 driver34)

		(index_action O1499 5882)
		(is_action O1499)
		(is_typeO O1499)
		(start_action O1499 "11/01/2017 13:04")
		(end_action O1499 "11/01/2017 13:09")
		(duration_action O1499 5)
		(parameters_typeO O1499 driver34)

		(index_action B1851 5883)
		(is_action B1851)
		(is_typeB B1851)
		(start_action B1851 "11/01/2017 13:09")
		(end_action B1851 "11/01/2017 13:16")
		(duration_action B1851 7)
		(parameters_typeB B1851 driver34)

		(index_action O1500 5884)
		(is_action O1500)
		(is_typeO O1500)
		(start_action O1500 "11/01/2017 13:16")
		(end_action O1500 "11/01/2017 13:21")
		(duration_action O1500 5)
		(parameters_typeO O1500 driver34)

		(index_action D2527 5885)
		(is_action D2527)
		(is_typeD D2527)
		(start_action D2527 "11/01/2017 13:21")
		(end_action D2527 "11/01/2017 13:23")
		(duration_action D2527 2)
		(parameters_typeD D2527 driver34)

		(index_action O1501 5886)
		(is_action O1501)
		(is_typeO O1501)
		(start_action O1501 "11/01/2017 13:23")
		(end_action O1501 "11/01/2017 13:35")
		(duration_action O1501 12)
		(parameters_typeO O1501 driver34)

	)
	(:tasks-goal
		:tasks (
			(WD driver34)
		)
	)
)