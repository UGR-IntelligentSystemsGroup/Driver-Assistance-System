(define (problem prueba0) (:domain GantaBi)
	(:customization
		(= :time-format "%d/%m/%Y %H:%M")
		(= :time-horizon-relative 86400) ;; que son los minutos que tienen 2 meses
		(= :time-start "01/01/2017 00:00")
		(= :time-unit :minutes)
	)
	(:objects
		driver232 - Driver

		D14030 D14031 D14032 D14033 D14034 D14035 D14036 D14037 D14038 D14039 D14040 D14041 D14042 D14043 D14044 D14045 D14046 D14047 D14048 D14049 D14050 D14051 D14052 D14053 D14054 D14055 D14056 D14057 D14058 D14059 D14060 D14061 D14062 D14063 D14064 D14065 D14066 D14067 D14068 D14069 D14070 D14071 D14072 D14073 D14074 D14075 D14076 D14077 D14078 D14079 D14080
 - TaskInstanceSymbol
		O8456 O8457 O8458 O8459 O8460 O8461 O8462 O8463 O8464 O8465 O8466 O8467 O8468 O8469 O8470 O8471 O8472 O8473 O8474 O8475 O8476 O8477 O8478 O8479 O8480 O8481 O8482 O8483 O8484 O8485 O8486 O8487 O8488 O8489 O8490 O8491 O8492 O8493 O8494 O8495 O8496 O8497 O8498 O8499
 - TaskInstanceSymbol
		B12449 B12450 B12451 B12452 B12453 B12454 B12455 B12456 B12457 B12458 B12459 B12460 B12461 B12462 B12463 B12464 B12465 B12466 B12467 B12468 B12469 B12470 B12471 B12472 B12473
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

		(= (current_index_action) 36621)

		(= (last_dr) "05/01/2017 12:04")
		(= (last_wr) "05/01/2017 12:04")
		(= (actual-timestamp) "05/01/2017 12:04")

		; Events
		(index_action D14030 36621)
		(is_action D14030)
		(is_typeD D14030)
		(start_action D14030 "05/01/2017 12:04")
		(end_action D14030 "05/01/2017 13:50")
		(duration_action D14030 106)
		(parameters_typeD D14030 driver232)

		(index_action O8456 36622)
		(is_action O8456)
		(is_typeO O8456)
		(start_action O8456 "05/01/2017 13:50")
		(end_action O8456 "05/01/2017 14:04")
		(duration_action O8456 14)
		(parameters_typeO O8456 driver232)

		(index_action B12449 36623)
		(is_action B12449)
		(is_typeB B12449)
		(start_action B12449 "05/01/2017 14:04")
		(end_action B12449 "05/01/2017 14:08")
		(duration_action B12449 4)
		(parameters_typeB B12449 driver232)

		(index_action D14031 36624)
		(is_action D14031)
		(is_typeD D14031)
		(start_action D14031 "05/01/2017 14:08")
		(end_action D14031 "05/01/2017 14:35")
		(duration_action D14031 27)
		(parameters_typeD D14031 driver232)

		(index_action O8457 36625)
		(is_action O8457)
		(is_typeO O8457)
		(start_action O8457 "05/01/2017 14:35")
		(end_action O8457 "05/01/2017 14:41")
		(duration_action O8457 6)
		(parameters_typeO O8457 driver232)

		(index_action D14032 36626)
		(is_action D14032)
		(is_typeD D14032)
		(start_action D14032 "05/01/2017 14:41")
		(end_action D14032 "05/01/2017 15:14")
		(duration_action D14032 33)
		(parameters_typeD D14032 driver232)

		(index_action O8458 36627)
		(is_action O8458)
		(is_typeO O8458)
		(start_action O8458 "05/01/2017 15:14")
		(end_action O8458 "05/01/2017 15:16")
		(duration_action O8458 2)
		(parameters_typeO O8458 driver232)

		(index_action D14033 36628)
		(is_action D14033)
		(is_typeD D14033)
		(start_action D14033 "05/01/2017 15:16")
		(end_action D14033 "05/01/2017 15:46")
		(duration_action D14033 30)
		(parameters_typeD D14033 driver232)

		(index_action O8459 36629)
		(is_action O8459)
		(is_typeO O8459)
		(start_action O8459 "05/01/2017 15:46")
		(end_action O8459 "05/01/2017 15:49")
		(duration_action O8459 3)
		(parameters_typeO O8459 driver232)

		(index_action B12450 36630)
		(is_action B12450)
		(is_typeB B12450)
		(start_action B12450 "05/01/2017 15:49")
		(end_action B12450 "06/01/2017 08:34")
		(duration_action B12450 1005)
		(parameters_typeB B12450 driver232)

		(index_action D14034 36631)
		(is_action D14034)
		(is_typeD D14034)
		(start_action D14034 "06/01/2017 08:34")
		(end_action D14034 "06/01/2017 08:51")
		(duration_action D14034 17)
		(parameters_typeD D14034 driver232)

		(index_action O8460 36632)
		(is_action O8460)
		(is_typeO O8460)
		(start_action O8460 "06/01/2017 08:51")
		(end_action O8460 "06/01/2017 08:55")
		(duration_action O8460 4)
		(parameters_typeO O8460 driver232)

		(index_action D14035 36633)
		(is_action D14035)
		(is_typeD D14035)
		(start_action D14035 "06/01/2017 08:55")
		(end_action D14035 "06/01/2017 08:56")
		(duration_action D14035 1)
		(parameters_typeD D14035 driver232)

		(index_action O8461 36634)
		(is_action O8461)
		(is_typeO O8461)
		(start_action O8461 "06/01/2017 08:56")
		(end_action O8461 "06/01/2017 08:57")
		(duration_action O8461 1)
		(parameters_typeO O8461 driver232)

		(index_action B12451 36635)
		(is_action B12451)
		(is_typeB B12451)
		(start_action B12451 "06/01/2017 08:57")
		(end_action B12451 "06/01/2017 09:58")
		(duration_action B12451 61)
		(parameters_typeB B12451 driver232)

		(index_action D14036 36636)
		(is_action D14036)
		(is_typeD D14036)
		(start_action D14036 "06/01/2017 09:58")
		(end_action D14036 "06/01/2017 10:02")
		(duration_action D14036 4)
		(parameters_typeD D14036 driver232)

		(index_action B12452 36637)
		(is_action B12452)
		(is_typeB B12452)
		(start_action B12452 "06/01/2017 10:02")
		(end_action B12452 "06/01/2017 10:09")
		(duration_action B12452 7)
		(parameters_typeB B12452 driver232)

		(index_action D14037 36638)
		(is_action D14037)
		(is_typeD D14037)
		(start_action D14037 "06/01/2017 10:09")
		(end_action D14037 "06/01/2017 10:11")
		(duration_action D14037 2)
		(parameters_typeD D14037 driver232)

		(index_action O8462 36639)
		(is_action O8462)
		(is_typeO O8462)
		(start_action O8462 "06/01/2017 10:11")
		(end_action O8462 "06/01/2017 10:14")
		(duration_action O8462 3)
		(parameters_typeO O8462 driver232)

		(index_action D14038 36640)
		(is_action D14038)
		(is_typeD D14038)
		(start_action D14038 "06/01/2017 10:14")
		(end_action D14038 "06/01/2017 10:17")
		(duration_action D14038 3)
		(parameters_typeD D14038 driver232)

		(index_action O8463 36641)
		(is_action O8463)
		(is_typeO O8463)
		(start_action O8463 "06/01/2017 10:17")
		(end_action O8463 "06/01/2017 10:52")
		(duration_action O8463 35)
		(parameters_typeO O8463 driver232)

		(index_action B12453 36642)
		(is_action B12453)
		(is_typeB B12453)
		(start_action B12453 "06/01/2017 10:52")
		(end_action B12453 "06/01/2017 11:08")
		(duration_action B12453 16)
		(parameters_typeB B12453 driver232)

		(index_action O8464 36643)
		(is_action O8464)
		(is_typeO O8464)
		(start_action O8464 "06/01/2017 11:08")
		(end_action O8464 "06/01/2017 11:30")
		(duration_action O8464 22)
		(parameters_typeO O8464 driver232)

		(index_action D14039 36644)
		(is_action D14039)
		(is_typeD D14039)
		(start_action D14039 "06/01/2017 11:30")
		(end_action D14039 "06/01/2017 11:31")
		(duration_action D14039 1)
		(parameters_typeD D14039 driver232)

		(index_action O8465 36645)
		(is_action O8465)
		(is_typeO O8465)
		(start_action O8465 "06/01/2017 11:31")
		(end_action O8465 "06/01/2017 11:37")
		(duration_action O8465 6)
		(parameters_typeO O8465 driver232)

		(index_action D14040 36646)
		(is_action D14040)
		(is_typeD D14040)
		(start_action D14040 "06/01/2017 11:37")
		(end_action D14040 "06/01/2017 15:01")
		(duration_action D14040 204)
		(parameters_typeD D14040 driver232)

		(index_action B12454 36647)
		(is_action B12454)
		(is_typeB B12454)
		(start_action B12454 "06/01/2017 15:01")
		(end_action B12454 "06/01/2017 15:12")
		(duration_action B12454 11)
		(parameters_typeB B12454 driver232)

		(index_action D14041 36648)
		(is_action D14041)
		(is_typeD D14041)
		(start_action D14041 "06/01/2017 15:12")
		(end_action D14041 "06/01/2017 15:16")
		(duration_action D14041 4)
		(parameters_typeD D14041 driver232)

		(index_action O8466 36649)
		(is_action O8466)
		(is_typeO O8466)
		(start_action O8466 "06/01/2017 15:16")
		(end_action O8466 "06/01/2017 15:25")
		(duration_action O8466 9)
		(parameters_typeO O8466 driver232)

		(index_action D14042 36650)
		(is_action D14042)
		(is_typeD D14042)
		(start_action D14042 "06/01/2017 15:25")
		(end_action D14042 "06/01/2017 15:26")
		(duration_action D14042 1)
		(parameters_typeD D14042 driver232)

		(index_action O8467 36651)
		(is_action O8467)
		(is_typeO O8467)
		(start_action O8467 "06/01/2017 15:26")
		(end_action O8467 "06/01/2017 15:43")
		(duration_action O8467 17)
		(parameters_typeO O8467 driver232)

		(index_action D14043 36652)
		(is_action D14043)
		(is_typeD D14043)
		(start_action D14043 "06/01/2017 15:43")
		(end_action D14043 "06/01/2017 15:45")
		(duration_action D14043 2)
		(parameters_typeD D14043 driver232)

		(index_action B12455 36653)
		(is_action B12455)
		(is_typeB B12455)
		(start_action B12455 "06/01/2017 15:45")
		(end_action B12455 "06/01/2017 16:31")
		(duration_action B12455 46)
		(parameters_typeB B12455 driver232)

		(index_action D14044 36654)
		(is_action D14044)
		(is_typeD D14044)
		(start_action D14044 "06/01/2017 16:31")
		(end_action D14044 "06/01/2017 18:52")
		(duration_action D14044 141)
		(parameters_typeD D14044 driver232)

		(index_action O8468 36655)
		(is_action O8468)
		(is_typeO O8468)
		(start_action O8468 "06/01/2017 18:52")
		(end_action O8468 "06/01/2017 18:55")
		(duration_action O8468 3)
		(parameters_typeO O8468 driver232)

		(index_action B12456 36656)
		(is_action B12456)
		(is_typeB B12456)
		(start_action B12456 "06/01/2017 18:55")
		(end_action B12456 "06/01/2017 19:03")
		(duration_action B12456 8)
		(parameters_typeB B12456 driver232)

		(index_action D14045 36657)
		(is_action D14045)
		(is_typeD D14045)
		(start_action D14045 "06/01/2017 19:03")
		(end_action D14045 "06/01/2017 21:06")
		(duration_action D14045 123)
		(parameters_typeD D14045 driver232)

		(index_action O8469 36658)
		(is_action O8469)
		(is_typeO O8469)
		(start_action O8469 "06/01/2017 21:06")
		(end_action O8469 "06/01/2017 21:11")
		(duration_action O8469 5)
		(parameters_typeO O8469 driver232)

		(index_action B12457 36659)
		(is_action B12457)
		(is_typeB B12457)
		(start_action B12457 "06/01/2017 21:11")
		(end_action B12457 "07/01/2017 08:45")
		(duration_action B12457 694)
		(parameters_typeB B12457 driver232)

		(index_action D14046 36660)
		(is_action D14046)
		(is_typeD D14046)
		(start_action D14046 "07/01/2017 08:45")
		(end_action D14046 "07/01/2017 13:00")
		(duration_action D14046 255)
		(parameters_typeD D14046 driver232)

		(index_action O8470 36661)
		(is_action O8470)
		(is_typeO O8470)
		(start_action O8470 "07/01/2017 13:00")
		(end_action O8470 "07/01/2017 13:06")
		(duration_action O8470 6)
		(parameters_typeO O8470 driver232)

		(index_action B12458 36662)
		(is_action B12458)
		(is_typeB B12458)
		(start_action B12458 "07/01/2017 13:06")
		(end_action B12458 "07/01/2017 14:01")
		(duration_action B12458 55)
		(parameters_typeB B12458 driver232)

		(index_action D14047 36663)
		(is_action D14047)
		(is_typeD D14047)
		(start_action D14047 "07/01/2017 14:01")
		(end_action D14047 "07/01/2017 17:49")
		(duration_action D14047 228)
		(parameters_typeD D14047 driver232)

		(index_action O8471 36664)
		(is_action O8471)
		(is_typeO O8471)
		(start_action O8471 "07/01/2017 17:49")
		(end_action O8471 "07/01/2017 17:52")
		(duration_action O8471 3)
		(parameters_typeO O8471 driver232)

		(index_action D14048 36665)
		(is_action D14048)
		(is_typeD D14048)
		(start_action D14048 "07/01/2017 17:52")
		(end_action D14048 "07/01/2017 17:56")
		(duration_action D14048 4)
		(parameters_typeD D14048 driver232)

		(index_action B12459 36666)
		(is_action B12459)
		(is_typeB B12459)
		(start_action B12459 "07/01/2017 17:56")
		(end_action B12459 "07/01/2017 18:42")
		(duration_action B12459 46)
		(parameters_typeB B12459 driver232)

		(index_action D14049 36667)
		(is_action D14049)
		(is_typeD D14049)
		(start_action D14049 "07/01/2017 18:42")
		(end_action D14049 "07/01/2017 19:03")
		(duration_action D14049 21)
		(parameters_typeD D14049 driver232)

		(index_action O8472 36668)
		(is_action O8472)
		(is_typeO O8472)
		(start_action O8472 "07/01/2017 19:03")
		(end_action O8472 "07/01/2017 19:05")
		(duration_action O8472 2)
		(parameters_typeO O8472 driver232)

		(index_action D14050 36669)
		(is_action D14050)
		(is_typeD D14050)
		(start_action D14050 "07/01/2017 19:05")
		(end_action D14050 "07/01/2017 19:08")
		(duration_action D14050 3)
		(parameters_typeD D14050 driver232)

		(index_action O8473 36670)
		(is_action O8473)
		(is_typeO O8473)
		(start_action O8473 "07/01/2017 19:08")
		(end_action O8473 "07/01/2017 19:23")
		(duration_action O8473 15)
		(parameters_typeO O8473 driver232)

		(index_action D14051 36671)
		(is_action D14051)
		(is_typeD D14051)
		(start_action D14051 "07/01/2017 19:23")
		(end_action D14051 "07/01/2017 19:27")
		(duration_action D14051 4)
		(parameters_typeD D14051 driver232)

		(index_action O8474 36672)
		(is_action O8474)
		(is_typeO O8474)
		(start_action O8474 "07/01/2017 19:27")
		(end_action O8474 "07/01/2017 19:29")
		(duration_action O8474 2)
		(parameters_typeO O8474 driver232)

		(index_action D14052 36673)
		(is_action D14052)
		(is_typeD D14052)
		(start_action D14052 "07/01/2017 19:29")
		(end_action D14052 "07/01/2017 20:34")
		(duration_action D14052 65)
		(parameters_typeD D14052 driver232)

		(index_action O8475 36674)
		(is_action O8475)
		(is_typeO O8475)
		(start_action O8475 "07/01/2017 20:34")
		(end_action O8475 "07/01/2017 20:36")
		(duration_action O8475 2)
		(parameters_typeO O8475 driver232)

		(index_action D14053 36675)
		(is_action D14053)
		(is_typeD D14053)
		(start_action D14053 "07/01/2017 20:36")
		(end_action D14053 "07/01/2017 20:42")
		(duration_action D14053 6)
		(parameters_typeD D14053 driver232)

		(index_action O8476 36676)
		(is_action O8476)
		(is_typeO O8476)
		(start_action O8476 "07/01/2017 20:42")
		(end_action O8476 "07/01/2017 20:44")
		(duration_action O8476 2)
		(parameters_typeO O8476 driver232)

		(index_action B12460 36677)
		(is_action B12460)
		(is_typeB B12460)
		(start_action B12460 "07/01/2017 20:44")
		(end_action B12460 "08/01/2017 05:46")
		(duration_action B12460 542)
		(parameters_typeB B12460 driver232)

		(index_action D14054 36678)
		(is_action D14054)
		(is_typeD D14054)
		(start_action D14054 "08/01/2017 05:46")
		(end_action D14054 "08/01/2017 05:47")
		(duration_action D14054 1)
		(parameters_typeD D14054 driver232)

		(index_action O8477 36679)
		(is_action O8477)
		(is_typeO O8477)
		(start_action O8477 "08/01/2017 05:47")
		(end_action O8477 "08/01/2017 05:50")
		(duration_action O8477 3)
		(parameters_typeO O8477 driver232)

		(index_action B12461 36680)
		(is_action B12461)
		(is_typeB B12461)
		(start_action B12461 "08/01/2017 05:50")
		(end_action B12461 "09/01/2017 05:57")
		(duration_action B12461 1447)
		(parameters_typeB B12461 driver232)

		(index_action D14055 36681)
		(is_action D14055)
		(is_typeD D14055)
		(start_action D14055 "09/01/2017 05:57")
		(end_action D14055 "09/01/2017 07:18")
		(duration_action D14055 81)
		(parameters_typeD D14055 driver232)

		(index_action O8478 36682)
		(is_action O8478)
		(is_typeO O8478)
		(start_action O8478 "09/01/2017 07:18")
		(end_action O8478 "09/01/2017 07:20")
		(duration_action O8478 2)
		(parameters_typeO O8478 driver232)

		(index_action D14056 36683)
		(is_action D14056)
		(is_typeD D14056)
		(start_action D14056 "09/01/2017 07:20")
		(end_action D14056 "09/01/2017 07:30")
		(duration_action D14056 10)
		(parameters_typeD D14056 driver232)

		(index_action O8479 36684)
		(is_action O8479)
		(is_typeO O8479)
		(start_action O8479 "09/01/2017 07:30")
		(end_action O8479 "09/01/2017 07:34")
		(duration_action O8479 4)
		(parameters_typeO O8479 driver232)

		(index_action D14057 36685)
		(is_action D14057)
		(is_typeD D14057)
		(start_action D14057 "09/01/2017 07:34")
		(end_action D14057 "09/01/2017 07:37")
		(duration_action D14057 3)
		(parameters_typeD D14057 driver232)

		(index_action O8480 36686)
		(is_action O8480)
		(is_typeO O8480)
		(start_action O8480 "09/01/2017 07:37")
		(end_action O8480 "09/01/2017 07:41")
		(duration_action O8480 4)
		(parameters_typeO O8480 driver232)

		(index_action D14058 36687)
		(is_action D14058)
		(is_typeD D14058)
		(start_action D14058 "09/01/2017 07:41")
		(end_action D14058 "09/01/2017 07:42")
		(duration_action D14058 1)
		(parameters_typeD D14058 driver232)

		(index_action O8481 36688)
		(is_action O8481)
		(is_typeO O8481)
		(start_action O8481 "09/01/2017 07:42")
		(end_action O8481 "09/01/2017 08:14")
		(duration_action O8481 32)
		(parameters_typeO O8481 driver232)

		(index_action D14059 36689)
		(is_action D14059)
		(is_typeD D14059)
		(start_action D14059 "09/01/2017 08:14")
		(end_action D14059 "09/01/2017 08:17")
		(duration_action D14059 3)
		(parameters_typeD D14059 driver232)

		(index_action O8482 36690)
		(is_action O8482)
		(is_typeO O8482)
		(start_action O8482 "09/01/2017 08:17")
		(end_action O8482 "09/01/2017 09:12")
		(duration_action O8482 55)
		(parameters_typeO O8482 driver232)

		(index_action D14060 36691)
		(is_action D14060)
		(is_typeD D14060)
		(start_action D14060 "09/01/2017 09:12")
		(end_action D14060 "09/01/2017 09:15")
		(duration_action D14060 3)
		(parameters_typeD D14060 driver232)

		(index_action O8483 36692)
		(is_action O8483)
		(is_typeO O8483)
		(start_action O8483 "09/01/2017 09:15")
		(end_action O8483 "09/01/2017 09:17")
		(duration_action O8483 2)
		(parameters_typeO O8483 driver232)

		(index_action D14061 36693)
		(is_action D14061)
		(is_typeD D14061)
		(start_action D14061 "09/01/2017 09:17")
		(end_action D14061 "09/01/2017 09:37")
		(duration_action D14061 20)
		(parameters_typeD D14061 driver232)

		(index_action B12462 36694)
		(is_action B12462)
		(is_typeB B12462)
		(start_action B12462 "09/01/2017 09:37")
		(end_action B12462 "09/01/2017 10:24")
		(duration_action B12462 47)
		(parameters_typeB B12462 driver232)

		(index_action D14062 36695)
		(is_action D14062)
		(is_typeD D14062)
		(start_action D14062 "09/01/2017 10:24")
		(end_action D14062 "09/01/2017 10:25")
		(duration_action D14062 1)
		(parameters_typeD D14062 driver232)

		(index_action B12463 36696)
		(is_action B12463)
		(is_typeB B12463)
		(start_action B12463 "09/01/2017 10:25")
		(end_action B12463 "11/01/2017 20:44")
		(duration_action B12463 3499)
		(parameters_typeB B12463 driver232)

		(index_action D14063 36697)
		(is_action D14063)
		(is_typeD D14063)
		(start_action D14063 "11/01/2017 20:44")
		(end_action D14063 "11/01/2017 20:48")
		(duration_action D14063 4)
		(parameters_typeD D14063 driver232)

		(index_action O8484 36698)
		(is_action O8484)
		(is_typeO O8484)
		(start_action O8484 "11/01/2017 20:48")
		(end_action O8484 "11/01/2017 21:04")
		(duration_action O8484 16)
		(parameters_typeO O8484 driver232)

		(index_action B12464 36699)
		(is_action B12464)
		(is_typeB B12464)
		(start_action B12464 "11/01/2017 21:04")
		(end_action B12464 "11/01/2017 21:19")
		(duration_action B12464 15)
		(parameters_typeB B12464 driver232)

		(index_action D14064 36700)
		(is_action D14064)
		(is_typeD D14064)
		(start_action D14064 "11/01/2017 21:19")
		(end_action D14064 "12/01/2017 01:36")
		(duration_action D14064 257)
		(parameters_typeD D14064 driver232)

		(index_action O8485 36701)
		(is_action O8485)
		(is_typeO O8485)
		(start_action O8485 "12/01/2017 01:36")
		(end_action O8485 "12/01/2017 01:39")
		(duration_action O8485 3)
		(parameters_typeO O8485 driver232)

		(index_action B12465 36702)
		(is_action B12465)
		(is_typeB B12465)
		(start_action B12465 "12/01/2017 01:39")
		(end_action B12465 "12/01/2017 02:59")
		(duration_action B12465 80)
		(parameters_typeB B12465 driver232)

		(index_action D14065 36703)
		(is_action D14065)
		(is_typeD D14065)
		(start_action D14065 "12/01/2017 02:59")
		(end_action D14065 "12/01/2017 05:17")
		(duration_action D14065 138)
		(parameters_typeD D14065 driver232)

		(index_action O8486 36704)
		(is_action O8486)
		(is_typeO O8486)
		(start_action O8486 "12/01/2017 05:17")
		(end_action O8486 "12/01/2017 05:22")
		(duration_action O8486 5)
		(parameters_typeO O8486 driver232)

		(index_action D14066 36705)
		(is_action D14066)
		(is_typeD D14066)
		(start_action D14066 "12/01/2017 05:22")
		(end_action D14066 "12/01/2017 06:59")
		(duration_action D14066 97)
		(parameters_typeD D14066 driver232)

		(index_action O8487 36706)
		(is_action O8487)
		(is_typeO O8487)
		(start_action O8487 "12/01/2017 06:59")
		(end_action O8487 "12/01/2017 07:09")
		(duration_action O8487 10)
		(parameters_typeO O8487 driver232)

		(index_action B12466 36707)
		(is_action B12466)
		(is_typeB B12466)
		(start_action B12466 "12/01/2017 07:09")
		(end_action B12466 "12/01/2017 10:36")
		(duration_action B12466 207)
		(parameters_typeB B12466 driver232)

		(index_action D14067 36708)
		(is_action D14067)
		(is_typeD D14067)
		(start_action D14067 "12/01/2017 10:36")
		(end_action D14067 "12/01/2017 10:39")
		(duration_action D14067 3)
		(parameters_typeD D14067 driver232)

		(index_action B12467 36709)
		(is_action B12467)
		(is_typeB B12467)
		(start_action B12467 "12/01/2017 10:39")
		(end_action B12467 "12/01/2017 19:46")
		(duration_action B12467 547)
		(parameters_typeB B12467 driver232)

		(index_action D14068 36710)
		(is_action D14068)
		(is_typeD D14068)
		(start_action D14068 "12/01/2017 19:46")
		(end_action D14068 "12/01/2017 19:48")
		(duration_action D14068 2)
		(parameters_typeD D14068 driver232)

		(index_action O8488 36711)
		(is_action O8488)
		(is_typeO O8488)
		(start_action O8488 "12/01/2017 19:48")
		(end_action O8488 "12/01/2017 20:00")
		(duration_action O8488 12)
		(parameters_typeO O8488 driver232)

		(index_action D14069 36712)
		(is_action D14069)
		(is_typeD D14069)
		(start_action D14069 "12/01/2017 20:00")
		(end_action D14069 "12/01/2017 20:33")
		(duration_action D14069 33)
		(parameters_typeD D14069 driver232)

		(index_action O8489 36713)
		(is_action O8489)
		(is_typeO O8489)
		(start_action O8489 "12/01/2017 20:33")
		(end_action O8489 "12/01/2017 20:38")
		(duration_action O8489 5)
		(parameters_typeO O8489 driver232)

		(index_action D14070 36714)
		(is_action D14070)
		(is_typeD D14070)
		(start_action D14070 "12/01/2017 20:38")
		(end_action D14070 "12/01/2017 20:54")
		(duration_action D14070 16)
		(parameters_typeD D14070 driver232)

		(index_action O8490 36715)
		(is_action O8490)
		(is_typeO O8490)
		(start_action O8490 "12/01/2017 20:54")
		(end_action O8490 "12/01/2017 21:00")
		(duration_action O8490 6)
		(parameters_typeO O8490 driver232)

		(index_action B12468 36716)
		(is_action B12468)
		(is_typeB B12468)
		(start_action B12468 "12/01/2017 21:00")
		(end_action B12468 "13/01/2017 08:37")
		(duration_action B12468 697)
		(parameters_typeB B12468 driver232)

		(index_action D14071 36717)
		(is_action D14071)
		(is_typeD D14071)
		(start_action D14071 "13/01/2017 08:37")
		(end_action D14071 "13/01/2017 08:47")
		(duration_action D14071 10)
		(parameters_typeD D14071 driver232)

		(index_action O8491 36718)
		(is_action O8491)
		(is_typeO O8491)
		(start_action O8491 "13/01/2017 08:47")
		(end_action O8491 "13/01/2017 08:49")
		(duration_action O8491 2)
		(parameters_typeO O8491 driver232)

		(index_action D14072 36719)
		(is_action D14072)
		(is_typeD D14072)
		(start_action D14072 "13/01/2017 08:49")
		(end_action D14072 "13/01/2017 08:51")
		(duration_action D14072 2)
		(parameters_typeD D14072 driver232)

		(index_action B12469 36720)
		(is_action B12469)
		(is_typeB B12469)
		(start_action B12469 "13/01/2017 08:51")
		(end_action B12469 "13/01/2017 08:53")
		(duration_action B12469 2)
		(parameters_typeB B12469 driver232)

		(index_action O8492 36721)
		(is_action O8492)
		(is_typeO O8492)
		(start_action O8492 "13/01/2017 08:53")
		(end_action O8492 "13/01/2017 10:13")
		(duration_action O8492 80)
		(parameters_typeO O8492 driver232)

		(index_action D14073 36722)
		(is_action D14073)
		(is_typeD D14073)
		(start_action D14073 "13/01/2017 10:13")
		(end_action D14073 "13/01/2017 10:17")
		(duration_action D14073 4)
		(parameters_typeD D14073 driver232)

		(index_action B12470 36723)
		(is_action B12470)
		(is_typeB B12470)
		(start_action B12470 "13/01/2017 10:17")
		(end_action B12470 "13/01/2017 10:38")
		(duration_action B12470 21)
		(parameters_typeB B12470 driver232)

		(index_action D14074 36724)
		(is_action D14074)
		(is_typeD D14074)
		(start_action D14074 "13/01/2017 10:38")
		(end_action D14074 "13/01/2017 11:18")
		(duration_action D14074 40)
		(parameters_typeD D14074 driver232)

		(index_action O8493 36725)
		(is_action O8493)
		(is_typeO O8493)
		(start_action O8493 "13/01/2017 11:18")
		(end_action O8493 "13/01/2017 11:23")
		(duration_action O8493 5)
		(parameters_typeO O8493 driver232)

		(index_action B12471 36726)
		(is_action B12471)
		(is_typeB B12471)
		(start_action B12471 "13/01/2017 11:23")
		(end_action B12471 "13/01/2017 21:40")
		(duration_action B12471 617)
		(parameters_typeB B12471 driver232)

		(index_action D14075 36727)
		(is_action D14075)
		(is_typeD D14075)
		(start_action D14075 "13/01/2017 21:40")
		(end_action D14075 "13/01/2017 21:43")
		(duration_action D14075 3)
		(parameters_typeD D14075 driver232)

		(index_action O8494 36728)
		(is_action O8494)
		(is_typeO O8494)
		(start_action O8494 "13/01/2017 21:43")
		(end_action O8494 "13/01/2017 22:01")
		(duration_action O8494 18)
		(parameters_typeO O8494 driver232)

		(index_action D14076 36729)
		(is_action D14076)
		(is_typeD D14076)
		(start_action D14076 "13/01/2017 22:01")
		(end_action D14076 "14/01/2017 02:05")
		(duration_action D14076 244)
		(parameters_typeD D14076 driver232)

		(index_action O8495 36730)
		(is_action O8495)
		(is_typeO O8495)
		(start_action O8495 "14/01/2017 02:05")
		(end_action O8495 "14/01/2017 02:10")
		(duration_action O8495 5)
		(parameters_typeO O8495 driver232)

		(index_action B12472 36731)
		(is_action B12472)
		(is_typeB B12472)
		(start_action B12472 "14/01/2017 02:10")
		(end_action B12472 "14/01/2017 02:59")
		(duration_action B12472 49)
		(parameters_typeB B12472 driver232)

		(index_action D14077 36732)
		(is_action D14077)
		(is_typeD D14077)
		(start_action D14077 "14/01/2017 02:59")
		(end_action D14077 "14/01/2017 05:37")
		(duration_action D14077 158)
		(parameters_typeD D14077 driver232)

		(index_action O8496 36733)
		(is_action O8496)
		(is_typeO O8496)
		(start_action O8496 "14/01/2017 05:37")
		(end_action O8496 "14/01/2017 05:41")
		(duration_action O8496 4)
		(parameters_typeO O8496 driver232)

		(index_action D14078 36734)
		(is_action D14078)
		(is_typeD D14078)
		(start_action D14078 "14/01/2017 05:41")
		(end_action D14078 "14/01/2017 05:44")
		(duration_action D14078 3)
		(parameters_typeD D14078 driver232)

		(index_action O8497 36735)
		(is_action O8497)
		(is_typeO O8497)
		(start_action O8497 "14/01/2017 05:44")
		(end_action O8497 "14/01/2017 05:50")
		(duration_action O8497 6)
		(parameters_typeO O8497 driver232)

		(index_action D14079 36736)
		(is_action D14079)
		(is_typeD D14079)
		(start_action D14079 "14/01/2017 05:50")
		(end_action D14079 "14/01/2017 05:51")
		(duration_action D14079 1)
		(parameters_typeD D14079 driver232)

		(index_action O8498 36737)
		(is_action O8498)
		(is_typeO O8498)
		(start_action O8498 "14/01/2017 05:51")
		(end_action O8498 "14/01/2017 06:00")
		(duration_action O8498 9)
		(parameters_typeO O8498 driver232)

		(index_action D14080 36738)
		(is_action D14080)
		(is_typeD D14080)
		(start_action D14080 "14/01/2017 06:00")
		(end_action D14080 "14/01/2017 06:01")
		(duration_action D14080 1)
		(parameters_typeD D14080 driver232)

		(index_action O8499 36739)
		(is_action O8499)
		(is_typeO O8499)
		(start_action O8499 "14/01/2017 06:01")
		(end_action O8499 "14/01/2017 06:13")
		(duration_action O8499 12)
		(parameters_typeO O8499 driver232)

		(index_action B12473 36740)
		(is_action B12473)
		(is_typeB B12473)
		(start_action B12473 "14/01/2017 06:13")
		(end_action B12473 "15/01/2017 06:27")
		(duration_action B12473 1454)
		(parameters_typeB B12473 driver232)

	)
	(:tasks-goal
		:tasks (
			(WD driver232)
		)
	)
)