(define (problem prueba0) (:domain GantaBi)
	(:customization
		(= :time-format "%d/%m/%Y %H:%M")
		(= :time-horizon-relative 86400) ;; que son los minutos que tienen 2 meses
		(= :time-start "01/01/2017 00:00")
		(= :time-unit :minutes)
	)
	(:objects
		driver142 - Driver

		D8885 D8886 D8887 D8888 D8889 D8890 D8891 D8892 D8893 D8894 D8895 D8896 D8897 D8898 D8899 D8900 D8901 D8902 D8903 D8904 D8905
 - TaskInstanceSymbol
		O5132 O5133 O5134 O5135 O5136 O5137 O5138 O5139 O5140 O5141 O5142 O5143 O5144 O5145 O5146 O5147 O5148
 - TaskInstanceSymbol
		B7529 B7530 B7531 B7532 B7533 B7534 B7535 B7536 B7537 B7538 B7539 B7540 B7541 B7542 B7543 B7544 B7545 B7546 B7547 B7548 B7549 B7550 B7551 B7552 B7553 B7554 B7555 B7556 B7557 B7558
 - TaskInstanceSymbol
		I534 I535 I536 I537 I538 I539 I540 I541 I542 I543 I544 I545 I546 I547 I548 I549 I550 I551 - TaskInstanceSymbol
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

		(= (current_index_action) 22076)

		(= (last_dr) "02/01/2017 10:05")
		(= (last_wr) "02/01/2017 10:05")
		(= (actual-timestamp) "02/01/2017 10:05")

		; Events
		(index_action I534 22076)
		(is_action I534)
		(is_typeI I534)
		(start_action I534 "02/01/2017 10:05")
		(end_action I534 "02/01/2017 11:15")
		(duration_action I534 70)
		(parameters_typeI I534 driver142)

		(index_action I535 22077)
		(is_action I535)
		(is_typeI I535)
		(start_action I535 "02/01/2017 12:26")
		(end_action I535 "02/01/2017 12:32")
		(duration_action I535 6)
		(parameters_typeI I535 driver142)

		(index_action B7529 22078)
		(is_action B7529)
		(is_typeB B7529)
		(start_action B7529 "02/01/2017 12:32")
		(end_action B7529 "02/01/2017 15:03")
		(duration_action B7529 151)
		(parameters_typeB B7529 driver142)

		(index_action I536 22079)
		(is_action I536)
		(is_typeI I536)
		(start_action I536 "02/01/2017 15:03")
		(end_action I536 "02/01/2017 15:11")
		(duration_action I536 8)
		(parameters_typeI I536 driver142)

		(index_action B7530 22080)
		(is_action B7530)
		(is_typeB B7530)
		(start_action B7530 "02/01/2017 15:11")
		(end_action B7530 "02/01/2017 16:47")
		(duration_action B7530 96)
		(parameters_typeB B7530 driver142)

		(index_action B7531 22081)
		(is_action B7531)
		(is_typeB B7531)
		(start_action B7531 "03/01/2017 03:30")
		(end_action B7531 "03/01/2017 05:36")
		(duration_action B7531 126)
		(parameters_typeB B7531 driver142)

		(index_action B7532 22082)
		(is_action B7532)
		(is_typeB B7532)
		(start_action B7532 "03/01/2017 11:57")
		(end_action B7532 "03/01/2017 12:48")
		(duration_action B7532 51)
		(parameters_typeB B7532 driver142)

		(index_action B7533 22083)
		(is_action B7533)
		(is_typeB B7533)
		(start_action B7533 "03/01/2017 13:42")
		(end_action B7533 "03/01/2017 14:50")
		(duration_action B7533 68)
		(parameters_typeB B7533 driver142)

		(index_action I537 22084)
		(is_action I537)
		(is_typeI I537)
		(start_action I537 "03/01/2017 14:50")
		(end_action I537 "03/01/2017 15:08")
		(duration_action I537 18)
		(parameters_typeI I537 driver142)

		(index_action B7534 22085)
		(is_action B7534)
		(is_typeB B7534)
		(start_action B7534 "03/01/2017 19:01")
		(end_action B7534 "03/01/2017 19:12")
		(duration_action B7534 11)
		(parameters_typeB B7534 driver142)

		(index_action B7535 22086)
		(is_action B7535)
		(is_typeB B7535)
		(start_action B7535 "04/01/2017 12:21")
		(end_action B7535 "04/01/2017 14:23")
		(duration_action B7535 122)
		(parameters_typeB B7535 driver142)

		(index_action B7536 22087)
		(is_action B7536)
		(is_typeB B7536)
		(start_action B7536 "04/01/2017 14:45")
		(end_action B7536 "04/01/2017 16:50")
		(duration_action B7536 125)
		(parameters_typeB B7536 driver142)

		(index_action B7537 22088)
		(is_action B7537)
		(is_typeB B7537)
		(start_action B7537 "05/01/2017 07:31")
		(end_action B7537 "05/01/2017 10:54")
		(duration_action B7537 203)
		(parameters_typeB B7537 driver142)

		(index_action D8885 22089)
		(is_action D8885)
		(is_typeD D8885)
		(start_action D8885 "05/01/2017 12:03")
		(end_action D8885 "05/01/2017 12:04")
		(duration_action D8885 1)
		(parameters_typeD D8885 driver142)

		(index_action O5132 22090)
		(is_action O5132)
		(is_typeO O5132)
		(start_action O5132 "05/01/2017 12:04")
		(end_action O5132 "05/01/2017 12:05")
		(duration_action O5132 1)
		(parameters_typeO O5132 driver142)

		(index_action B7538 22091)
		(is_action B7538)
		(is_typeB B7538)
		(start_action B7538 "05/01/2017 12:05")
		(end_action B7538 "05/01/2017 12:15")
		(duration_action B7538 10)
		(parameters_typeB B7538 driver142)

		(index_action D8886 22092)
		(is_action D8886)
		(is_typeD D8886)
		(start_action D8886 "05/01/2017 12:15")
		(end_action D8886 "05/01/2017 12:16")
		(duration_action D8886 1)
		(parameters_typeD D8886 driver142)

		(index_action B7539 22093)
		(is_action B7539)
		(is_typeB B7539)
		(start_action B7539 "05/01/2017 12:16")
		(end_action B7539 "05/01/2017 12:50")
		(duration_action B7539 34)
		(parameters_typeB B7539 driver142)

		(index_action D8887 22094)
		(is_action D8887)
		(is_typeD D8887)
		(start_action D8887 "05/01/2017 12:50")
		(end_action D8887 "05/01/2017 13:04")
		(duration_action D8887 14)
		(parameters_typeD D8887 driver142)

		(index_action O5133 22095)
		(is_action O5133)
		(is_typeO O5133)
		(start_action O5133 "05/01/2017 16:39")
		(end_action O5133 "05/01/2017 17:33")
		(duration_action O5133 54)
		(parameters_typeO O5133 driver142)

		(index_action B7540 22096)
		(is_action B7540)
		(is_typeB B7540)
		(start_action B7540 "05/01/2017 21:45")
		(end_action B7540 "06/01/2017 07:09")
		(duration_action B7540 564)
		(parameters_typeB B7540 driver142)

		(index_action I538 22097)
		(is_action I538)
		(is_typeI I538)
		(start_action I538 "06/01/2017 09:03")
		(end_action I538 "06/01/2017 09:25")
		(duration_action I538 22)
		(parameters_typeI I538 driver142)

		(index_action B7541 22098)
		(is_action B7541)
		(is_typeB B7541)
		(start_action B7541 "06/01/2017 11:47")
		(end_action B7541 "06/01/2017 12:39")
		(duration_action B7541 52)
		(parameters_typeB B7541 driver142)

		(index_action B7542 22099)
		(is_action B7542)
		(is_typeB B7542)
		(start_action B7542 "06/01/2017 18:20")
		(end_action B7542 "06/01/2017 18:39")
		(duration_action B7542 19)
		(parameters_typeB B7542 driver142)

		(index_action I539 22100)
		(is_action I539)
		(is_typeI I539)
		(start_action I539 "06/01/2017 19:29")
		(end_action I539 "06/01/2017 19:35")
		(duration_action I539 6)
		(parameters_typeI I539 driver142)

		(index_action B7543 22101)
		(is_action B7543)
		(is_typeB B7543)
		(start_action B7543 "06/01/2017 19:35")
		(end_action B7543 "09/01/2017 10:31")
		(duration_action B7543 3776)
		(parameters_typeB B7543 driver142)

		(index_action D8888 22102)
		(is_action D8888)
		(is_typeD D8888)
		(start_action D8888 "09/01/2017 16:26")
		(end_action D8888 "09/01/2017 16:27")
		(duration_action D8888 1)
		(parameters_typeD D8888 driver142)

		(index_action O5134 22103)
		(is_action O5134)
		(is_typeO O5134)
		(start_action O5134 "09/01/2017 16:27")
		(end_action O5134 "09/01/2017 16:29")
		(duration_action O5134 2)
		(parameters_typeO O5134 driver142)

		(index_action D8889 22104)
		(is_action D8889)
		(is_typeD D8889)
		(start_action D8889 "09/01/2017 16:29")
		(end_action D8889 "09/01/2017 16:31")
		(duration_action D8889 2)
		(parameters_typeD D8889 driver142)

		(index_action B7544 22105)
		(is_action B7544)
		(is_typeB B7544)
		(start_action B7544 "09/01/2017 16:31")
		(end_action B7544 "09/01/2017 17:11")
		(duration_action B7544 40)
		(parameters_typeB B7544 driver142)

		(index_action D8890 22106)
		(is_action D8890)
		(is_typeD D8890)
		(start_action D8890 "09/01/2017 17:11")
		(end_action D8890 "09/01/2017 17:12")
		(duration_action D8890 1)
		(parameters_typeD D8890 driver142)

		(index_action O5135 22107)
		(is_action O5135)
		(is_typeO O5135)
		(start_action O5135 "09/01/2017 17:12")
		(end_action O5135 "09/01/2017 17:17")
		(duration_action O5135 5)
		(parameters_typeO O5135 driver142)

		(index_action B7545 22108)
		(is_action B7545)
		(is_typeB B7545)
		(start_action B7545 "09/01/2017 17:17")
		(end_action B7545 "10/01/2017 07:50")
		(duration_action B7545 873)
		(parameters_typeB B7545 driver142)

		(index_action O5136 22109)
		(is_action O5136)
		(is_typeO O5136)
		(start_action O5136 "10/01/2017 07:50")
		(end_action O5136 "10/01/2017 08:18")
		(duration_action O5136 28)
		(parameters_typeO O5136 driver142)

		(index_action B7546 22110)
		(is_action B7546)
		(is_typeB B7546)
		(start_action B7546 "10/01/2017 12:09")
		(end_action B7546 "10/01/2017 12:34")
		(duration_action B7546 25)
		(parameters_typeB B7546 driver142)

		(index_action B7547 22111)
		(is_action B7547)
		(is_typeB B7547)
		(start_action B7547 "10/01/2017 15:43")
		(end_action B7547 "10/01/2017 16:39")
		(duration_action B7547 56)
		(parameters_typeB B7547 driver142)

		(index_action I540 22112)
		(is_action I540)
		(is_typeI I540)
		(start_action I540 "10/01/2017 16:39")
		(end_action I540 "10/01/2017 17:25")
		(duration_action I540 46)
		(parameters_typeI I540 driver142)

		(index_action B7548 22113)
		(is_action B7548)
		(is_typeB B7548)
		(start_action B7548 "10/01/2017 17:25")
		(end_action B7548 "10/01/2017 18:23")
		(duration_action B7548 58)
		(parameters_typeB B7548 driver142)

		(index_action I541 22114)
		(is_action I541)
		(is_typeI I541)
		(start_action I541 "11/01/2017 00:53")
		(end_action I541 "11/01/2017 09:42")
		(duration_action I541 529)
		(parameters_typeI I541 driver142)

		(index_action B7549 22115)
		(is_action B7549)
		(is_typeB B7549)
		(start_action B7549 "11/01/2017 09:42")
		(end_action B7549 "11/01/2017 10:04")
		(duration_action B7549 22)
		(parameters_typeB B7549 driver142)

		(index_action I542 22116)
		(is_action I542)
		(is_typeI I542)
		(start_action I542 "11/01/2017 10:04")
		(end_action I542 "11/01/2017 10:29")
		(duration_action I542 25)
		(parameters_typeI I542 driver142)

		(index_action I543 22117)
		(is_action I543)
		(is_typeI I543)
		(start_action I543 "11/01/2017 11:14")
		(end_action I543 "11/01/2017 11:24")
		(duration_action I543 10)
		(parameters_typeI I543 driver142)

		(index_action I544 22118)
		(is_action I544)
		(is_typeI I544)
		(start_action I544 "11/01/2017 11:51")
		(end_action I544 "11/01/2017 12:00")
		(duration_action I544 9)
		(parameters_typeI I544 driver142)

		(index_action I545 22119)
		(is_action I545)
		(is_typeI I545)
		(start_action I545 "11/01/2017 12:52")
		(end_action I545 "11/01/2017 13:01")
		(duration_action I545 9)
		(parameters_typeI I545 driver142)

		(index_action I546 22120)
		(is_action I546)
		(is_typeI I546)
		(start_action I546 "11/01/2017 13:23")
		(end_action I546 "11/01/2017 13:39")
		(duration_action I546 16)
		(parameters_typeI I546 driver142)

		(index_action D8891 22121)
		(is_action D8891)
		(is_typeD D8891)
		(start_action D8891 "11/01/2017 17:03")
		(end_action D8891 "11/01/2017 17:12")
		(duration_action D8891 9)
		(parameters_typeD D8891 driver142)

		(index_action D8892 22122)
		(is_action D8892)
		(is_typeD D8892)
		(start_action D8892 "11/01/2017 17:49")
		(end_action D8892 "11/01/2017 17:59")
		(duration_action D8892 10)
		(parameters_typeD D8892 driver142)

		(index_action I547 22123)
		(is_action I547)
		(is_typeI I547)
		(start_action I547 "11/01/2017 19:13")
		(end_action I547 "11/01/2017 19:42")
		(duration_action I547 29)
		(parameters_typeI I547 driver142)

		(index_action I548 22124)
		(is_action I548)
		(is_typeI I548)
		(start_action I548 "11/01/2017 19:54")
		(end_action I548 "11/01/2017 20:11")
		(duration_action I548 17)
		(parameters_typeI I548 driver142)

		(index_action B7550 22125)
		(is_action B7550)
		(is_typeB B7550)
		(start_action B7550 "11/01/2017 21:11")
		(end_action B7550 "11/01/2017 21:12")
		(duration_action B7550 1)
		(parameters_typeB B7550 driver142)

		(index_action I549 22126)
		(is_action I549)
		(is_typeI I549)
		(start_action I549 "11/01/2017 21:12")
		(end_action I549 "11/01/2017 21:28")
		(duration_action I549 16)
		(parameters_typeI I549 driver142)

		(index_action B7551 22127)
		(is_action B7551)
		(is_typeB B7551)
		(start_action B7551 "12/01/2017 03:46")
		(end_action B7551 "12/01/2017 03:48")
		(duration_action B7551 2)
		(parameters_typeB B7551 driver142)

		(index_action O5137 22128)
		(is_action O5137)
		(is_typeO O5137)
		(start_action O5137 "12/01/2017 03:48")
		(end_action O5137 "12/01/2017 04:05")
		(duration_action O5137 17)
		(parameters_typeO O5137 driver142)

		(index_action B7552 22129)
		(is_action B7552)
		(is_typeB B7552)
		(start_action B7552 "12/01/2017 04:05")
		(end_action B7552 "12/01/2017 17:06")
		(duration_action B7552 781)
		(parameters_typeB B7552 driver142)

		(index_action D8893 22130)
		(is_action D8893)
		(is_typeD D8893)
		(start_action D8893 "12/01/2017 17:06")
		(end_action D8893 "12/01/2017 17:10")
		(duration_action D8893 4)
		(parameters_typeD D8893 driver142)

		(index_action O5138 22131)
		(is_action O5138)
		(is_typeO O5138)
		(start_action O5138 "12/01/2017 17:10")
		(end_action O5138 "12/01/2017 17:12")
		(duration_action O5138 2)
		(parameters_typeO O5138 driver142)

		(index_action D8894 22132)
		(is_action D8894)
		(is_typeD D8894)
		(start_action D8894 "12/01/2017 17:12")
		(end_action D8894 "12/01/2017 17:14")
		(duration_action D8894 2)
		(parameters_typeD D8894 driver142)

		(index_action O5139 22133)
		(is_action O5139)
		(is_typeO O5139)
		(start_action O5139 "12/01/2017 17:14")
		(end_action O5139 "12/01/2017 17:24")
		(duration_action O5139 10)
		(parameters_typeO O5139 driver142)

		(index_action D8895 22134)
		(is_action D8895)
		(is_typeD D8895)
		(start_action D8895 "12/01/2017 17:24")
		(end_action D8895 "12/01/2017 17:28")
		(duration_action D8895 4)
		(parameters_typeD D8895 driver142)

		(index_action O5140 22135)
		(is_action O5140)
		(is_typeO O5140)
		(start_action O5140 "12/01/2017 17:28")
		(end_action O5140 "12/01/2017 17:36")
		(duration_action O5140 8)
		(parameters_typeO O5140 driver142)

		(index_action B7553 22136)
		(is_action B7553)
		(is_typeB B7553)
		(start_action B7553 "12/01/2017 17:36")
		(end_action B7553 "13/01/2017 08:55")
		(duration_action B7553 919)
		(parameters_typeB B7553 driver142)

		(index_action D8896 22137)
		(is_action D8896)
		(is_typeD D8896)
		(start_action D8896 "13/01/2017 08:55")
		(end_action D8896 "13/01/2017 08:56")
		(duration_action D8896 1)
		(parameters_typeD D8896 driver142)

		(index_action O5141 22138)
		(is_action O5141)
		(is_typeO O5141)
		(start_action O5141 "13/01/2017 08:56")
		(end_action O5141 "13/01/2017 08:58")
		(duration_action O5141 2)
		(parameters_typeO O5141 driver142)

		(index_action D8897 22139)
		(is_action D8897)
		(is_typeD D8897)
		(start_action D8897 "13/01/2017 08:58")
		(end_action D8897 "13/01/2017 09:01")
		(duration_action D8897 3)
		(parameters_typeD D8897 driver142)

		(index_action O5142 22140)
		(is_action O5142)
		(is_typeO O5142)
		(start_action O5142 "13/01/2017 09:01")
		(end_action O5142 "13/01/2017 09:04")
		(duration_action O5142 3)
		(parameters_typeO O5142 driver142)

		(index_action D8898 22141)
		(is_action D8898)
		(is_typeD D8898)
		(start_action D8898 "13/01/2017 09:04")
		(end_action D8898 "13/01/2017 09:05")
		(duration_action D8898 1)
		(parameters_typeD D8898 driver142)

		(index_action O5143 22142)
		(is_action O5143)
		(is_typeO O5143)
		(start_action O5143 "13/01/2017 09:05")
		(end_action O5143 "13/01/2017 09:10")
		(duration_action O5143 5)
		(parameters_typeO O5143 driver142)

		(index_action D8899 22143)
		(is_action D8899)
		(is_typeD D8899)
		(start_action D8899 "13/01/2017 09:10")
		(end_action D8899 "13/01/2017 09:11")
		(duration_action D8899 1)
		(parameters_typeD D8899 driver142)

		(index_action O5144 22144)
		(is_action O5144)
		(is_typeO O5144)
		(start_action O5144 "13/01/2017 09:11")
		(end_action O5144 "13/01/2017 09:13")
		(duration_action O5144 2)
		(parameters_typeO O5144 driver142)

		(index_action D8900 22145)
		(is_action D8900)
		(is_typeD D8900)
		(start_action D8900 "13/01/2017 09:13")
		(end_action D8900 "13/01/2017 09:14")
		(duration_action D8900 1)
		(parameters_typeD D8900 driver142)

		(index_action O5145 22146)
		(is_action O5145)
		(is_typeO O5145)
		(start_action O5145 "13/01/2017 09:14")
		(end_action O5145 "13/01/2017 09:25")
		(duration_action O5145 11)
		(parameters_typeO O5145 driver142)

		(index_action D8901 22147)
		(is_action D8901)
		(is_typeD D8901)
		(start_action D8901 "13/01/2017 09:25")
		(end_action D8901 "13/01/2017 09:27")
		(duration_action D8901 2)
		(parameters_typeD D8901 driver142)

		(index_action O5146 22148)
		(is_action O5146)
		(is_typeO O5146)
		(start_action O5146 "13/01/2017 09:27")
		(end_action O5146 "13/01/2017 09:29")
		(duration_action O5146 2)
		(parameters_typeO O5146 driver142)

		(index_action D8902 22149)
		(is_action D8902)
		(is_typeD D8902)
		(start_action D8902 "13/01/2017 09:29")
		(end_action D8902 "13/01/2017 09:30")
		(duration_action D8902 1)
		(parameters_typeD D8902 driver142)

		(index_action B7554 22150)
		(is_action B7554)
		(is_typeB B7554)
		(start_action B7554 "13/01/2017 09:30")
		(end_action B7554 "13/01/2017 10:19")
		(duration_action B7554 49)
		(parameters_typeB B7554 driver142)

		(index_action D8903 22151)
		(is_action D8903)
		(is_typeD D8903)
		(start_action D8903 "13/01/2017 10:19")
		(end_action D8903 "13/01/2017 10:21")
		(duration_action D8903 2)
		(parameters_typeD D8903 driver142)

		(index_action O5147 22152)
		(is_action O5147)
		(is_typeO O5147)
		(start_action O5147 "13/01/2017 10:21")
		(end_action O5147 "13/01/2017 11:18")
		(duration_action O5147 57)
		(parameters_typeO O5147 driver142)

		(index_action B7555 22153)
		(is_action B7555)
		(is_typeB B7555)
		(start_action B7555 "13/01/2017 11:18")
		(end_action B7555 "13/01/2017 11:19")
		(duration_action B7555 1)
		(parameters_typeB B7555 driver142)

		(index_action D8904 22154)
		(is_action D8904)
		(is_typeD D8904)
		(start_action D8904 "13/01/2017 11:19")
		(end_action D8904 "13/01/2017 11:22")
		(duration_action D8904 3)
		(parameters_typeD D8904 driver142)

		(index_action O5148 22155)
		(is_action O5148)
		(is_typeO O5148)
		(start_action O5148 "13/01/2017 11:22")
		(end_action O5148 "13/01/2017 11:26")
		(duration_action O5148 4)
		(parameters_typeO O5148 driver142)

		(index_action D8905 22156)
		(is_action D8905)
		(is_typeD D8905)
		(start_action D8905 "13/01/2017 11:26")
		(end_action D8905 "13/01/2017 11:37")
		(duration_action D8905 11)
		(parameters_typeD D8905 driver142)

		(index_action B7556 22157)
		(is_action B7556)
		(is_typeB B7556)
		(start_action B7556 "14/01/2017 01:53")
		(end_action B7556 "14/01/2017 03:27")
		(duration_action B7556 94)
		(parameters_typeB B7556 driver142)

		(index_action I550 22158)
		(is_action I550)
		(is_typeI I550)
		(start_action I550 "14/01/2017 09:39")
		(end_action I550 "14/01/2017 09:46")
		(duration_action I550 7)
		(parameters_typeI I550 driver142)

		(index_action B7557 22159)
		(is_action B7557)
		(is_typeB B7557)
		(start_action B7557 "14/01/2017 09:46")
		(end_action B7557 "14/01/2017 11:03")
		(duration_action B7557 77)
		(parameters_typeB B7557 driver142)

		(index_action I551 22160)
		(is_action I551)
		(is_typeI I551)
		(start_action I551 "14/01/2017 11:03")
		(end_action I551 "14/01/2017 11:24")
		(duration_action I551 21)
		(parameters_typeI I551 driver142)

		(index_action B7558 22161)
		(is_action B7558)
		(is_typeB B7558)
		(start_action B7558 "14/01/2017 22:12")
		(end_action B7558 "16/01/2017 00:01")
		(duration_action B7558 1549)
		(parameters_typeB B7558 driver142)

	)
	(:tasks-goal
		:tasks (
			(WD driver142)
		)
	)
)