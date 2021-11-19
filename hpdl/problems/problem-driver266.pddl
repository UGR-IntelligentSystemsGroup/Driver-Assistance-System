(define (problem prueba0) (:domain GantaBi)
	(:customization
		(= :time-format "%d/%m/%Y %H:%M")
		(= :time-horizon-relative 86400) ;; que son los minutos que tienen 2 meses
		(= :time-start "01/01/2017 00:00")
		(= :time-unit :minutes)
	)
	(:objects
		driver266 - Driver

		D15560 D15561 D15562 D15563 D15564 D15565 D15566 D15567 D15568 D15569 D15570 D15571 D15572 D15573 D15574 D15575 D15576 D15577 D15578 D15579 D15580 D15581 D15582 D15583 D15584 D15585 D15586 D15587 D15588 D15589 D15590 D15591 D15592 D15593 D15594 D15595 D15596 D15597 D15598 D15599 D15600 D15601 D15602 D15603
 - TaskInstanceSymbol
		O9448 O9449 O9450 O9451 O9452 O9453 O9454 O9455 O9456 O9457 O9458 O9459 O9460 O9461 O9462 O9463 O9464 O9465 O9466 O9467 O9468 O9469 O9470 O9471 O9472 O9473 O9474 O9475 O9476 O9477 O9478 O9479 O9480 O9481 O9482 O9483 O9484 O9485
 - TaskInstanceSymbol
		B14059 B14060 B14061 B14062 B14063 B14064 B14065 B14066 B14067 B14068 B14069 B14070 B14071 B14072 B14073 B14074 B14075 B14076 B14077 B14078 B14079 B14080 B14081 B14082 B14083 B14084 B14085 B14086 B14087 B14088 B14089 B14090 B14091
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

		(= (current_index_action) 41199)

		(= (last_dr) "07/01/2017 14:58")
		(= (last_wr) "07/01/2017 14:58")
		(= (actual-timestamp) "07/01/2017 14:58")

		; Events
		(index_action B14059 41199)
		(is_action B14059)
		(is_typeB B14059)
		(start_action B14059 "07/01/2017 14:58")
		(end_action B14059 "07/01/2017 15:17")
		(duration_action B14059 19)
		(parameters_typeB B14059 driver266)

		(index_action D15560 41200)
		(is_action D15560)
		(is_typeD D15560)
		(start_action D15560 "07/01/2017 15:17")
		(end_action D15560 "07/01/2017 15:18")
		(duration_action D15560 1)
		(parameters_typeD D15560 driver266)

		(index_action O9448 41201)
		(is_action O9448)
		(is_typeO O9448)
		(start_action O9448 "07/01/2017 15:18")
		(end_action O9448 "07/01/2017 15:20")
		(duration_action O9448 2)
		(parameters_typeO O9448 driver266)

		(index_action D15561 41202)
		(is_action D15561)
		(is_typeD D15561)
		(start_action D15561 "07/01/2017 15:20")
		(end_action D15561 "07/01/2017 15:23")
		(duration_action D15561 3)
		(parameters_typeD D15561 driver266)

		(index_action B14060 41203)
		(is_action B14060)
		(is_typeB B14060)
		(start_action B14060 "07/01/2017 15:23")
		(end_action B14060 "07/01/2017 15:28")
		(duration_action B14060 5)
		(parameters_typeB B14060 driver266)

		(index_action D15562 41204)
		(is_action D15562)
		(is_typeD D15562)
		(start_action D15562 "07/01/2017 15:28")
		(end_action D15562 "07/01/2017 15:32")
		(duration_action D15562 4)
		(parameters_typeD D15562 driver266)

		(index_action B14061 41205)
		(is_action B14061)
		(is_typeB B14061)
		(start_action B14061 "07/01/2017 15:32")
		(end_action B14061 "07/01/2017 17:57")
		(duration_action B14061 145)
		(parameters_typeB B14061 driver266)

		(index_action D15563 41206)
		(is_action D15563)
		(is_typeD D15563)
		(start_action D15563 "07/01/2017 17:57")
		(end_action D15563 "07/01/2017 17:58")
		(duration_action D15563 1)
		(parameters_typeD D15563 driver266)

		(index_action O9449 41207)
		(is_action O9449)
		(is_typeO O9449)
		(start_action O9449 "07/01/2017 17:58")
		(end_action O9449 "07/01/2017 18:00")
		(duration_action O9449 2)
		(parameters_typeO O9449 driver266)

		(index_action D15564 41208)
		(is_action D15564)
		(is_typeD D15564)
		(start_action D15564 "07/01/2017 18:00")
		(end_action D15564 "07/01/2017 18:01")
		(duration_action D15564 1)
		(parameters_typeD D15564 driver266)

		(index_action B14062 41209)
		(is_action B14062)
		(is_typeB B14062)
		(start_action B14062 "07/01/2017 18:01")
		(end_action B14062 "07/01/2017 19:14")
		(duration_action B14062 73)
		(parameters_typeB B14062 driver266)

		(index_action D15565 41210)
		(is_action D15565)
		(is_typeD D15565)
		(start_action D15565 "07/01/2017 19:14")
		(end_action D15565 "07/01/2017 19:15")
		(duration_action D15565 1)
		(parameters_typeD D15565 driver266)

		(index_action O9450 41211)
		(is_action O9450)
		(is_typeO O9450)
		(start_action O9450 "07/01/2017 19:15")
		(end_action O9450 "07/01/2017 19:17")
		(duration_action O9450 2)
		(parameters_typeO O9450 driver266)

		(index_action D15566 41212)
		(is_action D15566)
		(is_typeD D15566)
		(start_action D15566 "07/01/2017 19:17")
		(end_action D15566 "07/01/2017 19:22")
		(duration_action D15566 5)
		(parameters_typeD D15566 driver266)

		(index_action O9451 41213)
		(is_action O9451)
		(is_typeO O9451)
		(start_action O9451 "07/01/2017 19:22")
		(end_action O9451 "07/01/2017 19:27")
		(duration_action O9451 5)
		(parameters_typeO O9451 driver266)

		(index_action B14063 41214)
		(is_action B14063)
		(is_typeB B14063)
		(start_action B14063 "07/01/2017 19:27")
		(end_action B14063 "09/01/2017 13:35")
		(duration_action B14063 2528)
		(parameters_typeB B14063 driver266)

		(index_action O9452 41215)
		(is_action O9452)
		(is_typeO O9452)
		(start_action O9452 "09/01/2017 13:35")
		(end_action O9452 "09/01/2017 13:39")
		(duration_action O9452 4)
		(parameters_typeO O9452 driver266)

		(index_action D15567 41216)
		(is_action D15567)
		(is_typeD D15567)
		(start_action D15567 "09/01/2017 13:39")
		(end_action D15567 "09/01/2017 15:44")
		(duration_action D15567 125)
		(parameters_typeD D15567 driver266)

		(index_action O9453 41217)
		(is_action O9453)
		(is_typeO O9453)
		(start_action O9453 "09/01/2017 15:44")
		(end_action O9453 "09/01/2017 15:48")
		(duration_action O9453 4)
		(parameters_typeO O9453 driver266)

		(index_action D15568 41218)
		(is_action D15568)
		(is_typeD D15568)
		(start_action D15568 "09/01/2017 15:48")
		(end_action D15568 "09/01/2017 17:23")
		(duration_action D15568 95)
		(parameters_typeD D15568 driver266)

		(index_action O9454 41219)
		(is_action O9454)
		(is_typeO O9454)
		(start_action O9454 "09/01/2017 17:23")
		(end_action O9454 "09/01/2017 17:25")
		(duration_action O9454 2)
		(parameters_typeO O9454 driver266)

		(index_action D15569 41220)
		(is_action D15569)
		(is_typeD D15569)
		(start_action D15569 "09/01/2017 17:25")
		(end_action D15569 "09/01/2017 17:31")
		(duration_action D15569 6)
		(parameters_typeD D15569 driver266)

		(index_action O9455 41221)
		(is_action O9455)
		(is_typeO O9455)
		(start_action O9455 "09/01/2017 17:31")
		(end_action O9455 "09/01/2017 17:52")
		(duration_action O9455 21)
		(parameters_typeO O9455 driver266)

		(index_action D15570 41222)
		(is_action D15570)
		(is_typeD D15570)
		(start_action D15570 "09/01/2017 17:52")
		(end_action D15570 "09/01/2017 17:53")
		(duration_action D15570 1)
		(parameters_typeD D15570 driver266)

		(index_action O9456 41223)
		(is_action O9456)
		(is_typeO O9456)
		(start_action O9456 "09/01/2017 17:53")
		(end_action O9456 "09/01/2017 17:56")
		(duration_action O9456 3)
		(parameters_typeO O9456 driver266)

		(index_action B14064 41224)
		(is_action B14064)
		(is_typeB B14064)
		(start_action B14064 "09/01/2017 17:56")
		(end_action B14064 "10/01/2017 07:00")
		(duration_action B14064 784)
		(parameters_typeB B14064 driver266)

		(index_action O9457 41225)
		(is_action O9457)
		(is_typeO O9457)
		(start_action O9457 "10/01/2017 07:00")
		(end_action O9457 "10/01/2017 07:01")
		(duration_action O9457 1)
		(parameters_typeO O9457 driver266)

		(index_action D15571 41226)
		(is_action D15571)
		(is_typeD D15571)
		(start_action D15571 "10/01/2017 07:01")
		(end_action D15571 "10/01/2017 07:02")
		(duration_action D15571 1)
		(parameters_typeD D15571 driver266)

		(index_action O9458 41227)
		(is_action O9458)
		(is_typeO O9458)
		(start_action O9458 "10/01/2017 07:02")
		(end_action O9458 "10/01/2017 07:10")
		(duration_action O9458 8)
		(parameters_typeO O9458 driver266)

		(index_action D15572 41228)
		(is_action D15572)
		(is_typeD D15572)
		(start_action D15572 "10/01/2017 07:10")
		(end_action D15572 "10/01/2017 07:11")
		(duration_action D15572 1)
		(parameters_typeD D15572 driver266)

		(index_action B14065 41229)
		(is_action B14065)
		(is_typeB B14065)
		(start_action B14065 "10/01/2017 07:11")
		(end_action B14065 "10/01/2017 07:23")
		(duration_action B14065 12)
		(parameters_typeB B14065 driver266)

		(index_action D15573 41230)
		(is_action D15573)
		(is_typeD D15573)
		(start_action D15573 "10/01/2017 07:23")
		(end_action D15573 "10/01/2017 07:26")
		(duration_action D15573 3)
		(parameters_typeD D15573 driver266)

		(index_action O9459 41231)
		(is_action O9459)
		(is_typeO O9459)
		(start_action O9459 "10/01/2017 07:26")
		(end_action O9459 "10/01/2017 07:29")
		(duration_action O9459 3)
		(parameters_typeO O9459 driver266)

		(index_action B14066 41232)
		(is_action B14066)
		(is_typeB B14066)
		(start_action B14066 "10/01/2017 07:29")
		(end_action B14066 "10/01/2017 09:50")
		(duration_action B14066 141)
		(parameters_typeB B14066 driver266)

		(index_action O9460 41233)
		(is_action O9460)
		(is_typeO O9460)
		(start_action O9460 "10/01/2017 09:50")
		(end_action O9460 "10/01/2017 09:54")
		(duration_action O9460 4)
		(parameters_typeO O9460 driver266)

		(index_action D15574 41234)
		(is_action D15574)
		(is_typeD D15574)
		(start_action D15574 "10/01/2017 09:54")
		(end_action D15574 "10/01/2017 09:57")
		(duration_action D15574 3)
		(parameters_typeD D15574 driver266)

		(index_action O9461 41235)
		(is_action O9461)
		(is_typeO O9461)
		(start_action O9461 "10/01/2017 09:57")
		(end_action O9461 "10/01/2017 10:04")
		(duration_action O9461 7)
		(parameters_typeO O9461 driver266)

		(index_action B14067 41236)
		(is_action B14067)
		(is_typeB B14067)
		(start_action B14067 "10/01/2017 10:04")
		(end_action B14067 "10/01/2017 10:13")
		(duration_action B14067 9)
		(parameters_typeB B14067 driver266)

		(index_action O9462 41237)
		(is_action O9462)
		(is_typeO O9462)
		(start_action O9462 "10/01/2017 10:13")
		(end_action O9462 "10/01/2017 10:23")
		(duration_action O9462 10)
		(parameters_typeO O9462 driver266)

		(index_action B14068 41238)
		(is_action B14068)
		(is_typeB B14068)
		(start_action B14068 "10/01/2017 10:23")
		(end_action B14068 "10/01/2017 14:10")
		(duration_action B14068 227)
		(parameters_typeB B14068 driver266)

		(index_action O9463 41239)
		(is_action O9463)
		(is_typeO O9463)
		(start_action O9463 "10/01/2017 14:10")
		(end_action O9463 "10/01/2017 14:11")
		(duration_action O9463 1)
		(parameters_typeO O9463 driver266)

		(index_action D15575 41240)
		(is_action D15575)
		(is_typeD D15575)
		(start_action D15575 "10/01/2017 14:11")
		(end_action D15575 "10/01/2017 18:39")
		(duration_action D15575 268)
		(parameters_typeD D15575 driver266)

		(index_action B14069 41241)
		(is_action B14069)
		(is_typeB B14069)
		(start_action B14069 "10/01/2017 18:39")
		(end_action B14069 "10/01/2017 19:26")
		(duration_action B14069 47)
		(parameters_typeB B14069 driver266)

		(index_action D15576 41242)
		(is_action D15576)
		(is_typeD D15576)
		(start_action D15576 "10/01/2017 19:26")
		(end_action D15576 "10/01/2017 22:32")
		(duration_action D15576 186)
		(parameters_typeD D15576 driver266)

		(index_action O9464 41243)
		(is_action O9464)
		(is_typeO O9464)
		(start_action O9464 "10/01/2017 22:32")
		(end_action O9464 "10/01/2017 22:34")
		(duration_action O9464 2)
		(parameters_typeO O9464 driver266)

		(index_action B14070 41244)
		(is_action B14070)
		(is_typeB B14070)
		(start_action B14070 "10/01/2017 22:34")
		(end_action B14070 "11/01/2017 07:39")
		(duration_action B14070 545)
		(parameters_typeB B14070 driver266)

		(index_action D15577 41245)
		(is_action D15577)
		(is_typeD D15577)
		(start_action D15577 "11/01/2017 07:39")
		(end_action D15577 "11/01/2017 08:41")
		(duration_action D15577 62)
		(parameters_typeD D15577 driver266)

		(index_action B14071 41246)
		(is_action B14071)
		(is_typeB B14071)
		(start_action B14071 "11/01/2017 08:41")
		(end_action B14071 "11/01/2017 08:48")
		(duration_action B14071 7)
		(parameters_typeB B14071 driver266)

		(index_action D15578 41247)
		(is_action D15578)
		(is_typeD D15578)
		(start_action D15578 "11/01/2017 08:48")
		(end_action D15578 "11/01/2017 08:49")
		(duration_action D15578 1)
		(parameters_typeD D15578 driver266)

		(index_action O9465 41248)
		(is_action O9465)
		(is_typeO O9465)
		(start_action O9465 "11/01/2017 08:49")
		(end_action O9465 "11/01/2017 08:55")
		(duration_action O9465 6)
		(parameters_typeO O9465 driver266)

		(index_action B14072 41249)
		(is_action B14072)
		(is_typeB B14072)
		(start_action B14072 "11/01/2017 08:55")
		(end_action B14072 "11/01/2017 09:19")
		(duration_action B14072 24)
		(parameters_typeB B14072 driver266)

		(index_action O9466 41250)
		(is_action O9466)
		(is_typeO O9466)
		(start_action O9466 "11/01/2017 09:19")
		(end_action O9466 "11/01/2017 09:37")
		(duration_action O9466 18)
		(parameters_typeO O9466 driver266)

		(index_action B14073 41251)
		(is_action B14073)
		(is_typeB B14073)
		(start_action B14073 "11/01/2017 09:37")
		(end_action B14073 "11/01/2017 10:49")
		(duration_action B14073 72)
		(parameters_typeB B14073 driver266)

		(index_action O9467 41252)
		(is_action O9467)
		(is_typeO O9467)
		(start_action O9467 "11/01/2017 10:49")
		(end_action O9467 "11/01/2017 10:52")
		(duration_action O9467 3)
		(parameters_typeO O9467 driver266)

		(index_action D15579 41253)
		(is_action D15579)
		(is_typeD D15579)
		(start_action D15579 "11/01/2017 10:52")
		(end_action D15579 "11/01/2017 10:53")
		(duration_action D15579 1)
		(parameters_typeD D15579 driver266)

		(index_action O9468 41254)
		(is_action O9468)
		(is_typeO O9468)
		(start_action O9468 "11/01/2017 10:53")
		(end_action O9468 "11/01/2017 11:02")
		(duration_action O9468 9)
		(parameters_typeO O9468 driver266)

		(index_action D15580 41255)
		(is_action D15580)
		(is_typeD D15580)
		(start_action D15580 "11/01/2017 11:02")
		(end_action D15580 "11/01/2017 11:03")
		(duration_action D15580 1)
		(parameters_typeD D15580 driver266)

		(index_action O9469 41256)
		(is_action O9469)
		(is_typeO O9469)
		(start_action O9469 "11/01/2017 11:03")
		(end_action O9469 "11/01/2017 11:08")
		(duration_action O9469 5)
		(parameters_typeO O9469 driver266)

		(index_action B14074 41257)
		(is_action B14074)
		(is_typeB B14074)
		(start_action B14074 "11/01/2017 11:08")
		(end_action B14074 "11/01/2017 11:28")
		(duration_action B14074 20)
		(parameters_typeB B14074 driver266)

		(index_action D15581 41258)
		(is_action D15581)
		(is_typeD D15581)
		(start_action D15581 "11/01/2017 11:28")
		(end_action D15581 "11/01/2017 11:37")
		(duration_action D15581 9)
		(parameters_typeD D15581 driver266)

		(index_action B14075 41259)
		(is_action B14075)
		(is_typeB B14075)
		(start_action B14075 "11/01/2017 11:37")
		(end_action B14075 "11/01/2017 13:54")
		(duration_action B14075 137)
		(parameters_typeB B14075 driver266)

		(index_action D15582 41260)
		(is_action D15582)
		(is_typeD D15582)
		(start_action D15582 "11/01/2017 13:54")
		(end_action D15582 "11/01/2017 14:27")
		(duration_action D15582 33)
		(parameters_typeD D15582 driver266)

		(index_action B14076 41261)
		(is_action B14076)
		(is_typeB B14076)
		(start_action B14076 "11/01/2017 14:27")
		(end_action B14076 "11/01/2017 15:09")
		(duration_action B14076 42)
		(parameters_typeB B14076 driver266)

		(index_action D15583 41262)
		(is_action D15583)
		(is_typeD D15583)
		(start_action D15583 "11/01/2017 15:09")
		(end_action D15583 "11/01/2017 15:10")
		(duration_action D15583 1)
		(parameters_typeD D15583 driver266)

		(index_action O9470 41263)
		(is_action O9470)
		(is_typeO O9470)
		(start_action O9470 "11/01/2017 15:10")
		(end_action O9470 "11/01/2017 15:12")
		(duration_action O9470 2)
		(parameters_typeO O9470 driver266)

		(index_action D15584 41264)
		(is_action D15584)
		(is_typeD D15584)
		(start_action D15584 "11/01/2017 15:12")
		(end_action D15584 "11/01/2017 15:34")
		(duration_action D15584 22)
		(parameters_typeD D15584 driver266)

		(index_action B14077 41265)
		(is_action B14077)
		(is_typeB B14077)
		(start_action B14077 "11/01/2017 15:34")
		(end_action B14077 "11/01/2017 15:38")
		(duration_action B14077 4)
		(parameters_typeB B14077 driver266)

		(index_action D15585 41266)
		(is_action D15585)
		(is_typeD D15585)
		(start_action D15585 "11/01/2017 15:38")
		(end_action D15585 "11/01/2017 17:04")
		(duration_action D15585 86)
		(parameters_typeD D15585 driver266)

		(index_action O9471 41267)
		(is_action O9471)
		(is_typeO O9471)
		(start_action O9471 "11/01/2017 17:04")
		(end_action O9471 "11/01/2017 17:06")
		(duration_action O9471 2)
		(parameters_typeO O9471 driver266)

		(index_action D15586 41268)
		(is_action D15586)
		(is_typeD D15586)
		(start_action D15586 "11/01/2017 17:06")
		(end_action D15586 "11/01/2017 17:20")
		(duration_action D15586 14)
		(parameters_typeD D15586 driver266)

		(index_action B14078 41269)
		(is_action B14078)
		(is_typeB B14078)
		(start_action B14078 "11/01/2017 17:20")
		(end_action B14078 "11/01/2017 17:23")
		(duration_action B14078 3)
		(parameters_typeB B14078 driver266)

		(index_action D15587 41270)
		(is_action D15587)
		(is_typeD D15587)
		(start_action D15587 "11/01/2017 17:23")
		(end_action D15587 "11/01/2017 17:24")
		(duration_action D15587 1)
		(parameters_typeD D15587 driver266)

		(index_action B14079 41271)
		(is_action B14079)
		(is_typeB B14079)
		(start_action B14079 "11/01/2017 17:24")
		(end_action B14079 "12/01/2017 07:00")
		(duration_action B14079 816)
		(parameters_typeB B14079 driver266)

		(index_action O9472 41272)
		(is_action O9472)
		(is_typeO O9472)
		(start_action O9472 "12/01/2017 07:00")
		(end_action O9472 "12/01/2017 07:01")
		(duration_action O9472 1)
		(parameters_typeO O9472 driver266)

		(index_action D15588 41273)
		(is_action D15588)
		(is_typeD D15588)
		(start_action D15588 "12/01/2017 07:01")
		(end_action D15588 "12/01/2017 07:10")
		(duration_action D15588 9)
		(parameters_typeD D15588 driver266)

		(index_action O9473 41274)
		(is_action O9473)
		(is_typeO O9473)
		(start_action O9473 "12/01/2017 07:10")
		(end_action O9473 "12/01/2017 07:14")
		(duration_action O9473 4)
		(parameters_typeO O9473 driver266)

		(index_action D15589 41275)
		(is_action D15589)
		(is_typeD D15589)
		(start_action D15589 "12/01/2017 07:14")
		(end_action D15589 "12/01/2017 07:17")
		(duration_action D15589 3)
		(parameters_typeD D15589 driver266)

		(index_action O9474 41276)
		(is_action O9474)
		(is_typeO O9474)
		(start_action O9474 "12/01/2017 07:17")
		(end_action O9474 "12/01/2017 07:22")
		(duration_action O9474 5)
		(parameters_typeO O9474 driver266)

		(index_action B14080 41277)
		(is_action B14080)
		(is_typeB B14080)
		(start_action B14080 "12/01/2017 07:22")
		(end_action B14080 "12/01/2017 07:48")
		(duration_action B14080 26)
		(parameters_typeB B14080 driver266)

		(index_action O9475 41278)
		(is_action O9475)
		(is_typeO O9475)
		(start_action O9475 "12/01/2017 07:48")
		(end_action O9475 "12/01/2017 07:51")
		(duration_action O9475 3)
		(parameters_typeO O9475 driver266)

		(index_action D15590 41279)
		(is_action D15590)
		(is_typeD D15590)
		(start_action D15590 "12/01/2017 07:51")
		(end_action D15590 "12/01/2017 07:52")
		(duration_action D15590 1)
		(parameters_typeD D15590 driver266)

		(index_action O9476 41280)
		(is_action O9476)
		(is_typeO O9476)
		(start_action O9476 "12/01/2017 07:52")
		(end_action O9476 "12/01/2017 07:57")
		(duration_action O9476 5)
		(parameters_typeO O9476 driver266)

		(index_action B14081 41281)
		(is_action B14081)
		(is_typeB B14081)
		(start_action B14081 "12/01/2017 07:57")
		(end_action B14081 "12/01/2017 08:23")
		(duration_action B14081 26)
		(parameters_typeB B14081 driver266)

		(index_action O9477 41282)
		(is_action O9477)
		(is_typeO O9477)
		(start_action O9477 "12/01/2017 08:23")
		(end_action O9477 "12/01/2017 08:24")
		(duration_action O9477 1)
		(parameters_typeO O9477 driver266)

		(index_action D15591 41283)
		(is_action D15591)
		(is_typeD D15591)
		(start_action D15591 "12/01/2017 08:24")
		(end_action D15591 "12/01/2017 12:34")
		(duration_action D15591 250)
		(parameters_typeD D15591 driver266)

		(index_action B14082 41284)
		(is_action B14082)
		(is_typeB B14082)
		(start_action B14082 "12/01/2017 12:34")
		(end_action B14082 "12/01/2017 13:21")
		(duration_action B14082 47)
		(parameters_typeB B14082 driver266)

		(index_action D15592 41285)
		(is_action D15592)
		(is_typeD D15592)
		(start_action D15592 "12/01/2017 13:21")
		(end_action D15592 "12/01/2017 16:19")
		(duration_action D15592 178)
		(parameters_typeD D15592 driver266)

		(index_action B14083 41286)
		(is_action B14083)
		(is_typeB B14083)
		(start_action B14083 "12/01/2017 16:19")
		(end_action B14083 "12/01/2017 16:44")
		(duration_action B14083 25)
		(parameters_typeB B14083 driver266)

		(index_action D15593 41287)
		(is_action D15593)
		(is_typeD D15593)
		(start_action D15593 "12/01/2017 16:44")
		(end_action D15593 "12/01/2017 17:07")
		(duration_action D15593 23)
		(parameters_typeD D15593 driver266)

		(index_action O9478 41288)
		(is_action O9478)
		(is_typeO O9478)
		(start_action O9478 "12/01/2017 17:07")
		(end_action O9478 "12/01/2017 17:08")
		(duration_action O9478 1)
		(parameters_typeO O9478 driver266)

		(index_action B14084 41289)
		(is_action B14084)
		(is_typeB B14084)
		(start_action B14084 "12/01/2017 17:08")
		(end_action B14084 "13/01/2017 02:18")
		(duration_action B14084 550)
		(parameters_typeB B14084 driver266)

		(index_action O9479 41290)
		(is_action O9479)
		(is_typeO O9479)
		(start_action O9479 "13/01/2017 02:18")
		(end_action O9479 "13/01/2017 02:19")
		(duration_action O9479 1)
		(parameters_typeO O9479 driver266)

		(index_action D15594 41291)
		(is_action D15594)
		(is_typeD D15594)
		(start_action D15594 "13/01/2017 02:19")
		(end_action D15594 "13/01/2017 06:30")
		(duration_action D15594 251)
		(parameters_typeD D15594 driver266)

		(index_action B14085 41292)
		(is_action B14085)
		(is_typeB B14085)
		(start_action B14085 "13/01/2017 06:30")
		(end_action B14085 "13/01/2017 07:16")
		(duration_action B14085 46)
		(parameters_typeB B14085 driver266)

		(index_action D15595 41293)
		(is_action D15595)
		(is_typeD D15595)
		(start_action D15595 "13/01/2017 07:16")
		(end_action D15595 "13/01/2017 07:56")
		(duration_action D15595 40)
		(parameters_typeD D15595 driver266)

		(index_action B14086 41294)
		(is_action B14086)
		(is_typeB B14086)
		(start_action B14086 "13/01/2017 07:56")
		(end_action B14086 "13/01/2017 08:23")
		(duration_action B14086 27)
		(parameters_typeB B14086 driver266)

		(index_action O9480 41295)
		(is_action O9480)
		(is_typeO O9480)
		(start_action O9480 "13/01/2017 08:23")
		(end_action O9480 "13/01/2017 08:25")
		(duration_action O9480 2)
		(parameters_typeO O9480 driver266)

		(index_action D15596 41296)
		(is_action D15596)
		(is_typeD D15596)
		(start_action D15596 "13/01/2017 08:25")
		(end_action D15596 "13/01/2017 11:58")
		(duration_action D15596 213)
		(parameters_typeD D15596 driver266)

		(index_action O9481 41297)
		(is_action O9481)
		(is_typeO O9481)
		(start_action O9481 "13/01/2017 11:58")
		(end_action O9481 "13/01/2017 12:02")
		(duration_action O9481 4)
		(parameters_typeO O9481 driver266)

		(index_action D15597 41298)
		(is_action D15597)
		(is_typeD D15597)
		(start_action D15597 "13/01/2017 12:02")
		(end_action D15597 "13/01/2017 12:08")
		(duration_action D15597 6)
		(parameters_typeD D15597 driver266)

		(index_action B14087 41299)
		(is_action B14087)
		(is_typeB B14087)
		(start_action B14087 "13/01/2017 12:08")
		(end_action B14087 "13/01/2017 12:25")
		(duration_action B14087 17)
		(parameters_typeB B14087 driver266)

		(index_action D15598 41300)
		(is_action D15598)
		(is_typeD D15598)
		(start_action D15598 "13/01/2017 12:25")
		(end_action D15598 "13/01/2017 12:28")
		(duration_action D15598 3)
		(parameters_typeD D15598 driver266)

		(index_action O9482 41301)
		(is_action O9482)
		(is_typeO O9482)
		(start_action O9482 "13/01/2017 12:28")
		(end_action O9482 "13/01/2017 12:35")
		(duration_action O9482 7)
		(parameters_typeO O9482 driver266)

		(index_action D15599 41302)
		(is_action D15599)
		(is_typeD D15599)
		(start_action D15599 "13/01/2017 12:35")
		(end_action D15599 "13/01/2017 12:36")
		(duration_action D15599 1)
		(parameters_typeD D15599 driver266)

		(index_action B14088 41303)
		(is_action B14088)
		(is_typeB B14088)
		(start_action B14088 "13/01/2017 12:36")
		(end_action B14088 "13/01/2017 12:49")
		(duration_action B14088 13)
		(parameters_typeB B14088 driver266)

		(index_action O9483 41304)
		(is_action O9483)
		(is_typeO O9483)
		(start_action O9483 "13/01/2017 12:49")
		(end_action O9483 "13/01/2017 12:53")
		(duration_action O9483 4)
		(parameters_typeO O9483 driver266)

		(index_action D15600 41305)
		(is_action D15600)
		(is_typeD D15600)
		(start_action D15600 "13/01/2017 12:53")
		(end_action D15600 "13/01/2017 12:54")
		(duration_action D15600 1)
		(parameters_typeD D15600 driver266)

		(index_action B14089 41306)
		(is_action B14089)
		(is_typeB B14089)
		(start_action B14089 "13/01/2017 12:54")
		(end_action B14089 "13/01/2017 12:56")
		(duration_action B14089 2)
		(parameters_typeB B14089 driver266)

		(index_action D15601 41307)
		(is_action D15601)
		(is_typeD D15601)
		(start_action D15601 "13/01/2017 12:56")
		(end_action D15601 "13/01/2017 12:58")
		(duration_action D15601 2)
		(parameters_typeD D15601 driver266)

		(index_action B14090 41308)
		(is_action B14090)
		(is_typeB B14090)
		(start_action B14090 "13/01/2017 12:58")
		(end_action B14090 "13/01/2017 16:49")
		(duration_action B14090 231)
		(parameters_typeB B14090 driver266)

		(index_action O9484 41309)
		(is_action O9484)
		(is_typeO O9484)
		(start_action O9484 "13/01/2017 16:49")
		(end_action O9484 "13/01/2017 16:50")
		(duration_action O9484 1)
		(parameters_typeO O9484 driver266)

		(index_action D15602 41310)
		(is_action D15602)
		(is_typeD D15602)
		(start_action D15602 "13/01/2017 16:50")
		(end_action D15602 "13/01/2017 16:51")
		(duration_action D15602 1)
		(parameters_typeD D15602 driver266)

		(index_action O9485 41311)
		(is_action O9485)
		(is_typeO O9485)
		(start_action O9485 "13/01/2017 16:51")
		(end_action O9485 "13/01/2017 17:03")
		(duration_action O9485 12)
		(parameters_typeO O9485 driver266)

		(index_action D15603 41312)
		(is_action D15603)
		(is_typeD D15603)
		(start_action D15603 "13/01/2017 17:03")
		(end_action D15603 "13/01/2017 17:12")
		(duration_action D15603 9)
		(parameters_typeD D15603 driver266)

		(index_action B14091 41313)
		(is_action B14091)
		(is_typeB B14091)
		(start_action B14091 "13/01/2017 17:12")
		(end_action B14091 "16/01/2017 15:31")
		(duration_action B14091 4219)
		(parameters_typeB B14091 driver266)

	)
	(:tasks-goal
		:tasks (
			(WD driver266)
		)
	)
)