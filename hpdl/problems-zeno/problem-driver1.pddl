(define (problem prueba0) (:domain GantaBi)
	(:customization
		(= :time-format "%d/%m/%Y %H:%M")
		(= :time-horizon-relative 86400) ;; que son los minutos que tienen 2 meses
		(= :time-start "01/01/2017 00:00")
		(= :time-unit :minutes)
	)
	(:objects
		driver1 - Driver
		almeria barcelona bilbao cadiz cordoba gibraltar granada huelva jaen madrid malaga sevilla - city
		box1 box2 box3 - box

		D1 D2 D3 D4 D5 D6 D7 D8 D9 D10 D11 D12 D13 D14 D15 D16 D17 D18 D19 D20 D21 D22 D23 D24 D25 D26 D27 D28 D29 D30 D31 D32 D33 D34 D35 D36 D37 D38 D39 D40 D41 D42 D43 D44 D45 D46 D47 D48 D49 D50 D51 D52 D53 D54 D55 D56 D57 D58 D59 D60 D61 D62 D63 D64 D65 D66 D67 D68
 - TaskInstanceSymbol
		O1 O2 O3 O4 O5 O6 O7 O8 O9 O10 O11 O12 O13 O14 O15 O16 O17 O18 O19 O20 O21 O22 O23 O24 O25 O26 O27 O28
 - TaskInstanceSymbol
		B1 B2 B3 B4 B5 B6 B7 B8 B9 B10 B11 B12 B13 B14 B15 B16 B17 B18 B19 B20 B21 B22 B23 B24 B25 B26 B27 B28 B29 B30 B31 B32 B33 B34 B35 B36 B37 B38 B39 B40 B41 B42 B43 B44 B45 B46 B47 B48 B49 B50 B51 B52 B53 B54 B55
 - TaskInstanceSymbol
		I1 I2 - TaskInstanceSymbol
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
		(= (dt_wd) 0)
		(= (dt_previous_wd) 0)
		(= (edds_in_week) 0)

		(= (current_index_action) 0)

		(= (last_dr) "02/01/2017 17:59")
		(= (last_wr) "02/01/2017 17:59")
		(= (actual-timestamp) "02/01/2017 17:59")

		; Events
		(index_action B1 0)
		(is_action B1)
		(is_typeB B1)
		(start_action B1 "02/01/2017 17:59")
		(end_action B1 "02/01/2017 18:13")
		(duration_action B1 14)
		(parameters_typeB B1 driver1)

		(index_action D1 1)
		(is_action D1)
		(is_typeD D1)
		(start_action D1 "02/01/2017 18:13")
		(end_action D1 "02/01/2017 18:16")
		(duration_action D1 3)
		(parameters_typeD D1 driver1)

		(index_action O1 2)
		(is_action O1)
		(is_typeO O1)
		(start_action O1 "02/01/2017 18:16")
		(end_action O1 "02/01/2017 18:18")
		(duration_action O1 2)
		(parameters_typeO O1 driver1)

		(index_action D2 3)
		(is_action D2)
		(is_typeD D2)
		(start_action D2 "02/01/2017 18:18")
		(end_action D2 "02/01/2017 18:20")
		(duration_action D2 2)
		(parameters_typeD D2 driver1)

		(index_action O2 4)
		(is_action O2)
		(is_typeO O2)
		(start_action O2 "02/01/2017 18:20")
		(end_action O2 "02/01/2017 18:43")
		(duration_action O2 23)
		(parameters_typeO O2 driver1)

		(index_action D3 5)
		(is_action D3)
		(is_typeD D3)
		(start_action D3 "02/01/2017 18:43")
		(end_action D3 "02/01/2017 18:45")
		(duration_action D3 2)
		(parameters_typeD D3 driver1)

		(index_action B2 6)
		(is_action B2)
		(is_typeB B2)
		(start_action B2 "02/01/2017 18:45")
		(end_action B2 "02/01/2017 18:47")
		(duration_action B2 2)
		(parameters_typeB B2 driver1)

		(index_action D4 7)
		(is_action D4)
		(is_typeD D4)
		(start_action D4 "02/01/2017 18:47")
		(end_action D4 "02/01/2017 19:12")
		(duration_action D4 25)
		(parameters_typeD D4 driver1)

		(index_action B3 8)
		(is_action B3)
		(is_typeB B3)
		(start_action B3 "02/01/2017 19:12")
		(end_action B3 "02/01/2017 19:42")
		(duration_action B3 30)
		(parameters_typeB B3 driver1)

		(index_action D5 9)
		(is_action D5)
		(is_typeD D5)
		(start_action D5 "02/01/2017 19:42")
		(end_action D5 "02/01/2017 21:35")
		(duration_action D5 113)
		(parameters_typeD D5 driver1)

		(index_action B4 10)
		(is_action B4)
		(is_typeB B4)
		(start_action B4 "02/01/2017 21:35")
		(end_action B4 "02/01/2017 22:34")
		(duration_action B4 59)
		(parameters_typeB B4 driver1)

		(index_action D6 11)
		(is_action D6)
		(is_typeD D6)
		(start_action D6 "02/01/2017 22:34")
		(end_action D6 "03/01/2017 00:56")
		(duration_action D6 142)
		(parameters_typeD D6 driver1)

		(index_action O3 12)
		(is_action O3)
		(is_typeO O3)
		(start_action O3 "03/01/2017 00:56")
		(end_action O3 "03/01/2017 00:59")
		(duration_action O3 3)
		(parameters_typeO O3 driver1)

		(index_action D7 13)
		(is_action D7)
		(is_typeD D7)
		(start_action D7 "03/01/2017 00:59")
		(end_action D7 "03/01/2017 01:00")
		(duration_action D7 1)
		(parameters_typeD D7 driver1)

		(index_action O4 14)
		(is_action O4)
		(is_typeO O4)
		(start_action O4 "03/01/2017 01:00")
		(end_action O4 "03/01/2017 01:02")
		(duration_action O4 2)
		(parameters_typeO O4 driver1)

		(index_action D8 15)
		(is_action D8)
		(is_typeD D8)
		(start_action D8 "03/01/2017 01:02")
		(end_action D8 "03/01/2017 01:05")
		(duration_action D8 3)
		(parameters_typeD D8 driver1)

		(index_action B5 16)
		(is_action B5)
		(is_typeB B5)
		(start_action B5 "03/01/2017 01:05")
		(end_action B5 "03/01/2017 16:20")
		(duration_action B5 915)
		(parameters_typeB B5 driver1)

		(index_action D9 17)
		(is_action D9)
		(is_typeD D9)
		(start_action D9 "03/01/2017 16:20")
		(end_action D9 "03/01/2017 18:39")
		(duration_action D9 139)
		(parameters_typeD D9 driver1)

		(index_action O5 18)
		(is_action O5)
		(is_typeO O5)
		(start_action O5 "03/01/2017 18:39")
		(end_action O5 "03/01/2017 18:40")
		(duration_action O5 1)
		(parameters_typeO O5 driver1)

		(index_action B6 19)
		(is_action B6)
		(is_typeB B6)
		(start_action B6 "03/01/2017 18:40")
		(end_action B6 "04/01/2017 09:25")
		(duration_action B6 885)
		(parameters_typeB B6 driver1)

		(index_action D10 20)
		(is_action D10)
		(is_typeD D10)
		(start_action D10 "04/01/2017 09:25")
		(end_action D10 "04/01/2017 09:29")
		(duration_action D10 4)
		(parameters_typeD D10 driver1)

		(index_action B7 21)
		(is_action B7)
		(is_typeB B7)
		(start_action B7 "04/01/2017 09:29")
		(end_action B7 "04/01/2017 09:47")
		(duration_action B7 18)
		(parameters_typeB B7 driver1)

		(index_action D11 22)
		(is_action D11)
		(is_typeD D11)
		(start_action D11 "04/01/2017 09:47")
		(end_action D11 "04/01/2017 09:50")
		(duration_action D11 3)
		(parameters_typeD D11 driver1)

		(index_action O6 23)
		(is_action O6)
		(is_typeO O6)
		(start_action O6 "04/01/2017 09:50")
		(end_action O6 "04/01/2017 09:54")
		(duration_action O6 4)
		(parameters_typeO O6 driver1)

		(index_action B8 24)
		(is_action B8)
		(is_typeB B8)
		(start_action B8 "04/01/2017 09:54")
		(end_action B8 "04/01/2017 11:07")
		(duration_action B8 73)
		(parameters_typeB B8 driver1)

		(index_action D12 25)
		(is_action D12)
		(is_typeD D12)
		(start_action D12 "04/01/2017 11:07")
		(end_action D12 "04/01/2017 15:22")
		(duration_action D12 255)
		(parameters_typeD D12 driver1)

		(index_action B9 26)
		(is_action B9)
		(is_typeB B9)
		(start_action B9 "04/01/2017 15:22")
		(end_action B9 "04/01/2017 15:47")
		(duration_action B9 25)
		(parameters_typeB B9 driver1)

		(index_action D13 27)
		(is_action D13)
		(is_typeD D13)
		(start_action D13 "04/01/2017 15:47")
		(end_action D13 "04/01/2017 15:50")
		(duration_action D13 3)
		(parameters_typeD D13 driver1)

		(index_action B10 28)
		(is_action B10)
		(is_typeB B10)
		(start_action B10 "04/01/2017 15:50")
		(end_action B10 "04/01/2017 16:49")
		(duration_action B10 59)
		(parameters_typeB B10 driver1)

		(index_action D14 29)
		(is_action D14)
		(is_typeD D14)
		(start_action D14 "04/01/2017 16:49")
		(end_action D14 "04/01/2017 21:11")
		(duration_action D14 262)
		(parameters_typeD D14 driver1)

		(index_action O7 30)
		(is_action O7)
		(is_typeO O7)
		(start_action O7 "04/01/2017 21:11")
		(end_action O7 "04/01/2017 21:13")
		(duration_action O7 2)
		(parameters_typeO O7 driver1)

		(index_action B11 31)
		(is_action B11)
		(is_typeB B11)
		(start_action B11 "04/01/2017 21:13")
		(end_action B11 "05/01/2017 06:21")
		(duration_action B11 548)
		(parameters_typeB B11 driver1)

		(index_action D15 32)
		(is_action D15)
		(is_typeD D15)
		(start_action D15 "05/01/2017 06:21")
		(end_action D15 "05/01/2017 07:43")
		(duration_action D15 82)
		(parameters_typeD D15 driver1)

		(index_action B12 33)
		(is_action B12)
		(is_typeB B12)
		(start_action B12 "05/01/2017 07:43")
		(end_action B12 "05/01/2017 08:02")
		(duration_action B12 19)
		(parameters_typeB B12 driver1)

		(index_action D16 34)
		(is_action D16)
		(is_typeD D16)
		(start_action D16 "05/01/2017 08:02")
		(end_action D16 "05/01/2017 11:10")
		(duration_action D16 188)
		(parameters_typeD D16 driver1)

		(index_action B13 35)
		(is_action B13)
		(is_typeB B13)
		(start_action B13 "05/01/2017 11:10")
		(end_action B13 "05/01/2017 11:59")
		(duration_action B13 49)
		(parameters_typeB B13 driver1)

		(index_action D17 36)
		(is_action D17)
		(is_typeD D17)
		(start_action D17 "05/01/2017 11:59")
		(end_action D17 "05/01/2017 14:54")
		(duration_action D17 175)
		(parameters_typeD D17 driver1)

		(index_action B14 37)
		(is_action B14)
		(is_typeB B14)
		(start_action B14 "05/01/2017 14:54")
		(end_action B14 "05/01/2017 15:44")
		(duration_action B14 50)
		(parameters_typeB B14 driver1)

		(index_action D18 38)
		(is_action D18)
		(is_typeD D18)
		(start_action D18 "05/01/2017 15:44")
		(end_action D18 "05/01/2017 15:46")
		(duration_action D18 2)
		(parameters_typeD D18 driver1)

		(index_action B15 39)
		(is_action B15)
		(is_typeB B15)
		(start_action B15 "05/01/2017 15:46")
		(end_action B15 "05/01/2017 16:54")
		(duration_action B15 68)
		(parameters_typeB B15 driver1)

		(index_action D19 40)
		(is_action D19)
		(is_typeD D19)
		(start_action D19 "05/01/2017 16:54")
		(end_action D19 "05/01/2017 17:35")
		(duration_action D19 41)
		(parameters_typeD D19 driver1)

		(index_action B16 41)
		(is_action B16)
		(is_typeB B16)
		(start_action B16 "05/01/2017 17:35")
		(end_action B16 "05/01/2017 17:41")
		(duration_action B16 6)
		(parameters_typeB B16 driver1)

		(index_action D20 42)
		(is_action D20)
		(is_typeD D20)
		(start_action D20 "05/01/2017 17:41")
		(end_action D20 "05/01/2017 18:29")
		(duration_action D20 48)
		(parameters_typeD D20 driver1)

		(index_action B17 43)
		(is_action B17)
		(is_typeB B17)
		(start_action B17 "05/01/2017 18:29")
		(end_action B17 "05/01/2017 18:39")
		(duration_action B17 10)
		(parameters_typeB B17 driver1)

		(index_action D21 44)
		(is_action D21)
		(is_typeD D21)
		(start_action D21 "05/01/2017 18:39")
		(end_action D21 "05/01/2017 18:45")
		(duration_action D21 6)
		(parameters_typeD D21 driver1)

		(index_action B18 45)
		(is_action B18)
		(is_typeB B18)
		(start_action B18 "05/01/2017 18:45")
		(end_action B18 "05/01/2017 18:56")
		(duration_action B18 11)
		(parameters_typeB B18 driver1)

		(index_action D22 46)
		(is_action D22)
		(is_typeD D22)
		(start_action D22 "05/01/2017 18:56")
		(end_action D22 "05/01/2017 19:02")
		(duration_action D22 6)
		(parameters_typeD D22 driver1)

		(index_action B19 47)
		(is_action B19)
		(is_typeB B19)
		(start_action B19 "05/01/2017 19:02")
		(end_action B19 "06/01/2017 07:36")
		(duration_action B19 754)
		(parameters_typeB B19 driver1)

		(index_action D23 48)
		(is_action D23)
		(is_typeD D23)
		(start_action D23 "06/01/2017 07:36")
		(end_action D23 "06/01/2017 07:38")
		(duration_action D23 2)
		(parameters_typeD D23 driver1)

		(index_action O8 49)
		(is_action O8)
		(is_typeO O8)
		(start_action O8 "06/01/2017 07:38")
		(end_action O8 "06/01/2017 07:44")
		(duration_action O8 6)
		(parameters_typeO O8 driver1)

		(index_action B20 50)
		(is_action B20)
		(is_typeB B20)
		(start_action B20 "06/01/2017 07:44")
		(end_action B20 "06/01/2017 07:59")
		(duration_action B20 15)
		(parameters_typeB B20 driver1)

		(index_action D24 51)
		(is_action D24)
		(is_typeD D24)
		(start_action D24 "06/01/2017 07:59")
		(end_action D24 "06/01/2017 08:00")
		(duration_action D24 1)
		(parameters_typeD D24 driver1)

		(index_action B21 52)
		(is_action B21)
		(is_typeB B21)
		(start_action B21 "06/01/2017 08:00")
		(end_action B21 "06/01/2017 08:07")
		(duration_action B21 7)
		(parameters_typeB B21 driver1)

		(index_action O9 53)
		(is_action O9)
		(is_typeO O9)
		(start_action O9 "06/01/2017 08:07")
		(end_action O9 "06/01/2017 08:08")
		(duration_action O9 1)
		(parameters_typeO O9 driver1)

		(index_action D25 54)
		(is_action D25)
		(is_typeD D25)
		(start_action D25 "06/01/2017 08:08")
		(end_action D25 "06/01/2017 12:26")
		(duration_action D25 258)
		(parameters_typeD D25 driver1)

		(index_action B22 55)
		(is_action B22)
		(is_typeB B22)
		(start_action B22 "06/01/2017 12:26")
		(end_action B22 "06/01/2017 13:14")
		(duration_action B22 48)
		(parameters_typeB B22 driver1)

		(index_action D26 56)
		(is_action D26)
		(is_typeD D26)
		(start_action D26 "06/01/2017 13:14")
		(end_action D26 "06/01/2017 14:04")
		(duration_action D26 50)
		(parameters_typeD D26 driver1)

		(index_action B23 57)
		(is_action B23)
		(is_typeB B23)
		(start_action B23 "06/01/2017 14:04")
		(end_action B23 "06/01/2017 23:11")
		(duration_action B23 547)
		(parameters_typeB B23 driver1)

		(index_action D27 58)
		(is_action D27)
		(is_typeD D27)
		(start_action D27 "06/01/2017 23:11")
		(end_action D27 "07/01/2017 03:38")
		(duration_action D27 267)
		(parameters_typeD D27 driver1)

		(index_action B24 59)
		(is_action B24)
		(is_typeB B24)
		(start_action B24 "07/01/2017 03:38")
		(end_action B24 "07/01/2017 04:26")
		(duration_action B24 48)
		(parameters_typeB B24 driver1)

		(index_action D28 60)
		(is_action D28)
		(is_typeD D28)
		(start_action D28 "07/01/2017 04:26")
		(end_action D28 "07/01/2017 08:04")
		(duration_action D28 218)
		(parameters_typeD D28 driver1)

		(index_action B25 61)
		(is_action B25)
		(is_typeB B25)
		(start_action B25 "07/01/2017 08:04")
		(end_action B25 "07/01/2017 08:50")
		(duration_action B25 46)
		(parameters_typeB B25 driver1)

		(index_action D29 62)
		(is_action D29)
		(is_typeD D29)
		(start_action D29 "07/01/2017 08:50")
		(end_action D29 "07/01/2017 10:16")
		(duration_action D29 86)
		(parameters_typeD D29 driver1)

		(index_action B26 63)
		(is_action B26)
		(is_typeB B26)
		(start_action B26 "07/01/2017 10:16")
		(end_action B26 "07/01/2017 10:18")
		(duration_action B26 2)
		(parameters_typeB B26 driver1)

		(index_action D30 64)
		(is_action D30)
		(is_typeD D30)
		(start_action D30 "07/01/2017 10:18")
		(end_action D30 "07/01/2017 10:22")
		(duration_action D30 4)
		(parameters_typeD D30 driver1)

		(index_action B27 65)
		(is_action B27)
		(is_typeB B27)
		(start_action B27 "07/01/2017 10:22")
		(end_action B27 "07/01/2017 21:24")
		(duration_action B27 662)
		(parameters_typeB B27 driver1)

		(index_action D31 66)
		(is_action D31)
		(is_typeD D31)
		(start_action D31 "07/01/2017 21:24")
		(end_action D31 "07/01/2017 21:30")
		(duration_action D31 6)
		(parameters_typeD D31 driver1)

		(index_action B28 67)
		(is_action B28)
		(is_typeB B28)
		(start_action B28 "07/01/2017 21:30")
		(end_action B28 "07/01/2017 21:54")
		(duration_action B28 24)
		(parameters_typeB B28 driver1)

		(index_action D32 68)
		(is_action D32)
		(is_typeD D32)
		(start_action D32 "07/01/2017 21:54")
		(end_action D32 "08/01/2017 01:24")
		(duration_action D32 210)
		(parameters_typeD D32 driver1)

		(index_action B29 69)
		(is_action B29)
		(is_typeB B29)
		(start_action B29 "08/01/2017 01:24")
		(end_action B29 "08/01/2017 02:11")
		(duration_action B29 47)
		(parameters_typeB B29 driver1)

		(index_action D33 70)
		(is_action D33)
		(is_typeD D33)
		(start_action D33 "08/01/2017 02:11")
		(end_action D33 "08/01/2017 04:45")
		(duration_action D33 154)
		(parameters_typeD D33 driver1)

		(index_action O10 71)
		(is_action O10)
		(is_typeO O10)
		(start_action O10 "08/01/2017 04:45")
		(end_action O10 "08/01/2017 04:46")
		(duration_action O10 1)
		(parameters_typeO O10 driver1)

		(index_action B30 72)
		(is_action B30)
		(is_typeB B30)
		(start_action B30 "08/01/2017 04:46")
		(end_action B30 "08/01/2017 04:49")
		(duration_action B30 3)
		(parameters_typeB B30 driver1)

		(index_action D34 73)
		(is_action D34)
		(is_typeD D34)
		(start_action D34 "08/01/2017 04:49")
		(end_action D34 "08/01/2017 04:59")
		(duration_action D34 10)
		(parameters_typeD D34 driver1)

		(index_action O11 74)
		(is_action O11)
		(is_typeO O11)
		(start_action O11 "08/01/2017 04:59")
		(end_action O11 "08/01/2017 05:12")
		(duration_action O11 13)
		(parameters_typeO O11 driver1)

		(index_action D35 75)
		(is_action D35)
		(is_typeD D35)
		(start_action D35 "08/01/2017 05:12")
		(end_action D35 "08/01/2017 05:16")
		(duration_action D35 4)
		(parameters_typeD D35 driver1)

		(index_action O12 76)
		(is_action O12)
		(is_typeO O12)
		(start_action O12 "08/01/2017 05:16")
		(end_action O12 "08/01/2017 05:18")
		(duration_action O12 2)
		(parameters_typeO O12 driver1)

		(index_action B31 77)
		(is_action B31)
		(is_typeB B31)
		(start_action B31 "08/01/2017 05:18")
		(end_action B31 "10/01/2017 09:47")
		(duration_action B31 3149)
		(parameters_typeB B31 driver1)

		(index_action D36 78)
		(is_action D36)
		(is_typeD D36)
		(start_action D36 "10/01/2017 09:47")
		(end_action D36 "10/01/2017 09:53")
		(duration_action D36 6)
		(parameters_typeD D36 driver1)

		(index_action O13 79)
		(is_action O13)
		(is_typeO O13)
		(start_action O13 "10/01/2017 09:53")
		(end_action O13 "10/01/2017 09:58")
		(duration_action O13 5)
		(parameters_typeO O13 driver1)

		(index_action D37 80)
		(is_action D37)
		(is_typeD D37)
		(start_action D37 "10/01/2017 09:58")
		(end_action D37 "10/01/2017 10:01")
		(duration_action D37 3)
		(parameters_typeD D37 driver1)

		(index_action I1 81)
		(is_action I1)
		(is_typeI I1)
		(start_action I1 "10/01/2017 10:01")
		(end_action I1 "10/01/2017 10:07")
		(duration_action I1 6)
		(parameters_typeI I1 driver1)

		(index_action D38 82)
		(is_action D38)
		(is_typeD D38)
		(start_action D38 "10/01/2017 10:07")
		(end_action D38 "10/01/2017 10:09")
		(duration_action D38 2)
		(parameters_typeD D38 driver1)

		(index_action O14 83)
		(is_action O14)
		(is_typeO O14)
		(start_action O14 "10/01/2017 10:09")
		(end_action O14 "10/01/2017 10:14")
		(duration_action O14 5)
		(parameters_typeO O14 driver1)

		(index_action B32 84)
		(is_action B32)
		(is_typeB B32)
		(start_action B32 "10/01/2017 10:14")
		(end_action B32 "10/01/2017 11:25")
		(duration_action B32 71)
		(parameters_typeB B32 driver1)

		(index_action D39 85)
		(is_action D39)
		(is_typeD D39)
		(start_action D39 "10/01/2017 11:25")
		(end_action D39 "10/01/2017 11:26")
		(duration_action D39 1)
		(parameters_typeD D39 driver1)

		(index_action I2 86)
		(is_action I2)
		(is_typeI I2)
		(start_action I2 "10/01/2017 11:26")
		(end_action I2 "10/01/2017 11:28")
		(duration_action I2 2)
		(parameters_typeI I2 driver1)

		(index_action D40 87)
		(is_action D40)
		(is_typeD D40)
		(start_action D40 "10/01/2017 11:28")
		(end_action D40 "10/01/2017 11:53")
		(duration_action D40 25)
		(parameters_typeD D40 driver1)

		(index_action B33 88)
		(is_action B33)
		(is_typeB B33)
		(start_action B33 "10/01/2017 11:53")
		(end_action B33 "10/01/2017 12:09")
		(duration_action B33 16)
		(parameters_typeB B33 driver1)

		(index_action D41 89)
		(is_action D41)
		(is_typeD D41)
		(start_action D41 "10/01/2017 12:09")
		(end_action D41 "10/01/2017 12:36")
		(duration_action D41 27)
		(parameters_typeD D41 driver1)

		(index_action B34 90)
		(is_action B34)
		(is_typeB B34)
		(start_action B34 "10/01/2017 12:36")
		(end_action B34 "10/01/2017 12:50")
		(duration_action B34 14)
		(parameters_typeB B34 driver1)

		(index_action O15 91)
		(is_action O15)
		(is_typeO O15)
		(start_action O15 "10/01/2017 12:50")
		(end_action O15 "10/01/2017 12:54")
		(duration_action O15 4)
		(parameters_typeO O15 driver1)

		(index_action B35 92)
		(is_action B35)
		(is_typeB B35)
		(start_action B35 "10/01/2017 12:54")
		(end_action B35 "10/01/2017 13:11")
		(duration_action B35 17)
		(parameters_typeB B35 driver1)

		(index_action D42 93)
		(is_action D42)
		(is_typeD D42)
		(start_action D42 "10/01/2017 13:11")
		(end_action D42 "10/01/2017 13:12")
		(duration_action D42 1)
		(parameters_typeD D42 driver1)

		(index_action B36 94)
		(is_action B36)
		(is_typeB B36)
		(start_action B36 "10/01/2017 13:12")
		(end_action B36 "10/01/2017 13:22")
		(duration_action B36 10)
		(parameters_typeB B36 driver1)

		(index_action O16 95)
		(is_action O16)
		(is_typeO O16)
		(start_action O16 "10/01/2017 13:22")
		(end_action O16 "10/01/2017 13:28")
		(duration_action O16 6)
		(parameters_typeO O16 driver1)

		(index_action D43 96)
		(is_action D43)
		(is_typeD D43)
		(start_action D43 "10/01/2017 13:28")
		(end_action D43 "10/01/2017 13:29")
		(duration_action D43 1)
		(parameters_typeD D43 driver1)

		(index_action O17 97)
		(is_action O17)
		(is_typeO O17)
		(start_action O17 "10/01/2017 13:29")
		(end_action O17 "10/01/2017 13:35")
		(duration_action O17 6)
		(parameters_typeO O17 driver1)

		(index_action D44 98)
		(is_action D44)
		(is_typeD D44)
		(start_action D44 "10/01/2017 13:35")
		(end_action D44 "10/01/2017 13:36")
		(duration_action D44 1)
		(parameters_typeD D44 driver1)

		(index_action B37 99)
		(is_action B37)
		(is_typeB B37)
		(start_action B37 "10/01/2017 13:36")
		(end_action B37 "10/01/2017 13:56")
		(duration_action B37 20)
		(parameters_typeB B37 driver1)

		(index_action D45 100)
		(is_action D45)
		(is_typeD D45)
		(start_action D45 "10/01/2017 13:56")
		(end_action D45 "10/01/2017 13:57")
		(duration_action D45 1)
		(parameters_typeD D45 driver1)

		(index_action O18 101)
		(is_action O18)
		(is_typeO O18)
		(start_action O18 "10/01/2017 13:57")
		(end_action O18 "10/01/2017 13:59")
		(duration_action O18 2)
		(parameters_typeO O18 driver1)

		(index_action B38 102)
		(is_action B38)
		(is_typeB B38)
		(start_action B38 "10/01/2017 13:59")
		(end_action B38 "10/01/2017 14:09")
		(duration_action B38 10)
		(parameters_typeB B38 driver1)

		(index_action D46 103)
		(is_action D46)
		(is_typeD D46)
		(start_action D46 "10/01/2017 14:09")
		(end_action D46 "10/01/2017 14:19")
		(duration_action D46 10)
		(parameters_typeD D46 driver1)

		(index_action B39 104)
		(is_action B39)
		(is_typeB B39)
		(start_action B39 "10/01/2017 14:19")
		(end_action B39 "10/01/2017 17:00")
		(duration_action B39 161)
		(parameters_typeB B39 driver1)

		(index_action D47 105)
		(is_action D47)
		(is_typeD D47)
		(start_action D47 "10/01/2017 17:00")
		(end_action D47 "10/01/2017 17:34")
		(duration_action D47 34)
		(parameters_typeD D47 driver1)

		(index_action O19 106)
		(is_action O19)
		(is_typeO O19)
		(start_action O19 "10/01/2017 17:34")
		(end_action O19 "10/01/2017 17:36")
		(duration_action O19 2)
		(parameters_typeO O19 driver1)

		(index_action D48 107)
		(is_action D48)
		(is_typeD D48)
		(start_action D48 "10/01/2017 17:36")
		(end_action D48 "10/01/2017 17:50")
		(duration_action D48 14)
		(parameters_typeD D48 driver1)

		(index_action O20 108)
		(is_action O20)
		(is_typeO O20)
		(start_action O20 "10/01/2017 17:50")
		(end_action O20 "10/01/2017 18:01")
		(duration_action O20 11)
		(parameters_typeO O20 driver1)

		(index_action D49 109)
		(is_action D49)
		(is_typeD D49)
		(start_action D49 "10/01/2017 18:01")
		(end_action D49 "10/01/2017 18:03")
		(duration_action D49 2)
		(parameters_typeD D49 driver1)

		(index_action O21 110)
		(is_action O21)
		(is_typeO O21)
		(start_action O21 "10/01/2017 18:03")
		(end_action O21 "10/01/2017 18:04")
		(duration_action O21 1)
		(parameters_typeO O21 driver1)

		(index_action B40 111)
		(is_action B40)
		(is_typeB B40)
		(start_action B40 "10/01/2017 18:04")
		(end_action B40 "10/01/2017 18:06")
		(duration_action B40 2)
		(parameters_typeB B40 driver1)

		(index_action D50 112)
		(is_action D50)
		(is_typeD D50)
		(start_action D50 "10/01/2017 18:06")
		(end_action D50 "10/01/2017 18:09")
		(duration_action D50 3)
		(parameters_typeD D50 driver1)

		(index_action O22 113)
		(is_action O22)
		(is_typeO O22)
		(start_action O22 "10/01/2017 18:09")
		(end_action O22 "10/01/2017 18:10")
		(duration_action O22 1)
		(parameters_typeO O22 driver1)

		(index_action B41 114)
		(is_action B41)
		(is_typeB B41)
		(start_action B41 "10/01/2017 18:10")
		(end_action B41 "11/01/2017 17:19")
		(duration_action B41 1389)
		(parameters_typeB B41 driver1)

		(index_action D51 115)
		(is_action D51)
		(is_typeD D51)
		(start_action D51 "11/01/2017 17:19")
		(end_action D51 "11/01/2017 17:24")
		(duration_action D51 5)
		(parameters_typeD D51 driver1)

		(index_action B42 116)
		(is_action B42)
		(is_typeB B42)
		(start_action B42 "11/01/2017 17:24")
		(end_action B42 "11/01/2017 17:41")
		(duration_action B42 17)
		(parameters_typeB B42 driver1)

		(index_action D52 117)
		(is_action D52)
		(is_typeD D52)
		(start_action D52 "11/01/2017 17:41")
		(end_action D52 "11/01/2017 17:46")
		(duration_action D52 5)
		(parameters_typeD D52 driver1)

		(index_action B43 118)
		(is_action B43)
		(is_typeB B43)
		(start_action B43 "11/01/2017 17:46")
		(end_action B43 "11/01/2017 20:49")
		(duration_action B43 183)
		(parameters_typeB B43 driver1)

		(index_action D53 119)
		(is_action D53)
		(is_typeD D53)
		(start_action D53 "11/01/2017 20:49")
		(end_action D53 "11/01/2017 20:50")
		(duration_action D53 1)
		(parameters_typeD D53 driver1)

		(index_action O23 120)
		(is_action O23)
		(is_typeO O23)
		(start_action O23 "11/01/2017 20:50")
		(end_action O23 "11/01/2017 20:52")
		(duration_action O23 2)
		(parameters_typeO O23 driver1)

		(index_action D54 121)
		(is_action D54)
		(is_typeD D54)
		(start_action D54 "11/01/2017 20:52")
		(end_action D54 "11/01/2017 23:06")
		(duration_action D54 134)
		(parameters_typeD D54 driver1)

		(index_action B44 122)
		(is_action B44)
		(is_typeB B44)
		(start_action B44 "11/01/2017 23:06")
		(end_action B44 "12/01/2017 00:00")
		(duration_action B44 54)
		(parameters_typeB B44 driver1)

		(index_action D55 123)
		(is_action D55)
		(is_typeD D55)
		(start_action D55 "12/01/2017 00:00")
		(end_action D55 "12/01/2017 03:00")
		(duration_action D55 180)
		(parameters_typeD D55 driver1)

		(index_action O24 124)
		(is_action O24)
		(is_typeO O24)
		(start_action O24 "12/01/2017 03:00")
		(end_action O24 "12/01/2017 03:02")
		(duration_action O24 2)
		(parameters_typeO O24 driver1)

		(index_action D56 125)
		(is_action D56)
		(is_typeD D56)
		(start_action D56 "12/01/2017 03:02")
		(end_action D56 "12/01/2017 03:03")
		(duration_action D56 1)
		(parameters_typeD D56 driver1)

		(index_action O25 126)
		(is_action O25)
		(is_typeO O25)
		(start_action O25 "12/01/2017 03:03")
		(end_action O25 "12/01/2017 03:06")
		(duration_action O25 3)
		(parameters_typeO O25 driver1)

		(index_action D57 127)
		(is_action D57)
		(is_typeD D57)
		(start_action D57 "12/01/2017 03:06")
		(end_action D57 "12/01/2017 03:13")
		(duration_action D57 7)
		(parameters_typeD D57 driver1)

		(index_action O26 128)
		(is_action O26)
		(is_typeO O26)
		(start_action O26 "12/01/2017 03:13")
		(end_action O26 "12/01/2017 03:17")
		(duration_action O26 4)
		(parameters_typeO O26 driver1)

		(index_action B45 129)
		(is_action B45)
		(is_typeB B45)
		(start_action B45 "12/01/2017 03:17")
		(end_action B45 "12/01/2017 06:30")
		(duration_action B45 193)
		(parameters_typeB B45 driver1)

		(index_action D58 130)
		(is_action D58)
		(is_typeD D58)
		(start_action D58 "12/01/2017 06:30")
		(end_action D58 "12/01/2017 06:33")
		(duration_action D58 3)
		(parameters_typeD D58 driver1)

		(index_action B46 131)
		(is_action B46)
		(is_typeB B46)
		(start_action B46 "12/01/2017 06:33")
		(end_action B46 "14/01/2017 12:02")
		(duration_action B46 3209)
		(parameters_typeB B46 driver1)

		(index_action D59 132)
		(is_action D59)
		(is_typeD D59)
		(start_action D59 "14/01/2017 12:02")
		(end_action D59 "14/01/2017 13:04")
		(duration_action D59 62)
		(parameters_typeD D59 driver1)

		(index_action B47 133)
		(is_action B47)
		(is_typeB B47)
		(start_action B47 "14/01/2017 13:04")
		(end_action B47 "14/01/2017 14:51")
		(duration_action B47 107)
		(parameters_typeB B47 driver1)

		(index_action D60 134)
		(is_action D60)
		(is_typeD D60)
		(start_action D60 "14/01/2017 14:51")
		(end_action D60 "14/01/2017 15:58")
		(duration_action D60 67)
		(parameters_typeD D60 driver1)

		(index_action B48 135)
		(is_action B48)
		(is_typeB B48)
		(start_action B48 "14/01/2017 15:58")
		(end_action B48 "15/01/2017 11:56")
		(duration_action B48 1198)
		(parameters_typeB B48 driver1)

		(index_action D61 136)
		(is_action D61)
		(is_typeD D61)
		(start_action D61 "15/01/2017 11:56")
		(end_action D61 "15/01/2017 12:00")
		(duration_action D61 4)
		(parameters_typeD D61 driver1)

		(index_action B49 137)
		(is_action B49)
		(is_typeB B49)
		(start_action B49 "15/01/2017 12:00")
		(end_action B49 "15/01/2017 12:04")
		(duration_action B49 4)
		(parameters_typeB B49 driver1)

		(index_action D62 138)
		(is_action D62)
		(is_typeD D62)
		(start_action D62 "15/01/2017 12:04")
		(end_action D62 "15/01/2017 12:05")
		(duration_action D62 1)
		(parameters_typeD D62 driver1)

		(index_action O27 139)
		(is_action O27)
		(is_typeO O27)
		(start_action O27 "15/01/2017 12:05")
		(end_action O27 "15/01/2017 12:08")
		(duration_action O27 3)
		(parameters_typeO O27 driver1)

		(index_action B50 140)
		(is_action B50)
		(is_typeB B50)
		(start_action B50 "15/01/2017 12:08")
		(end_action B50 "15/01/2017 14:16")
		(duration_action B50 128)
		(parameters_typeB B50 driver1)

		(index_action D63 141)
		(is_action D63)
		(is_typeD D63)
		(start_action D63 "15/01/2017 14:16")
		(end_action D63 "15/01/2017 14:19")
		(duration_action D63 3)
		(parameters_typeD D63 driver1)

		(index_action B51 142)
		(is_action B51)
		(is_typeB B51)
		(start_action B51 "15/01/2017 14:19")
		(end_action B51 "15/01/2017 14:25")
		(duration_action B51 6)
		(parameters_typeB B51 driver1)

		(index_action O28 143)
		(is_action O28)
		(is_typeO O28)
		(start_action O28 "15/01/2017 14:25")
		(end_action O28 "15/01/2017 14:28")
		(duration_action O28 3)
		(parameters_typeO O28 driver1)

		(index_action D64 144)
		(is_action D64)
		(is_typeD D64)
		(start_action D64 "15/01/2017 14:28")
		(end_action D64 "15/01/2017 14:29")
		(duration_action D64 1)
		(parameters_typeD D64 driver1)

		(index_action B52 145)
		(is_action B52)
		(is_typeB B52)
		(start_action B52 "15/01/2017 14:29")
		(end_action B52 "15/01/2017 14:39")
		(duration_action B52 10)
		(parameters_typeB B52 driver1)

		(index_action D65 146)
		(is_action D65)
		(is_typeD D65)
		(start_action D65 "15/01/2017 14:39")
		(end_action D65 "15/01/2017 14:55")
		(duration_action D65 16)
		(parameters_typeD D65 driver1)

		(index_action B53 147)
		(is_action B53)
		(is_typeB B53)
		(start_action B53 "15/01/2017 14:55")
		(end_action B53 "15/01/2017 15:21")
		(duration_action B53 26)
		(parameters_typeB B53 driver1)

		(index_action D66 148)
		(is_action D66)
		(is_typeD D66)
		(start_action D66 "15/01/2017 15:21")
		(end_action D66 "15/01/2017 19:16")
		(duration_action D66 235)
		(parameters_typeD D66 driver1)

		(index_action B54 149)
		(is_action B54)
		(is_typeB B54)
		(start_action B54 "15/01/2017 19:16")
		(end_action B54 "15/01/2017 19:48")
		(duration_action B54 32)
		(parameters_typeB B54 driver1)

		(index_action D67 150)
		(is_action D67)
		(is_typeD D67)
		(start_action D67 "15/01/2017 19:48")
		(end_action D67 "15/01/2017 21:48")
		(duration_action D67 120)
		(parameters_typeD D67 driver1)

		(index_action B55 151)
		(is_action B55)
		(is_typeB B55)
		(start_action B55 "15/01/2017 21:48")
		(end_action B55 "15/01/2017 22:23")
		(duration_action B55 35)
		(parameters_typeB B55 driver1)

		(index_action D68 152)
		(is_action D68)
		(is_typeD D68)
		(start_action D68 "15/01/2017 22:23")
		(end_action D68 "16/01/2017 00:24")
		(duration_action D68 121)
		(parameters_typeD D68 driver1)

		(= (distance almeria barcelona) 809)
		(= (distance almeria bilbao) 958)
		(= (distance almeria cadiz) 463)
		(= (distance almeria cordoba) 316)
		(= (distance almeria gibraltar) 339)
		(= (distance almeria granada) 162)
		(= (distance almeria huelva) 505)
		(= (distance almeria jaen) 220)
		(= (distance almeria madrid) 547)
		(= (distance almeria malaga) 207)
		(= (distance almeria sevilla) 410)

		(= (distance barcelona almeria) 809)
		(= (distance barcelona bilbao) 620)
		(= (distance barcelona cadiz) 1284)
		(= (distance barcelona cordoba) 908)
		(= (distance barcelona gibraltar) 1124)
		(= (distance barcelona granada) 868)
		(= (distance barcelona huelva) 1140)
		(= (distance barcelona jaen) 804)
		(= (distance barcelona madrid) 621)
		(= (distance barcelona malaga) 997)
		(= (distance barcelona sevilla) 1046)

		(= (distance bilbao almeria) 958)
		(= (distance bilbao barcelona) 620)
		(= (distance bilbao cadiz) 1058)
		(= (distance bilbao cordoba) 796)
		(= (distance bilbao gibraltar) 1110)
		(= (distance bilbao granada) 829)
		(= (distance bilbao huelva) 939)
		(= (distance bilbao jaen) 730)
		(= (distance bilbao madrid) 395)
		(= (distance bilbao malaga) 939)
		(= (distance bilbao sevilla) 933)

		(= (distance cadiz almeria) 463)
		(= (distance cadiz barcelona) 1284)
		(= (distance cadiz bilbao) 1058)
		(= (distance cadiz cordoba) 261)
		(= (distance cadiz gibraltar) 124)
		(= (distance cadiz granada) 296)
		(= (distance cadiz huelva) 214)
		(= (distance cadiz jaen) 330)
		(= (distance cadiz madrid) 654)
		(= (distance cadiz malaga) 240)
		(= (distance cadiz sevilla) 126)

		(= (distance cordoba almeria) 809)
		(= (distance cordoba barcelona) 908)
		(= (distance cordoba bilbao) 796)
		(= (distance cordoba cadiz) 261)
		(= (distance cordoba gibraltar) 294)
		(= (distance cordoba granada) 160)
		(= (distance cordoba huelva) 241)
		(= (distance cordoba jaen) 108)
		(= (distance cordoba madrid) 396)
		(= (distance cordoba malaga) 165)
		(= (distance cordoba sevilla) 143)

		(= (distance gibraltar almeria) 339)
		(= (distance gibraltar barcelona) 1124)
		(= (distance gibraltar bilbao) 1110)
		(= (distance gibraltar cadiz) 124)
		(= (distance gibraltar cordoba) 294)
		(= (distance gibraltar granada) 255)
		(= (distance gibraltar huelva) 289)
		(= (distance gibraltar jaen) 335)
		(= (distance gibraltar madrid) 662)
		(= (distance gibraltar malaga) 134)
		(= (distance gibraltar sevilla) 201)

		(= (distance granada almeria) 162)
		(= (distance granada barcelona) 868)
		(= (distance granada bilbao) 829)
		(= (distance granada cadiz) 296)
		(= (distance granada cordoba) 160)
		(= (distance granada gibraltar) 255)
		(= (distance granada huelva) 346)
		(= (distance granada jaen) 93)
		(= (distance granada madrid) 421)
		(= (distance granada malaga) 125)
		(= (distance granada sevilla) 252)

		(= (distance huelva almeria) 505)
		(= (distance huelva barcelona) 1140)
		(= (distance huelva bilbao) 929)
		(= (distance huelva cadiz) 214)
		(= (distance huelva cordoba) 241)
		(= (distance huelva gibraltar) 289)
		(= (distance huelva granada) 346)
		(= (distance huelva jaen) 347)
		(= (distance huelva madrid) 591)
		(= (distance huelva malaga) 301)
		(= (distance huelva sevilla) 95)

		(= (distance jaen almeria) 220)
		(= (distance jaen barcelona) 804)
		(= (distance jaen bilbao) 730)
		(= (distance jaen cadiz) 330)
		(= (distance jaen cordoba) 108)
		(= (distance jaen gibraltar) 335)
		(= (distance jaen granada) 93)
		(= (distance jaen huelva) 347)
		(= (distance jaen madrid) 335)
		(= (distance jaen malaga) 203)
		(= (distance jaen sevilla) 246)

		(= (distance madrid almeria) 547)
		(= (distance madrid barcelona) 621)
		(= (distance madrid bilbao) 395)
		(= (distance madrid cadiz) 654)
		(= (distance madrid cordoba) 396)
		(= (distance madrid gibraltar) 662)
		(= (distance madrid granada) 421)
		(= (distance madrid huelva) 591)
		(= (distance madrid jaen) 335)
		(= (distance madrid malaga) 532)
		(= (distance madrid sevilla) 534)

		(= (distance malaga almeria) 207)
		(= (distance malaga barcelona) 997)
		(= (distance malaga bilbao) 939)
		(= (distance malaga cadiz) 240)
		(= (distance malaga cordoba) 165)
		(= (distance malaga gibraltar) 134)
		(= (distance malaga granada) 125)
		(= (distance malaga huelva) 301)
		(= (distance malaga jaen) 203)
		(= (distance malaga madrid) 532)
		(= (distance malaga sevilla) 209)

		(= (distance sevilla almeria) 410)
		(= (distance sevilla barcelona) 1046)
		(= (distance sevilla bilbao) 933)
		(= (distance sevilla cadiz) 126)
		(= (distance sevilla cordoba) 143)
		(= (distance sevilla gibraltar) 201)
		(= (distance sevilla granada) 252)
		(= (distance sevilla huelva) 95)
		(= (distance sevilla jaen) 246)
		(= (distance sevilla madrid) 534)
		(= (distance sevilla malaga) 209) ;km
		
		(= (actual-fuel driver1) 50) ; l
		(= (total-fuel-used driver1) 0) ; l
		(= (fuel-consumption-rate driver1) 0.35) ; l/km
		(= (fuel-limit driver1) 1500) ; l
		(= (speed driver1) 100) ; km/h
		; (= (speed driver1) 40) ; km/h

		(= (remaining_transport_dt) 0)

		(at driver1 sevilla)
		(at box1 sevilla)
		(at box2 sevilla)
		(at box3 sevilla)
		
		(= (load driver1) 0)
		(= (max-load driver1) 15)

		(destination box2 almeria)
		(destination box1 barcelona)
		(destination box3 bilbao)

		(= (weight box1) 2)
		(= (weight box2) 3)
		(= (weight box3) 7)
	)
	(:tasks-goal
		:tasks (
			(WD driver1)
		)
	)
)