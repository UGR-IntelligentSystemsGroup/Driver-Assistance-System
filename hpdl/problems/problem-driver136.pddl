(define (problem prueba0) (:domain GantaBi)
	(:customization
		(= :time-format "%d/%m/%Y %H:%M")
		(= :time-horizon-relative 86400) ;; que son los minutos que tienen 2 meses
		(= :time-start "01/01/2017 00:00")
		(= :time-unit :minutes)
	)
	(:objects
		driver136 - Driver

		D8558 D8559 D8560 D8561 D8562 D8563 D8564 D8565 D8566 D8567 D8568 D8569 D8570 D8571 D8572 D8573 D8574 D8575 D8576 D8577 D8578 D8579 D8580 D8581 D8582 D8583 D8584 D8585 D8586 D8587 D8588 D8589 D8590 D8591 D8592 D8593 D8594 D8595 D8596 D8597 D8598 D8599 D8600 D8601 D8602 D8603 D8604 D8605 D8606 D8607 D8608 D8609 D8610 D8611 D8612 D8613 D8614 D8615 D8616 D8617 D8618
 - TaskInstanceSymbol
		O4950 O4951 O4952 O4953 O4954 O4955 O4956 O4957 O4958 O4959 O4960 O4961 O4962 O4963 O4964 O4965 O4966 O4967 O4968 O4969 O4970 O4971 O4972 O4973 O4974 O4975 O4976 O4977 O4978 O4979 O4980 O4981 O4982 O4983 O4984 O4985 O4986 O4987
 - TaskInstanceSymbol
		B7214 B7215 B7216 B7217 B7218 B7219 B7220 B7221 B7222 B7223 B7224 B7225 B7226 B7227 B7228 B7229 B7230 B7231 B7232 B7233 B7234 B7235 B7236 B7237 B7238 B7239 B7240 B7241 B7242 B7243 B7244 B7245 B7246 B7247 B7248 B7249 B7250 B7251 B7252 B7253 B7254 B7255
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

		(= (current_index_action) 21219)

		(= (last_dr) "04/01/2017 16:03")
		(= (last_wr) "04/01/2017 16:03")
		(= (actual-timestamp) "04/01/2017 16:03")

		; Events
		(index_action B7214 21219)
		(is_action B7214)
		(is_typeB B7214)
		(start_action B7214 "04/01/2017 16:03")
		(end_action B7214 "04/01/2017 22:42")
		(duration_action B7214 399)
		(parameters_typeB B7214 driver136)

		(index_action D8558 21220)
		(is_action D8558)
		(is_typeD D8558)
		(start_action D8558 "04/01/2017 22:42")
		(end_action D8558 "04/01/2017 22:55")
		(duration_action D8558 13)
		(parameters_typeD D8558 driver136)

		(index_action O4950 21221)
		(is_action O4950)
		(is_typeO O4950)
		(start_action O4950 "04/01/2017 22:55")
		(end_action O4950 "04/01/2017 23:04")
		(duration_action O4950 9)
		(parameters_typeO O4950 driver136)

		(index_action D8559 21222)
		(is_action D8559)
		(is_typeD D8559)
		(start_action D8559 "04/01/2017 23:04")
		(end_action D8559 "04/01/2017 23:09")
		(duration_action D8559 5)
		(parameters_typeD D8559 driver136)

		(index_action B7215 21223)
		(is_action B7215)
		(is_typeB B7215)
		(start_action B7215 "04/01/2017 23:09")
		(end_action B7215 "04/01/2017 23:18")
		(duration_action B7215 9)
		(parameters_typeB B7215 driver136)

		(index_action D8560 21224)
		(is_action D8560)
		(is_typeD D8560)
		(start_action D8560 "04/01/2017 23:18")
		(end_action D8560 "04/01/2017 23:28")
		(duration_action D8560 10)
		(parameters_typeD D8560 driver136)

		(index_action B7216 21225)
		(is_action B7216)
		(is_typeB B7216)
		(start_action B7216 "04/01/2017 23:28")
		(end_action B7216 "04/01/2017 23:44")
		(duration_action B7216 16)
		(parameters_typeB B7216 driver136)

		(index_action D8561 21226)
		(is_action D8561)
		(is_typeD D8561)
		(start_action D8561 "04/01/2017 23:44")
		(end_action D8561 "05/01/2017 02:34")
		(duration_action D8561 170)
		(parameters_typeD D8561 driver136)

		(index_action O4951 21227)
		(is_action O4951)
		(is_typeO O4951)
		(start_action O4951 "05/01/2017 02:34")
		(end_action O4951 "05/01/2017 02:39")
		(duration_action O4951 5)
		(parameters_typeO O4951 driver136)

		(index_action D8562 21228)
		(is_action D8562)
		(is_typeD D8562)
		(start_action D8562 "05/01/2017 02:39")
		(end_action D8562 "05/01/2017 03:51")
		(duration_action D8562 72)
		(parameters_typeD D8562 driver136)

		(index_action B7217 21229)
		(is_action B7217)
		(is_typeB B7217)
		(start_action B7217 "05/01/2017 03:51")
		(end_action B7217 "05/01/2017 07:29")
		(duration_action B7217 218)
		(parameters_typeB B7217 driver136)

		(index_action D8563 21230)
		(is_action D8563)
		(is_typeD D8563)
		(start_action D8563 "05/01/2017 07:29")
		(end_action D8563 "05/01/2017 08:42")
		(duration_action D8563 73)
		(parameters_typeD D8563 driver136)

		(index_action O4952 21231)
		(is_action O4952)
		(is_typeO O4952)
		(start_action O4952 "05/01/2017 08:42")
		(end_action O4952 "05/01/2017 08:45")
		(duration_action O4952 3)
		(parameters_typeO O4952 driver136)

		(index_action D8564 21232)
		(is_action D8564)
		(is_typeD D8564)
		(start_action D8564 "05/01/2017 08:45")
		(end_action D8564 "05/01/2017 11:42")
		(duration_action D8564 177)
		(parameters_typeD D8564 driver136)

		(index_action B7218 21233)
		(is_action B7218)
		(is_typeB B7218)
		(start_action B7218 "05/01/2017 11:42")
		(end_action B7218 "05/01/2017 22:11")
		(duration_action B7218 629)
		(parameters_typeB B7218 driver136)

		(index_action D8565 21234)
		(is_action D8565)
		(is_typeD D8565)
		(start_action D8565 "05/01/2017 22:11")
		(end_action D8565 "06/01/2017 02:04")
		(duration_action D8565 233)
		(parameters_typeD D8565 driver136)

		(index_action B7219 21235)
		(is_action B7219)
		(is_typeB B7219)
		(start_action B7219 "06/01/2017 02:04")
		(end_action B7219 "06/01/2017 02:51")
		(duration_action B7219 47)
		(parameters_typeB B7219 driver136)

		(index_action D8566 21236)
		(is_action D8566)
		(is_typeD D8566)
		(start_action D8566 "06/01/2017 02:51")
		(end_action D8566 "06/01/2017 05:16")
		(duration_action D8566 145)
		(parameters_typeD D8566 driver136)

		(index_action O4953 21237)
		(is_action O4953)
		(is_typeO O4953)
		(start_action O4953 "06/01/2017 05:16")
		(end_action O4953 "06/01/2017 05:19")
		(duration_action O4953 3)
		(parameters_typeO O4953 driver136)

		(index_action D8567 21238)
		(is_action D8567)
		(is_typeD D8567)
		(start_action D8567 "06/01/2017 05:19")
		(end_action D8567 "06/01/2017 06:33")
		(duration_action D8567 74)
		(parameters_typeD D8567 driver136)

		(index_action B7220 21239)
		(is_action B7220)
		(is_typeB B7220)
		(start_action B7220 "06/01/2017 06:33")
		(end_action B7220 "06/01/2017 07:19")
		(duration_action B7220 46)
		(parameters_typeB B7220 driver136)

		(index_action D8568 21240)
		(is_action D8568)
		(is_typeD D8568)
		(start_action D8568 "06/01/2017 07:19")
		(end_action D8568 "06/01/2017 07:43")
		(duration_action D8568 24)
		(parameters_typeD D8568 driver136)

		(index_action O4954 21241)
		(is_action O4954)
		(is_typeO O4954)
		(start_action O4954 "06/01/2017 07:43")
		(end_action O4954 "06/01/2017 07:45")
		(duration_action O4954 2)
		(parameters_typeO O4954 driver136)

		(index_action D8569 21242)
		(is_action D8569)
		(is_typeD D8569)
		(start_action D8569 "06/01/2017 07:45")
		(end_action D8569 "06/01/2017 08:06")
		(duration_action D8569 21)
		(parameters_typeD D8569 driver136)

		(index_action B7221 21243)
		(is_action B7221)
		(is_typeB B7221)
		(start_action B7221 "06/01/2017 08:06")
		(end_action B7221 "06/01/2017 10:13")
		(duration_action B7221 127)
		(parameters_typeB B7221 driver136)

		(index_action D8570 21244)
		(is_action D8570)
		(is_typeD D8570)
		(start_action D8570 "06/01/2017 10:13")
		(end_action D8570 "06/01/2017 10:18")
		(duration_action D8570 5)
		(parameters_typeD D8570 driver136)

		(index_action B7222 21245)
		(is_action B7222)
		(is_typeB B7222)
		(start_action B7222 "06/01/2017 10:18")
		(end_action B7222 "06/01/2017 11:24")
		(duration_action B7222 66)
		(parameters_typeB B7222 driver136)

		(index_action O4955 21246)
		(is_action O4955)
		(is_typeO O4955)
		(start_action O4955 "06/01/2017 11:24")
		(end_action O4955 "06/01/2017 11:26")
		(duration_action O4955 2)
		(parameters_typeO O4955 driver136)

		(index_action D8571 21247)
		(is_action D8571)
		(is_typeD D8571)
		(start_action D8571 "06/01/2017 11:26")
		(end_action D8571 "06/01/2017 11:39")
		(duration_action D8571 13)
		(parameters_typeD D8571 driver136)

		(index_action B7223 21248)
		(is_action B7223)
		(is_typeB B7223)
		(start_action B7223 "06/01/2017 11:39")
		(end_action B7223 "06/01/2017 23:05")
		(duration_action B7223 686)
		(parameters_typeB B7223 driver136)

		(index_action D8572 21249)
		(is_action D8572)
		(is_typeD D8572)
		(start_action D8572 "06/01/2017 23:05")
		(end_action D8572 "06/01/2017 23:08")
		(duration_action D8572 3)
		(parameters_typeD D8572 driver136)

		(index_action O4956 21250)
		(is_action O4956)
		(is_typeO O4956)
		(start_action O4956 "06/01/2017 23:08")
		(end_action O4956 "06/01/2017 23:18")
		(duration_action O4956 10)
		(parameters_typeO O4956 driver136)

		(index_action B7224 21251)
		(is_action B7224)
		(is_typeB B7224)
		(start_action B7224 "06/01/2017 23:18")
		(end_action B7224 "06/01/2017 23:42")
		(duration_action B7224 24)
		(parameters_typeB B7224 driver136)

		(index_action D8573 21252)
		(is_action D8573)
		(is_typeD D8573)
		(start_action D8573 "06/01/2017 23:42")
		(end_action D8573 "07/01/2017 00:20")
		(duration_action D8573 38)
		(parameters_typeD D8573 driver136)

		(index_action B7225 21253)
		(is_action B7225)
		(is_typeB B7225)
		(start_action B7225 "07/01/2017 00:20")
		(end_action B7225 "07/01/2017 00:30")
		(duration_action B7225 10)
		(parameters_typeB B7225 driver136)

		(index_action D8574 21254)
		(is_action D8574)
		(is_typeD D8574)
		(start_action D8574 "07/01/2017 00:30")
		(end_action D8574 "07/01/2017 04:11")
		(duration_action D8574 221)
		(parameters_typeD D8574 driver136)

		(index_action B7226 21255)
		(is_action B7226)
		(is_typeB B7226)
		(start_action B7226 "07/01/2017 04:11")
		(end_action B7226 "07/01/2017 04:58")
		(duration_action B7226 47)
		(parameters_typeB B7226 driver136)

		(index_action D8575 21256)
		(is_action D8575)
		(is_typeD D8575)
		(start_action D8575 "07/01/2017 04:58")
		(end_action D8575 "07/01/2017 06:32")
		(duration_action D8575 94)
		(parameters_typeD D8575 driver136)

		(index_action O4957 21257)
		(is_action O4957)
		(is_typeO O4957)
		(start_action O4957 "07/01/2017 06:32")
		(end_action O4957 "07/01/2017 06:35")
		(duration_action O4957 3)
		(parameters_typeO O4957 driver136)

		(index_action D8576 21258)
		(is_action D8576)
		(is_typeD D8576)
		(start_action D8576 "07/01/2017 06:35")
		(end_action D8576 "07/01/2017 07:31")
		(duration_action D8576 56)
		(parameters_typeD D8576 driver136)

		(index_action O4958 21259)
		(is_action O4958)
		(is_typeO O4958)
		(start_action O4958 "07/01/2017 07:31")
		(end_action O4958 "07/01/2017 07:33")
		(duration_action O4958 2)
		(parameters_typeO O4958 driver136)

		(index_action D8577 21260)
		(is_action D8577)
		(is_typeD D8577)
		(start_action D8577 "07/01/2017 07:33")
		(end_action D8577 "07/01/2017 08:59")
		(duration_action D8577 86)
		(parameters_typeD D8577 driver136)

		(index_action B7227 21261)
		(is_action B7227)
		(is_typeB B7227)
		(start_action B7227 "07/01/2017 08:59")
		(end_action B7227 "07/01/2017 18:01")
		(duration_action B7227 542)
		(parameters_typeB B7227 driver136)

		(index_action D8578 21262)
		(is_action D8578)
		(is_typeD D8578)
		(start_action D8578 "07/01/2017 18:01")
		(end_action D8578 "07/01/2017 20:35")
		(duration_action D8578 154)
		(parameters_typeD D8578 driver136)

		(index_action O4959 21263)
		(is_action O4959)
		(is_typeO O4959)
		(start_action O4959 "07/01/2017 20:35")
		(end_action O4959 "07/01/2017 20:36")
		(duration_action O4959 1)
		(parameters_typeO O4959 driver136)

		(index_action B7228 21264)
		(is_action B7228)
		(is_typeB B7228)
		(start_action B7228 "07/01/2017 20:36")
		(end_action B7228 "07/01/2017 21:24")
		(duration_action B7228 48)
		(parameters_typeB B7228 driver136)

		(index_action D8579 21265)
		(is_action D8579)
		(is_typeD D8579)
		(start_action D8579 "07/01/2017 21:24")
		(end_action D8579 "08/01/2017 00:42")
		(duration_action D8579 198)
		(parameters_typeD D8579 driver136)

		(index_action B7229 21266)
		(is_action B7229)
		(is_typeB B7229)
		(start_action B7229 "08/01/2017 00:42")
		(end_action B7229 "08/01/2017 11:37")
		(duration_action B7229 655)
		(parameters_typeB B7229 driver136)

		(index_action D8580 21267)
		(is_action D8580)
		(is_typeD D8580)
		(start_action D8580 "08/01/2017 11:37")
		(end_action D8580 "08/01/2017 12:07")
		(duration_action D8580 30)
		(parameters_typeD D8580 driver136)

		(index_action B7230 21268)
		(is_action B7230)
		(is_typeB B7230)
		(start_action B7230 "08/01/2017 12:07")
		(end_action B7230 "10/01/2017 09:07")
		(duration_action B7230 2700)
		(parameters_typeB B7230 driver136)

		(index_action D8581 21269)
		(is_action D8581)
		(is_typeD D8581)
		(start_action D8581 "10/01/2017 09:07")
		(end_action D8581 "10/01/2017 09:32")
		(duration_action D8581 25)
		(parameters_typeD D8581 driver136)

		(index_action O4960 21270)
		(is_action O4960)
		(is_typeO O4960)
		(start_action O4960 "10/01/2017 09:32")
		(end_action O4960 "10/01/2017 09:57")
		(duration_action O4960 25)
		(parameters_typeO O4960 driver136)

		(index_action B7231 21271)
		(is_action B7231)
		(is_typeB B7231)
		(start_action B7231 "10/01/2017 09:57")
		(end_action B7231 "10/01/2017 10:44")
		(duration_action B7231 47)
		(parameters_typeB B7231 driver136)

		(index_action O4961 21272)
		(is_action O4961)
		(is_typeO O4961)
		(start_action O4961 "10/01/2017 10:44")
		(end_action O4961 "10/01/2017 10:48")
		(duration_action O4961 4)
		(parameters_typeO O4961 driver136)

		(index_action D8582 21273)
		(is_action D8582)
		(is_typeD D8582)
		(start_action D8582 "10/01/2017 10:48")
		(end_action D8582 "10/01/2017 11:10")
		(duration_action D8582 22)
		(parameters_typeD D8582 driver136)

		(index_action B7232 21274)
		(is_action B7232)
		(is_typeB B7232)
		(start_action B7232 "10/01/2017 11:10")
		(end_action B7232 "10/01/2017 11:23")
		(duration_action B7232 13)
		(parameters_typeB B7232 driver136)

		(index_action D8583 21275)
		(is_action D8583)
		(is_typeD D8583)
		(start_action D8583 "10/01/2017 11:23")
		(end_action D8583 "10/01/2017 11:24")
		(duration_action D8583 1)
		(parameters_typeD D8583 driver136)

		(index_action O4962 21276)
		(is_action O4962)
		(is_typeO O4962)
		(start_action O4962 "10/01/2017 11:24")
		(end_action O4962 "10/01/2017 11:26")
		(duration_action O4962 2)
		(parameters_typeO O4962 driver136)

		(index_action D8584 21277)
		(is_action D8584)
		(is_typeD D8584)
		(start_action D8584 "10/01/2017 11:26")
		(end_action D8584 "10/01/2017 11:27")
		(duration_action D8584 1)
		(parameters_typeD D8584 driver136)

		(index_action B7233 21278)
		(is_action B7233)
		(is_typeB B7233)
		(start_action B7233 "10/01/2017 11:27")
		(end_action B7233 "10/01/2017 11:28")
		(duration_action B7233 1)
		(parameters_typeB B7233 driver136)

		(index_action O4963 21279)
		(is_action O4963)
		(is_typeO O4963)
		(start_action O4963 "10/01/2017 11:28")
		(end_action O4963 "10/01/2017 11:29")
		(duration_action O4963 1)
		(parameters_typeO O4963 driver136)

		(index_action B7234 21280)
		(is_action B7234)
		(is_typeB B7234)
		(start_action B7234 "10/01/2017 11:29")
		(end_action B7234 "10/01/2017 11:37")
		(duration_action B7234 8)
		(parameters_typeB B7234 driver136)

		(index_action O4964 21281)
		(is_action O4964)
		(is_typeO O4964)
		(start_action O4964 "10/01/2017 11:37")
		(end_action O4964 "10/01/2017 11:39")
		(duration_action O4964 2)
		(parameters_typeO O4964 driver136)

		(index_action D8585 21282)
		(is_action D8585)
		(is_typeD D8585)
		(start_action D8585 "10/01/2017 11:39")
		(end_action D8585 "10/01/2017 11:42")
		(duration_action D8585 3)
		(parameters_typeD D8585 driver136)

		(index_action O4965 21283)
		(is_action O4965)
		(is_typeO O4965)
		(start_action O4965 "10/01/2017 11:42")
		(end_action O4965 "10/01/2017 11:46")
		(duration_action O4965 4)
		(parameters_typeO O4965 driver136)

		(index_action D8586 21284)
		(is_action D8586)
		(is_typeD D8586)
		(start_action D8586 "10/01/2017 11:46")
		(end_action D8586 "10/01/2017 15:10")
		(duration_action D8586 204)
		(parameters_typeD D8586 driver136)

		(index_action O4966 21285)
		(is_action O4966)
		(is_typeO O4966)
		(start_action O4966 "10/01/2017 15:10")
		(end_action O4966 "10/01/2017 15:13")
		(duration_action O4966 3)
		(parameters_typeO O4966 driver136)

		(index_action B7235 21286)
		(is_action B7235)
		(is_typeB B7235)
		(start_action B7235 "10/01/2017 15:13")
		(end_action B7235 "11/01/2017 18:27")
		(duration_action B7235 1634)
		(parameters_typeB B7235 driver136)

		(index_action D8587 21287)
		(is_action D8587)
		(is_typeD D8587)
		(start_action D8587 "11/01/2017 18:27")
		(end_action D8587 "11/01/2017 18:35")
		(duration_action D8587 8)
		(parameters_typeD D8587 driver136)

		(index_action O4967 21288)
		(is_action O4967)
		(is_typeO O4967)
		(start_action O4967 "11/01/2017 18:35")
		(end_action O4967 "11/01/2017 18:40")
		(duration_action O4967 5)
		(parameters_typeO O4967 driver136)

		(index_action D8588 21289)
		(is_action D8588)
		(is_typeD D8588)
		(start_action D8588 "11/01/2017 18:40")
		(end_action D8588 "11/01/2017 18:41")
		(duration_action D8588 1)
		(parameters_typeD D8588 driver136)

		(index_action O4968 21290)
		(is_action O4968)
		(is_typeO O4968)
		(start_action O4968 "11/01/2017 18:41")
		(end_action O4968 "11/01/2017 18:44")
		(duration_action O4968 3)
		(parameters_typeO O4968 driver136)

		(index_action B7236 21291)
		(is_action B7236)
		(is_typeB B7236)
		(start_action B7236 "11/01/2017 18:44")
		(end_action B7236 "11/01/2017 19:07")
		(duration_action B7236 23)
		(parameters_typeB B7236 driver136)

		(index_action O4969 21292)
		(is_action O4969)
		(is_typeO O4969)
		(start_action O4969 "11/01/2017 19:07")
		(end_action O4969 "11/01/2017 19:12")
		(duration_action O4969 5)
		(parameters_typeO O4969 driver136)

		(index_action D8589 21293)
		(is_action D8589)
		(is_typeD D8589)
		(start_action D8589 "11/01/2017 19:12")
		(end_action D8589 "11/01/2017 19:33")
		(duration_action D8589 21)
		(parameters_typeD D8589 driver136)

		(index_action B7237 21294)
		(is_action B7237)
		(is_typeB B7237)
		(start_action B7237 "11/01/2017 19:33")
		(end_action B7237 "11/01/2017 20:26")
		(duration_action B7237 53)
		(parameters_typeB B7237 driver136)

		(index_action D8590 21295)
		(is_action D8590)
		(is_typeD D8590)
		(start_action D8590 "11/01/2017 20:26")
		(end_action D8590 "11/01/2017 20:28")
		(duration_action D8590 2)
		(parameters_typeD D8590 driver136)

		(index_action B7238 21296)
		(is_action B7238)
		(is_typeB B7238)
		(start_action B7238 "11/01/2017 20:28")
		(end_action B7238 "11/01/2017 20:47")
		(duration_action B7238 19)
		(parameters_typeB B7238 driver136)

		(index_action O4970 21297)
		(is_action O4970)
		(is_typeO O4970)
		(start_action O4970 "11/01/2017 20:47")
		(end_action O4970 "11/01/2017 20:54")
		(duration_action O4970 7)
		(parameters_typeO O4970 driver136)

		(index_action D8591 21298)
		(is_action D8591)
		(is_typeD D8591)
		(start_action D8591 "11/01/2017 20:54")
		(end_action D8591 "11/01/2017 21:48")
		(duration_action D8591 54)
		(parameters_typeD D8591 driver136)

		(index_action O4971 21299)
		(is_action O4971)
		(is_typeO O4971)
		(start_action O4971 "11/01/2017 21:48")
		(end_action O4971 "11/01/2017 21:50")
		(duration_action O4971 2)
		(parameters_typeO O4971 driver136)

		(index_action D8592 21300)
		(is_action D8592)
		(is_typeD D8592)
		(start_action D8592 "11/01/2017 21:50")
		(end_action D8592 "11/01/2017 21:52")
		(duration_action D8592 2)
		(parameters_typeD D8592 driver136)

		(index_action O4972 21301)
		(is_action O4972)
		(is_typeO O4972)
		(start_action O4972 "11/01/2017 21:52")
		(end_action O4972 "11/01/2017 22:00")
		(duration_action O4972 8)
		(parameters_typeO O4972 driver136)

		(index_action D8593 21302)
		(is_action D8593)
		(is_typeD D8593)
		(start_action D8593 "11/01/2017 22:00")
		(end_action D8593 "11/01/2017 22:02")
		(duration_action D8593 2)
		(parameters_typeD D8593 driver136)

		(index_action O4973 21303)
		(is_action O4973)
		(is_typeO O4973)
		(start_action O4973 "11/01/2017 22:02")
		(end_action O4973 "11/01/2017 22:04")
		(duration_action O4973 2)
		(parameters_typeO O4973 driver136)

		(index_action D8594 21304)
		(is_action D8594)
		(is_typeD D8594)
		(start_action D8594 "11/01/2017 22:04")
		(end_action D8594 "11/01/2017 22:06")
		(duration_action D8594 2)
		(parameters_typeD D8594 driver136)

		(index_action O4974 21305)
		(is_action O4974)
		(is_typeO O4974)
		(start_action O4974 "11/01/2017 22:06")
		(end_action O4974 "11/01/2017 22:07")
		(duration_action O4974 1)
		(parameters_typeO O4974 driver136)

		(index_action B7239 21306)
		(is_action B7239)
		(is_typeB B7239)
		(start_action B7239 "11/01/2017 22:07")
		(end_action B7239 "11/01/2017 22:27")
		(duration_action B7239 20)
		(parameters_typeB B7239 driver136)

		(index_action D8595 21307)
		(is_action D8595)
		(is_typeD D8595)
		(start_action D8595 "11/01/2017 22:27")
		(end_action D8595 "11/01/2017 22:28")
		(duration_action D8595 1)
		(parameters_typeD D8595 driver136)

		(index_action O4975 21308)
		(is_action O4975)
		(is_typeO O4975)
		(start_action O4975 "11/01/2017 22:28")
		(end_action O4975 "11/01/2017 22:40")
		(duration_action O4975 12)
		(parameters_typeO O4975 driver136)

		(index_action D8596 21309)
		(is_action D8596)
		(is_typeD D8596)
		(start_action D8596 "11/01/2017 22:40")
		(end_action D8596 "12/01/2017 00:54")
		(duration_action D8596 134)
		(parameters_typeD D8596 driver136)

		(index_action B7240 21310)
		(is_action B7240)
		(is_typeB B7240)
		(start_action B7240 "12/01/2017 00:54")
		(end_action B7240 "12/01/2017 01:02")
		(duration_action B7240 8)
		(parameters_typeB B7240 driver136)

		(index_action D8597 21311)
		(is_action D8597)
		(is_typeD D8597)
		(start_action D8597 "12/01/2017 01:02")
		(end_action D8597 "12/01/2017 01:05")
		(duration_action D8597 3)
		(parameters_typeD D8597 driver136)

		(index_action O4976 21312)
		(is_action O4976)
		(is_typeO O4976)
		(start_action O4976 "12/01/2017 01:05")
		(end_action O4976 "12/01/2017 01:11")
		(duration_action O4976 6)
		(parameters_typeO O4976 driver136)

		(index_action D8598 21313)
		(is_action D8598)
		(is_typeD D8598)
		(start_action D8598 "12/01/2017 01:11")
		(end_action D8598 "12/01/2017 01:12")
		(duration_action D8598 1)
		(parameters_typeD D8598 driver136)

		(index_action B7241 21314)
		(is_action B7241)
		(is_typeB B7241)
		(start_action B7241 "12/01/2017 01:12")
		(end_action B7241 "12/01/2017 10:17")
		(duration_action B7241 545)
		(parameters_typeB B7241 driver136)

		(index_action D8599 21315)
		(is_action D8599)
		(is_typeD D8599)
		(start_action D8599 "12/01/2017 10:17")
		(end_action D8599 "12/01/2017 11:01")
		(duration_action D8599 44)
		(parameters_typeD D8599 driver136)

		(index_action B7242 21316)
		(is_action B7242)
		(is_typeB B7242)
		(start_action B7242 "12/01/2017 11:01")
		(end_action B7242 "12/01/2017 11:14")
		(duration_action B7242 13)
		(parameters_typeB B7242 driver136)

		(index_action D8600 21317)
		(is_action D8600)
		(is_typeD D8600)
		(start_action D8600 "12/01/2017 11:14")
		(end_action D8600 "12/01/2017 11:16")
		(duration_action D8600 2)
		(parameters_typeD D8600 driver136)

		(index_action O4977 21318)
		(is_action O4977)
		(is_typeO O4977)
		(start_action O4977 "12/01/2017 11:16")
		(end_action O4977 "12/01/2017 11:18")
		(duration_action O4977 2)
		(parameters_typeO O4977 driver136)

		(index_action B7243 21319)
		(is_action B7243)
		(is_typeB B7243)
		(start_action B7243 "12/01/2017 11:18")
		(end_action B7243 "12/01/2017 14:24")
		(duration_action B7243 186)
		(parameters_typeB B7243 driver136)

		(index_action O4978 21320)
		(is_action O4978)
		(is_typeO O4978)
		(start_action O4978 "12/01/2017 14:24")
		(end_action O4978 "12/01/2017 14:39")
		(duration_action O4978 15)
		(parameters_typeO O4978 driver136)

		(index_action D8601 21321)
		(is_action D8601)
		(is_typeD D8601)
		(start_action D8601 "12/01/2017 14:39")
		(end_action D8601 "12/01/2017 14:40")
		(duration_action D8601 1)
		(parameters_typeD D8601 driver136)

		(index_action O4979 21322)
		(is_action O4979)
		(is_typeO O4979)
		(start_action O4979 "12/01/2017 14:40")
		(end_action O4979 "12/01/2017 14:42")
		(duration_action O4979 2)
		(parameters_typeO O4979 driver136)

		(index_action D8602 21323)
		(is_action D8602)
		(is_typeD D8602)
		(start_action D8602 "12/01/2017 14:42")
		(end_action D8602 "12/01/2017 18:49")
		(duration_action D8602 247)
		(parameters_typeD D8602 driver136)

		(index_action B7244 21324)
		(is_action B7244)
		(is_typeB B7244)
		(start_action B7244 "12/01/2017 18:49")
		(end_action B7244 "12/01/2017 19:35")
		(duration_action B7244 46)
		(parameters_typeB B7244 driver136)

		(index_action D8603 21325)
		(is_action D8603)
		(is_typeD D8603)
		(start_action D8603 "12/01/2017 19:35")
		(end_action D8603 "12/01/2017 22:38")
		(duration_action D8603 183)
		(parameters_typeD D8603 driver136)

		(index_action O4980 21326)
		(is_action O4980)
		(is_typeO O4980)
		(start_action O4980 "12/01/2017 22:38")
		(end_action O4980 "12/01/2017 22:42")
		(duration_action O4980 4)
		(parameters_typeO O4980 driver136)

		(index_action D8604 21327)
		(is_action D8604)
		(is_typeD D8604)
		(start_action D8604 "12/01/2017 22:42")
		(end_action D8604 "12/01/2017 22:43")
		(duration_action D8604 1)
		(parameters_typeD D8604 driver136)

		(index_action O4981 21328)
		(is_action O4981)
		(is_typeO O4981)
		(start_action O4981 "12/01/2017 22:43")
		(end_action O4981 "12/01/2017 22:49")
		(duration_action O4981 6)
		(parameters_typeO O4981 driver136)

		(index_action B7245 21329)
		(is_action B7245)
		(is_typeB B7245)
		(start_action B7245 "12/01/2017 22:49")
		(end_action B7245 "13/01/2017 10:01")
		(duration_action B7245 672)
		(parameters_typeB B7245 driver136)

		(index_action D8605 21330)
		(is_action D8605)
		(is_typeD D8605)
		(start_action D8605 "13/01/2017 10:01")
		(end_action D8605 "13/01/2017 12:42")
		(duration_action D8605 161)
		(parameters_typeD D8605 driver136)

		(index_action B7246 21331)
		(is_action B7246)
		(is_typeB B7246)
		(start_action B7246 "13/01/2017 12:42")
		(end_action B7246 "13/01/2017 13:43")
		(duration_action B7246 61)
		(parameters_typeB B7246 driver136)

		(index_action D8606 21332)
		(is_action D8606)
		(is_typeD D8606)
		(start_action D8606 "13/01/2017 13:43")
		(end_action D8606 "13/01/2017 14:09")
		(duration_action D8606 26)
		(parameters_typeD D8606 driver136)

		(index_action O4982 21333)
		(is_action O4982)
		(is_typeO O4982)
		(start_action O4982 "13/01/2017 14:09")
		(end_action O4982 "13/01/2017 14:16")
		(duration_action O4982 7)
		(parameters_typeO O4982 driver136)

		(index_action B7247 21334)
		(is_action B7247)
		(is_typeB B7247)
		(start_action B7247 "13/01/2017 14:16")
		(end_action B7247 "13/01/2017 14:37")
		(duration_action B7247 21)
		(parameters_typeB B7247 driver136)

		(index_action D8607 21335)
		(is_action D8607)
		(is_typeD D8607)
		(start_action D8607 "13/01/2017 14:37")
		(end_action D8607 "13/01/2017 17:19")
		(duration_action D8607 162)
		(parameters_typeD D8607 driver136)

		(index_action B7248 21336)
		(is_action B7248)
		(is_typeB B7248)
		(start_action B7248 "13/01/2017 17:19")
		(end_action B7248 "13/01/2017 18:07")
		(duration_action B7248 48)
		(parameters_typeB B7248 driver136)

		(index_action D8608 21337)
		(is_action D8608)
		(is_typeD D8608)
		(start_action D8608 "13/01/2017 18:07")
		(end_action D8608 "13/01/2017 19:06")
		(duration_action D8608 59)
		(parameters_typeD D8608 driver136)

		(index_action B7249 21338)
		(is_action B7249)
		(is_typeB B7249)
		(start_action B7249 "13/01/2017 19:06")
		(end_action B7249 "14/01/2017 07:11")
		(duration_action B7249 725)
		(parameters_typeB B7249 driver136)

		(index_action D8609 21339)
		(is_action D8609)
		(is_typeD D8609)
		(start_action D8609 "14/01/2017 07:11")
		(end_action D8609 "14/01/2017 08:23")
		(duration_action D8609 72)
		(parameters_typeD D8609 driver136)

		(index_action O4983 21340)
		(is_action O4983)
		(is_typeO O4983)
		(start_action O4983 "14/01/2017 08:23")
		(end_action O4983 "14/01/2017 08:25")
		(duration_action O4983 2)
		(parameters_typeO O4983 driver136)

		(index_action D8610 21341)
		(is_action D8610)
		(is_typeD D8610)
		(start_action D8610 "14/01/2017 08:25")
		(end_action D8610 "14/01/2017 10:19")
		(duration_action D8610 114)
		(parameters_typeD D8610 driver136)

		(index_action B7250 21342)
		(is_action B7250)
		(is_typeB B7250)
		(start_action B7250 "14/01/2017 10:19")
		(end_action B7250 "14/01/2017 10:33")
		(duration_action B7250 14)
		(parameters_typeB B7250 driver136)

		(index_action D8611 21343)
		(is_action D8611)
		(is_typeD D8611)
		(start_action D8611 "14/01/2017 10:33")
		(end_action D8611 "14/01/2017 10:39")
		(duration_action D8611 6)
		(parameters_typeD D8611 driver136)

		(index_action B7251 21344)
		(is_action B7251)
		(is_typeB B7251)
		(start_action B7251 "14/01/2017 10:39")
		(end_action B7251 "14/01/2017 10:43")
		(duration_action B7251 4)
		(parameters_typeB B7251 driver136)

		(index_action D8612 21345)
		(is_action D8612)
		(is_typeD D8612)
		(start_action D8612 "14/01/2017 10:43")
		(end_action D8612 "14/01/2017 11:55")
		(duration_action D8612 72)
		(parameters_typeD D8612 driver136)

		(index_action B7252 21346)
		(is_action B7252)
		(is_typeB B7252)
		(start_action B7252 "14/01/2017 11:55")
		(end_action B7252 "14/01/2017 12:42")
		(duration_action B7252 47)
		(parameters_typeB B7252 driver136)

		(index_action D8613 21347)
		(is_action D8613)
		(is_typeD D8613)
		(start_action D8613 "14/01/2017 12:42")
		(end_action D8613 "14/01/2017 14:12")
		(duration_action D8613 90)
		(parameters_typeD D8613 driver136)

		(index_action O4984 21348)
		(is_action O4984)
		(is_typeO O4984)
		(start_action O4984 "14/01/2017 14:12")
		(end_action O4984 "14/01/2017 14:16")
		(duration_action O4984 4)
		(parameters_typeO O4984 driver136)

		(index_action D8614 21349)
		(is_action D8614)
		(is_typeD D8614)
		(start_action D8614 "14/01/2017 14:16")
		(end_action D8614 "14/01/2017 16:48")
		(duration_action D8614 152)
		(parameters_typeD D8614 driver136)

		(index_action O4985 21350)
		(is_action O4985)
		(is_typeO O4985)
		(start_action O4985 "14/01/2017 16:48")
		(end_action O4985 "14/01/2017 16:50")
		(duration_action O4985 2)
		(parameters_typeO O4985 driver136)

		(index_action D8615 21351)
		(is_action D8615)
		(is_typeD D8615)
		(start_action D8615 "14/01/2017 16:50")
		(end_action D8615 "14/01/2017 16:59")
		(duration_action D8615 9)
		(parameters_typeD D8615 driver136)

		(index_action B7253 21352)
		(is_action B7253)
		(is_typeB B7253)
		(start_action B7253 "14/01/2017 16:59")
		(end_action B7253 "15/01/2017 21:47")
		(duration_action B7253 1728)
		(parameters_typeB B7253 driver136)

		(index_action D8616 21353)
		(is_action D8616)
		(is_typeD D8616)
		(start_action D8616 "15/01/2017 21:47")
		(end_action D8616 "15/01/2017 21:49")
		(duration_action D8616 2)
		(parameters_typeD D8616 driver136)

		(index_action O4986 21354)
		(is_action O4986)
		(is_typeO O4986)
		(start_action O4986 "15/01/2017 21:49")
		(end_action O4986 "15/01/2017 21:52")
		(duration_action O4986 3)
		(parameters_typeO O4986 driver136)

		(index_action B7254 21355)
		(is_action B7254)
		(is_typeB B7254)
		(start_action B7254 "15/01/2017 21:52")
		(end_action B7254 "15/01/2017 21:55")
		(duration_action B7254 3)
		(parameters_typeB B7254 driver136)

		(index_action D8617 21356)
		(is_action D8617)
		(is_typeD D8617)
		(start_action D8617 "15/01/2017 21:55")
		(end_action D8617 "15/01/2017 21:58")
		(duration_action D8617 3)
		(parameters_typeD D8617 driver136)

		(index_action O4987 21357)
		(is_action O4987)
		(is_typeO O4987)
		(start_action O4987 "15/01/2017 21:58")
		(end_action O4987 "15/01/2017 22:00")
		(duration_action O4987 2)
		(parameters_typeO O4987 driver136)

		(index_action D8618 21358)
		(is_action D8618)
		(is_typeD D8618)
		(start_action D8618 "15/01/2017 22:00")
		(end_action D8618 "15/01/2017 22:03")
		(duration_action D8618 3)
		(parameters_typeD D8618 driver136)

		(index_action B7255 21359)
		(is_action B7255)
		(is_typeB B7255)
		(start_action B7255 "15/01/2017 22:03")
		(end_action B7255 "16/01/2017 12:31")
		(duration_action B7255 868)
		(parameters_typeB B7255 driver136)

	)
	(:tasks-goal
		:tasks (
			(WD driver136)
		)
	)
)