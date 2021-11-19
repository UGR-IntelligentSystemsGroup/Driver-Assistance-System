(define (problem prueba0) (:domain GantaBi)
	(:customization
		(= :time-format "%d/%m/%Y %H:%M")
		(= :time-horizon-relative 86400) ;; que son los minutos que tienen 2 meses
		(= :time-start "01/01/2017 00:00")
		(= :time-unit :minutes)
	)
	(:objects
		driver209 - Driver

		D12903 D12904 D12905 D12906 D12907 D12908 D12909 D12910 D12911 D12912 D12913 D12914 D12915 D12916 D12917 D12918 D12919 D12920 D12921 D12922 D12923 D12924 D12925 D12926 D12927 D12928 D12929 D12930 D12931 D12932 D12933 D12934 D12935 D12936 D12937 D12938 D12939 D12940 D12941 D12942 D12943 D12944 D12945 D12946 D12947
 - TaskInstanceSymbol
		O7670 O7671 O7672 O7673 O7674 O7675 O7676 O7677 O7678 O7679 O7680 O7681 O7682 O7683 O7684 O7685 O7686 O7687 O7688 O7689 O7690 O7691 O7692 O7693 O7694 O7695 O7696 O7697 O7698 O7699 O7700 O7701 O7702 O7703 O7704 O7705 O7706 O7707 O7708 O7709 O7710 O7711 O7712
 - TaskInstanceSymbol
		B11206 B11207 B11208 B11209 B11210 B11211 B11212 B11213 B11214 B11215 B11216 B11217 B11218 B11219 B11220 B11221 B11222 B11223 B11224 B11225 B11226 B11227 B11228 B11229 B11230 B11231 B11232 B11233 B11234 B11235 B11236 B11237 B11238
 - TaskInstanceSymbol
		I1231 I1232 I1233 I1234 I1235 I1236 I1237 I1238 I1239 I1240 I1241 I1242 I1243 - TaskInstanceSymbol
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

		(= (current_index_action) 33006)

		(= (last_dr) "01/01/2017 00:39")
		(= (last_wr) "01/01/2017 00:39")
		(= (actual-timestamp) "01/01/2017 00:39")

		; Events
		(index_action O7670 33006)
		(is_action O7670)
		(is_typeO O7670)
		(start_action O7670 "01/01/2017 00:39")
		(end_action O7670 "01/01/2017 00:44")
		(duration_action O7670 5)
		(parameters_typeO O7670 driver209)

		(index_action D12903 33007)
		(is_action D12903)
		(is_typeD D12903)
		(start_action D12903 "01/01/2017 00:44")
		(end_action D12903 "01/01/2017 01:33")
		(duration_action D12903 49)
		(parameters_typeD D12903 driver209)

		(index_action O7671 33008)
		(is_action O7671)
		(is_typeO O7671)
		(start_action O7671 "01/01/2017 01:33")
		(end_action O7671 "01/01/2017 01:46")
		(duration_action O7671 13)
		(parameters_typeO O7671 driver209)

		(index_action D12904 33009)
		(is_action D12904)
		(is_typeD D12904)
		(start_action D12904 "01/01/2017 01:46")
		(end_action D12904 "01/01/2017 02:54")
		(duration_action D12904 68)
		(parameters_typeD D12904 driver209)

		(index_action O7672 33010)
		(is_action O7672)
		(is_typeO O7672)
		(start_action O7672 "01/01/2017 02:54")
		(end_action O7672 "01/01/2017 02:56")
		(duration_action O7672 2)
		(parameters_typeO O7672 driver209)

		(index_action D12905 33011)
		(is_action D12905)
		(is_typeD D12905)
		(start_action D12905 "01/01/2017 02:56")
		(end_action D12905 "01/01/2017 03:02")
		(duration_action D12905 6)
		(parameters_typeD D12905 driver209)

		(index_action O7673 33012)
		(is_action O7673)
		(is_typeO O7673)
		(start_action O7673 "01/01/2017 03:02")
		(end_action O7673 "01/01/2017 03:15")
		(duration_action O7673 13)
		(parameters_typeO O7673 driver209)

		(index_action B11206 33013)
		(is_action B11206)
		(is_typeB B11206)
		(start_action B11206 "01/01/2017 03:15")
		(end_action B11206 "03/01/2017 21:19")
		(duration_action B11206 3964)
		(parameters_typeB B11206 driver209)

		(index_action D12906 33014)
		(is_action D12906)
		(is_typeD D12906)
		(start_action D12906 "03/01/2017 21:19")
		(end_action D12906 "03/01/2017 23:08")
		(duration_action D12906 109)
		(parameters_typeD D12906 driver209)

		(index_action O7674 33015)
		(is_action O7674)
		(is_typeO O7674)
		(start_action O7674 "03/01/2017 23:08")
		(end_action O7674 "03/01/2017 23:14")
		(duration_action O7674 6)
		(parameters_typeO O7674 driver209)

		(index_action D12907 33016)
		(is_action D12907)
		(is_typeD D12907)
		(start_action D12907 "03/01/2017 23:14")
		(end_action D12907 "03/01/2017 23:17")
		(duration_action D12907 3)
		(parameters_typeD D12907 driver209)

		(index_action O7675 33017)
		(is_action O7675)
		(is_typeO O7675)
		(start_action O7675 "03/01/2017 23:17")
		(end_action O7675 "03/01/2017 23:20")
		(duration_action O7675 3)
		(parameters_typeO O7675 driver209)

		(index_action B11207 33018)
		(is_action B11207)
		(is_typeB B11207)
		(start_action B11207 "03/01/2017 23:20")
		(end_action B11207 "04/01/2017 08:30")
		(duration_action B11207 550)
		(parameters_typeB B11207 driver209)

		(index_action D12908 33019)
		(is_action D12908)
		(is_typeD D12908)
		(start_action D12908 "04/01/2017 08:30")
		(end_action D12908 "04/01/2017 08:33")
		(duration_action D12908 3)
		(parameters_typeD D12908 driver209)

		(index_action B11208 33020)
		(is_action B11208)
		(is_typeB B11208)
		(start_action B11208 "04/01/2017 08:33")
		(end_action B11208 "04/01/2017 08:34")
		(duration_action B11208 1)
		(parameters_typeB B11208 driver209)

		(index_action O7676 33021)
		(is_action O7676)
		(is_typeO O7676)
		(start_action O7676 "04/01/2017 08:34")
		(end_action O7676 "04/01/2017 09:23")
		(duration_action O7676 49)
		(parameters_typeO O7676 driver209)

		(index_action B11209 33022)
		(is_action B11209)
		(is_typeB B11209)
		(start_action B11209 "04/01/2017 09:23")
		(end_action B11209 "04/01/2017 09:28")
		(duration_action B11209 5)
		(parameters_typeB B11209 driver209)

		(index_action D12909 33023)
		(is_action D12909)
		(is_typeD D12909)
		(start_action D12909 "04/01/2017 09:28")
		(end_action D12909 "04/01/2017 09:30")
		(duration_action D12909 2)
		(parameters_typeD D12909 driver209)

		(index_action B11210 33024)
		(is_action B11210)
		(is_typeB B11210)
		(start_action B11210 "04/01/2017 09:30")
		(end_action B11210 "04/01/2017 09:37")
		(duration_action B11210 7)
		(parameters_typeB B11210 driver209)

		(index_action D12910 33025)
		(is_action D12910)
		(is_typeD D12910)
		(start_action D12910 "04/01/2017 09:37")
		(end_action D12910 "04/01/2017 11:27")
		(duration_action D12910 110)
		(parameters_typeD D12910 driver209)

		(index_action B11211 33026)
		(is_action B11211)
		(is_typeB B11211)
		(start_action B11211 "04/01/2017 11:27")
		(end_action B11211 "04/01/2017 11:32")
		(duration_action B11211 5)
		(parameters_typeB B11211 driver209)

		(index_action D12911 33027)
		(is_action D12911)
		(is_typeD D12911)
		(start_action D12911 "04/01/2017 11:32")
		(end_action D12911 "04/01/2017 13:14")
		(duration_action D12911 102)
		(parameters_typeD D12911 driver209)

		(index_action B11212 33028)
		(is_action B11212)
		(is_typeB B11212)
		(start_action B11212 "04/01/2017 13:18")
		(end_action B11212 "04/01/2017 13:42")
		(duration_action B11212 24)
		(parameters_typeB B11212 driver209)

		(index_action I1231 33029)
		(is_action I1231)
		(is_typeI I1231)
		(start_action I1231 "04/01/2017 13:42")
		(end_action I1231 "04/01/2017 17:55")
		(duration_action I1231 253)
		(parameters_typeI I1231 driver209)

		(index_action O7677 33030)
		(is_action O7677)
		(is_typeO O7677)
		(start_action O7677 "04/01/2017 17:57")
		(end_action O7677 "04/01/2017 18:01")
		(duration_action O7677 4)
		(parameters_typeO O7677 driver209)

		(index_action D12912 33031)
		(is_action D12912)
		(is_typeD D12912)
		(start_action D12912 "04/01/2017 18:01")
		(end_action D12912 "04/01/2017 20:03")
		(duration_action D12912 122)
		(parameters_typeD D12912 driver209)

		(index_action B11213 33032)
		(is_action B11213)
		(is_typeB B11213)
		(start_action B11213 "04/01/2017 20:03")
		(end_action B11213 "04/01/2017 20:14")
		(duration_action B11213 11)
		(parameters_typeB B11213 driver209)

		(index_action D12913 33033)
		(is_action D12913)
		(is_typeD D12913)
		(start_action D12913 "04/01/2017 20:14")
		(end_action D12913 "04/01/2017 22:27")
		(duration_action D12913 133)
		(parameters_typeD D12913 driver209)

		(index_action I1232 33034)
		(is_action I1232)
		(is_typeI I1232)
		(start_action I1232 "04/01/2017 22:32")
		(end_action I1232 "05/01/2017 01:28")
		(duration_action I1232 176)
		(parameters_typeI I1232 driver209)

		(index_action B11214 33035)
		(is_action B11214)
		(is_typeB B11214)
		(start_action B11214 "05/01/2017 01:28")
		(end_action B11214 "05/01/2017 10:34")
		(duration_action B11214 546)
		(parameters_typeB B11214 driver209)

		(index_action I1233 33036)
		(is_action I1233)
		(is_typeI I1233)
		(start_action I1233 "05/01/2017 10:34")
		(end_action I1233 "05/01/2017 14:57")
		(duration_action I1233 263)
		(parameters_typeI I1233 driver209)

		(index_action O7678 33037)
		(is_action O7678)
		(is_typeO O7678)
		(start_action O7678 "05/01/2017 14:59")
		(end_action O7678 "05/01/2017 15:05")
		(duration_action O7678 6)
		(parameters_typeO O7678 driver209)

		(index_action D12914 33038)
		(is_action D12914)
		(is_typeD D12914)
		(start_action D12914 "05/01/2017 15:05")
		(end_action D12914 "05/01/2017 16:13")
		(duration_action D12914 68)
		(parameters_typeD D12914 driver209)

		(index_action O7679 33039)
		(is_action O7679)
		(is_typeO O7679)
		(start_action O7679 "05/01/2017 16:13")
		(end_action O7679 "05/01/2017 16:31")
		(duration_action O7679 18)
		(parameters_typeO O7679 driver209)

		(index_action D12915 33040)
		(is_action D12915)
		(is_typeD D12915)
		(start_action D12915 "05/01/2017 16:31")
		(end_action D12915 "05/01/2017 16:32")
		(duration_action D12915 1)
		(parameters_typeD D12915 driver209)

		(index_action B11215 33041)
		(is_action B11215)
		(is_typeB B11215)
		(start_action B11215 "05/01/2017 16:32")
		(end_action B11215 "05/01/2017 16:37")
		(duration_action B11215 5)
		(parameters_typeB B11215 driver209)

		(index_action D12916 33042)
		(is_action D12916)
		(is_typeD D12916)
		(start_action D12916 "05/01/2017 16:37")
		(end_action D12916 "05/01/2017 16:39")
		(duration_action D12916 2)
		(parameters_typeD D12916 driver209)

		(index_action B11216 33043)
		(is_action B11216)
		(is_typeB B11216)
		(start_action B11216 "05/01/2017 16:39")
		(end_action B11216 "05/01/2017 17:01")
		(duration_action B11216 22)
		(parameters_typeB B11216 driver209)

		(index_action D12917 33044)
		(is_action D12917)
		(is_typeD D12917)
		(start_action D12917 "05/01/2017 17:01")
		(end_action D12917 "05/01/2017 20:16")
		(duration_action D12917 195)
		(parameters_typeD D12917 driver209)

		(index_action I1234 33045)
		(is_action I1234)
		(is_typeI I1234)
		(start_action I1234 "05/01/2017 20:20")
		(end_action I1234 "06/01/2017 00:49")
		(duration_action I1234 269)
		(parameters_typeI I1234 driver209)

		(index_action O7680 33046)
		(is_action O7680)
		(is_typeO O7680)
		(start_action O7680 "06/01/2017 00:52")
		(end_action O7680 "06/01/2017 00:53")
		(duration_action O7680 1)
		(parameters_typeO O7680 driver209)

		(index_action D12918 33047)
		(is_action D12918)
		(is_typeD D12918)
		(start_action D12918 "06/01/2017 00:53")
		(end_action D12918 "06/01/2017 04:05")
		(duration_action D12918 192)
		(parameters_typeD D12918 driver209)

		(index_action O7681 33048)
		(is_action O7681)
		(is_typeO O7681)
		(start_action O7681 "06/01/2017 04:05")
		(end_action O7681 "06/01/2017 04:09")
		(duration_action O7681 4)
		(parameters_typeO O7681 driver209)

		(index_action D12919 33049)
		(is_action D12919)
		(is_typeD D12919)
		(start_action D12919 "06/01/2017 04:09")
		(end_action D12919 "06/01/2017 04:12")
		(duration_action D12919 3)
		(parameters_typeD D12919 driver209)

		(index_action O7682 33050)
		(is_action O7682)
		(is_typeO O7682)
		(start_action O7682 "06/01/2017 04:12")
		(end_action O7682 "06/01/2017 04:20")
		(duration_action O7682 8)
		(parameters_typeO O7682 driver209)

		(index_action B11217 33051)
		(is_action B11217)
		(is_typeB B11217)
		(start_action B11217 "06/01/2017 04:20")
		(end_action B11217 "06/01/2017 04:24")
		(duration_action B11217 4)
		(parameters_typeB B11217 driver209)

		(index_action D12920 33052)
		(is_action D12920)
		(is_typeD D12920)
		(start_action D12920 "06/01/2017 04:24")
		(end_action D12920 "06/01/2017 04:32")
		(duration_action D12920 8)
		(parameters_typeD D12920 driver209)

		(index_action O7683 33053)
		(is_action O7683)
		(is_typeO O7683)
		(start_action O7683 "06/01/2017 04:32")
		(end_action O7683 "06/01/2017 04:39")
		(duration_action O7683 7)
		(parameters_typeO O7683 driver209)

		(index_action B11218 33054)
		(is_action B11218)
		(is_typeB B11218)
		(start_action B11218 "06/01/2017 04:39")
		(end_action B11218 "09/01/2017 08:01")
		(duration_action B11218 4522)
		(parameters_typeB B11218 driver209)

		(index_action D12921 33055)
		(is_action D12921)
		(is_typeD D12921)
		(start_action D12921 "09/01/2017 08:01")
		(end_action D12921 "09/01/2017 08:03")
		(duration_action D12921 2)
		(parameters_typeD D12921 driver209)

		(index_action O7684 33056)
		(is_action O7684)
		(is_typeO O7684)
		(start_action O7684 "09/01/2017 08:03")
		(end_action O7684 "09/01/2017 08:05")
		(duration_action O7684 2)
		(parameters_typeO O7684 driver209)

		(index_action D12922 33057)
		(is_action D12922)
		(is_typeD D12922)
		(start_action D12922 "09/01/2017 08:05")
		(end_action D12922 "09/01/2017 08:06")
		(duration_action D12922 1)
		(parameters_typeD D12922 driver209)

		(index_action O7685 33058)
		(is_action O7685)
		(is_typeO O7685)
		(start_action O7685 "09/01/2017 08:06")
		(end_action O7685 "09/01/2017 09:16")
		(duration_action O7685 70)
		(parameters_typeO O7685 driver209)

		(index_action D12923 33059)
		(is_action D12923)
		(is_typeD D12923)
		(start_action D12923 "09/01/2017 09:16")
		(end_action D12923 "09/01/2017 09:20")
		(duration_action D12923 4)
		(parameters_typeD D12923 driver209)

		(index_action O7686 33060)
		(is_action O7686)
		(is_typeO O7686)
		(start_action O7686 "09/01/2017 09:20")
		(end_action O7686 "09/01/2017 09:25")
		(duration_action O7686 5)
		(parameters_typeO O7686 driver209)

		(index_action B11219 33061)
		(is_action B11219)
		(is_typeB B11219)
		(start_action B11219 "09/01/2017 09:25")
		(end_action B11219 "09/01/2017 09:43")
		(duration_action B11219 18)
		(parameters_typeB B11219 driver209)

		(index_action O7687 33062)
		(is_action O7687)
		(is_typeO O7687)
		(start_action O7687 "09/01/2017 09:43")
		(end_action O7687 "09/01/2017 09:45")
		(duration_action O7687 2)
		(parameters_typeO O7687 driver209)

		(index_action D12924 33063)
		(is_action D12924)
		(is_typeD D12924)
		(start_action D12924 "09/01/2017 09:45")
		(end_action D12924 "09/01/2017 09:56")
		(duration_action D12924 11)
		(parameters_typeD D12924 driver209)

		(index_action O7688 33064)
		(is_action O7688)
		(is_typeO O7688)
		(start_action O7688 "09/01/2017 09:56")
		(end_action O7688 "09/01/2017 09:57")
		(duration_action O7688 1)
		(parameters_typeO O7688 driver209)

		(index_action B11220 33065)
		(is_action B11220)
		(is_typeB B11220)
		(start_action B11220 "09/01/2017 09:57")
		(end_action B11220 "09/01/2017 12:15")
		(duration_action B11220 138)
		(parameters_typeB B11220 driver209)

		(index_action D12925 33066)
		(is_action D12925)
		(is_typeD D12925)
		(start_action D12925 "09/01/2017 12:15")
		(end_action D12925 "09/01/2017 15:36")
		(duration_action D12925 201)
		(parameters_typeD D12925 driver209)

		(index_action O7689 33067)
		(is_action O7689)
		(is_typeO O7689)
		(start_action O7689 "09/01/2017 15:36")
		(end_action O7689 "09/01/2017 15:39")
		(duration_action O7689 3)
		(parameters_typeO O7689 driver209)

		(index_action B11221 33068)
		(is_action B11221)
		(is_typeB B11221)
		(start_action B11221 "09/01/2017 15:39")
		(end_action B11221 "10/01/2017 18:02")
		(duration_action B11221 1583)
		(parameters_typeB B11221 driver209)

		(index_action D12926 33069)
		(is_action D12926)
		(is_typeD D12926)
		(start_action D12926 "10/01/2017 18:02")
		(end_action D12926 "10/01/2017 18:14")
		(duration_action D12926 12)
		(parameters_typeD D12926 driver209)

		(index_action O7690 33070)
		(is_action O7690)
		(is_typeO O7690)
		(start_action O7690 "10/01/2017 18:14")
		(end_action O7690 "10/01/2017 18:17")
		(duration_action O7690 3)
		(parameters_typeO O7690 driver209)

		(index_action B11222 33071)
		(is_action B11222)
		(is_typeB B11222)
		(start_action B11222 "10/01/2017 18:17")
		(end_action B11222 "10/01/2017 18:30")
		(duration_action B11222 13)
		(parameters_typeB B11222 driver209)

		(index_action O7691 33072)
		(is_action O7691)
		(is_typeO O7691)
		(start_action O7691 "10/01/2017 18:30")
		(end_action O7691 "10/01/2017 18:34")
		(duration_action O7691 4)
		(parameters_typeO O7691 driver209)

		(index_action D12927 33073)
		(is_action D12927)
		(is_typeD D12927)
		(start_action D12927 "10/01/2017 18:34")
		(end_action D12927 "10/01/2017 18:35")
		(duration_action D12927 1)
		(parameters_typeD D12927 driver209)

		(index_action O7692 33074)
		(is_action O7692)
		(is_typeO O7692)
		(start_action O7692 "10/01/2017 18:35")
		(end_action O7692 "10/01/2017 18:51")
		(duration_action O7692 16)
		(parameters_typeO O7692 driver209)

		(index_action D12928 33075)
		(is_action D12928)
		(is_typeD D12928)
		(start_action D12928 "10/01/2017 18:51")
		(end_action D12928 "10/01/2017 19:09")
		(duration_action D12928 18)
		(parameters_typeD D12928 driver209)

		(index_action O7693 33076)
		(is_action O7693)
		(is_typeO O7693)
		(start_action O7693 "10/01/2017 19:09")
		(end_action O7693 "10/01/2017 19:13")
		(duration_action O7693 4)
		(parameters_typeO O7693 driver209)

		(index_action D12929 33077)
		(is_action D12929)
		(is_typeD D12929)
		(start_action D12929 "10/01/2017 19:13")
		(end_action D12929 "10/01/2017 19:17")
		(duration_action D12929 4)
		(parameters_typeD D12929 driver209)

		(index_action O7694 33078)
		(is_action O7694)
		(is_typeO O7694)
		(start_action O7694 "10/01/2017 19:17")
		(end_action O7694 "10/01/2017 19:20")
		(duration_action O7694 3)
		(parameters_typeO O7694 driver209)

		(index_action D12930 33079)
		(is_action D12930)
		(is_typeD D12930)
		(start_action D12930 "10/01/2017 19:20")
		(end_action D12930 "10/01/2017 19:23")
		(duration_action D12930 3)
		(parameters_typeD D12930 driver209)

		(index_action B11223 33080)
		(is_action B11223)
		(is_typeB B11223)
		(start_action B11223 "10/01/2017 19:23")
		(end_action B11223 "10/01/2017 20:52")
		(duration_action B11223 89)
		(parameters_typeB B11223 driver209)

		(index_action D12931 33081)
		(is_action D12931)
		(is_typeD D12931)
		(start_action D12931 "10/01/2017 20:52")
		(end_action D12931 "10/01/2017 20:55")
		(duration_action D12931 3)
		(parameters_typeD D12931 driver209)

		(index_action B11224 33082)
		(is_action B11224)
		(is_typeB B11224)
		(start_action B11224 "10/01/2017 20:55")
		(end_action B11224 "10/01/2017 21:24")
		(duration_action B11224 29)
		(parameters_typeB B11224 driver209)

		(index_action O7695 33083)
		(is_action O7695)
		(is_typeO O7695)
		(start_action O7695 "10/01/2017 21:24")
		(end_action O7695 "10/01/2017 21:29")
		(duration_action O7695 5)
		(parameters_typeO O7695 driver209)

		(index_action D12932 33084)
		(is_action D12932)
		(is_typeD D12932)
		(start_action D12932 "10/01/2017 21:29")
		(end_action D12932 "10/01/2017 22:02")
		(duration_action D12932 33)
		(parameters_typeD D12932 driver209)

		(index_action O7696 33085)
		(is_action O7696)
		(is_typeO O7696)
		(start_action O7696 "10/01/2017 22:02")
		(end_action O7696 "10/01/2017 22:07")
		(duration_action O7696 5)
		(parameters_typeO O7696 driver209)

		(index_action D12933 33086)
		(is_action D12933)
		(is_typeD D12933)
		(start_action D12933 "10/01/2017 22:07")
		(end_action D12933 "10/01/2017 22:09")
		(duration_action D12933 2)
		(parameters_typeD D12933 driver209)

		(index_action B11225 33087)
		(is_action B11225)
		(is_typeB B11225)
		(start_action B11225 "10/01/2017 22:09")
		(end_action B11225 "10/01/2017 22:16")
		(duration_action B11225 7)
		(parameters_typeB B11225 driver209)

		(index_action O7697 33088)
		(is_action O7697)
		(is_typeO O7697)
		(start_action O7697 "10/01/2017 22:16")
		(end_action O7697 "10/01/2017 22:31")
		(duration_action O7697 15)
		(parameters_typeO O7697 driver209)

		(index_action B11226 33089)
		(is_action B11226)
		(is_typeB B11226)
		(start_action B11226 "10/01/2017 22:31")
		(end_action B11226 "10/01/2017 23:52")
		(duration_action B11226 81)
		(parameters_typeB B11226 driver209)

		(index_action D12934 33090)
		(is_action D12934)
		(is_typeD D12934)
		(start_action D12934 "10/01/2017 23:52")
		(end_action D12934 "10/01/2017 23:56")
		(duration_action D12934 4)
		(parameters_typeD D12934 driver209)

		(index_action B11227 33091)
		(is_action B11227)
		(is_typeB B11227)
		(start_action B11227 "10/01/2017 23:56")
		(end_action B11227 "11/01/2017 00:38")
		(duration_action B11227 42)
		(parameters_typeB B11227 driver209)

		(index_action D12935 33092)
		(is_action D12935)
		(is_typeD D12935)
		(start_action D12935 "11/01/2017 00:38")
		(end_action D12935 "11/01/2017 00:39")
		(duration_action D12935 1)
		(parameters_typeD D12935 driver209)

		(index_action O7698 33093)
		(is_action O7698)
		(is_typeO O7698)
		(start_action O7698 "11/01/2017 00:39")
		(end_action O7698 "11/01/2017 00:42")
		(duration_action O7698 3)
		(parameters_typeO O7698 driver209)

		(index_action D12936 33094)
		(is_action D12936)
		(is_typeD D12936)
		(start_action D12936 "11/01/2017 00:42")
		(end_action D12936 "11/01/2017 04:57")
		(duration_action D12936 255)
		(parameters_typeD D12936 driver209)

		(index_action O7699 33095)
		(is_action O7699)
		(is_typeO O7699)
		(start_action O7699 "11/01/2017 04:57")
		(end_action O7699 "11/01/2017 04:58")
		(duration_action O7699 1)
		(parameters_typeO O7699 driver209)

		(index_action I1235 33096)
		(is_action I1235)
		(is_typeI I1235)
		(start_action I1235 "11/01/2017 05:02")
		(end_action I1235 "11/01/2017 09:34")
		(duration_action I1235 272)
		(parameters_typeI I1235 driver209)

		(index_action O7700 33097)
		(is_action O7700)
		(is_typeO O7700)
		(start_action O7700 "11/01/2017 09:37")
		(end_action O7700 "11/01/2017 09:39")
		(duration_action O7700 2)
		(parameters_typeO O7700 driver209)

		(index_action D12937 33098)
		(is_action D12937)
		(is_typeD D12937)
		(start_action D12937 "11/01/2017 09:39")
		(end_action D12937 "11/01/2017 12:22")
		(duration_action D12937 163)
		(parameters_typeD D12937 driver209)

		(index_action O7701 33099)
		(is_action O7701)
		(is_typeO O7701)
		(start_action O7701 "11/01/2017 12:22")
		(end_action O7701 "11/01/2017 12:29")
		(duration_action O7701 7)
		(parameters_typeO O7701 driver209)

		(index_action D12938 33100)
		(is_action D12938)
		(is_typeD D12938)
		(start_action D12938 "11/01/2017 12:29")
		(end_action D12938 "11/01/2017 12:30")
		(duration_action D12938 1)
		(parameters_typeD D12938 driver209)

		(index_action B11228 33101)
		(is_action B11228)
		(is_typeB B11228)
		(start_action B11228 "11/01/2017 12:30")
		(end_action B11228 "11/01/2017 12:46")
		(duration_action B11228 16)
		(parameters_typeB B11228 driver209)

		(index_action I1236 33102)
		(is_action I1236)
		(is_typeI I1236)
		(start_action I1236 "11/01/2017 12:50")
		(end_action I1236 "11/01/2017 14:41")
		(duration_action I1236 111)
		(parameters_typeI I1236 driver209)

		(index_action B11229 33103)
		(is_action B11229)
		(is_typeB B11229)
		(start_action B11229 "11/01/2017 14:41")
		(end_action B11229 "11/01/2017 23:49")
		(duration_action B11229 548)
		(parameters_typeB B11229 driver209)

		(index_action I1237 33104)
		(is_action I1237)
		(is_typeI I1237)
		(start_action I1237 "11/01/2017 23:49")
		(end_action I1237 "12/01/2017 03:54")
		(duration_action I1237 245)
		(parameters_typeI I1237 driver209)

		(index_action O7702 33105)
		(is_action O7702)
		(is_typeO O7702)
		(start_action O7702 "12/01/2017 03:57")
		(end_action O7702 "12/01/2017 03:59")
		(duration_action O7702 2)
		(parameters_typeO O7702 driver209)

		(index_action D12939 33106)
		(is_action D12939)
		(is_typeD D12939)
		(start_action D12939 "12/01/2017 03:59")
		(end_action D12939 "12/01/2017 08:21")
		(duration_action D12939 262)
		(parameters_typeD D12939 driver209)

		(index_action I1238 33107)
		(is_action I1238)
		(is_typeI I1238)
		(start_action I1238 "12/01/2017 08:25")
		(end_action I1238 "12/01/2017 10:37")
		(duration_action I1238 132)
		(parameters_typeI I1238 driver209)

		(index_action B11230 33108)
		(is_action B11230)
		(is_typeB B11230)
		(start_action B11230 "12/01/2017 10:37")
		(end_action B11230 "12/01/2017 10:54")
		(duration_action B11230 17)
		(parameters_typeB B11230 driver209)

		(index_action I1239 33109)
		(is_action I1239)
		(is_typeI I1239)
		(start_action I1239 "12/01/2017 10:54")
		(end_action I1239 "12/01/2017 12:52")
		(duration_action I1239 118)
		(parameters_typeI I1239 driver209)

		(index_action O7703 33110)
		(is_action O7703)
		(is_typeO O7703)
		(start_action O7703 "12/01/2017 12:55")
		(end_action O7703 "12/01/2017 12:56")
		(duration_action O7703 1)
		(parameters_typeO O7703 driver209)

		(index_action D12940 33111)
		(is_action D12940)
		(is_typeD D12940)
		(start_action D12940 "12/01/2017 12:56")
		(end_action D12940 "12/01/2017 14:08")
		(duration_action D12940 72)
		(parameters_typeD D12940 driver209)

		(index_action O7704 33112)
		(is_action O7704)
		(is_typeO O7704)
		(start_action O7704 "12/01/2017 14:08")
		(end_action O7704 "12/01/2017 14:12")
		(duration_action O7704 4)
		(parameters_typeO O7704 driver209)

		(index_action B11231 33113)
		(is_action B11231)
		(is_typeB B11231)
		(start_action B11231 "12/01/2017 14:12")
		(end_action B11231 "12/01/2017 14:15")
		(duration_action B11231 3)
		(parameters_typeB B11231 driver209)

		(index_action D12941 33114)
		(is_action D12941)
		(is_typeD D12941)
		(start_action D12941 "12/01/2017 14:15")
		(end_action D12941 "12/01/2017 14:16")
		(duration_action D12941 1)
		(parameters_typeD D12941 driver209)

		(index_action B11232 33115)
		(is_action B11232)
		(is_typeB B11232)
		(start_action B11232 "12/01/2017 14:16")
		(end_action B11232 "12/01/2017 18:12")
		(duration_action B11232 236)
		(parameters_typeB B11232 driver209)

		(index_action O7705 33116)
		(is_action O7705)
		(is_typeO O7705)
		(start_action O7705 "12/01/2017 18:12")
		(end_action O7705 "12/01/2017 18:24")
		(duration_action O7705 12)
		(parameters_typeO O7705 driver209)

		(index_action B11233 33117)
		(is_action B11233)
		(is_typeB B11233)
		(start_action B11233 "12/01/2017 18:24")
		(end_action B11233 "13/01/2017 03:36")
		(duration_action B11233 552)
		(parameters_typeB B11233 driver209)

		(index_action O7706 33118)
		(is_action O7706)
		(is_typeO O7706)
		(start_action O7706 "13/01/2017 03:36")
		(end_action O7706 "13/01/2017 03:41")
		(duration_action O7706 5)
		(parameters_typeO O7706 driver209)

		(index_action D12942 33119)
		(is_action D12942)
		(is_typeD D12942)
		(start_action D12942 "13/01/2017 03:41")
		(end_action D12942 "13/01/2017 07:58")
		(duration_action D12942 257)
		(parameters_typeD D12942 driver209)

		(index_action O7707 33120)
		(is_action O7707)
		(is_typeO O7707)
		(start_action O7707 "13/01/2017 07:58")
		(end_action O7707 "13/01/2017 07:59")
		(duration_action O7707 1)
		(parameters_typeO O7707 driver209)

		(index_action I1240 33121)
		(is_action I1240)
		(is_typeI I1240)
		(start_action I1240 "13/01/2017 08:03")
		(end_action I1240 "13/01/2017 12:20")
		(duration_action I1240 257)
		(parameters_typeI I1240 driver209)

		(index_action O7708 33122)
		(is_action O7708)
		(is_typeO O7708)
		(start_action O7708 "13/01/2017 12:22")
		(end_action O7708 "13/01/2017 12:23")
		(duration_action O7708 1)
		(parameters_typeO O7708 driver209)

		(index_action B11234 33123)
		(is_action B11234)
		(is_typeB B11234)
		(start_action B11234 "13/01/2017 12:23")
		(end_action B11234 "13/01/2017 12:57")
		(duration_action B11234 34)
		(parameters_typeB B11234 driver209)

		(index_action D12943 33124)
		(is_action D12943)
		(is_typeD D12943)
		(start_action D12943 "13/01/2017 12:57")
		(end_action D12943 "13/01/2017 17:03")
		(duration_action D12943 246)
		(parameters_typeD D12943 driver209)

		(index_action I1241 33125)
		(is_action I1241)
		(is_typeI I1241)
		(start_action I1241 "13/01/2017 17:07")
		(end_action I1241 "13/01/2017 17:45")
		(duration_action I1241 38)
		(parameters_typeI I1241 driver209)

		(index_action B11235 33126)
		(is_action B11235)
		(is_typeB B11235)
		(start_action B11235 "13/01/2017 17:45")
		(end_action B11235 "14/01/2017 02:59")
		(duration_action B11235 554)
		(parameters_typeB B11235 driver209)

		(index_action I1242 33127)
		(is_action I1242)
		(is_typeI I1242)
		(start_action I1242 "14/01/2017 02:59")
		(end_action I1242 "14/01/2017 07:09")
		(duration_action I1242 250)
		(parameters_typeI I1242 driver209)

		(index_action O7709 33128)
		(is_action O7709)
		(is_typeO O7709)
		(start_action O7709 "14/01/2017 07:12")
		(end_action O7709 "14/01/2017 07:21")
		(duration_action O7709 9)
		(parameters_typeO O7709 driver209)

		(index_action D12944 33129)
		(is_action D12944)
		(is_typeD D12944)
		(start_action D12944 "14/01/2017 07:21")
		(end_action D12944 "14/01/2017 08:13")
		(duration_action D12944 52)
		(parameters_typeD D12944 driver209)

		(index_action O7710 33130)
		(is_action O7710)
		(is_typeO O7710)
		(start_action O7710 "14/01/2017 08:13")
		(end_action O7710 "14/01/2017 08:28")
		(duration_action O7710 15)
		(parameters_typeO O7710 driver209)

		(index_action D12945 33131)
		(is_action D12945)
		(is_typeD D12945)
		(start_action D12945 "14/01/2017 08:28")
		(end_action D12945 "14/01/2017 08:29")
		(duration_action D12945 1)
		(parameters_typeD D12945 driver209)

		(index_action B11236 33132)
		(is_action B11236)
		(is_typeB B11236)
		(start_action B11236 "14/01/2017 08:29")
		(end_action B11236 "14/01/2017 09:09")
		(duration_action B11236 40)
		(parameters_typeB B11236 driver209)

		(index_action D12946 33133)
		(is_action D12946)
		(is_typeD D12946)
		(start_action D12946 "14/01/2017 09:09")
		(end_action D12946 "14/01/2017 09:10")
		(duration_action D12946 1)
		(parameters_typeD D12946 driver209)

		(index_action O7711 33134)
		(is_action O7711)
		(is_typeO O7711)
		(start_action O7711 "14/01/2017 09:10")
		(end_action O7711 "14/01/2017 09:12")
		(duration_action O7711 2)
		(parameters_typeO O7711 driver209)

		(index_action B11237 33135)
		(is_action B11237)
		(is_typeB B11237)
		(start_action B11237 "14/01/2017 09:12")
		(end_action B11237 "14/01/2017 09:40")
		(duration_action B11237 28)
		(parameters_typeB B11237 driver209)

		(index_action O7712 33136)
		(is_action O7712)
		(is_typeO O7712)
		(start_action O7712 "14/01/2017 09:40")
		(end_action O7712 "14/01/2017 09:45")
		(duration_action O7712 5)
		(parameters_typeO O7712 driver209)

		(index_action D12947 33137)
		(is_action D12947)
		(is_typeD D12947)
		(start_action D12947 "14/01/2017 09:45")
		(end_action D12947 "14/01/2017 13:03")
		(duration_action D12947 198)
		(parameters_typeD D12947 driver209)

		(index_action I1243 33138)
		(is_action I1243)
		(is_typeI I1243)
		(start_action I1243 "14/01/2017 13:07")
		(end_action I1243 "14/01/2017 16:42")
		(duration_action I1243 215)
		(parameters_typeI I1243 driver209)

		(index_action B11238 33139)
		(is_action B11238)
		(is_typeB B11238)
		(start_action B11238 "14/01/2017 16:42")
		(end_action B11238 "18/01/2017 08:32")
		(duration_action B11238 5270)
		(parameters_typeB B11238 driver209)

	)
	(:tasks-goal
		:tasks (
			(WD driver209)
		)
	)
)