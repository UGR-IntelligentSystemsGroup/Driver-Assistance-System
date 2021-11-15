(define (problem prueba0) (:domain GantaBi)
	(:customization
		(= :time-format "%d/%m/%Y %H:%M")
		(= :time-horizon-relative 86400) ;; que son los minutos que tienen 2 meses
		(= :time-start "01/01/2017 00:00")
		(= :time-unit :minutes)
	)
	(:objects
		driver95 - Driver

		D6133 D6134 D6135 D6136 D6137 D6138
 - TaskInstanceSymbol
		O3412 O3413 O3414
 - TaskInstanceSymbol
		B5017 B5018 B5019 B5020 B5021 B5022
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

		(= (current_index_action) 14753)

		(= (last_dr) "02/01/2017 07:46")
		(= (last_wr) "02/01/2017 07:46")
		(= (actual-timestamp) "02/01/2017 07:46")

		; Events
		(index_action D6133 14753)
		(is_action D6133)
		(is_typeD D6133)
		(start_action D6133 "02/01/2017 07:46")
		(end_action D6133 "02/01/2017 08:00")
		(duration_action D6133 14)
		(parameters_typeD D6133 driver95)

		(index_action O3412 14754)
		(is_action O3412)
		(is_typeO O3412)
		(start_action O3412 "02/01/2017 08:00")
		(end_action O3412 "02/01/2017 08:10")
		(duration_action O3412 10)
		(parameters_typeO O3412 driver95)

		(index_action B5017 14755)
		(is_action B5017)
		(is_typeB B5017)
		(start_action B5017 "02/01/2017 08:10")
		(end_action B5017 "02/01/2017 08:14")
		(duration_action B5017 4)
		(parameters_typeB B5017 driver95)

		(index_action D6134 14756)
		(is_action D6134)
		(is_typeD D6134)
		(start_action D6134 "02/01/2017 08:14")
		(end_action D6134 "02/01/2017 08:17")
		(duration_action D6134 3)
		(parameters_typeD D6134 driver95)

		(index_action O3413 14757)
		(is_action O3413)
		(is_typeO O3413)
		(start_action O3413 "02/01/2017 08:17")
		(end_action O3413 "02/01/2017 08:21")
		(duration_action O3413 4)
		(parameters_typeO O3413 driver95)

		(index_action D6135 14758)
		(is_action D6135)
		(is_typeD D6135)
		(start_action D6135 "02/01/2017 08:21")
		(end_action D6135 "02/01/2017 08:22")
		(duration_action D6135 1)
		(parameters_typeD D6135 driver95)

		(index_action B5018 14759)
		(is_action B5018)
		(is_typeB B5018)
		(start_action B5018 "02/01/2017 08:22")
		(end_action B5018 "02/01/2017 08:58")
		(duration_action B5018 36)
		(parameters_typeB B5018 driver95)

		(index_action B5019 14760)
		(is_action B5019)
		(is_typeB B5019)
		(start_action B5019 "02/01/2017 09:02")
		(end_action B5019 "02/01/2017 09:38")
		(duration_action B5019 36)
		(parameters_typeB B5019 driver95)

		(index_action O3414 14761)
		(is_action O3414)
		(is_typeO O3414)
		(start_action O3414 "02/01/2017 09:38")
		(end_action O3414 "02/01/2017 09:40")
		(duration_action O3414 2)
		(parameters_typeO O3414 driver95)

		(index_action D6136 14762)
		(is_action D6136)
		(is_typeD D6136)
		(start_action D6136 "02/01/2017 09:40")
		(end_action D6136 "02/01/2017 13:40")
		(duration_action D6136 240)
		(parameters_typeD D6136 driver95)

		(index_action B5020 14763)
		(is_action B5020)
		(is_typeB B5020)
		(start_action B5020 "02/01/2017 13:40")
		(end_action B5020 "02/01/2017 14:27")
		(duration_action B5020 47)
		(parameters_typeB B5020 driver95)

		(index_action D6137 14764)
		(is_action D6137)
		(is_typeD D6137)
		(start_action D6137 "02/01/2017 14:27")
		(end_action D6137 "02/01/2017 16:42")
		(duration_action D6137 135)
		(parameters_typeD D6137 driver95)

		(index_action B5021 14765)
		(is_action B5021)
		(is_typeB B5021)
		(start_action B5021 "02/01/2017 16:42")
		(end_action B5021 "03/01/2017 01:47")
		(duration_action B5021 545)
		(parameters_typeB B5021 driver95)

		(index_action D6138 14766)
		(is_action D6138)
		(is_typeD D6138)
		(start_action D6138 "03/01/2017 01:47")
		(end_action D6138 "03/01/2017 06:14")
		(duration_action D6138 267)
		(parameters_typeD D6138 driver95)

		(index_action B5022 14767)
		(is_action B5022)
		(is_typeB B5022)
		(start_action B5022 "03/01/2017 06:14")
		(end_action B5022 "03/01/2017 06:19")
		(duration_action B5022 5)
		(parameters_typeB B5022 driver95)

	)
	(:tasks-goal
		:tasks (
			(WD driver95)
		)
	)
)