(define (problem prueba0) (:domain GantaBi)
	(:customization
		(= :time-format "%d/%m/%Y %H:%M")
		(= :time-horizon-relative 86400) ;; que son los minutos que tienen 2 meses
		(= :time-start "01/01/2017 00:00")
		(= :time-unit :minutes)
	)
	(:objects
		driver283 - Driver

		D16196 D16197 D16198 D16199 D16200 D16201 D16202 D16203 D16204 D16205 D16206 D16207 D16208 D16209 D16210 D16211 D16212 D16213 D16214 D16215 D16216 D16217 D16218 D16219 D16220 D16221 D16222 D16223 D16224 D16225 D16226 D16227 D16228 D16229 D16230 D16231 D16232 D16233 D16234 D16235 D16236 D16237 D16238 D16239 D16240 D16241 D16242 D16243 D16244 D16245 D16246 D16247 D16248 D16249 D16250 D16251 D16252 D16253 D16254 D16255 D16256 D16257 D16258 D16259 D16260 D16261 D16262 D16263 D16264 D16265 D16266 D16267 D16268 D16269
 - TaskInstanceSymbol
		O9792 O9793 O9794 O9795 O9796 O9797 O9798 O9799 O9800 O9801 O9802 O9803 O9804 O9805 O9806 O9807 O9808 O9809
 - TaskInstanceSymbol
		B14688 B14689 B14690 B14691 B14692 B14693 B14694 B14695 B14696 B14697 B14698 B14699 B14700 B14701 B14702 B14703 B14704 B14705 B14706 B14707 B14708 B14709 B14710 B14711 B14712 B14713 B14714 B14715 B14716 B14717 B14718 B14719 B14720 B14721 B14722 B14723 B14724 B14725 B14726 B14727 B14728 B14729 B14730 B14731 B14732 B14733 B14734 B14735 B14736 B14737 B14738 B14739 B14740 B14741 B14742 B14743 B14744 B14745 B14746 B14747 B14748 B14749 B14750 B14751 B14752 B14753 B14754 B14755 B14756 B14757
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

		(= (current_index_action) 42925)

		(= (last_dr) "02/01/2017 19:34")
		(= (last_wr) "02/01/2017 19:34")
		(= (actual-timestamp) "02/01/2017 19:34")

		; Events
		(index_action B14688 42925)
		(is_action B14688)
		(is_typeB B14688)
		(start_action B14688 "02/01/2017 19:34")
		(end_action B14688 "02/01/2017 19:38")
		(duration_action B14688 4)
		(parameters_typeB B14688 driver283)

		(index_action D16196 42926)
		(is_action D16196)
		(is_typeD D16196)
		(start_action D16196 "02/01/2017 19:38")
		(end_action D16196 "02/01/2017 19:49")
		(duration_action D16196 11)
		(parameters_typeD D16196 driver283)

		(index_action B14689 42927)
		(is_action B14689)
		(is_typeB B14689)
		(start_action B14689 "02/01/2017 19:49")
		(end_action B14689 "02/01/2017 20:36")
		(duration_action B14689 47)
		(parameters_typeB B14689 driver283)

		(index_action D16197 42928)
		(is_action D16197)
		(is_typeD D16197)
		(start_action D16197 "02/01/2017 20:36")
		(end_action D16197 "03/01/2017 00:40")
		(duration_action D16197 244)
		(parameters_typeD D16197 driver283)

		(index_action B14690 42929)
		(is_action B14690)
		(is_typeB B14690)
		(start_action B14690 "03/01/2017 00:40")
		(end_action B14690 "03/01/2017 01:26")
		(duration_action B14690 46)
		(parameters_typeB B14690 driver283)

		(index_action D16198 42930)
		(is_action D16198)
		(is_typeD D16198)
		(start_action D16198 "03/01/2017 01:26")
		(end_action D16198 "03/01/2017 04:40")
		(duration_action D16198 194)
		(parameters_typeD D16198 driver283)

		(index_action B14691 42931)
		(is_action B14691)
		(is_typeB B14691)
		(start_action B14691 "03/01/2017 04:40")
		(end_action B14691 "03/01/2017 04:43")
		(duration_action B14691 3)
		(parameters_typeB B14691 driver283)

		(index_action D16199 42932)
		(is_action D16199)
		(is_typeD D16199)
		(start_action D16199 "03/01/2017 04:43")
		(end_action D16199 "03/01/2017 04:46")
		(duration_action D16199 3)
		(parameters_typeD D16199 driver283)

		(index_action O9792 42933)
		(is_action O9792)
		(is_typeO O9792)
		(start_action O9792 "03/01/2017 04:46")
		(end_action O9792 "03/01/2017 04:49")
		(duration_action O9792 3)
		(parameters_typeO O9792 driver283)

		(index_action B14692 42934)
		(is_action B14692)
		(is_typeB B14692)
		(start_action B14692 "03/01/2017 04:49")
		(end_action B14692 "03/01/2017 13:52")
		(duration_action B14692 543)
		(parameters_typeB B14692 driver283)

		(index_action D16200 42935)
		(is_action D16200)
		(is_typeD D16200)
		(start_action D16200 "03/01/2017 13:52")
		(end_action D16200 "03/01/2017 18:03")
		(duration_action D16200 251)
		(parameters_typeD D16200 driver283)

		(index_action B14693 42936)
		(is_action B14693)
		(is_typeB B14693)
		(start_action B14693 "03/01/2017 18:03")
		(end_action B14693 "03/01/2017 19:01")
		(duration_action B14693 58)
		(parameters_typeB B14693 driver283)

		(index_action D16201 42937)
		(is_action D16201)
		(is_typeD D16201)
		(start_action D16201 "03/01/2017 19:01")
		(end_action D16201 "03/01/2017 21:33")
		(duration_action D16201 152)
		(parameters_typeD D16201 driver283)

		(index_action B14694 42938)
		(is_action B14694)
		(is_typeB B14694)
		(start_action B14694 "03/01/2017 21:33")
		(end_action B14694 "03/01/2017 21:38")
		(duration_action B14694 5)
		(parameters_typeB B14694 driver283)

		(index_action D16202 42939)
		(is_action D16202)
		(is_typeD D16202)
		(start_action D16202 "03/01/2017 21:38")
		(end_action D16202 "03/01/2017 21:39")
		(duration_action D16202 1)
		(parameters_typeD D16202 driver283)

		(index_action B14695 42940)
		(is_action B14695)
		(is_typeB B14695)
		(start_action B14695 "03/01/2017 21:39")
		(end_action B14695 "04/01/2017 08:41")
		(duration_action B14695 662)
		(parameters_typeB B14695 driver283)

		(index_action D16203 42941)
		(is_action D16203)
		(is_typeD D16203)
		(start_action D16203 "04/01/2017 08:41")
		(end_action D16203 "04/01/2017 08:42")
		(duration_action D16203 1)
		(parameters_typeD D16203 driver283)

		(index_action B14696 42942)
		(is_action B14696)
		(is_typeB B14696)
		(start_action B14696 "04/01/2017 08:42")
		(end_action B14696 "04/01/2017 08:47")
		(duration_action B14696 5)
		(parameters_typeB B14696 driver283)

		(index_action D16204 42943)
		(is_action D16204)
		(is_typeD D16204)
		(start_action D16204 "04/01/2017 08:47")
		(end_action D16204 "04/01/2017 08:49")
		(duration_action D16204 2)
		(parameters_typeD D16204 driver283)

		(index_action B14697 42944)
		(is_action B14697)
		(is_typeB B14697)
		(start_action B14697 "04/01/2017 08:49")
		(end_action B14697 "04/01/2017 09:00")
		(duration_action B14697 11)
		(parameters_typeB B14697 driver283)

		(index_action D16205 42945)
		(is_action D16205)
		(is_typeD D16205)
		(start_action D16205 "04/01/2017 09:00")
		(end_action D16205 "04/01/2017 09:06")
		(duration_action D16205 6)
		(parameters_typeD D16205 driver283)

		(index_action O9793 42946)
		(is_action O9793)
		(is_typeO O9793)
		(start_action O9793 "04/01/2017 09:06")
		(end_action O9793 "04/01/2017 09:09")
		(duration_action O9793 3)
		(parameters_typeO O9793 driver283)

		(index_action B14698 42947)
		(is_action B14698)
		(is_typeB B14698)
		(start_action B14698 "04/01/2017 09:09")
		(end_action B14698 "04/01/2017 09:43")
		(duration_action B14698 34)
		(parameters_typeB B14698 driver283)

		(index_action D16206 42948)
		(is_action D16206)
		(is_typeD D16206)
		(start_action D16206 "04/01/2017 09:43")
		(end_action D16206 "04/01/2017 09:53")
		(duration_action D16206 10)
		(parameters_typeD D16206 driver283)

		(index_action O9794 42949)
		(is_action O9794)
		(is_typeO O9794)
		(start_action O9794 "04/01/2017 09:53")
		(end_action O9794 "04/01/2017 09:55")
		(duration_action O9794 2)
		(parameters_typeO O9794 driver283)

		(index_action B14699 42950)
		(is_action B14699)
		(is_typeB B14699)
		(start_action B14699 "04/01/2017 09:55")
		(end_action B14699 "04/01/2017 10:12")
		(duration_action B14699 17)
		(parameters_typeB B14699 driver283)

		(index_action D16207 42951)
		(is_action D16207)
		(is_typeD D16207)
		(start_action D16207 "04/01/2017 10:12")
		(end_action D16207 "04/01/2017 10:14")
		(duration_action D16207 2)
		(parameters_typeD D16207 driver283)

		(index_action B14700 42952)
		(is_action B14700)
		(is_typeB B14700)
		(start_action B14700 "04/01/2017 10:14")
		(end_action B14700 "04/01/2017 10:35")
		(duration_action B14700 21)
		(parameters_typeB B14700 driver283)

		(index_action D16208 42953)
		(is_action D16208)
		(is_typeD D16208)
		(start_action D16208 "04/01/2017 10:35")
		(end_action D16208 "04/01/2017 10:36")
		(duration_action D16208 1)
		(parameters_typeD D16208 driver283)

		(index_action B14701 42954)
		(is_action B14701)
		(is_typeB B14701)
		(start_action B14701 "04/01/2017 10:36")
		(end_action B14701 "04/01/2017 10:38")
		(duration_action B14701 2)
		(parameters_typeB B14701 driver283)

		(index_action D16209 42955)
		(is_action D16209)
		(is_typeD D16209)
		(start_action D16209 "04/01/2017 10:38")
		(end_action D16209 "04/01/2017 10:40")
		(duration_action D16209 2)
		(parameters_typeD D16209 driver283)

		(index_action B14702 42956)
		(is_action B14702)
		(is_typeB B14702)
		(start_action B14702 "04/01/2017 10:40")
		(end_action B14702 "04/01/2017 10:46")
		(duration_action B14702 6)
		(parameters_typeB B14702 driver283)

		(index_action D16210 42957)
		(is_action D16210)
		(is_typeD D16210)
		(start_action D16210 "04/01/2017 10:46")
		(end_action D16210 "04/01/2017 10:47")
		(duration_action D16210 1)
		(parameters_typeD D16210 driver283)

		(index_action B14703 42958)
		(is_action B14703)
		(is_typeB B14703)
		(start_action B14703 "04/01/2017 10:47")
		(end_action B14703 "04/01/2017 11:25")
		(duration_action B14703 38)
		(parameters_typeB B14703 driver283)

		(index_action D16211 42959)
		(is_action D16211)
		(is_typeD D16211)
		(start_action D16211 "04/01/2017 11:25")
		(end_action D16211 "04/01/2017 11:38")
		(duration_action D16211 13)
		(parameters_typeD D16211 driver283)

		(index_action B14704 42960)
		(is_action B14704)
		(is_typeB B14704)
		(start_action B14704 "04/01/2017 11:38")
		(end_action B14704 "04/01/2017 11:43")
		(duration_action B14704 5)
		(parameters_typeB B14704 driver283)

		(index_action D16212 42961)
		(is_action D16212)
		(is_typeD D16212)
		(start_action D16212 "04/01/2017 11:43")
		(end_action D16212 "04/01/2017 11:45")
		(duration_action D16212 2)
		(parameters_typeD D16212 driver283)

		(index_action O9795 42962)
		(is_action O9795)
		(is_typeO O9795)
		(start_action O9795 "04/01/2017 11:45")
		(end_action O9795 "04/01/2017 11:47")
		(duration_action O9795 2)
		(parameters_typeO O9795 driver283)

		(index_action B14705 42963)
		(is_action B14705)
		(is_typeB B14705)
		(start_action B14705 "04/01/2017 11:47")
		(end_action B14705 "04/01/2017 12:13")
		(duration_action B14705 26)
		(parameters_typeB B14705 driver283)

		(index_action O9796 42964)
		(is_action O9796)
		(is_typeO O9796)
		(start_action O9796 "04/01/2017 12:13")
		(end_action O9796 "04/01/2017 12:16")
		(duration_action O9796 3)
		(parameters_typeO O9796 driver283)

		(index_action B14706 42965)
		(is_action B14706)
		(is_typeB B14706)
		(start_action B14706 "04/01/2017 12:16")
		(end_action B14706 "04/01/2017 12:21")
		(duration_action B14706 5)
		(parameters_typeB B14706 driver283)

		(index_action D16213 42966)
		(is_action D16213)
		(is_typeD D16213)
		(start_action D16213 "04/01/2017 12:21")
		(end_action D16213 "04/01/2017 12:46")
		(duration_action D16213 25)
		(parameters_typeD D16213 driver283)

		(index_action B14707 42967)
		(is_action B14707)
		(is_typeB B14707)
		(start_action B14707 "04/01/2017 12:46")
		(end_action B14707 "04/01/2017 12:48")
		(duration_action B14707 2)
		(parameters_typeB B14707 driver283)

		(index_action D16214 42968)
		(is_action D16214)
		(is_typeD D16214)
		(start_action D16214 "04/01/2017 12:48")
		(end_action D16214 "04/01/2017 12:57")
		(duration_action D16214 9)
		(parameters_typeD D16214 driver283)

		(index_action B14708 42969)
		(is_action B14708)
		(is_typeB B14708)
		(start_action B14708 "04/01/2017 12:57")
		(end_action B14708 "04/01/2017 13:37")
		(duration_action B14708 40)
		(parameters_typeB B14708 driver283)

		(index_action D16215 42970)
		(is_action D16215)
		(is_typeD D16215)
		(start_action D16215 "04/01/2017 13:37")
		(end_action D16215 "04/01/2017 14:03")
		(duration_action D16215 26)
		(parameters_typeD D16215 driver283)

		(index_action B14709 42971)
		(is_action B14709)
		(is_typeB B14709)
		(start_action B14709 "04/01/2017 14:03")
		(end_action B14709 "04/01/2017 14:07")
		(duration_action B14709 4)
		(parameters_typeB B14709 driver283)

		(index_action D16216 42972)
		(is_action D16216)
		(is_typeD D16216)
		(start_action D16216 "04/01/2017 14:07")
		(end_action D16216 "04/01/2017 14:08")
		(duration_action D16216 1)
		(parameters_typeD D16216 driver283)

		(index_action O9797 42973)
		(is_action O9797)
		(is_typeO O9797)
		(start_action O9797 "04/01/2017 14:08")
		(end_action O9797 "04/01/2017 14:09")
		(duration_action O9797 1)
		(parameters_typeO O9797 driver283)

		(index_action B14710 42974)
		(is_action B14710)
		(is_typeB B14710)
		(start_action B14710 "04/01/2017 14:09")
		(end_action B14710 "04/01/2017 14:17")
		(duration_action B14710 8)
		(parameters_typeB B14710 driver283)

		(index_action D16217 42975)
		(is_action D16217)
		(is_typeD D16217)
		(start_action D16217 "04/01/2017 14:17")
		(end_action D16217 "04/01/2017 14:18")
		(duration_action D16217 1)
		(parameters_typeD D16217 driver283)

		(index_action B14711 42976)
		(is_action B14711)
		(is_typeB B14711)
		(start_action B14711 "04/01/2017 14:18")
		(end_action B14711 "05/01/2017 22:21")
		(duration_action B14711 1923)
		(parameters_typeB B14711 driver283)

		(index_action D16218 42977)
		(is_action D16218)
		(is_typeD D16218)
		(start_action D16218 "05/01/2017 22:21")
		(end_action D16218 "05/01/2017 22:22")
		(duration_action D16218 1)
		(parameters_typeD D16218 driver283)

		(index_action B14712 42978)
		(is_action B14712)
		(is_typeB B14712)
		(start_action B14712 "05/01/2017 22:22")
		(end_action B14712 "05/01/2017 22:43")
		(duration_action B14712 21)
		(parameters_typeB B14712 driver283)

		(index_action D16219 42979)
		(is_action D16219)
		(is_typeD D16219)
		(start_action D16219 "05/01/2017 22:43")
		(end_action D16219 "05/01/2017 22:46")
		(duration_action D16219 3)
		(parameters_typeD D16219 driver283)

		(index_action B14713 42980)
		(is_action B14713)
		(is_typeB B14713)
		(start_action B14713 "05/01/2017 22:46")
		(end_action B14713 "05/01/2017 23:51")
		(duration_action B14713 65)
		(parameters_typeB B14713 driver283)

		(index_action D16220 42981)
		(is_action D16220)
		(is_typeD D16220)
		(start_action D16220 "05/01/2017 23:51")
		(end_action D16220 "06/01/2017 01:40")
		(duration_action D16220 109)
		(parameters_typeD D16220 driver283)

		(index_action B14714 42982)
		(is_action B14714)
		(is_typeB B14714)
		(start_action B14714 "06/01/2017 01:40")
		(end_action B14714 "06/01/2017 01:56")
		(duration_action B14714 16)
		(parameters_typeB B14714 driver283)

		(index_action D16221 42983)
		(is_action D16221)
		(is_typeD D16221)
		(start_action D16221 "06/01/2017 01:56")
		(end_action D16221 "06/01/2017 03:50")
		(duration_action D16221 114)
		(parameters_typeD D16221 driver283)

		(index_action B14715 42984)
		(is_action B14715)
		(is_typeB B14715)
		(start_action B14715 "06/01/2017 03:50")
		(end_action B14715 "06/01/2017 04:22")
		(duration_action B14715 32)
		(parameters_typeB B14715 driver283)

		(index_action D16222 42985)
		(is_action D16222)
		(is_typeD D16222)
		(start_action D16222 "06/01/2017 04:22")
		(end_action D16222 "06/01/2017 05:09")
		(duration_action D16222 47)
		(parameters_typeD D16222 driver283)

		(index_action B14716 42986)
		(is_action B14716)
		(is_typeB B14716)
		(start_action B14716 "06/01/2017 05:09")
		(end_action B14716 "06/01/2017 05:30")
		(duration_action B14716 21)
		(parameters_typeB B14716 driver283)

		(index_action D16223 42987)
		(is_action D16223)
		(is_typeD D16223)
		(start_action D16223 "06/01/2017 05:30")
		(end_action D16223 "06/01/2017 07:43")
		(duration_action D16223 133)
		(parameters_typeD D16223 driver283)

		(index_action B14717 42988)
		(is_action B14717)
		(is_typeB B14717)
		(start_action B14717 "06/01/2017 07:43")
		(end_action B14717 "06/01/2017 18:44")
		(duration_action B14717 661)
		(parameters_typeB B14717 driver283)

		(index_action D16224 42989)
		(is_action D16224)
		(is_typeD D16224)
		(start_action D16224 "06/01/2017 18:44")
		(end_action D16224 "06/01/2017 21:11")
		(duration_action D16224 147)
		(parameters_typeD D16224 driver283)

		(index_action B14718 42990)
		(is_action B14718)
		(is_typeB B14718)
		(start_action B14718 "06/01/2017 21:11")
		(end_action B14718 "07/01/2017 06:40")
		(duration_action B14718 569)
		(parameters_typeB B14718 driver283)

		(index_action D16225 42991)
		(is_action D16225)
		(is_typeD D16225)
		(start_action D16225 "07/01/2017 06:40")
		(end_action D16225 "07/01/2017 06:41")
		(duration_action D16225 1)
		(parameters_typeD D16225 driver283)

		(index_action B14719 42992)
		(is_action B14719)
		(is_typeB B14719)
		(start_action B14719 "07/01/2017 06:41")
		(end_action B14719 "07/01/2017 06:44")
		(duration_action B14719 3)
		(parameters_typeB B14719 driver283)

		(index_action D16226 42993)
		(is_action D16226)
		(is_typeD D16226)
		(start_action D16226 "07/01/2017 06:44")
		(end_action D16226 "07/01/2017 11:04")
		(duration_action D16226 260)
		(parameters_typeD D16226 driver283)

		(index_action B14720 42994)
		(is_action B14720)
		(is_typeB B14720)
		(start_action B14720 "07/01/2017 11:04")
		(end_action B14720 "07/01/2017 11:50")
		(duration_action B14720 46)
		(parameters_typeB B14720 driver283)

		(index_action D16227 42995)
		(is_action D16227)
		(is_typeD D16227)
		(start_action D16227 "07/01/2017 11:50")
		(end_action D16227 "07/01/2017 12:26")
		(duration_action D16227 36)
		(parameters_typeD D16227 driver283)

		(index_action B14721 42996)
		(is_action B14721)
		(is_typeB B14721)
		(start_action B14721 "07/01/2017 12:26")
		(end_action B14721 "08/01/2017 06:26")
		(duration_action B14721 1080)
		(parameters_typeB B14721 driver283)

		(index_action D16228 42997)
		(is_action D16228)
		(is_typeD D16228)
		(start_action D16228 "08/01/2017 06:26")
		(end_action D16228 "08/01/2017 06:28")
		(duration_action D16228 2)
		(parameters_typeD D16228 driver283)

		(index_action B14722 42998)
		(is_action B14722)
		(is_typeB B14722)
		(start_action B14722 "08/01/2017 06:28")
		(end_action B14722 "08/01/2017 06:31")
		(duration_action B14722 3)
		(parameters_typeB B14722 driver283)

		(index_action O9798 42999)
		(is_action O9798)
		(is_typeO O9798)
		(start_action O9798 "08/01/2017 06:31")
		(end_action O9798 "08/01/2017 06:32")
		(duration_action O9798 1)
		(parameters_typeO O9798 driver283)

		(index_action D16229 43000)
		(is_action D16229)
		(is_typeD D16229)
		(start_action D16229 "08/01/2017 06:32")
		(end_action D16229 "08/01/2017 06:45")
		(duration_action D16229 13)
		(parameters_typeD D16229 driver283)

		(index_action B14723 43001)
		(is_action B14723)
		(is_typeB B14723)
		(start_action B14723 "08/01/2017 06:45")
		(end_action B14723 "08/01/2017 08:25")
		(duration_action B14723 100)
		(parameters_typeB B14723 driver283)

		(index_action D16230 43002)
		(is_action D16230)
		(is_typeD D16230)
		(start_action D16230 "08/01/2017 08:25")
		(end_action D16230 "08/01/2017 08:36")
		(duration_action D16230 11)
		(parameters_typeD D16230 driver283)

		(index_action O9799 43003)
		(is_action O9799)
		(is_typeO O9799)
		(start_action O9799 "08/01/2017 08:36")
		(end_action O9799 "08/01/2017 08:38")
		(duration_action O9799 2)
		(parameters_typeO O9799 driver283)

		(index_action D16231 43004)
		(is_action D16231)
		(is_typeD D16231)
		(start_action D16231 "08/01/2017 08:38")
		(end_action D16231 "08/01/2017 08:39")
		(duration_action D16231 1)
		(parameters_typeD D16231 driver283)

		(index_action B14724 43005)
		(is_action B14724)
		(is_typeB B14724)
		(start_action B14724 "08/01/2017 08:39")
		(end_action B14724 "08/01/2017 18:06")
		(duration_action B14724 567)
		(parameters_typeB B14724 driver283)

		(index_action D16232 43006)
		(is_action D16232)
		(is_typeD D16232)
		(start_action D16232 "08/01/2017 18:06")
		(end_action D16232 "08/01/2017 18:07")
		(duration_action D16232 1)
		(parameters_typeD D16232 driver283)

		(index_action O9800 43007)
		(is_action O9800)
		(is_typeO O9800)
		(start_action O9800 "08/01/2017 18:07")
		(end_action O9800 "08/01/2017 18:09")
		(duration_action O9800 2)
		(parameters_typeO O9800 driver283)

		(index_action D16233 43008)
		(is_action D16233)
		(is_typeD D16233)
		(start_action D16233 "08/01/2017 18:09")
		(end_action D16233 "08/01/2017 18:15")
		(duration_action D16233 6)
		(parameters_typeD D16233 driver283)

		(index_action B14725 43009)
		(is_action B14725)
		(is_typeB B14725)
		(start_action B14725 "08/01/2017 18:15")
		(end_action B14725 "08/01/2017 18:21")
		(duration_action B14725 6)
		(parameters_typeB B14725 driver283)

		(index_action D16234 43010)
		(is_action D16234)
		(is_typeD D16234)
		(start_action D16234 "08/01/2017 18:21")
		(end_action D16234 "08/01/2017 18:22")
		(duration_action D16234 1)
		(parameters_typeD D16234 driver283)

		(index_action B14726 43011)
		(is_action B14726)
		(is_typeB B14726)
		(start_action B14726 "08/01/2017 18:22")
		(end_action B14726 "08/01/2017 19:12")
		(duration_action B14726 50)
		(parameters_typeB B14726 driver283)

		(index_action D16235 43012)
		(is_action D16235)
		(is_typeD D16235)
		(start_action D16235 "08/01/2017 19:12")
		(end_action D16235 "08/01/2017 19:22")
		(duration_action D16235 10)
		(parameters_typeD D16235 driver283)

		(index_action B14727 43013)
		(is_action B14727)
		(is_typeB B14727)
		(start_action B14727 "10/01/2017 21:44")
		(end_action B14727 "10/01/2017 21:46")
		(duration_action B14727 2)
		(parameters_typeB B14727 driver283)

		(index_action D16236 43014)
		(is_action D16236)
		(is_typeD D16236)
		(start_action D16236 "10/01/2017 21:46")
		(end_action D16236 "10/01/2017 21:57")
		(duration_action D16236 11)
		(parameters_typeD D16236 driver283)

		(index_action B14728 43015)
		(is_action B14728)
		(is_typeB B14728)
		(start_action B14728 "10/01/2017 21:57")
		(end_action B14728 "10/01/2017 22:01")
		(duration_action B14728 4)
		(parameters_typeB B14728 driver283)

		(index_action O9801 43016)
		(is_action O9801)
		(is_typeO O9801)
		(start_action O9801 "10/01/2017 22:01")
		(end_action O9801 "10/01/2017 22:03")
		(duration_action O9801 2)
		(parameters_typeO O9801 driver283)

		(index_action B14729 43017)
		(is_action B14729)
		(is_typeB B14729)
		(start_action B14729 "10/01/2017 22:03")
		(end_action B14729 "10/01/2017 22:08")
		(duration_action B14729 5)
		(parameters_typeB B14729 driver283)

		(index_action D16237 43018)
		(is_action D16237)
		(is_typeD D16237)
		(start_action D16237 "10/01/2017 22:08")
		(end_action D16237 "10/01/2017 22:09")
		(duration_action D16237 1)
		(parameters_typeD D16237 driver283)

		(index_action B14730 43019)
		(is_action B14730)
		(is_typeB B14730)
		(start_action B14730 "10/01/2017 22:09")
		(end_action B14730 "10/01/2017 22:12")
		(duration_action B14730 3)
		(parameters_typeB B14730 driver283)

		(index_action D16238 43020)
		(is_action D16238)
		(is_typeD D16238)
		(start_action D16238 "10/01/2017 22:12")
		(end_action D16238 "10/01/2017 22:22")
		(duration_action D16238 10)
		(parameters_typeD D16238 driver283)

		(index_action B14731 43021)
		(is_action B14731)
		(is_typeB B14731)
		(start_action B14731 "10/01/2017 22:22")
		(end_action B14731 "10/01/2017 23:27")
		(duration_action B14731 65)
		(parameters_typeB B14731 driver283)

		(index_action D16239 43022)
		(is_action D16239)
		(is_typeD D16239)
		(start_action D16239 "10/01/2017 23:27")
		(end_action D16239 "10/01/2017 23:30")
		(duration_action D16239 3)
		(parameters_typeD D16239 driver283)

		(index_action O9802 43023)
		(is_action O9802)
		(is_typeO O9802)
		(start_action O9802 "10/01/2017 23:30")
		(end_action O9802 "10/01/2017 23:32")
		(duration_action O9802 2)
		(parameters_typeO O9802 driver283)

		(index_action D16240 43024)
		(is_action D16240)
		(is_typeD D16240)
		(start_action D16240 "10/01/2017 23:32")
		(end_action D16240 "10/01/2017 23:43")
		(duration_action D16240 11)
		(parameters_typeD D16240 driver283)

		(index_action B14732 43025)
		(is_action B14732)
		(is_typeB B14732)
		(start_action B14732 "10/01/2017 23:43")
		(end_action B14732 "10/01/2017 23:52")
		(duration_action B14732 9)
		(parameters_typeB B14732 driver283)

		(index_action D16241 43026)
		(is_action D16241)
		(is_typeD D16241)
		(start_action D16241 "10/01/2017 23:52")
		(end_action D16241 "11/01/2017 01:35")
		(duration_action D16241 103)
		(parameters_typeD D16241 driver283)

		(index_action B14733 43027)
		(is_action B14733)
		(is_typeB B14733)
		(start_action B14733 "11/01/2017 01:35")
		(end_action B14733 "11/01/2017 02:22")
		(duration_action B14733 47)
		(parameters_typeB B14733 driver283)

		(index_action D16242 43028)
		(is_action D16242)
		(is_typeD D16242)
		(start_action D16242 "11/01/2017 02:22")
		(end_action D16242 "11/01/2017 06:19")
		(duration_action D16242 237)
		(parameters_typeD D16242 driver283)

		(index_action B14734 43029)
		(is_action B14734)
		(is_typeB B14734)
		(start_action B14734 "11/01/2017 06:19")
		(end_action B14734 "11/01/2017 15:23")
		(duration_action B14734 544)
		(parameters_typeB B14734 driver283)

		(index_action D16243 43030)
		(is_action D16243)
		(is_typeD D16243)
		(start_action D16243 "11/01/2017 15:23")
		(end_action D16243 "11/01/2017 19:10")
		(duration_action D16243 227)
		(parameters_typeD D16243 driver283)

		(index_action B14735 43031)
		(is_action B14735)
		(is_typeB B14735)
		(start_action B14735 "11/01/2017 19:10")
		(end_action B14735 "11/01/2017 19:30")
		(duration_action B14735 20)
		(parameters_typeB B14735 driver283)

		(index_action D16244 43032)
		(is_action D16244)
		(is_typeD D16244)
		(start_action D16244 "11/01/2017 19:30")
		(end_action D16244 "11/01/2017 19:59")
		(duration_action D16244 29)
		(parameters_typeD D16244 driver283)

		(index_action B14736 43033)
		(is_action B14736)
		(is_typeB B14736)
		(start_action B14736 "11/01/2017 19:59")
		(end_action B14736 "11/01/2017 20:30")
		(duration_action B14736 31)
		(parameters_typeB B14736 driver283)

		(index_action D16245 43034)
		(is_action D16245)
		(is_typeD D16245)
		(start_action D16245 "11/01/2017 20:30")
		(end_action D16245 "12/01/2017 00:24")
		(duration_action D16245 234)
		(parameters_typeD D16245 driver283)

		(index_action B14737 43035)
		(is_action B14737)
		(is_typeB B14737)
		(start_action B14737 "12/01/2017 00:24")
		(end_action B14737 "12/01/2017 09:25")
		(duration_action B14737 541)
		(parameters_typeB B14737 driver283)

		(index_action D16246 43036)
		(is_action D16246)
		(is_typeD D16246)
		(start_action D16246 "12/01/2017 09:25")
		(end_action D16246 "12/01/2017 11:49")
		(duration_action D16246 144)
		(parameters_typeD D16246 driver283)

		(index_action B14738 43037)
		(is_action B14738)
		(is_typeB B14738)
		(start_action B14738 "12/01/2017 11:49")
		(end_action B14738 "12/01/2017 12:16")
		(duration_action B14738 27)
		(parameters_typeB B14738 driver283)

		(index_action D16247 43038)
		(is_action D16247)
		(is_typeD D16247)
		(start_action D16247 "12/01/2017 12:16")
		(end_action D16247 "12/01/2017 12:21")
		(duration_action D16247 5)
		(parameters_typeD D16247 driver283)

		(index_action B14739 43039)
		(is_action B14739)
		(is_typeB B14739)
		(start_action B14739 "12/01/2017 12:21")
		(end_action B14739 "12/01/2017 12:24")
		(duration_action B14739 3)
		(parameters_typeB B14739 driver283)

		(index_action O9803 43040)
		(is_action O9803)
		(is_typeO O9803)
		(start_action O9803 "12/01/2017 12:24")
		(end_action O9803 "12/01/2017 12:25")
		(duration_action O9803 1)
		(parameters_typeO O9803 driver283)

		(index_action D16248 43041)
		(is_action D16248)
		(is_typeD D16248)
		(start_action D16248 "12/01/2017 12:25")
		(end_action D16248 "12/01/2017 12:26")
		(duration_action D16248 1)
		(parameters_typeD D16248 driver283)

		(index_action B14740 43042)
		(is_action B14740)
		(is_typeB B14740)
		(start_action B14740 "12/01/2017 12:26")
		(end_action B14740 "12/01/2017 13:01")
		(duration_action B14740 35)
		(parameters_typeB B14740 driver283)

		(index_action D16249 43043)
		(is_action D16249)
		(is_typeD D16249)
		(start_action D16249 "12/01/2017 13:01")
		(end_action D16249 "12/01/2017 13:02")
		(duration_action D16249 1)
		(parameters_typeD D16249 driver283)

		(index_action B14741 43044)
		(is_action B14741)
		(is_typeB B14741)
		(start_action B14741 "12/01/2017 13:02")
		(end_action B14741 "12/01/2017 13:15")
		(duration_action B14741 13)
		(parameters_typeB B14741 driver283)

		(index_action O9804 43045)
		(is_action O9804)
		(is_typeO O9804)
		(start_action O9804 "12/01/2017 13:15")
		(end_action O9804 "12/01/2017 13:17")
		(duration_action O9804 2)
		(parameters_typeO O9804 driver283)

		(index_action D16250 43046)
		(is_action D16250)
		(is_typeD D16250)
		(start_action D16250 "12/01/2017 13:17")
		(end_action D16250 "12/01/2017 13:52")
		(duration_action D16250 35)
		(parameters_typeD D16250 driver283)

		(index_action B14742 43047)
		(is_action B14742)
		(is_typeB B14742)
		(start_action B14742 "12/01/2017 13:52")
		(end_action B14742 "12/01/2017 14:15")
		(duration_action B14742 23)
		(parameters_typeB B14742 driver283)

		(index_action D16251 43048)
		(is_action D16251)
		(is_typeD D16251)
		(start_action D16251 "12/01/2017 14:15")
		(end_action D16251 "12/01/2017 14:16")
		(duration_action D16251 1)
		(parameters_typeD D16251 driver283)

		(index_action B14743 43049)
		(is_action B14743)
		(is_typeB B14743)
		(start_action B14743 "12/01/2017 14:16")
		(end_action B14743 "12/01/2017 15:34")
		(duration_action B14743 78)
		(parameters_typeB B14743 driver283)

		(index_action D16252 43050)
		(is_action D16252)
		(is_typeD D16252)
		(start_action D16252 "12/01/2017 15:34")
		(end_action D16252 "12/01/2017 18:14")
		(duration_action D16252 160)
		(parameters_typeD D16252 driver283)

		(index_action B14744 43051)
		(is_action B14744)
		(is_typeB B14744)
		(start_action B14744 "12/01/2017 18:14")
		(end_action B14744 "12/01/2017 19:16")
		(duration_action B14744 62)
		(parameters_typeB B14744 driver283)

		(index_action D16253 43052)
		(is_action D16253)
		(is_typeD D16253)
		(start_action D16253 "12/01/2017 19:16")
		(end_action D16253 "12/01/2017 21:45")
		(duration_action D16253 149)
		(parameters_typeD D16253 driver283)

		(index_action B14745 43053)
		(is_action B14745)
		(is_typeB B14745)
		(start_action B14745 "12/01/2017 21:45")
		(end_action B14745 "13/01/2017 12:13")
		(duration_action B14745 868)
		(parameters_typeB B14745 driver283)

		(index_action D16254 43054)
		(is_action D16254)
		(is_typeD D16254)
		(start_action D16254 "13/01/2017 12:13")
		(end_action D16254 "13/01/2017 12:18")
		(duration_action D16254 5)
		(parameters_typeD D16254 driver283)

		(index_action O9805 43055)
		(is_action O9805)
		(is_typeO O9805)
		(start_action O9805 "13/01/2017 12:18")
		(end_action O9805 "13/01/2017 12:19")
		(duration_action O9805 1)
		(parameters_typeO O9805 driver283)

		(index_action B14746 43056)
		(is_action B14746)
		(is_typeB B14746)
		(start_action B14746 "13/01/2017 12:19")
		(end_action B14746 "13/01/2017 13:33")
		(duration_action B14746 74)
		(parameters_typeB B14746 driver283)

		(index_action D16255 43057)
		(is_action D16255)
		(is_typeD D16255)
		(start_action D16255 "13/01/2017 13:33")
		(end_action D16255 "13/01/2017 13:37")
		(duration_action D16255 4)
		(parameters_typeD D16255 driver283)

		(index_action O9806 43058)
		(is_action O9806)
		(is_typeO O9806)
		(start_action O9806 "13/01/2017 13:37")
		(end_action O9806 "13/01/2017 13:39")
		(duration_action O9806 2)
		(parameters_typeO O9806 driver283)

		(index_action D16256 43059)
		(is_action D16256)
		(is_typeD D16256)
		(start_action D16256 "13/01/2017 13:39")
		(end_action D16256 "13/01/2017 14:51")
		(duration_action D16256 72)
		(parameters_typeD D16256 driver283)

		(index_action B14747 43060)
		(is_action B14747)
		(is_typeB B14747)
		(start_action B14747 "13/01/2017 14:51")
		(end_action B14747 "13/01/2017 15:40")
		(duration_action B14747 49)
		(parameters_typeB B14747 driver283)

		(index_action D16257 43061)
		(is_action D16257)
		(is_typeD D16257)
		(start_action D16257 "13/01/2017 15:40")
		(end_action D16257 "13/01/2017 19:32")
		(duration_action D16257 232)
		(parameters_typeD D16257 driver283)

		(index_action B14748 43062)
		(is_action B14748)
		(is_typeB B14748)
		(start_action B14748 "13/01/2017 19:32")
		(end_action B14748 "13/01/2017 20:20")
		(duration_action B14748 48)
		(parameters_typeB B14748 driver283)

		(index_action D16258 43063)
		(is_action D16258)
		(is_typeD D16258)
		(start_action D16258 "13/01/2017 20:20")
		(end_action D16258 "13/01/2017 22:22")
		(duration_action D16258 122)
		(parameters_typeD D16258 driver283)

		(index_action B14749 43064)
		(is_action B14749)
		(is_typeB B14749)
		(start_action B14749 "13/01/2017 22:22")
		(end_action B14749 "14/01/2017 09:24")
		(duration_action B14749 662)
		(parameters_typeB B14749 driver283)

		(index_action D16259 43065)
		(is_action D16259)
		(is_typeD D16259)
		(start_action D16259 "14/01/2017 09:24")
		(end_action D16259 "14/01/2017 09:27")
		(duration_action D16259 3)
		(parameters_typeD D16259 driver283)

		(index_action O9807 43066)
		(is_action O9807)
		(is_typeO O9807)
		(start_action O9807 "14/01/2017 09:27")
		(end_action O9807 "14/01/2017 09:30")
		(duration_action O9807 3)
		(parameters_typeO O9807 driver283)

		(index_action D16260 43067)
		(is_action D16260)
		(is_typeD D16260)
		(start_action D16260 "14/01/2017 09:30")
		(end_action D16260 "14/01/2017 11:21")
		(duration_action D16260 111)
		(parameters_typeD D16260 driver283)

		(index_action B14750 43068)
		(is_action B14750)
		(is_typeB B14750)
		(start_action B14750 "14/01/2017 11:21")
		(end_action B14750 "14/01/2017 12:09")
		(duration_action B14750 48)
		(parameters_typeB B14750 driver283)

		(index_action D16261 43069)
		(is_action D16261)
		(is_typeD D16261)
		(start_action D16261 "14/01/2017 12:09")
		(end_action D16261 "14/01/2017 12:58")
		(duration_action D16261 49)
		(parameters_typeD D16261 driver283)

		(index_action B14751 43070)
		(is_action B14751)
		(is_typeB B14751)
		(start_action B14751 "14/01/2017 12:58")
		(end_action B14751 "14/01/2017 13:00")
		(duration_action B14751 2)
		(parameters_typeB B14751 driver283)

		(index_action D16262 43071)
		(is_action D16262)
		(is_typeD D16262)
		(start_action D16262 "14/01/2017 13:00")
		(end_action D16262 "14/01/2017 14:59")
		(duration_action D16262 119)
		(parameters_typeD D16262 driver283)

		(index_action B14752 43072)
		(is_action B14752)
		(is_typeB B14752)
		(start_action B14752 "14/01/2017 14:59")
		(end_action B14752 "15/01/2017 07:16")
		(duration_action B14752 977)
		(parameters_typeB B14752 driver283)

		(index_action D16263 43073)
		(is_action D16263)
		(is_typeD D16263)
		(start_action D16263 "15/01/2017 07:16")
		(end_action D16263 "15/01/2017 07:29")
		(duration_action D16263 13)
		(parameters_typeD D16263 driver283)

		(index_action B14753 43074)
		(is_action B14753)
		(is_typeB B14753)
		(start_action B14753 "15/01/2017 07:29")
		(end_action B14753 "15/01/2017 08:10")
		(duration_action B14753 41)
		(parameters_typeB B14753 driver283)

		(index_action D16264 43075)
		(is_action D16264)
		(is_typeD D16264)
		(start_action D16264 "15/01/2017 08:10")
		(end_action D16264 "15/01/2017 08:22")
		(duration_action D16264 12)
		(parameters_typeD D16264 driver283)

		(index_action O9808 43076)
		(is_action O9808)
		(is_typeO O9808)
		(start_action O9808 "15/01/2017 08:22")
		(end_action O9808 "15/01/2017 08:25")
		(duration_action O9808 3)
		(parameters_typeO O9808 driver283)

		(index_action D16265 43077)
		(is_action D16265)
		(is_typeD D16265)
		(start_action D16265 "15/01/2017 08:25")
		(end_action D16265 "15/01/2017 08:27")
		(duration_action D16265 2)
		(parameters_typeD D16265 driver283)

		(index_action B14754 43078)
		(is_action B14754)
		(is_typeB B14754)
		(start_action B14754 "15/01/2017 08:27")
		(end_action B14754 "15/01/2017 17:49")
		(duration_action B14754 562)
		(parameters_typeB B14754 driver283)

		(index_action D16266 43079)
		(is_action D16266)
		(is_typeD D16266)
		(start_action D16266 "15/01/2017 17:49")
		(end_action D16266 "15/01/2017 17:59")
		(duration_action D16266 10)
		(parameters_typeD D16266 driver283)

		(index_action O9809 43080)
		(is_action O9809)
		(is_typeO O9809)
		(start_action O9809 "15/01/2017 17:59")
		(end_action O9809 "15/01/2017 18:02")
		(duration_action O9809 3)
		(parameters_typeO O9809 driver283)

		(index_action D16267 43081)
		(is_action D16267)
		(is_typeD D16267)
		(start_action D16267 "15/01/2017 18:02")
		(end_action D16267 "15/01/2017 18:04")
		(duration_action D16267 2)
		(parameters_typeD D16267 driver283)

		(index_action B14755 43082)
		(is_action B14755)
		(is_typeB B14755)
		(start_action B14755 "15/01/2017 18:04")
		(end_action B14755 "15/01/2017 18:09")
		(duration_action B14755 5)
		(parameters_typeB B14755 driver283)

		(index_action D16268 43083)
		(is_action D16268)
		(is_typeD D16268)
		(start_action D16268 "15/01/2017 18:09")
		(end_action D16268 "15/01/2017 18:10")
		(duration_action D16268 1)
		(parameters_typeD D16268 driver283)

		(index_action B14756 43084)
		(is_action B14756)
		(is_typeB B14756)
		(start_action B14756 "15/01/2017 18:10")
		(end_action B14756 "15/01/2017 18:29")
		(duration_action B14756 19)
		(parameters_typeB B14756 driver283)

		(index_action D16269 43085)
		(is_action D16269)
		(is_typeD D16269)
		(start_action D16269 "15/01/2017 18:29")
		(end_action D16269 "15/01/2017 18:43")
		(duration_action D16269 14)
		(parameters_typeD D16269 driver283)

		(index_action B14757 43086)
		(is_action B14757)
		(is_typeB B14757)
		(start_action B14757 "15/01/2017 18:43")
		(end_action B14757 "15/01/2017 18:44")
		(duration_action B14757 1)
		(parameters_typeB B14757 driver283)

	)
	(:tasks-goal
		:tasks (
			(WD driver283)
		)
	)
)