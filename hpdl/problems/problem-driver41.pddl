(define (problem prueba0) (:domain GantaBi)
	(:customization
		(= :time-format "%d/%m/%Y %H:%M")
		(= :time-horizon-relative 86400) ;; que son los minutos que tienen 2 meses
		(= :time-start "01/01/2017 00:00")
		(= :time-unit :minutes)
	)
	(:objects
		driver41 - Driver

		D2977 D2978 D2979 D2980 D2981 D2982 D2983 D2984
 - TaskInstanceSymbol
		O1710 O1711 O1712 O1713 O1714 O1715 O1716
 - TaskInstanceSymbol
		B2223 B2224 B2225 B2226 B2227 B2228
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

		(= (current_index_action) 6922)

		(= (last_dr) "02/01/2017 22:19")
		(= (last_wr) "02/01/2017 22:19")
		(= (actual-timestamp) "02/01/2017 22:19")

		; Events
		(index_action B2223 6922)
		(is_action B2223)
		(is_typeB B2223)
		(start_action B2223 "02/01/2017 22:19")
		(end_action B2223 "02/01/2017 22:28")
		(duration_action B2223 9)
		(parameters_typeB B2223 driver41)

		(index_action D2977 6923)
		(is_action D2977)
		(is_typeD D2977)
		(start_action D2977 "02/01/2017 22:28")
		(end_action D2977 "02/01/2017 23:46")
		(duration_action D2977 78)
		(parameters_typeD D2977 driver41)

		(index_action O1710 6924)
		(is_action O1710)
		(is_typeO O1710)
		(start_action O1710 "02/01/2017 23:46")
		(end_action O1710 "02/01/2017 23:48")
		(duration_action O1710 2)
		(parameters_typeO O1710 driver41)

		(index_action D2978 6925)
		(is_action D2978)
		(is_typeD D2978)
		(start_action D2978 "02/01/2017 23:48")
		(end_action D2978 "02/01/2017 23:49")
		(duration_action D2978 1)
		(parameters_typeD D2978 driver41)

		(index_action B2224 6926)
		(is_action B2224)
		(is_typeB B2224)
		(start_action B2224 "02/01/2017 23:49")
		(end_action B2224 "03/01/2017 00:45")
		(duration_action B2224 56)
		(parameters_typeB B2224 driver41)

		(index_action O1711 6927)
		(is_action O1711)
		(is_typeO O1711)
		(start_action O1711 "03/01/2017 00:45")
		(end_action O1711 "03/01/2017 00:46")
		(duration_action O1711 1)
		(parameters_typeO O1711 driver41)

		(index_action D2979 6928)
		(is_action D2979)
		(is_typeD D2979)
		(start_action D2979 "03/01/2017 00:46")
		(end_action D2979 "03/01/2017 00:47")
		(duration_action D2979 1)
		(parameters_typeD D2979 driver41)

		(index_action O1712 6929)
		(is_action O1712)
		(is_typeO O1712)
		(start_action O1712 "03/01/2017 00:47")
		(end_action O1712 "03/01/2017 00:50")
		(duration_action O1712 3)
		(parameters_typeO O1712 driver41)

		(index_action D2980 6930)
		(is_action D2980)
		(is_typeD D2980)
		(start_action D2980 "03/01/2017 00:50")
		(end_action D2980 "03/01/2017 00:53")
		(duration_action D2980 3)
		(parameters_typeD D2980 driver41)

		(index_action O1713 6931)
		(is_action O1713)
		(is_typeO O1713)
		(start_action O1713 "03/01/2017 00:53")
		(end_action O1713 "03/01/2017 01:00")
		(duration_action O1713 7)
		(parameters_typeO O1713 driver41)

		(index_action D2981 6932)
		(is_action D2981)
		(is_typeD D2981)
		(start_action D2981 "03/01/2017 12:36")
		(end_action D2981 "03/01/2017 12:53")
		(duration_action D2981 17)
		(parameters_typeD D2981 driver41)

		(index_action B2225 6933)
		(is_action B2225)
		(is_typeB B2225)
		(start_action B2225 "03/01/2017 12:53")
		(end_action B2225 "03/01/2017 12:59")
		(duration_action B2225 6)
		(parameters_typeB B2225 driver41)

		(index_action D2982 6934)
		(is_action D2982)
		(is_typeD D2982)
		(start_action D2982 "03/01/2017 12:59")
		(end_action D2982 "03/01/2017 13:02")
		(duration_action D2982 3)
		(parameters_typeD D2982 driver41)

		(index_action O1714 6935)
		(is_action O1714)
		(is_typeO O1714)
		(start_action O1714 "03/01/2017 13:02")
		(end_action O1714 "03/01/2017 13:06")
		(duration_action O1714 4)
		(parameters_typeO O1714 driver41)

		(index_action O1715 6936)
		(is_action O1715)
		(is_typeO O1715)
		(start_action O1715 "03/01/2017 13:09")
		(end_action O1715 "03/01/2017 13:11")
		(duration_action O1715 2)
		(parameters_typeO O1715 driver41)

		(index_action B2226 6937)
		(is_action B2226)
		(is_typeB B2226)
		(start_action B2226 "03/01/2017 13:11")
		(end_action B2226 "03/01/2017 13:38")
		(duration_action B2226 27)
		(parameters_typeB B2226 driver41)

		(index_action D2983 6938)
		(is_action D2983)
		(is_typeD D2983)
		(start_action D2983 "03/01/2017 13:38")
		(end_action D2983 "03/01/2017 13:50")
		(duration_action D2983 12)
		(parameters_typeD D2983 driver41)

		(index_action B2227 6939)
		(is_action B2227)
		(is_typeB B2227)
		(start_action B2227 "03/01/2017 13:50")
		(end_action B2227 "03/01/2017 13:55")
		(duration_action B2227 5)
		(parameters_typeB B2227 driver41)

		(index_action D2984 6940)
		(is_action D2984)
		(is_typeD D2984)
		(start_action D2984 "03/01/2017 13:55")
		(end_action D2984 "03/01/2017 13:56")
		(duration_action D2984 1)
		(parameters_typeD D2984 driver41)

		(index_action O1716 6941)
		(is_action O1716)
		(is_typeO O1716)
		(start_action O1716 "03/01/2017 13:56")
		(end_action O1716 "03/01/2017 14:01")
		(duration_action O1716 5)
		(parameters_typeO O1716 driver41)

		(index_action B2228 6942)
		(is_action B2228)
		(is_typeB B2228)
		(start_action B2228 "03/01/2017 14:01")
		(end_action B2228 "03/01/2017 14:32")
		(duration_action B2228 31)
		(parameters_typeB B2228 driver41)

	)
	(:tasks-goal
		:tasks (
			(WD driver41)
		)
	)
)