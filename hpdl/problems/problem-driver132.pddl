(define (problem prueba0) (:domain GantaBi)
	(:customization
		(= :time-format "%d/%m/%Y %H:%M")
		(= :time-horizon-relative 86400) ;; que son los minutos que tienen 2 meses
		(= :time-start "01/01/2017 00:00")
		(= :time-unit :minutes)
	)
	(:objects
		driver132 - Driver

		D8289 D8290 D8291 D8292 D8293 D8294 D8295 D8296 D8297 D8298 D8299 D8300 D8301 D8302 D8303 D8304 D8305 D8306 D8307 D8308 D8309 D8310 D8311 D8312 D8313 D8314 D8315 D8316 D8317 D8318 D8319 D8320 D8321 D8322 D8323 D8324 D8325 D8326 D8327 D8328 D8329 D8330 D8331 D8332
 - TaskInstanceSymbol
		O4787 O4788 O4789 O4790 O4791 O4792 O4793 O4794 O4795 O4796 O4797 O4798 O4799 O4800 O4801 O4802 O4803 O4804 O4805 O4806 O4807 O4808 O4809
 - TaskInstanceSymbol
		B6974 B6975 B6976 B6977 B6978 B6979 B6980 B6981 B6982 B6983 B6984 B6985 B6986 B6987 B6988 B6989 B6990 B6991 B6992 B6993 B6994 B6995 B6996 B6997 B6998 B6999 B7000 B7001 B7002 B7003 B7004 B7005 B7006 B7007 B7008 B7009
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

		(= (current_index_action) 20496)

		(= (last_dr) "08/01/2017 11:01")
		(= (last_wr) "08/01/2017 11:01")
		(= (actual-timestamp) "08/01/2017 11:01")

		; Events
		(index_action B6974 20496)
		(is_action B6974)
		(is_typeB B6974)
		(start_action B6974 "08/01/2017 11:01")
		(end_action B6974 "08/01/2017 18:27")
		(duration_action B6974 446)
		(parameters_typeB B6974 driver132)

		(index_action O4787 20497)
		(is_action O4787)
		(is_typeO O4787)
		(start_action O4787 "08/01/2017 18:27")
		(end_action O4787 "08/01/2017 18:42")
		(duration_action O4787 15)
		(parameters_typeO O4787 driver132)

		(index_action B6975 20498)
		(is_action B6975)
		(is_typeB B6975)
		(start_action B6975 "08/01/2017 18:42")
		(end_action B6975 "08/01/2017 18:58")
		(duration_action B6975 16)
		(parameters_typeB B6975 driver132)

		(index_action D8289 20499)
		(is_action D8289)
		(is_typeD D8289)
		(start_action D8289 "08/01/2017 18:58")
		(end_action D8289 "08/01/2017 21:11")
		(duration_action D8289 133)
		(parameters_typeD D8289 driver132)

		(index_action O4788 20500)
		(is_action O4788)
		(is_typeO O4788)
		(start_action O4788 "08/01/2017 21:11")
		(end_action O4788 "08/01/2017 21:18")
		(duration_action O4788 7)
		(parameters_typeO O4788 driver132)

		(index_action D8290 20501)
		(is_action D8290)
		(is_typeD D8290)
		(start_action D8290 "08/01/2017 21:18")
		(end_action D8290 "08/01/2017 21:21")
		(duration_action D8290 3)
		(parameters_typeD D8290 driver132)

		(index_action O4789 20502)
		(is_action O4789)
		(is_typeO O4789)
		(start_action O4789 "08/01/2017 21:21")
		(end_action O4789 "08/01/2017 21:24")
		(duration_action O4789 3)
		(parameters_typeO O4789 driver132)

		(index_action B6976 20503)
		(is_action B6976)
		(is_typeB B6976)
		(start_action B6976 "08/01/2017 21:24")
		(end_action B6976 "08/01/2017 21:27")
		(duration_action B6976 3)
		(parameters_typeB B6976 driver132)

		(index_action D8291 20504)
		(is_action D8291)
		(is_typeD D8291)
		(start_action D8291 "08/01/2017 21:27")
		(end_action D8291 "08/01/2017 21:28")
		(duration_action D8291 1)
		(parameters_typeD D8291 driver132)

		(index_action B6977 20505)
		(is_action B6977)
		(is_typeB B6977)
		(start_action B6977 "08/01/2017 21:28")
		(end_action B6977 "08/01/2017 21:33")
		(duration_action B6977 5)
		(parameters_typeB B6977 driver132)

		(index_action D8292 20506)
		(is_action D8292)
		(is_typeD D8292)
		(start_action D8292 "08/01/2017 21:33")
		(end_action D8292 "08/01/2017 21:36")
		(duration_action D8292 3)
		(parameters_typeD D8292 driver132)

		(index_action B6978 20507)
		(is_action B6978)
		(is_typeB B6978)
		(start_action B6978 "08/01/2017 21:36")
		(end_action B6978 "08/01/2017 21:39")
		(duration_action B6978 3)
		(parameters_typeB B6978 driver132)

		(index_action D8293 20508)
		(is_action D8293)
		(is_typeD D8293)
		(start_action D8293 "08/01/2017 21:39")
		(end_action D8293 "08/01/2017 21:42")
		(duration_action D8293 3)
		(parameters_typeD D8293 driver132)

		(index_action B6979 20509)
		(is_action B6979)
		(is_typeB B6979)
		(start_action B6979 "08/01/2017 21:42")
		(end_action B6979 "08/01/2017 22:44")
		(duration_action B6979 62)
		(parameters_typeB B6979 driver132)

		(index_action D8294 20510)
		(is_action D8294)
		(is_typeD D8294)
		(start_action D8294 "08/01/2017 22:44")
		(end_action D8294 "08/01/2017 22:47")
		(duration_action D8294 3)
		(parameters_typeD D8294 driver132)

		(index_action B6980 20511)
		(is_action B6980)
		(is_typeB B6980)
		(start_action B6980 "08/01/2017 22:47")
		(end_action B6980 "09/01/2017 00:59")
		(duration_action B6980 132)
		(parameters_typeB B6980 driver132)

		(index_action D8295 20512)
		(is_action D8295)
		(is_typeD D8295)
		(start_action D8295 "09/01/2017 00:59")
		(end_action D8295 "09/01/2017 01:14")
		(duration_action D8295 15)
		(parameters_typeD D8295 driver132)

		(index_action B6981 20513)
		(is_action B6981)
		(is_typeB B6981)
		(start_action B6981 "09/01/2017 01:14")
		(end_action B6981 "09/01/2017 02:31")
		(duration_action B6981 77)
		(parameters_typeB B6981 driver132)

		(index_action D8296 20514)
		(is_action D8296)
		(is_typeD D8296)
		(start_action D8296 "09/01/2017 02:31")
		(end_action D8296 "09/01/2017 03:43")
		(duration_action D8296 72)
		(parameters_typeD D8296 driver132)

		(index_action O4790 20515)
		(is_action O4790)
		(is_typeO O4790)
		(start_action O4790 "09/01/2017 03:43")
		(end_action O4790 "09/01/2017 03:45")
		(duration_action O4790 2)
		(parameters_typeO O4790 driver132)

		(index_action D8297 20516)
		(is_action D8297)
		(is_typeD D8297)
		(start_action D8297 "09/01/2017 03:45")
		(end_action D8297 "09/01/2017 03:46")
		(duration_action D8297 1)
		(parameters_typeD D8297 driver132)

		(index_action O4791 20517)
		(is_action O4791)
		(is_typeO O4791)
		(start_action O4791 "09/01/2017 03:46")
		(end_action O4791 "09/01/2017 03:53")
		(duration_action O4791 7)
		(parameters_typeO O4791 driver132)

		(index_action D8298 20518)
		(is_action D8298)
		(is_typeD D8298)
		(start_action D8298 "09/01/2017 03:53")
		(end_action D8298 "09/01/2017 03:54")
		(duration_action D8298 1)
		(parameters_typeD D8298 driver132)

		(index_action O4792 20519)
		(is_action O4792)
		(is_typeO O4792)
		(start_action O4792 "09/01/2017 03:54")
		(end_action O4792 "09/01/2017 03:59")
		(duration_action O4792 5)
		(parameters_typeO O4792 driver132)

		(index_action D8299 20520)
		(is_action D8299)
		(is_typeD D8299)
		(start_action D8299 "09/01/2017 03:59")
		(end_action D8299 "09/01/2017 04:00")
		(duration_action D8299 1)
		(parameters_typeD D8299 driver132)

		(index_action O4793 20521)
		(is_action O4793)
		(is_typeO O4793)
		(start_action O4793 "09/01/2017 04:00")
		(end_action O4793 "09/01/2017 04:30")
		(duration_action O4793 30)
		(parameters_typeO O4793 driver132)

		(index_action B6982 20522)
		(is_action B6982)
		(is_typeB B6982)
		(start_action B6982 "09/01/2017 04:30")
		(end_action B6982 "09/01/2017 04:37")
		(duration_action B6982 7)
		(parameters_typeB B6982 driver132)

		(index_action D8300 20523)
		(is_action D8300)
		(is_typeD D8300)
		(start_action D8300 "09/01/2017 04:37")
		(end_action D8300 "09/01/2017 04:39")
		(duration_action D8300 2)
		(parameters_typeD D8300 driver132)

		(index_action B6983 20524)
		(is_action B6983)
		(is_typeB B6983)
		(start_action B6983 "09/01/2017 04:39")
		(end_action B6983 "10/01/2017 14:09")
		(duration_action B6983 2010)
		(parameters_typeB B6983 driver132)

		(index_action D8301 20525)
		(is_action D8301)
		(is_typeD D8301)
		(start_action D8301 "10/01/2017 14:09")
		(end_action D8301 "10/01/2017 14:47")
		(duration_action D8301 38)
		(parameters_typeD D8301 driver132)

		(index_action B6984 20526)
		(is_action B6984)
		(is_typeB B6984)
		(start_action B6984 "10/01/2017 14:47")
		(end_action B6984 "10/01/2017 14:52")
		(duration_action B6984 5)
		(parameters_typeB B6984 driver132)

		(index_action O4794 20527)
		(is_action O4794)
		(is_typeO O4794)
		(start_action O4794 "10/01/2017 14:52")
		(end_action O4794 "10/01/2017 14:55")
		(duration_action O4794 3)
		(parameters_typeO O4794 driver132)

		(index_action D8302 20528)
		(is_action D8302)
		(is_typeD D8302)
		(start_action D8302 "10/01/2017 14:55")
		(end_action D8302 "10/01/2017 14:56")
		(duration_action D8302 1)
		(parameters_typeD D8302 driver132)

		(index_action B6985 20529)
		(is_action B6985)
		(is_typeB B6985)
		(start_action B6985 "10/01/2017 14:56")
		(end_action B6985 "10/01/2017 15:41")
		(duration_action B6985 45)
		(parameters_typeB B6985 driver132)

		(index_action D8303 20530)
		(is_action D8303)
		(is_typeD D8303)
		(start_action D8303 "10/01/2017 15:41")
		(end_action D8303 "10/01/2017 16:22")
		(duration_action D8303 41)
		(parameters_typeD D8303 driver132)

		(index_action O4795 20531)
		(is_action O4795)
		(is_typeO O4795)
		(start_action O4795 "10/01/2017 16:22")
		(end_action O4795 "10/01/2017 16:31")
		(duration_action O4795 9)
		(parameters_typeO O4795 driver132)

		(index_action B6986 20532)
		(is_action B6986)
		(is_typeB B6986)
		(start_action B6986 "10/01/2017 16:31")
		(end_action B6986 "10/01/2017 16:32")
		(duration_action B6986 1)
		(parameters_typeB B6986 driver132)

		(index_action D8304 20533)
		(is_action D8304)
		(is_typeD D8304)
		(start_action D8304 "10/01/2017 16:32")
		(end_action D8304 "10/01/2017 16:34")
		(duration_action D8304 2)
		(parameters_typeD D8304 driver132)

		(index_action B6987 20534)
		(is_action B6987)
		(is_typeB B6987)
		(start_action B6987 "10/01/2017 16:34")
		(end_action B6987 "10/01/2017 19:07")
		(duration_action B6987 153)
		(parameters_typeB B6987 driver132)

		(index_action O4796 20535)
		(is_action O4796)
		(is_typeO O4796)
		(start_action O4796 "10/01/2017 19:07")
		(end_action O4796 "10/01/2017 19:10")
		(duration_action O4796 3)
		(parameters_typeO O4796 driver132)

		(index_action D8305 20536)
		(is_action D8305)
		(is_typeD D8305)
		(start_action D8305 "10/01/2017 19:10")
		(end_action D8305 "10/01/2017 19:12")
		(duration_action D8305 2)
		(parameters_typeD D8305 driver132)

		(index_action B6988 20537)
		(is_action B6988)
		(is_typeB B6988)
		(start_action B6988 "10/01/2017 19:12")
		(end_action B6988 "10/01/2017 21:15")
		(duration_action B6988 123)
		(parameters_typeB B6988 driver132)

		(index_action D8306 20538)
		(is_action D8306)
		(is_typeD D8306)
		(start_action D8306 "10/01/2017 21:15")
		(end_action D8306 "10/01/2017 21:33")
		(duration_action D8306 18)
		(parameters_typeD D8306 driver132)

		(index_action O4797 20539)
		(is_action O4797)
		(is_typeO O4797)
		(start_action O4797 "10/01/2017 21:33")
		(end_action O4797 "10/01/2017 21:37")
		(duration_action O4797 4)
		(parameters_typeO O4797 driver132)

		(index_action D8307 20540)
		(is_action D8307)
		(is_typeD D8307)
		(start_action D8307 "10/01/2017 21:37")
		(end_action D8307 "10/01/2017 22:22")
		(duration_action D8307 45)
		(parameters_typeD D8307 driver132)

		(index_action B6989 20541)
		(is_action B6989)
		(is_typeB B6989)
		(start_action B6989 "10/01/2017 22:22")
		(end_action B6989 "12/01/2017 14:33")
		(duration_action B6989 2411)
		(parameters_typeB B6989 driver132)

		(index_action D8308 20542)
		(is_action D8308)
		(is_typeD D8308)
		(start_action D8308 "12/01/2017 14:33")
		(end_action D8308 "12/01/2017 15:31")
		(duration_action D8308 58)
		(parameters_typeD D8308 driver132)

		(index_action B6990 20543)
		(is_action B6990)
		(is_typeB B6990)
		(start_action B6990 "12/01/2017 15:31")
		(end_action B6990 "12/01/2017 16:21")
		(duration_action B6990 50)
		(parameters_typeB B6990 driver132)

		(index_action D8309 20544)
		(is_action D8309)
		(is_typeD D8309)
		(start_action D8309 "12/01/2017 16:21")
		(end_action D8309 "12/01/2017 16:27")
		(duration_action D8309 6)
		(parameters_typeD D8309 driver132)

		(index_action O4798 20545)
		(is_action O4798)
		(is_typeO O4798)
		(start_action O4798 "12/01/2017 16:27")
		(end_action O4798 "12/01/2017 16:30")
		(duration_action O4798 3)
		(parameters_typeO O4798 driver132)

		(index_action B6991 20546)
		(is_action B6991)
		(is_typeB B6991)
		(start_action B6991 "12/01/2017 16:30")
		(end_action B6991 "12/01/2017 16:42")
		(duration_action B6991 12)
		(parameters_typeB B6991 driver132)

		(index_action D8310 20547)
		(is_action D8310)
		(is_typeD D8310)
		(start_action D8310 "12/01/2017 16:42")
		(end_action D8310 "12/01/2017 16:43")
		(duration_action D8310 1)
		(parameters_typeD D8310 driver132)

		(index_action B6992 20548)
		(is_action B6992)
		(is_typeB B6992)
		(start_action B6992 "12/01/2017 16:43")
		(end_action B6992 "12/01/2017 16:47")
		(duration_action B6992 4)
		(parameters_typeB B6992 driver132)

		(index_action D8311 20549)
		(is_action D8311)
		(is_typeD D8311)
		(start_action D8311 "12/01/2017 16:47")
		(end_action D8311 "12/01/2017 16:48")
		(duration_action D8311 1)
		(parameters_typeD D8311 driver132)

		(index_action B6993 20550)
		(is_action B6993)
		(is_typeB B6993)
		(start_action B6993 "12/01/2017 16:48")
		(end_action B6993 "12/01/2017 16:50")
		(duration_action B6993 2)
		(parameters_typeB B6993 driver132)

		(index_action D8312 20551)
		(is_action D8312)
		(is_typeD D8312)
		(start_action D8312 "12/01/2017 16:50")
		(end_action D8312 "12/01/2017 16:52")
		(duration_action D8312 2)
		(parameters_typeD D8312 driver132)

		(index_action O4799 20552)
		(is_action O4799)
		(is_typeO O4799)
		(start_action O4799 "12/01/2017 16:52")
		(end_action O4799 "12/01/2017 16:53")
		(duration_action O4799 1)
		(parameters_typeO O4799 driver132)

		(index_action B6994 20553)
		(is_action B6994)
		(is_typeB B6994)
		(start_action B6994 "12/01/2017 16:53")
		(end_action B6994 "12/01/2017 17:18")
		(duration_action B6994 25)
		(parameters_typeB B6994 driver132)

		(index_action O4800 20554)
		(is_action O4800)
		(is_typeO O4800)
		(start_action O4800 "12/01/2017 17:18")
		(end_action O4800 "12/01/2017 17:25")
		(duration_action O4800 7)
		(parameters_typeO O4800 driver132)

		(index_action D8313 20555)
		(is_action D8313)
		(is_typeD D8313)
		(start_action D8313 "12/01/2017 17:25")
		(end_action D8313 "12/01/2017 21:35")
		(duration_action D8313 250)
		(parameters_typeD D8313 driver132)

		(index_action B6995 20556)
		(is_action B6995)
		(is_typeB B6995)
		(start_action B6995 "12/01/2017 21:35")
		(end_action B6995 "12/01/2017 22:07")
		(duration_action B6995 32)
		(parameters_typeB B6995 driver132)

		(index_action D8314 20557)
		(is_action D8314)
		(is_typeD D8314)
		(start_action D8314 "12/01/2017 22:07")
		(end_action D8314 "12/01/2017 22:51")
		(duration_action D8314 44)
		(parameters_typeD D8314 driver132)

		(index_action B6996 20558)
		(is_action B6996)
		(is_typeB B6996)
		(start_action B6996 "12/01/2017 22:51")
		(end_action B6996 "12/01/2017 23:13")
		(duration_action B6996 22)
		(parameters_typeB B6996 driver132)

		(index_action D8315 20559)
		(is_action D8315)
		(is_typeD D8315)
		(start_action D8315 "12/01/2017 23:13")
		(end_action D8315 "13/01/2017 02:52")
		(duration_action D8315 219)
		(parameters_typeD D8315 driver132)

		(index_action B6997 20560)
		(is_action B6997)
		(is_typeB B6997)
		(start_action B6997 "13/01/2017 02:52")
		(end_action B6997 "13/01/2017 11:58")
		(duration_action B6997 546)
		(parameters_typeB B6997 driver132)

		(index_action O4801 20561)
		(is_action O4801)
		(is_typeO O4801)
		(start_action O4801 "13/01/2017 11:58")
		(end_action O4801 "13/01/2017 11:59")
		(duration_action O4801 1)
		(parameters_typeO O4801 driver132)

		(index_action D8316 20562)
		(is_action D8316)
		(is_typeD D8316)
		(start_action D8316 "13/01/2017 11:59")
		(end_action D8316 "13/01/2017 12:07")
		(duration_action D8316 8)
		(parameters_typeD D8316 driver132)

		(index_action B6998 20563)
		(is_action B6998)
		(is_typeB B6998)
		(start_action B6998 "13/01/2017 12:07")
		(end_action B6998 "13/01/2017 12:11")
		(duration_action B6998 4)
		(parameters_typeB B6998 driver132)

		(index_action D8317 20564)
		(is_action D8317)
		(is_typeD D8317)
		(start_action D8317 "13/01/2017 12:11")
		(end_action D8317 "13/01/2017 12:13")
		(duration_action D8317 2)
		(parameters_typeD D8317 driver132)

		(index_action O4802 20565)
		(is_action O4802)
		(is_typeO O4802)
		(start_action O4802 "13/01/2017 12:13")
		(end_action O4802 "13/01/2017 12:16")
		(duration_action O4802 3)
		(parameters_typeO O4802 driver132)

		(index_action D8318 20566)
		(is_action D8318)
		(is_typeD D8318)
		(start_action D8318 "13/01/2017 12:16")
		(end_action D8318 "13/01/2017 12:17")
		(duration_action D8318 1)
		(parameters_typeD D8318 driver132)

		(index_action O4803 20567)
		(is_action O4803)
		(is_typeO O4803)
		(start_action O4803 "13/01/2017 12:17")
		(end_action O4803 "13/01/2017 12:19")
		(duration_action O4803 2)
		(parameters_typeO O4803 driver132)

		(index_action B6999 20568)
		(is_action B6999)
		(is_typeB B6999)
		(start_action B6999 "13/01/2017 12:19")
		(end_action B6999 "13/01/2017 12:54")
		(duration_action B6999 35)
		(parameters_typeB B6999 driver132)

		(index_action D8319 20569)
		(is_action D8319)
		(is_typeD D8319)
		(start_action D8319 "13/01/2017 12:54")
		(end_action D8319 "13/01/2017 12:55")
		(duration_action D8319 1)
		(parameters_typeD D8319 driver132)

		(index_action O4804 20570)
		(is_action O4804)
		(is_typeO O4804)
		(start_action O4804 "13/01/2017 12:55")
		(end_action O4804 "13/01/2017 13:00")
		(duration_action O4804 5)
		(parameters_typeO O4804 driver132)

		(index_action D8320 20571)
		(is_action D8320)
		(is_typeD D8320)
		(start_action D8320 "13/01/2017 13:00")
		(end_action D8320 "13/01/2017 14:23")
		(duration_action D8320 83)
		(parameters_typeD D8320 driver132)

		(index_action B7000 20572)
		(is_action B7000)
		(is_typeB B7000)
		(start_action B7000 "13/01/2017 14:23")
		(end_action B7000 "13/01/2017 14:32")
		(duration_action B7000 9)
		(parameters_typeB B7000 driver132)

		(index_action D8321 20573)
		(is_action D8321)
		(is_typeD D8321)
		(start_action D8321 "13/01/2017 14:32")
		(end_action D8321 "13/01/2017 14:36")
		(duration_action D8321 4)
		(parameters_typeD D8321 driver132)

		(index_action B7001 20574)
		(is_action B7001)
		(is_typeB B7001)
		(start_action B7001 "13/01/2017 14:36")
		(end_action B7001 "13/01/2017 15:31")
		(duration_action B7001 55)
		(parameters_typeB B7001 driver132)

		(index_action O4805 20575)
		(is_action O4805)
		(is_typeO O4805)
		(start_action O4805 "13/01/2017 15:31")
		(end_action O4805 "13/01/2017 15:33")
		(duration_action O4805 2)
		(parameters_typeO O4805 driver132)

		(index_action D8322 20576)
		(is_action D8322)
		(is_typeD D8322)
		(start_action D8322 "13/01/2017 15:33")
		(end_action D8322 "13/01/2017 15:34")
		(duration_action D8322 1)
		(parameters_typeD D8322 driver132)

		(index_action B7002 20577)
		(is_action B7002)
		(is_typeB B7002)
		(start_action B7002 "13/01/2017 15:34")
		(end_action B7002 "13/01/2017 17:16")
		(duration_action B7002 102)
		(parameters_typeB B7002 driver132)

		(index_action D8323 20578)
		(is_action D8323)
		(is_typeD D8323)
		(start_action D8323 "13/01/2017 17:16")
		(end_action D8323 "13/01/2017 17:17")
		(duration_action D8323 1)
		(parameters_typeD D8323 driver132)

		(index_action O4806 20579)
		(is_action O4806)
		(is_typeO O4806)
		(start_action O4806 "13/01/2017 17:17")
		(end_action O4806 "13/01/2017 17:23")
		(duration_action O4806 6)
		(parameters_typeO O4806 driver132)

		(index_action D8324 20580)
		(is_action D8324)
		(is_typeD D8324)
		(start_action D8324 "13/01/2017 17:23")
		(end_action D8324 "13/01/2017 19:27")
		(duration_action D8324 124)
		(parameters_typeD D8324 driver132)

		(index_action O4807 20581)
		(is_action O4807)
		(is_typeO O4807)
		(start_action O4807 "13/01/2017 19:27")
		(end_action O4807 "13/01/2017 19:30")
		(duration_action O4807 3)
		(parameters_typeO O4807 driver132)

		(index_action D8325 20582)
		(is_action D8325)
		(is_typeD D8325)
		(start_action D8325 "13/01/2017 19:30")
		(end_action D8325 "13/01/2017 21:23")
		(duration_action D8325 113)
		(parameters_typeD D8325 driver132)

		(index_action B7003 20583)
		(is_action B7003)
		(is_typeB B7003)
		(start_action B7003 "13/01/2017 21:23")
		(end_action B7003 "13/01/2017 22:09")
		(duration_action B7003 46)
		(parameters_typeB B7003 driver132)

		(index_action D8326 20584)
		(is_action D8326)
		(is_typeD D8326)
		(start_action D8326 "13/01/2017 22:09")
		(end_action D8326 "14/01/2017 01:25")
		(duration_action D8326 196)
		(parameters_typeD D8326 driver132)

		(index_action B7004 20585)
		(is_action B7004)
		(is_typeB B7004)
		(start_action B7004 "14/01/2017 01:25")
		(end_action B7004 "14/01/2017 12:28")
		(duration_action B7004 663)
		(parameters_typeB B7004 driver132)

		(index_action D8327 20586)
		(is_action D8327)
		(is_typeD D8327)
		(start_action D8327 "14/01/2017 12:28")
		(end_action D8327 "14/01/2017 12:59")
		(duration_action D8327 31)
		(parameters_typeD D8327 driver132)

		(index_action B7005 20587)
		(is_action B7005)
		(is_typeB B7005)
		(start_action B7005 "14/01/2017 12:59")
		(end_action B7005 "14/01/2017 13:14")
		(duration_action B7005 15)
		(parameters_typeB B7005 driver132)

		(index_action D8328 20588)
		(is_action D8328)
		(is_typeD D8328)
		(start_action D8328 "14/01/2017 13:14")
		(end_action D8328 "14/01/2017 16:36")
		(duration_action D8328 202)
		(parameters_typeD D8328 driver132)

		(index_action B7006 20589)
		(is_action B7006)
		(is_typeB B7006)
		(start_action B7006 "14/01/2017 16:36")
		(end_action B7006 "14/01/2017 16:50")
		(duration_action B7006 14)
		(parameters_typeB B7006 driver132)

		(index_action D8329 20590)
		(is_action D8329)
		(is_typeD D8329)
		(start_action D8329 "14/01/2017 16:50")
		(end_action D8329 "14/01/2017 16:51")
		(duration_action D8329 1)
		(parameters_typeD D8329 driver132)

		(index_action B7007 20591)
		(is_action B7007)
		(is_typeB B7007)
		(start_action B7007 "14/01/2017 16:51")
		(end_action B7007 "14/01/2017 17:02")
		(duration_action B7007 11)
		(parameters_typeB B7007 driver132)

		(index_action D8330 20592)
		(is_action D8330)
		(is_typeD D8330)
		(start_action D8330 "14/01/2017 17:02")
		(end_action D8330 "14/01/2017 17:23")
		(duration_action D8330 21)
		(parameters_typeD D8330 driver132)

		(index_action B7008 20593)
		(is_action B7008)
		(is_typeB B7008)
		(start_action B7008 "14/01/2017 17:23")
		(end_action B7008 "14/01/2017 17:54")
		(duration_action B7008 31)
		(parameters_typeB B7008 driver132)

		(index_action D8331 20594)
		(is_action D8331)
		(is_typeD D8331)
		(start_action D8331 "14/01/2017 17:54")
		(end_action D8331 "14/01/2017 21:52")
		(duration_action D8331 238)
		(parameters_typeD D8331 driver132)

		(index_action O4808 20595)
		(is_action O4808)
		(is_typeO O4808)
		(start_action O4808 "14/01/2017 21:52")
		(end_action O4808 "14/01/2017 21:55")
		(duration_action O4808 3)
		(parameters_typeO O4808 driver132)

		(index_action D8332 20596)
		(is_action D8332)
		(is_typeD D8332)
		(start_action D8332 "14/01/2017 21:55")
		(end_action D8332 "14/01/2017 22:02")
		(duration_action D8332 7)
		(parameters_typeD D8332 driver132)

		(index_action O4809 20597)
		(is_action O4809)
		(is_typeO O4809)
		(start_action O4809 "14/01/2017 22:02")
		(end_action O4809 "14/01/2017 22:05")
		(duration_action O4809 3)
		(parameters_typeO O4809 driver132)

		(index_action B7009 20598)
		(is_action B7009)
		(is_typeB B7009)
		(start_action B7009 "14/01/2017 22:05")
		(end_action B7009 "16/01/2017 08:02")
		(duration_action B7009 2037)
		(parameters_typeB B7009 driver132)

	)
	(:tasks-goal
		:tasks (
			(WD driver132)
		)
	)
)