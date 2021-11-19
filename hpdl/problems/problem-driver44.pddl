(define (problem prueba0) (:domain GantaBi)
	(:customization
		(= :time-format "%d/%m/%Y %H:%M")
		(= :time-horizon-relative 86400) ;; que son los minutos que tienen 2 meses
		(= :time-start "01/01/2017 00:00")
		(= :time-unit :minutes)
	)
	(:objects
		driver44 - Driver

		D3111 D3112 D3113 D3114 D3115 D3116 D3117 D3118 D3119 D3120 D3121 D3122 D3123 D3124 D3125 D3126 D3127 D3128
 - TaskInstanceSymbol
		O1797 O1798 O1799 O1800 O1801 O1802 O1803 O1804 O1805 O1806 O1807 O1808 O1809 O1810 O1811 O1812 O1813 O1814
 - TaskInstanceSymbol
		B2340 B2341 B2342 B2343 B2344 B2345 B2346 B2347 B2348 B2349 B2350 B2351 B2352 B2353 B2354
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

		(= (current_index_action) 7260)

		(= (last_dr) "03/01/2017 13:53")
		(= (last_wr) "03/01/2017 13:53")
		(= (actual-timestamp) "03/01/2017 13:53")

		; Events
		(index_action B2340 7260)
		(is_action B2340)
		(is_typeB B2340)
		(start_action B2340 "03/01/2017 13:53")
		(end_action B2340 "03/01/2017 13:56")
		(duration_action B2340 3)
		(parameters_typeB B2340 driver44)

		(index_action O1797 7261)
		(is_action O1797)
		(is_typeO O1797)
		(start_action O1797 "03/01/2017 13:56")
		(end_action O1797 "03/01/2017 14:01")
		(duration_action O1797 5)
		(parameters_typeO O1797 driver44)

		(index_action D3111 7262)
		(is_action D3111)
		(is_typeD D3111)
		(start_action D3111 "03/01/2017 14:01")
		(end_action D3111 "03/01/2017 14:03")
		(duration_action D3111 2)
		(parameters_typeD D3111 driver44)

		(index_action O1798 7263)
		(is_action O1798)
		(is_typeO O1798)
		(start_action O1798 "03/01/2017 14:03")
		(end_action O1798 "03/01/2017 14:05")
		(duration_action O1798 2)
		(parameters_typeO O1798 driver44)

		(index_action D3112 7264)
		(is_action D3112)
		(is_typeD D3112)
		(start_action D3112 "03/01/2017 14:05")
		(end_action D3112 "03/01/2017 14:07")
		(duration_action D3112 2)
		(parameters_typeD D3112 driver44)

		(index_action O1799 7265)
		(is_action O1799)
		(is_typeO O1799)
		(start_action O1799 "03/01/2017 14:07")
		(end_action O1799 "03/01/2017 14:09")
		(duration_action O1799 2)
		(parameters_typeO O1799 driver44)

		(index_action B2341 7266)
		(is_action B2341)
		(is_typeB B2341)
		(start_action B2341 "03/01/2017 14:09")
		(end_action B2341 "03/01/2017 14:32")
		(duration_action B2341 23)
		(parameters_typeB B2341 driver44)

		(index_action D3113 7267)
		(is_action D3113)
		(is_typeD D3113)
		(start_action D3113 "03/01/2017 14:32")
		(end_action D3113 "03/01/2017 14:33")
		(duration_action D3113 1)
		(parameters_typeD D3113 driver44)

		(index_action O1800 7268)
		(is_action O1800)
		(is_typeO O1800)
		(start_action O1800 "03/01/2017 14:33")
		(end_action O1800 "03/01/2017 14:36")
		(duration_action O1800 3)
		(parameters_typeO O1800 driver44)

		(index_action B2342 7269)
		(is_action B2342)
		(is_typeB B2342)
		(start_action B2342 "03/01/2017 14:36")
		(end_action B2342 "03/01/2017 14:43")
		(duration_action B2342 7)
		(parameters_typeB B2342 driver44)

		(index_action O1801 7270)
		(is_action O1801)
		(is_typeO O1801)
		(start_action O1801 "03/01/2017 14:43")
		(end_action O1801 "03/01/2017 14:46")
		(duration_action O1801 3)
		(parameters_typeO O1801 driver44)

		(index_action B2343 7271)
		(is_action B2343)
		(is_typeB B2343)
		(start_action B2343 "03/01/2017 14:46")
		(end_action B2343 "03/01/2017 14:53")
		(duration_action B2343 7)
		(parameters_typeB B2343 driver44)

		(index_action D3114 7272)
		(is_action D3114)
		(is_typeD D3114)
		(start_action D3114 "03/01/2017 14:53")
		(end_action D3114 "03/01/2017 14:54")
		(duration_action D3114 1)
		(parameters_typeD D3114 driver44)

		(index_action O1802 7273)
		(is_action O1802)
		(is_typeO O1802)
		(start_action O1802 "03/01/2017 14:54")
		(end_action O1802 "03/01/2017 14:56")
		(duration_action O1802 2)
		(parameters_typeO O1802 driver44)

		(index_action B2344 7274)
		(is_action B2344)
		(is_typeB B2344)
		(start_action B2344 "03/01/2017 14:56")
		(end_action B2344 "03/01/2017 14:59")
		(duration_action B2344 3)
		(parameters_typeB B2344 driver44)

		(index_action O1803 7275)
		(is_action O1803)
		(is_typeO O1803)
		(start_action O1803 "03/01/2017 14:59")
		(end_action O1803 "03/01/2017 15:11")
		(duration_action O1803 12)
		(parameters_typeO O1803 driver44)

		(index_action D3115 7276)
		(is_action D3115)
		(is_typeD D3115)
		(start_action D3115 "03/01/2017 15:11")
		(end_action D3115 "03/01/2017 15:12")
		(duration_action D3115 1)
		(parameters_typeD D3115 driver44)

		(index_action B2345 7277)
		(is_action B2345)
		(is_typeB B2345)
		(start_action B2345 "03/01/2017 15:12")
		(end_action B2345 "03/01/2017 15:16")
		(duration_action B2345 4)
		(parameters_typeB B2345 driver44)

		(index_action D3116 7278)
		(is_action D3116)
		(is_typeD D3116)
		(start_action D3116 "03/01/2017 15:16")
		(end_action D3116 "03/01/2017 15:20")
		(duration_action D3116 4)
		(parameters_typeD D3116 driver44)

		(index_action O1804 7279)
		(is_action O1804)
		(is_typeO O1804)
		(start_action O1804 "03/01/2017 15:20")
		(end_action O1804 "03/01/2017 15:25")
		(duration_action O1804 5)
		(parameters_typeO O1804 driver44)

		(index_action D3117 7280)
		(is_action D3117)
		(is_typeD D3117)
		(start_action D3117 "03/01/2017 15:25")
		(end_action D3117 "03/01/2017 15:26")
		(duration_action D3117 1)
		(parameters_typeD D3117 driver44)

		(index_action B2346 7281)
		(is_action B2346)
		(is_typeB B2346)
		(start_action B2346 "03/01/2017 16:23")
		(end_action B2346 "03/01/2017 16:47")
		(duration_action B2346 24)
		(parameters_typeB B2346 driver44)

		(index_action B2347 7282)
		(is_action B2347)
		(is_typeB B2347)
		(start_action B2347 "10/01/2017 13:58")
		(end_action B2347 "10/01/2017 14:00")
		(duration_action B2347 2)
		(parameters_typeB B2347 driver44)

		(index_action D3118 7283)
		(is_action D3118)
		(is_typeD D3118)
		(start_action D3118 "10/01/2017 14:00")
		(end_action D3118 "10/01/2017 14:01")
		(duration_action D3118 1)
		(parameters_typeD D3118 driver44)

		(index_action O1805 7284)
		(is_action O1805)
		(is_typeO O1805)
		(start_action O1805 "10/01/2017 14:01")
		(end_action O1805 "10/01/2017 14:04")
		(duration_action O1805 3)
		(parameters_typeO O1805 driver44)

		(index_action B2348 7285)
		(is_action B2348)
		(is_typeB B2348)
		(start_action B2348 "10/01/2017 14:04")
		(end_action B2348 "10/01/2017 14:41")
		(duration_action B2348 37)
		(parameters_typeB B2348 driver44)

		(index_action D3119 7286)
		(is_action D3119)
		(is_typeD D3119)
		(start_action D3119 "10/01/2017 14:41")
		(end_action D3119 "10/01/2017 14:43")
		(duration_action D3119 2)
		(parameters_typeD D3119 driver44)

		(index_action B2349 7287)
		(is_action B2349)
		(is_typeB B2349)
		(start_action B2349 "10/01/2017 14:43")
		(end_action B2349 "10/01/2017 14:58")
		(duration_action B2349 15)
		(parameters_typeB B2349 driver44)

		(index_action O1806 7288)
		(is_action O1806)
		(is_typeO O1806)
		(start_action O1806 "10/01/2017 14:58")
		(end_action O1806 "10/01/2017 14:59")
		(duration_action O1806 1)
		(parameters_typeO O1806 driver44)

		(index_action D3120 7289)
		(is_action D3120)
		(is_typeD D3120)
		(start_action D3120 "10/01/2017 14:59")
		(end_action D3120 "10/01/2017 15:01")
		(duration_action D3120 2)
		(parameters_typeD D3120 driver44)

		(index_action O1807 7290)
		(is_action O1807)
		(is_typeO O1807)
		(start_action O1807 "10/01/2017 15:01")
		(end_action O1807 "10/01/2017 15:04")
		(duration_action O1807 3)
		(parameters_typeO O1807 driver44)

		(index_action D3121 7291)
		(is_action D3121)
		(is_typeD D3121)
		(start_action D3121 "10/01/2017 15:04")
		(end_action D3121 "10/01/2017 15:05")
		(duration_action D3121 1)
		(parameters_typeD D3121 driver44)

		(index_action O1808 7292)
		(is_action O1808)
		(is_typeO O1808)
		(start_action O1808 "10/01/2017 15:11")
		(end_action O1808 "10/01/2017 15:14")
		(duration_action O1808 3)
		(parameters_typeO O1808 driver44)

		(index_action B2350 7293)
		(is_action B2350)
		(is_typeB B2350)
		(start_action B2350 "10/01/2017 15:14")
		(end_action B2350 "10/01/2017 17:52")
		(duration_action B2350 158)
		(parameters_typeB B2350 driver44)

		(index_action D3122 7294)
		(is_action D3122)
		(is_typeD D3122)
		(start_action D3122 "10/01/2017 17:52")
		(end_action D3122 "10/01/2017 17:54")
		(duration_action D3122 2)
		(parameters_typeD D3122 driver44)

		(index_action B2351 7295)
		(is_action B2351)
		(is_typeB B2351)
		(start_action B2351 "10/01/2017 17:54")
		(end_action B2351 "10/01/2017 19:02")
		(duration_action B2351 68)
		(parameters_typeB B2351 driver44)

		(index_action O1809 7296)
		(is_action O1809)
		(is_typeO O1809)
		(start_action O1809 "10/01/2017 19:02")
		(end_action O1809 "10/01/2017 19:08")
		(duration_action O1809 6)
		(parameters_typeO O1809 driver44)

		(index_action B2352 7297)
		(is_action B2352)
		(is_typeB B2352)
		(start_action B2352 "10/01/2017 19:08")
		(end_action B2352 "10/01/2017 19:12")
		(duration_action B2352 4)
		(parameters_typeB B2352 driver44)

		(index_action D3123 7298)
		(is_action D3123)
		(is_typeD D3123)
		(start_action D3123 "10/01/2017 19:12")
		(end_action D3123 "10/01/2017 19:13")
		(duration_action D3123 1)
		(parameters_typeD D3123 driver44)

		(index_action B2353 7299)
		(is_action B2353)
		(is_typeB B2353)
		(start_action B2353 "10/01/2017 19:13")
		(end_action B2353 "10/01/2017 19:23")
		(duration_action B2353 10)
		(parameters_typeB B2353 driver44)

		(index_action D3124 7300)
		(is_action D3124)
		(is_typeD D3124)
		(start_action D3124 "10/01/2017 19:23")
		(end_action D3124 "10/01/2017 19:25")
		(duration_action D3124 2)
		(parameters_typeD D3124 driver44)

		(index_action B2354 7301)
		(is_action B2354)
		(is_typeB B2354)
		(start_action B2354 "10/01/2017 19:25")
		(end_action B2354 "10/01/2017 19:32")
		(duration_action B2354 7)
		(parameters_typeB B2354 driver44)

		(index_action O1810 7302)
		(is_action O1810)
		(is_typeO O1810)
		(start_action O1810 "11/01/2017 16:05")
		(end_action O1810 "11/01/2017 16:09")
		(duration_action O1810 4)
		(parameters_typeO O1810 driver44)

		(index_action D3125 7303)
		(is_action D3125)
		(is_typeD D3125)
		(start_action D3125 "11/01/2017 16:09")
		(end_action D3125 "11/01/2017 16:11")
		(duration_action D3125 2)
		(parameters_typeD D3125 driver44)

		(index_action O1811 7304)
		(is_action O1811)
		(is_typeO O1811)
		(start_action O1811 "11/01/2017 16:11")
		(end_action O1811 "11/01/2017 16:15")
		(duration_action O1811 4)
		(parameters_typeO O1811 driver44)

		(index_action D3126 7305)
		(is_action D3126)
		(is_typeD D3126)
		(start_action D3126 "11/01/2017 16:15")
		(end_action D3126 "11/01/2017 16:19")
		(duration_action D3126 4)
		(parameters_typeD D3126 driver44)

		(index_action O1812 7306)
		(is_action O1812)
		(is_typeO O1812)
		(start_action O1812 "11/01/2017 16:19")
		(end_action O1812 "11/01/2017 16:23")
		(duration_action O1812 4)
		(parameters_typeO O1812 driver44)

		(index_action D3127 7307)
		(is_action D3127)
		(is_typeD D3127)
		(start_action D3127 "13/01/2017 09:48")
		(end_action D3127 "13/01/2017 09:51")
		(duration_action D3127 3)
		(parameters_typeD D3127 driver44)

		(index_action O1813 7308)
		(is_action O1813)
		(is_typeO O1813)
		(start_action O1813 "13/01/2017 09:51")
		(end_action O1813 "13/01/2017 09:53")
		(duration_action O1813 2)
		(parameters_typeO O1813 driver44)

		(index_action D3128 7309)
		(is_action D3128)
		(is_typeD D3128)
		(start_action D3128 "13/01/2017 09:53")
		(end_action D3128 "13/01/2017 09:54")
		(duration_action D3128 1)
		(parameters_typeD D3128 driver44)

		(index_action O1814 7310)
		(is_action O1814)
		(is_typeO O1814)
		(start_action O1814 "13/01/2017 09:54")
		(end_action O1814 "13/01/2017 09:55")
		(duration_action O1814 1)
		(parameters_typeO O1814 driver44)

	)
	(:tasks-goal
		:tasks (
			(WD driver44)
		)
	)
)