(define (problem prueba0) (:domain GantaBi)
	(:customization
		(= :time-format "%d/%m/%Y %H:%M")
		(= :time-horizon-relative 86400) ;; que son los minutos que tienen 2 meses
		(= :time-start "01/01/2017 00:00")
		(= :time-unit :minutes)
	)
	(:objects
		driver247 - Driver

		D14714 D14715 D14716 D14717 D14718 D14719 D14720 D14721 D14722 D14723 D14724 D14725 D14726 D14727 D14728 D14729 D14730 D14731 D14732 D14733 D14734 D14735 D14736 D14737 D14738 D14739 D14740 D14741 D14742 D14743 D14744 D14745 D14746 D14747 D14748 D14749 D14750 D14751 D14752 D14753
 - TaskInstanceSymbol
		O8914 O8915 O8916 O8917 O8918 O8919 O8920 O8921 O8922 O8923 O8924 O8925 O8926 O8927 O8928 O8929 O8930 O8931 O8932 O8933
 - TaskInstanceSymbol
		B13098 B13099 B13100 B13101 B13102 B13103 B13104 B13105 B13106 B13107 B13108 B13109 B13110 B13111 B13112 B13113 B13114 B13115 B13116 B13117 B13118 B13119 B13120 B13121 B13122 B13123 B13124 B13125 B13126 B13127 B13128 B13129 B13130 B13131
 - TaskInstanceSymbol
		I1855 I1856 - TaskInstanceSymbol
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

		(= (current_index_action) 38577)

		(= (last_dr) "08/01/2017 06:06")
		(= (last_wr) "08/01/2017 06:06")
		(= (actual-timestamp) "08/01/2017 06:06")

		; Events
		(index_action B13098 38577)
		(is_action B13098)
		(is_typeB B13098)
		(start_action B13098 "08/01/2017 06:06")
		(end_action B13098 "08/01/2017 06:07")
		(duration_action B13098 1)
		(parameters_typeB B13098 driver247)

		(index_action O8914 38578)
		(is_action O8914)
		(is_typeO O8914)
		(start_action O8914 "08/01/2017 06:07")
		(end_action O8914 "08/01/2017 06:08")
		(duration_action O8914 1)
		(parameters_typeO O8914 driver247)

		(index_action B13099 38579)
		(is_action B13099)
		(is_typeB B13099)
		(start_action B13099 "08/01/2017 06:08")
		(end_action B13099 "08/01/2017 07:59")
		(duration_action B13099 111)
		(parameters_typeB B13099 driver247)

		(index_action D14714 38580)
		(is_action D14714)
		(is_typeD D14714)
		(start_action D14714 "08/01/2017 07:59")
		(end_action D14714 "08/01/2017 08:06")
		(duration_action D14714 7)
		(parameters_typeD D14714 driver247)

		(index_action O8915 38581)
		(is_action O8915)
		(is_typeO O8915)
		(start_action O8915 "08/01/2017 08:06")
		(end_action O8915 "08/01/2017 08:16")
		(duration_action O8915 10)
		(parameters_typeO O8915 driver247)

		(index_action B13100 38582)
		(is_action B13100)
		(is_typeB B13100)
		(start_action B13100 "08/01/2017 08:16")
		(end_action B13100 "08/01/2017 09:49")
		(duration_action B13100 93)
		(parameters_typeB B13100 driver247)

		(index_action D14715 38583)
		(is_action D14715)
		(is_typeD D14715)
		(start_action D14715 "08/01/2017 09:49")
		(end_action D14715 "08/01/2017 09:50")
		(duration_action D14715 1)
		(parameters_typeD D14715 driver247)

		(index_action O8916 38584)
		(is_action O8916)
		(is_typeO O8916)
		(start_action O8916 "08/01/2017 09:50")
		(end_action O8916 "08/01/2017 09:56")
		(duration_action O8916 6)
		(parameters_typeO O8916 driver247)

		(index_action D14716 38585)
		(is_action D14716)
		(is_typeD D14716)
		(start_action D14716 "08/01/2017 09:56")
		(end_action D14716 "08/01/2017 10:57")
		(duration_action D14716 61)
		(parameters_typeD D14716 driver247)

		(index_action O8917 38586)
		(is_action O8917)
		(is_typeO O8917)
		(start_action O8917 "08/01/2017 10:57")
		(end_action O8917 "08/01/2017 10:58")
		(duration_action O8917 1)
		(parameters_typeO O8917 driver247)

		(index_action B13101 38587)
		(is_action B13101)
		(is_typeB B13101)
		(start_action B13101 "08/01/2017 10:58")
		(end_action B13101 "10/01/2017 08:01")
		(duration_action B13101 2703)
		(parameters_typeB B13101 driver247)

		(index_action D14717 38588)
		(is_action D14717)
		(is_typeD D14717)
		(start_action D14717 "10/01/2017 08:01")
		(end_action D14717 "10/01/2017 08:59")
		(duration_action D14717 58)
		(parameters_typeD D14717 driver247)

		(index_action B13102 38589)
		(is_action B13102)
		(is_typeB B13102)
		(start_action B13102 "10/01/2017 08:59")
		(end_action B13102 "10/01/2017 09:00")
		(duration_action B13102 1)
		(parameters_typeB B13102 driver247)

		(index_action I1855 38590)
		(is_action I1855)
		(is_typeI I1855)
		(start_action I1855 "10/01/2017 09:03")
		(end_action I1855 "10/01/2017 09:09")
		(duration_action I1855 6)
		(parameters_typeI I1855 driver247)

		(index_action B13103 38591)
		(is_action B13103)
		(is_typeB B13103)
		(start_action B13103 "10/01/2017 09:09")
		(end_action B13103 "10/01/2017 10:22")
		(duration_action B13103 73)
		(parameters_typeB B13103 driver247)

		(index_action D14718 38592)
		(is_action D14718)
		(is_typeD D14718)
		(start_action D14718 "10/01/2017 10:22")
		(end_action D14718 "10/01/2017 12:05")
		(duration_action D14718 103)
		(parameters_typeD D14718 driver247)

		(index_action B13104 38593)
		(is_action B13104)
		(is_typeB B13104)
		(start_action B13104 "10/01/2017 12:05")
		(end_action B13104 "10/01/2017 12:58")
		(duration_action B13104 53)
		(parameters_typeB B13104 driver247)

		(index_action D14719 38594)
		(is_action D14719)
		(is_typeD D14719)
		(start_action D14719 "10/01/2017 12:58")
		(end_action D14719 "10/01/2017 13:04")
		(duration_action D14719 6)
		(parameters_typeD D14719 driver247)

		(index_action O8918 38595)
		(is_action O8918)
		(is_typeO O8918)
		(start_action O8918 "10/01/2017 13:04")
		(end_action O8918 "10/01/2017 13:06")
		(duration_action O8918 2)
		(parameters_typeO O8918 driver247)

		(index_action D14720 38596)
		(is_action D14720)
		(is_typeD D14720)
		(start_action D14720 "10/01/2017 13:06")
		(end_action D14720 "10/01/2017 13:09")
		(duration_action D14720 3)
		(parameters_typeD D14720 driver247)

		(index_action B13105 38597)
		(is_action B13105)
		(is_typeB B13105)
		(start_action B13105 "10/01/2017 13:09")
		(end_action B13105 "10/01/2017 13:19")
		(duration_action B13105 10)
		(parameters_typeB B13105 driver247)

		(index_action D14721 38598)
		(is_action D14721)
		(is_typeD D14721)
		(start_action D14721 "10/01/2017 13:19")
		(end_action D14721 "10/01/2017 13:29")
		(duration_action D14721 10)
		(parameters_typeD D14721 driver247)

		(index_action B13106 38599)
		(is_action B13106)
		(is_typeB B13106)
		(start_action B13106 "10/01/2017 13:29")
		(end_action B13106 "10/01/2017 13:34")
		(duration_action B13106 5)
		(parameters_typeB B13106 driver247)

		(index_action D14722 38600)
		(is_action D14722)
		(is_typeD D14722)
		(start_action D14722 "10/01/2017 13:34")
		(end_action D14722 "10/01/2017 13:42")
		(duration_action D14722 8)
		(parameters_typeD D14722 driver247)

		(index_action B13107 38601)
		(is_action B13107)
		(is_typeB B13107)
		(start_action B13107 "10/01/2017 13:42")
		(end_action B13107 "10/01/2017 14:37")
		(duration_action B13107 55)
		(parameters_typeB B13107 driver247)

		(index_action O8919 38602)
		(is_action O8919)
		(is_typeO O8919)
		(start_action O8919 "10/01/2017 14:37")
		(end_action O8919 "10/01/2017 14:40")
		(duration_action O8919 3)
		(parameters_typeO O8919 driver247)

		(index_action D14723 38603)
		(is_action D14723)
		(is_typeD D14723)
		(start_action D14723 "10/01/2017 14:40")
		(end_action D14723 "10/01/2017 14:41")
		(duration_action D14723 1)
		(parameters_typeD D14723 driver247)

		(index_action B13108 38604)
		(is_action B13108)
		(is_typeB B13108)
		(start_action B13108 "10/01/2017 14:41")
		(end_action B13108 "10/01/2017 15:19")
		(duration_action B13108 38)
		(parameters_typeB B13108 driver247)

		(index_action D14724 38605)
		(is_action D14724)
		(is_typeD D14724)
		(start_action D14724 "10/01/2017 15:19")
		(end_action D14724 "10/01/2017 16:01")
		(duration_action D14724 42)
		(parameters_typeD D14724 driver247)

		(index_action O8920 38606)
		(is_action O8920)
		(is_typeO O8920)
		(start_action O8920 "10/01/2017 16:01")
		(end_action O8920 "10/01/2017 16:04")
		(duration_action O8920 3)
		(parameters_typeO O8920 driver247)

		(index_action D14725 38607)
		(is_action D14725)
		(is_typeD D14725)
		(start_action D14725 "10/01/2017 16:04")
		(end_action D14725 "10/01/2017 18:52")
		(duration_action D14725 168)
		(parameters_typeD D14725 driver247)

		(index_action B13109 38608)
		(is_action B13109)
		(is_typeB B13109)
		(start_action B13109 "10/01/2017 18:52")
		(end_action B13109 "10/01/2017 19:27")
		(duration_action B13109 35)
		(parameters_typeB B13109 driver247)

		(index_action D14726 38609)
		(is_action D14726)
		(is_typeD D14726)
		(start_action D14726 "10/01/2017 19:27")
		(end_action D14726 "10/01/2017 22:19")
		(duration_action D14726 172)
		(parameters_typeD D14726 driver247)

		(index_action O8921 38610)
		(is_action O8921)
		(is_typeO O8921)
		(start_action O8921 "10/01/2017 22:19")
		(end_action O8921 "10/01/2017 22:24")
		(duration_action O8921 5)
		(parameters_typeO O8921 driver247)

		(index_action B13110 38611)
		(is_action B13110)
		(is_typeB B13110)
		(start_action B13110 "10/01/2017 22:24")
		(end_action B13110 "11/01/2017 08:22")
		(duration_action B13110 598)
		(parameters_typeB B13110 driver247)

		(index_action O8922 38612)
		(is_action O8922)
		(is_typeO O8922)
		(start_action O8922 "11/01/2017 08:22")
		(end_action O8922 "11/01/2017 08:31")
		(duration_action O8922 9)
		(parameters_typeO O8922 driver247)

		(index_action D14727 38613)
		(is_action D14727)
		(is_typeD D14727)
		(start_action D14727 "11/01/2017 08:31")
		(end_action D14727 "11/01/2017 12:16")
		(duration_action D14727 225)
		(parameters_typeD D14727 driver247)

		(index_action B13111 38614)
		(is_action B13111)
		(is_typeB B13111)
		(start_action B13111 "11/01/2017 12:16")
		(end_action B13111 "11/01/2017 13:11")
		(duration_action B13111 55)
		(parameters_typeB B13111 driver247)

		(index_action D14728 38615)
		(is_action D14728)
		(is_typeD D14728)
		(start_action D14728 "11/01/2017 13:11")
		(end_action D14728 "11/01/2017 14:07")
		(duration_action D14728 56)
		(parameters_typeD D14728 driver247)

		(index_action B13112 38616)
		(is_action B13112)
		(is_typeB B13112)
		(start_action B13112 "11/01/2017 14:07")
		(end_action B13112 "11/01/2017 14:23")
		(duration_action B13112 16)
		(parameters_typeB B13112 driver247)

		(index_action D14729 38617)
		(is_action D14729)
		(is_typeD D14729)
		(start_action D14729 "11/01/2017 14:23")
		(end_action D14729 "11/01/2017 14:40")
		(duration_action D14729 17)
		(parameters_typeD D14729 driver247)

		(index_action B13113 38618)
		(is_action B13113)
		(is_typeB B13113)
		(start_action B13113 "11/01/2017 14:40")
		(end_action B13113 "11/01/2017 14:50")
		(duration_action B13113 10)
		(parameters_typeB B13113 driver247)

		(index_action D14730 38619)
		(is_action D14730)
		(is_typeD D14730)
		(start_action D14730 "11/01/2017 14:50")
		(end_action D14730 "11/01/2017 17:15")
		(duration_action D14730 145)
		(parameters_typeD D14730 driver247)

		(index_action B13114 38620)
		(is_action B13114)
		(is_typeB B13114)
		(start_action B13114 "11/01/2017 17:15")
		(end_action B13114 "11/01/2017 17:48")
		(duration_action B13114 33)
		(parameters_typeB B13114 driver247)

		(index_action D14731 38621)
		(is_action D14731)
		(is_typeD D14731)
		(start_action D14731 "11/01/2017 17:48")
		(end_action D14731 "11/01/2017 18:55")
		(duration_action D14731 67)
		(parameters_typeD D14731 driver247)

		(index_action B13115 38622)
		(is_action B13115)
		(is_typeB B13115)
		(start_action B13115 "11/01/2017 18:55")
		(end_action B13115 "12/01/2017 03:58")
		(duration_action B13115 543)
		(parameters_typeB B13115 driver247)

		(index_action O8923 38623)
		(is_action O8923)
		(is_typeO O8923)
		(start_action O8923 "12/01/2017 03:58")
		(end_action O8923 "12/01/2017 04:01")
		(duration_action O8923 3)
		(parameters_typeO O8923 driver247)

		(index_action D14732 38624)
		(is_action D14732)
		(is_typeD D14732)
		(start_action D14732 "12/01/2017 04:01")
		(end_action D14732 "12/01/2017 04:32")
		(duration_action D14732 31)
		(parameters_typeD D14732 driver247)

		(index_action O8924 38625)
		(is_action O8924)
		(is_typeO O8924)
		(start_action O8924 "12/01/2017 04:32")
		(end_action O8924 "12/01/2017 04:40")
		(duration_action O8924 8)
		(parameters_typeO O8924 driver247)

		(index_action D14733 38626)
		(is_action D14733)
		(is_typeD D14733)
		(start_action D14733 "12/01/2017 04:40")
		(end_action D14733 "12/01/2017 04:41")
		(duration_action D14733 1)
		(parameters_typeD D14733 driver247)

		(index_action B13116 38627)
		(is_action B13116)
		(is_typeB B13116)
		(start_action B13116 "12/01/2017 04:41")
		(end_action B13116 "12/01/2017 05:02")
		(duration_action B13116 21)
		(parameters_typeB B13116 driver247)

		(index_action D14734 38628)
		(is_action D14734)
		(is_typeD D14734)
		(start_action D14734 "12/01/2017 05:02")
		(end_action D14734 "12/01/2017 05:03")
		(duration_action D14734 1)
		(parameters_typeD D14734 driver247)

		(index_action O8925 38629)
		(is_action O8925)
		(is_typeO O8925)
		(start_action O8925 "12/01/2017 05:03")
		(end_action O8925 "12/01/2017 05:09")
		(duration_action O8925 6)
		(parameters_typeO O8925 driver247)

		(index_action D14735 38630)
		(is_action D14735)
		(is_typeD D14735)
		(start_action D14735 "12/01/2017 05:09")
		(end_action D14735 "12/01/2017 05:10")
		(duration_action D14735 1)
		(parameters_typeD D14735 driver247)

		(index_action B13117 38631)
		(is_action B13117)
		(is_typeB B13117)
		(start_action B13117 "12/01/2017 05:10")
		(end_action B13117 "12/01/2017 06:01")
		(duration_action B13117 51)
		(parameters_typeB B13117 driver247)

		(index_action D14736 38632)
		(is_action D14736)
		(is_typeD D14736)
		(start_action D14736 "12/01/2017 06:01")
		(end_action D14736 "12/01/2017 06:02")
		(duration_action D14736 1)
		(parameters_typeD D14736 driver247)

		(index_action O8926 38633)
		(is_action O8926)
		(is_typeO O8926)
		(start_action O8926 "12/01/2017 06:02")
		(end_action O8926 "12/01/2017 06:21")
		(duration_action O8926 19)
		(parameters_typeO O8926 driver247)

		(index_action D14737 38634)
		(is_action D14737)
		(is_typeD D14737)
		(start_action D14737 "12/01/2017 06:21")
		(end_action D14737 "12/01/2017 07:14")
		(duration_action D14737 53)
		(parameters_typeD D14737 driver247)

		(index_action B13118 38635)
		(is_action B13118)
		(is_typeB B13118)
		(start_action B13118 "12/01/2017 07:14")
		(end_action B13118 "12/01/2017 07:46")
		(duration_action B13118 32)
		(parameters_typeB B13118 driver247)

		(index_action D14738 38636)
		(is_action D14738)
		(is_typeD D14738)
		(start_action D14738 "12/01/2017 07:46")
		(end_action D14738 "12/01/2017 09:34")
		(duration_action D14738 108)
		(parameters_typeD D14738 driver247)

		(index_action B13119 38637)
		(is_action B13119)
		(is_typeB B13119)
		(start_action B13119 "12/01/2017 09:34")
		(end_action B13119 "13/01/2017 16:06")
		(duration_action B13119 1832)
		(parameters_typeB B13119 driver247)

		(index_action O8927 38638)
		(is_action O8927)
		(is_typeO O8927)
		(start_action O8927 "13/01/2017 16:06")
		(end_action O8927 "13/01/2017 16:21")
		(duration_action O8927 15)
		(parameters_typeO O8927 driver247)

		(index_action D14739 38639)
		(is_action D14739)
		(is_typeD D14739)
		(start_action D14739 "13/01/2017 16:21")
		(end_action D14739 "13/01/2017 16:57")
		(duration_action D14739 36)
		(parameters_typeD D14739 driver247)

		(index_action B13120 38640)
		(is_action B13120)
		(is_typeB B13120)
		(start_action B13120 "13/01/2017 16:57")
		(end_action B13120 "13/01/2017 17:02")
		(duration_action B13120 5)
		(parameters_typeB B13120 driver247)

		(index_action D14740 38641)
		(is_action D14740)
		(is_typeD D14740)
		(start_action D14740 "13/01/2017 17:02")
		(end_action D14740 "13/01/2017 17:04")
		(duration_action D14740 2)
		(parameters_typeD D14740 driver247)

		(index_action B13121 38642)
		(is_action B13121)
		(is_typeB B13121)
		(start_action B13121 "13/01/2017 17:04")
		(end_action B13121 "13/01/2017 17:10")
		(duration_action B13121 6)
		(parameters_typeB B13121 driver247)

		(index_action D14741 38643)
		(is_action D14741)
		(is_typeD D14741)
		(start_action D14741 "13/01/2017 17:10")
		(end_action D14741 "13/01/2017 17:12")
		(duration_action D14741 2)
		(parameters_typeD D14741 driver247)

		(index_action O8928 38644)
		(is_action O8928)
		(is_typeO O8928)
		(start_action O8928 "13/01/2017 17:12")
		(end_action O8928 "13/01/2017 17:14")
		(duration_action O8928 2)
		(parameters_typeO O8928 driver247)

		(index_action B13122 38645)
		(is_action B13122)
		(is_typeB B13122)
		(start_action B13122 "13/01/2017 17:14")
		(end_action B13122 "13/01/2017 18:35")
		(duration_action B13122 81)
		(parameters_typeB B13122 driver247)

		(index_action O8929 38646)
		(is_action O8929)
		(is_typeO O8929)
		(start_action O8929 "13/01/2017 18:35")
		(end_action O8929 "13/01/2017 18:38")
		(duration_action O8929 3)
		(parameters_typeO O8929 driver247)

		(index_action D14742 38647)
		(is_action D14742)
		(is_typeD D14742)
		(start_action D14742 "13/01/2017 18:38")
		(end_action D14742 "13/01/2017 18:40")
		(duration_action D14742 2)
		(parameters_typeD D14742 driver247)

		(index_action O8930 38648)
		(is_action O8930)
		(is_typeO O8930)
		(start_action O8930 "13/01/2017 18:40")
		(end_action O8930 "13/01/2017 19:11")
		(duration_action O8930 31)
		(parameters_typeO O8930 driver247)

		(index_action D14743 38649)
		(is_action D14743)
		(is_typeD D14743)
		(start_action D14743 "13/01/2017 19:11")
		(end_action D14743 "13/01/2017 22:12")
		(duration_action D14743 181)
		(parameters_typeD D14743 driver247)

		(index_action B13123 38650)
		(is_action B13123)
		(is_typeB B13123)
		(start_action B13123 "13/01/2017 22:12")
		(end_action B13123 "13/01/2017 23:01")
		(duration_action B13123 49)
		(parameters_typeB B13123 driver247)

		(index_action D14744 38651)
		(is_action D14744)
		(is_typeD D14744)
		(start_action D14744 "13/01/2017 23:01")
		(end_action D14744 "14/01/2017 02:01")
		(duration_action D14744 180)
		(parameters_typeD D14744 driver247)

		(index_action I1856 38652)
		(is_action I1856)
		(is_typeI I1856)
		(start_action I1856 "14/01/2017 02:01")
		(end_action I1856 "14/01/2017 02:03")
		(duration_action I1856 2)
		(parameters_typeI I1856 driver247)

		(index_action B13124 38653)
		(is_action B13124)
		(is_typeB B13124)
		(start_action B13124 "14/01/2017 02:03")
		(end_action B13124 "14/01/2017 11:06")
		(duration_action B13124 543)
		(parameters_typeB B13124 driver247)

		(index_action O8931 38654)
		(is_action O8931)
		(is_typeO O8931)
		(start_action O8931 "14/01/2017 11:06")
		(end_action O8931 "14/01/2017 11:11")
		(duration_action O8931 5)
		(parameters_typeO O8931 driver247)

		(index_action D14745 38655)
		(is_action D14745)
		(is_typeD D14745)
		(start_action D14745 "14/01/2017 11:11")
		(end_action D14745 "14/01/2017 13:10")
		(duration_action D14745 119)
		(parameters_typeD D14745 driver247)

		(index_action B13125 38656)
		(is_action B13125)
		(is_typeB B13125)
		(start_action B13125 "14/01/2017 13:10")
		(end_action B13125 "14/01/2017 13:31")
		(duration_action B13125 21)
		(parameters_typeB B13125 driver247)

		(index_action D14746 38657)
		(is_action D14746)
		(is_typeD D14746)
		(start_action D14746 "14/01/2017 13:31")
		(end_action D14746 "14/01/2017 15:21")
		(duration_action D14746 110)
		(parameters_typeD D14746 driver247)

		(index_action B13126 38658)
		(is_action B13126)
		(is_typeB B13126)
		(start_action B13126 "14/01/2017 15:21")
		(end_action B13126 "14/01/2017 15:56")
		(duration_action B13126 35)
		(parameters_typeB B13126 driver247)

		(index_action D14747 38659)
		(is_action D14747)
		(is_typeD D14747)
		(start_action D14747 "14/01/2017 15:56")
		(end_action D14747 "14/01/2017 16:26")
		(duration_action D14747 30)
		(parameters_typeD D14747 driver247)

		(index_action O8932 38660)
		(is_action O8932)
		(is_typeO O8932)
		(start_action O8932 "14/01/2017 16:26")
		(end_action O8932 "14/01/2017 16:28")
		(duration_action O8932 2)
		(parameters_typeO O8932 driver247)

		(index_action D14748 38661)
		(is_action D14748)
		(is_typeD D14748)
		(start_action D14748 "14/01/2017 16:28")
		(end_action D14748 "14/01/2017 16:35")
		(duration_action D14748 7)
		(parameters_typeD D14748 driver247)

		(index_action B13127 38662)
		(is_action B13127)
		(is_typeB B13127)
		(start_action B13127 "14/01/2017 16:35")
		(end_action B13127 "14/01/2017 16:44")
		(duration_action B13127 9)
		(parameters_typeB B13127 driver247)

		(index_action D14749 38663)
		(is_action D14749)
		(is_typeD D14749)
		(start_action D14749 "14/01/2017 16:44")
		(end_action D14749 "14/01/2017 18:34")
		(duration_action D14749 110)
		(parameters_typeD D14749 driver247)

		(index_action B13128 38664)
		(is_action B13128)
		(is_typeB B13128)
		(start_action B13128 "14/01/2017 18:34")
		(end_action B13128 "14/01/2017 19:04")
		(duration_action B13128 30)
		(parameters_typeB B13128 driver247)

		(index_action D14750 38665)
		(is_action D14750)
		(is_typeD D14750)
		(start_action D14750 "14/01/2017 19:04")
		(end_action D14750 "14/01/2017 19:08")
		(duration_action D14750 4)
		(parameters_typeD D14750 driver247)

		(index_action B13129 38666)
		(is_action B13129)
		(is_typeB B13129)
		(start_action B13129 "14/01/2017 19:08")
		(end_action B13129 "14/01/2017 19:41")
		(duration_action B13129 33)
		(parameters_typeB B13129 driver247)

		(index_action D14751 38667)
		(is_action D14751)
		(is_typeD D14751)
		(start_action D14751 "14/01/2017 19:41")
		(end_action D14751 "14/01/2017 21:18")
		(duration_action D14751 97)
		(parameters_typeD D14751 driver247)

		(index_action B13130 38668)
		(is_action B13130)
		(is_typeB B13130)
		(start_action B13130 "14/01/2017 21:18")
		(end_action B13130 "14/01/2017 21:23")
		(duration_action B13130 5)
		(parameters_typeB B13130 driver247)

		(index_action D14752 38669)
		(is_action D14752)
		(is_typeD D14752)
		(start_action D14752 "14/01/2017 21:23")
		(end_action D14752 "14/01/2017 23:06")
		(duration_action D14752 103)
		(parameters_typeD D14752 driver247)

		(index_action O8933 38670)
		(is_action O8933)
		(is_typeO O8933)
		(start_action O8933 "14/01/2017 23:06")
		(end_action O8933 "14/01/2017 23:09")
		(duration_action O8933 3)
		(parameters_typeO O8933 driver247)

		(index_action D14753 38671)
		(is_action D14753)
		(is_typeD D14753)
		(start_action D14753 "14/01/2017 23:09")
		(end_action D14753 "14/01/2017 23:20")
		(duration_action D14753 11)
		(parameters_typeD D14753 driver247)

		(index_action B13131 38672)
		(is_action B13131)
		(is_typeB B13131)
		(start_action B13131 "14/01/2017 23:20")
		(end_action B13131 "16/01/2017 06:23")
		(duration_action B13131 1863)
		(parameters_typeB B13131 driver247)

	)
	(:tasks-goal
		:tasks (
			(WD driver247)
		)
	)
)