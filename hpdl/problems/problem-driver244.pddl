(define (problem prueba0) (:domain GantaBi)
	(:customization
		(= :time-format "%d/%m/%Y %H:%M")
		(= :time-horizon-relative 86400) ;; que son los minutos que tienen 2 meses
		(= :time-start "01/01/2017 00:00")
		(= :time-unit :minutes)
	)
	(:objects
		driver244 - Driver

		D14621 D14622 D14623 D14624
 - TaskInstanceSymbol
		O8859 O8860
 - TaskInstanceSymbol
		B12991 B12992 B12993 B12994 B12995 B12996 B12997 B12998 B12999 B13000 B13001 B13002 B13003 B13004 B13005 B13006 B13007 B13008 B13009 B13010 B13011 B13012 B13013 B13014 B13015 B13016 B13017 B13018 B13019
 - TaskInstanceSymbol
		I1816 I1817 I1818 I1819 I1820 I1821 I1822 I1823 I1824 I1825 I1826 I1827 I1828 I1829 - TaskInstanceSymbol
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

		(= (current_index_action) 38283)

		(= (last_dr) "02/01/2017 14:59")
		(= (last_wr) "02/01/2017 14:59")
		(= (actual-timestamp) "02/01/2017 14:59")

		; Events
		(index_action I1816 38283)
		(is_action I1816)
		(is_typeI I1816)
		(start_action I1816 "02/01/2017 14:59")
		(end_action I1816 "02/01/2017 15:02")
		(duration_action I1816 3)
		(parameters_typeI I1816 driver244)

		(index_action B12991 38284)
		(is_action B12991)
		(is_typeB B12991)
		(start_action B12991 "02/01/2017 15:02")
		(end_action B12991 "02/01/2017 15:52")
		(duration_action B12991 50)
		(parameters_typeB B12991 driver244)

		(index_action B12992 38285)
		(is_action B12992)
		(is_typeB B12992)
		(start_action B12992 "03/01/2017 00:43")
		(end_action B12992 "03/01/2017 10:36")
		(duration_action B12992 593)
		(parameters_typeB B12992 driver244)

		(index_action I1817 38286)
		(is_action I1817)
		(is_typeI I1817)
		(start_action I1817 "03/01/2017 11:11")
		(end_action I1817 "03/01/2017 12:10")
		(duration_action I1817 59)
		(parameters_typeI I1817 driver244)

		(index_action B12993 38287)
		(is_action B12993)
		(is_typeB B12993)
		(start_action B12993 "03/01/2017 12:10")
		(end_action B12993 "03/01/2017 12:31")
		(duration_action B12993 21)
		(parameters_typeB B12993 driver244)

		(index_action I1818 38288)
		(is_action I1818)
		(is_typeI I1818)
		(start_action I1818 "03/01/2017 12:31")
		(end_action I1818 "03/01/2017 12:47")
		(duration_action I1818 16)
		(parameters_typeI I1818 driver244)

		(index_action B12994 38289)
		(is_action B12994)
		(is_typeB B12994)
		(start_action B12994 "03/01/2017 19:27")
		(end_action B12994 "03/01/2017 19:50")
		(duration_action B12994 23)
		(parameters_typeB B12994 driver244)

		(index_action B12995 38290)
		(is_action B12995)
		(is_typeB B12995)
		(start_action B12995 "03/01/2017 19:54")
		(end_action B12995 "03/01/2017 20:41")
		(duration_action B12995 47)
		(parameters_typeB B12995 driver244)

		(index_action B12996 38291)
		(is_action B12996)
		(is_typeB B12996)
		(start_action B12996 "03/01/2017 23:03")
		(end_action B12996 "04/01/2017 10:33")
		(duration_action B12996 690)
		(parameters_typeB B12996 driver244)

		(index_action B12997 38292)
		(is_action B12997)
		(is_typeB B12997)
		(start_action B12997 "04/01/2017 17:06")
		(end_action B12997 "04/01/2017 17:07")
		(duration_action B12997 1)
		(parameters_typeB B12997 driver244)

		(index_action B12998 38293)
		(is_action B12998)
		(is_typeB B12998)
		(start_action B12998 "05/01/2017 00:59")
		(end_action B12998 "05/01/2017 10:04")
		(duration_action B12998 545)
		(parameters_typeB B12998 driver244)

		(index_action I1819 38294)
		(is_action I1819)
		(is_typeI I1819)
		(start_action I1819 "05/01/2017 10:04")
		(end_action I1819 "05/01/2017 10:16")
		(duration_action I1819 12)
		(parameters_typeI I1819 driver244)

		(index_action B12999 38295)
		(is_action B12999)
		(is_typeB B12999)
		(start_action B12999 "05/01/2017 10:16")
		(end_action B12999 "05/01/2017 10:59")
		(duration_action B12999 43)
		(parameters_typeB B12999 driver244)

		(index_action I1820 38296)
		(is_action I1820)
		(is_typeI I1820)
		(start_action I1820 "05/01/2017 10:59")
		(end_action I1820 "05/01/2017 11:58")
		(duration_action I1820 59)
		(parameters_typeI I1820 driver244)

		(index_action B13000 38297)
		(is_action B13000)
		(is_typeB B13000)
		(start_action B13000 "05/01/2017 17:09")
		(end_action B13000 "07/01/2017 14:34")
		(duration_action B13000 2725)
		(parameters_typeB B13000 driver244)

		(index_action B13001 38298)
		(is_action B13001)
		(is_typeB B13001)
		(start_action B13001 "07/01/2017 15:59")
		(end_action B13001 "07/01/2017 16:16")
		(duration_action B13001 17)
		(parameters_typeB B13001 driver244)

		(index_action I1821 38299)
		(is_action I1821)
		(is_typeI I1821)
		(start_action I1821 "07/01/2017 16:16")
		(end_action I1821 "07/01/2017 17:17")
		(duration_action I1821 61)
		(parameters_typeI I1821 driver244)

		(index_action B13002 38300)
		(is_action B13002)
		(is_typeB B13002)
		(start_action B13002 "07/01/2017 17:17")
		(end_action B13002 "07/01/2017 18:50")
		(duration_action B13002 93)
		(parameters_typeB B13002 driver244)

		(index_action I1822 38301)
		(is_action I1822)
		(is_typeI I1822)
		(start_action I1822 "07/01/2017 20:33")
		(end_action I1822 "07/01/2017 21:15")
		(duration_action I1822 42)
		(parameters_typeI I1822 driver244)

		(index_action D14621 38302)
		(is_action D14621)
		(is_typeD D14621)
		(start_action D14621 "08/01/2017 07:11")
		(end_action D14621 "08/01/2017 07:12")
		(duration_action D14621 1)
		(parameters_typeD D14621 driver244)

		(index_action O8859 38303)
		(is_action O8859)
		(is_typeO O8859)
		(start_action O8859 "08/01/2017 07:12")
		(end_action O8859 "08/01/2017 08:36")
		(duration_action O8859 84)
		(parameters_typeO O8859 driver244)

		(index_action D14622 38304)
		(is_action D14622)
		(is_typeD D14622)
		(start_action D14622 "08/01/2017 08:36")
		(end_action D14622 "08/01/2017 09:13")
		(duration_action D14622 37)
		(parameters_typeD D14622 driver244)

		(index_action B13003 38305)
		(is_action B13003)
		(is_typeB B13003)
		(start_action B13003 "08/01/2017 09:13")
		(end_action B13003 "08/01/2017 09:14")
		(duration_action B13003 1)
		(parameters_typeB B13003 driver244)

		(index_action O8860 38306)
		(is_action O8860)
		(is_typeO O8860)
		(start_action O8860 "08/01/2017 09:14")
		(end_action O8860 "08/01/2017 09:17")
		(duration_action O8860 3)
		(parameters_typeO O8860 driver244)

		(index_action D14623 38307)
		(is_action D14623)
		(is_typeD D14623)
		(start_action D14623 "08/01/2017 09:17")
		(end_action D14623 "08/01/2017 09:26")
		(duration_action D14623 9)
		(parameters_typeD D14623 driver244)

		(index_action B13004 38308)
		(is_action B13004)
		(is_typeB B13004)
		(start_action B13004 "08/01/2017 09:26")
		(end_action B13004 "09/01/2017 06:43")
		(duration_action B13004 1277)
		(parameters_typeB B13004 driver244)

		(index_action I1823 38309)
		(is_action I1823)
		(is_typeI I1823)
		(start_action I1823 "09/01/2017 08:06")
		(end_action I1823 "09/01/2017 08:07")
		(duration_action I1823 1)
		(parameters_typeI I1823 driver244)

		(index_action B13005 38310)
		(is_action B13005)
		(is_typeB B13005)
		(start_action B13005 "09/01/2017 08:07")
		(end_action B13005 "09/01/2017 08:26")
		(duration_action B13005 19)
		(parameters_typeB B13005 driver244)

		(index_action I1824 38311)
		(is_action I1824)
		(is_typeI I1824)
		(start_action I1824 "09/01/2017 08:26")
		(end_action I1824 "09/01/2017 08:47")
		(duration_action I1824 21)
		(parameters_typeI I1824 driver244)

		(index_action B13006 38312)
		(is_action B13006)
		(is_typeB B13006)
		(start_action B13006 "09/01/2017 13:09")
		(end_action B13006 "09/01/2017 14:28")
		(duration_action B13006 79)
		(parameters_typeB B13006 driver244)

		(index_action I1825 38313)
		(is_action I1825)
		(is_typeI I1825)
		(start_action I1825 "09/01/2017 14:28")
		(end_action I1825 "09/01/2017 14:39")
		(duration_action I1825 11)
		(parameters_typeI I1825 driver244)

		(index_action B13007 38314)
		(is_action B13007)
		(is_typeB B13007)
		(start_action B13007 "09/01/2017 15:41")
		(end_action B13007 "09/01/2017 15:51")
		(duration_action B13007 10)
		(parameters_typeB B13007 driver244)

		(index_action I1826 38315)
		(is_action I1826)
		(is_typeI I1826)
		(start_action I1826 "09/01/2017 15:51")
		(end_action I1826 "09/01/2017 15:53")
		(duration_action I1826 2)
		(parameters_typeI I1826 driver244)

		(index_action B13008 38316)
		(is_action B13008)
		(is_typeB B13008)
		(start_action B13008 "09/01/2017 15:53")
		(end_action B13008 "09/01/2017 16:18")
		(duration_action B13008 25)
		(parameters_typeB B13008 driver244)

		(index_action B13009 38317)
		(is_action B13009)
		(is_typeB B13009)
		(start_action B13009 "09/01/2017 16:35")
		(end_action B13009 "10/01/2017 15:11")
		(duration_action B13009 1356)
		(parameters_typeB B13009 driver244)

		(index_action B13010 38318)
		(is_action B13010)
		(is_typeB B13010)
		(start_action B13010 "10/01/2017 16:15")
		(end_action B13010 "10/01/2017 16:45")
		(duration_action B13010 30)
		(parameters_typeB B13010 driver244)

		(index_action B13011 38319)
		(is_action B13011)
		(is_typeB B13011)
		(start_action B13011 "11/01/2017 00:04")
		(end_action B13011 "11/01/2017 09:53")
		(duration_action B13011 589)
		(parameters_typeB B13011 driver244)

		(index_action B13012 38320)
		(is_action B13012)
		(is_typeB B13012)
		(start_action B13012 "11/01/2017 14:00")
		(end_action B13012 "11/01/2017 14:16")
		(duration_action B13012 16)
		(parameters_typeB B13012 driver244)

		(index_action B13013 38321)
		(is_action B13013)
		(is_typeB B13013)
		(start_action B13013 "11/01/2017 16:58")
		(end_action B13013 "11/01/2017 17:27")
		(duration_action B13013 29)
		(parameters_typeB B13013 driver244)

		(index_action I1827 38322)
		(is_action I1827)
		(is_typeI I1827)
		(start_action I1827 "11/01/2017 17:27")
		(end_action I1827 "11/01/2017 17:55")
		(duration_action I1827 28)
		(parameters_typeI I1827 driver244)

		(index_action B13014 38323)
		(is_action B13014)
		(is_typeB B13014)
		(start_action B13014 "11/01/2017 21:30")
		(end_action B13014 "11/01/2017 21:41")
		(duration_action B13014 11)
		(parameters_typeB B13014 driver244)

		(index_action D14624 38324)
		(is_action D14624)
		(is_typeD D14624)
		(start_action D14624 "11/01/2017 21:41")
		(end_action D14624 "11/01/2017 21:53")
		(duration_action D14624 12)
		(parameters_typeD D14624 driver244)

		(index_action B13015 38325)
		(is_action B13015)
		(is_typeB B13015)
		(start_action B13015 "11/01/2017 22:31")
		(end_action B13015 "14/01/2017 16:34")
		(duration_action B13015 3963)
		(parameters_typeB B13015 driver244)

		(index_action I1828 38326)
		(is_action I1828)
		(is_typeI I1828)
		(start_action I1828 "14/01/2017 17:31")
		(end_action I1828 "14/01/2017 19:24")
		(duration_action I1828 113)
		(parameters_typeI I1828 driver244)

		(index_action B13016 38327)
		(is_action B13016)
		(is_typeB B13016)
		(start_action B13016 "14/01/2017 19:24")
		(end_action B13016 "14/01/2017 20:24")
		(duration_action B13016 60)
		(parameters_typeB B13016 driver244)

		(index_action B13017 38328)
		(is_action B13017)
		(is_typeB B13017)
		(start_action B13017 "15/01/2017 06:09")
		(end_action B13017 "15/01/2017 06:41")
		(duration_action B13017 32)
		(parameters_typeB B13017 driver244)

		(index_action B13018 38329)
		(is_action B13018)
		(is_typeB B13018)
		(start_action B13018 "15/01/2017 08:31")
		(end_action B13018 "15/01/2017 09:23")
		(duration_action B13018 52)
		(parameters_typeB B13018 driver244)

		(index_action I1829 38330)
		(is_action I1829)
		(is_typeI I1829)
		(start_action I1829 "15/01/2017 09:23")
		(end_action I1829 "15/01/2017 09:36")
		(duration_action I1829 13)
		(parameters_typeI I1829 driver244)

		(index_action B13019 38331)
		(is_action B13019)
		(is_typeB B13019)
		(start_action B13019 "15/01/2017 09:36")
		(end_action B13019 "16/01/2017 08:16")
		(duration_action B13019 1360)
		(parameters_typeB B13019 driver244)

	)
	(:tasks-goal
		:tasks (
			(WD driver244)
		)
	)
)