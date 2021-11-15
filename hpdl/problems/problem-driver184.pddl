(define (problem prueba0) (:domain GantaBi)
	(:customization
		(= :time-format "%d/%m/%Y %H:%M")
		(= :time-horizon-relative 86400) ;; que son los minutos que tienen 2 meses
		(= :time-start "01/01/2017 00:00")
		(= :time-unit :minutes)
	)
	(:objects
		driver184 - Driver

		D11658 D11659 D11660 D11661 D11662 D11663 D11664 D11665 D11666 D11667 D11668 D11669 D11670 D11671 D11672 D11673 D11674 D11675 D11676 D11677 D11678 D11679 D11680 D11681 D11682 D11683 D11684 D11685 D11686 D11687 D11688 D11689 D11690 D11691 D11692 D11693 D11694 D11695 D11696 D11697 D11698 D11699
 - TaskInstanceSymbol
		O6859 O6860 O6861 O6862 O6863 O6864 O6865 O6866 O6867 O6868 O6869 O6870 O6871 O6872 O6873 O6874 O6875 O6876 O6877 O6878 O6879 O6880 O6881 O6882
 - TaskInstanceSymbol
		B9853 B9854 B9855 B9856 B9857 B9858 B9859 B9860 B9861 B9862 B9863 B9864 B9865 B9866 B9867 B9868 B9869 B9870 B9871 B9872 B9873 B9874 B9875 B9876 B9877 B9878 B9879 B9880 B9881 B9882 B9883 B9884 B9885 B9886 B9887 B9888 B9889 B9890 B9891 B9892 B9893 B9894 B9895 B9896 B9897 B9898 B9899 B9900 B9901 B9902 B9903 B9904 B9905 B9906 B9907 B9908 B9909 B9910 B9911 B9912 B9913 B9914 B9915 B9916 B9917
 - TaskInstanceSymbol
		I845 I846 I847 I848 I849 I850 I851 I852 I853 I854 I855 I856 I857 I858 I859 I860 I861 I862 I863 I864 I865 I866 I867 I868 I869 I870 I871 I872 I873 - TaskInstanceSymbol
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

		(= (current_index_action) 29211)

		(= (last_dr) "04/01/2017 09:03")
		(= (last_wr) "04/01/2017 09:03")
		(= (actual-timestamp) "04/01/2017 09:03")

		; Events
		(index_action B9853 29211)
		(is_action B9853)
		(is_typeB B9853)
		(start_action B9853 "04/01/2017 09:03")
		(end_action B9853 "04/01/2017 17:55")
		(duration_action B9853 532)
		(parameters_typeB B9853 driver184)

		(index_action D11658 29212)
		(is_action D11658)
		(is_typeD D11658)
		(start_action D11658 "04/01/2017 17:55")
		(end_action D11658 "04/01/2017 18:07")
		(duration_action D11658 12)
		(parameters_typeD D11658 driver184)

		(index_action O6859 29213)
		(is_action O6859)
		(is_typeO O6859)
		(start_action O6859 "04/01/2017 18:07")
		(end_action O6859 "04/01/2017 18:10")
		(duration_action O6859 3)
		(parameters_typeO O6859 driver184)

		(index_action D11659 29214)
		(is_action D11659)
		(is_typeD D11659)
		(start_action D11659 "04/01/2017 18:10")
		(end_action D11659 "04/01/2017 18:11")
		(duration_action D11659 1)
		(parameters_typeD D11659 driver184)

		(index_action O6860 29215)
		(is_action O6860)
		(is_typeO O6860)
		(start_action O6860 "04/01/2017 18:11")
		(end_action O6860 "04/01/2017 18:16")
		(duration_action O6860 5)
		(parameters_typeO O6860 driver184)

		(index_action D11660 29216)
		(is_action D11660)
		(is_typeD D11660)
		(start_action D11660 "04/01/2017 18:16")
		(end_action D11660 "04/01/2017 22:29")
		(duration_action D11660 253)
		(parameters_typeD D11660 driver184)

		(index_action I845 29217)
		(is_action I845)
		(is_typeI I845)
		(start_action I845 "04/01/2017 22:34")
		(end_action I845 "05/01/2017 02:55")
		(duration_action I845 261)
		(parameters_typeI I845 driver184)

		(index_action B9854 29218)
		(is_action B9854)
		(is_typeB B9854)
		(start_action B9854 "05/01/2017 02:55")
		(end_action B9854 "05/01/2017 02:56")
		(duration_action B9854 1)
		(parameters_typeB B9854 driver184)

		(index_action B9855 29219)
		(is_action B9855)
		(is_typeB B9855)
		(start_action B9855 "05/01/2017 02:58")
		(end_action B9855 "05/01/2017 03:00")
		(duration_action B9855 2)
		(parameters_typeB B9855 driver184)

		(index_action D11661 29220)
		(is_action D11661)
		(is_typeD D11661)
		(start_action D11661 "05/01/2017 03:00")
		(end_action D11661 "05/01/2017 03:06")
		(duration_action D11661 6)
		(parameters_typeD D11661 driver184)

		(index_action B9856 29221)
		(is_action B9856)
		(is_typeB B9856)
		(start_action B9856 "05/01/2017 03:06")
		(end_action B9856 "05/01/2017 03:16")
		(duration_action B9856 10)
		(parameters_typeB B9856 driver184)

		(index_action D11662 29222)
		(is_action D11662)
		(is_typeD D11662)
		(start_action D11662 "05/01/2017 03:16")
		(end_action D11662 "05/01/2017 05:43")
		(duration_action D11662 147)
		(parameters_typeD D11662 driver184)

		(index_action B9857 29223)
		(is_action B9857)
		(is_typeB B9857)
		(start_action B9857 "05/01/2017 05:43")
		(end_action B9857 "05/01/2017 05:51")
		(duration_action B9857 8)
		(parameters_typeB B9857 driver184)

		(index_action D11663 29224)
		(is_action D11663)
		(is_typeD D11663)
		(start_action D11663 "05/01/2017 05:51")
		(end_action D11663 "05/01/2017 07:33")
		(duration_action D11663 102)
		(parameters_typeD D11663 driver184)

		(index_action I846 29225)
		(is_action I846)
		(is_typeI I846)
		(start_action I846 "05/01/2017 07:38")
		(end_action I846 "05/01/2017 11:14")
		(duration_action I846 216)
		(parameters_typeI I846 driver184)

		(index_action B9858 29226)
		(is_action B9858)
		(is_typeB B9858)
		(start_action B9858 "05/01/2017 11:14")
		(end_action B9858 "05/01/2017 11:31")
		(duration_action B9858 17)
		(parameters_typeB B9858 driver184)

		(index_action I847 29227)
		(is_action I847)
		(is_typeI I847)
		(start_action I847 "05/01/2017 11:31")
		(end_action I847 "05/01/2017 12:09")
		(duration_action I847 38)
		(parameters_typeI I847 driver184)

		(index_action B9859 29228)
		(is_action B9859)
		(is_typeB B9859)
		(start_action B9859 "05/01/2017 12:09")
		(end_action B9859 "05/01/2017 12:26")
		(duration_action B9859 17)
		(parameters_typeB B9859 driver184)

		(index_action I848 29229)
		(is_action I848)
		(is_typeI I848)
		(start_action I848 "05/01/2017 12:26")
		(end_action I848 "05/01/2017 12:37")
		(duration_action I848 11)
		(parameters_typeI I848 driver184)

		(index_action B9860 29230)
		(is_action B9860)
		(is_typeB B9860)
		(start_action B9860 "05/01/2017 12:37")
		(end_action B9860 "05/01/2017 14:18")
		(duration_action B9860 101)
		(parameters_typeB B9860 driver184)

		(index_action I849 29231)
		(is_action I849)
		(is_typeI I849)
		(start_action I849 "05/01/2017 14:18")
		(end_action I849 "05/01/2017 14:27")
		(duration_action I849 9)
		(parameters_typeI I849 driver184)

		(index_action B9861 29232)
		(is_action B9861)
		(is_typeB B9861)
		(start_action B9861 "05/01/2017 14:27")
		(end_action B9861 "05/01/2017 14:40")
		(duration_action B9861 13)
		(parameters_typeB B9861 driver184)

		(index_action I850 29233)
		(is_action I850)
		(is_typeI I850)
		(start_action I850 "05/01/2017 14:40")
		(end_action I850 "05/01/2017 14:42")
		(duration_action I850 2)
		(parameters_typeI I850 driver184)

		(index_action B9862 29234)
		(is_action B9862)
		(is_typeB B9862)
		(start_action B9862 "05/01/2017 14:42")
		(end_action B9862 "06/01/2017 19:05")
		(duration_action B9862 1703)
		(parameters_typeB B9862 driver184)

		(index_action I851 29235)
		(is_action I851)
		(is_typeI I851)
		(start_action I851 "06/01/2017 19:05")
		(end_action I851 "06/01/2017 20:01")
		(duration_action I851 56)
		(parameters_typeI I851 driver184)

		(index_action B9863 29236)
		(is_action B9863)
		(is_typeB B9863)
		(start_action B9863 "06/01/2017 20:01")
		(end_action B9863 "06/01/2017 20:13")
		(duration_action B9863 12)
		(parameters_typeB B9863 driver184)

		(index_action I852 29237)
		(is_action I852)
		(is_typeI I852)
		(start_action I852 "06/01/2017 20:13")
		(end_action I852 "06/01/2017 23:49")
		(duration_action I852 216)
		(parameters_typeI I852 driver184)

		(index_action B9864 29238)
		(is_action B9864)
		(is_typeB B9864)
		(start_action B9864 "06/01/2017 23:49")
		(end_action B9864 "06/01/2017 23:50")
		(duration_action B9864 1)
		(parameters_typeB B9864 driver184)

		(index_action B9865 29239)
		(is_action B9865)
		(is_typeB B9865)
		(start_action B9865 "06/01/2017 23:52")
		(end_action B9865 "07/01/2017 00:04")
		(duration_action B9865 12)
		(parameters_typeB B9865 driver184)

		(index_action D11664 29240)
		(is_action D11664)
		(is_typeD D11664)
		(start_action D11664 "07/01/2017 00:04")
		(end_action D11664 "07/01/2017 03:56")
		(duration_action D11664 232)
		(parameters_typeD D11664 driver184)

		(index_action B9866 29241)
		(is_action B9866)
		(is_typeB B9866)
		(start_action B9866 "07/01/2017 03:56")
		(end_action B9866 "07/01/2017 03:57")
		(duration_action B9866 1)
		(parameters_typeB B9866 driver184)

		(index_action B9867 29242)
		(is_action B9867)
		(is_typeB B9867)
		(start_action B9867 "07/01/2017 04:01")
		(end_action B9867 "07/01/2017 04:08")
		(duration_action B9867 7)
		(parameters_typeB B9867 driver184)

		(index_action I853 29243)
		(is_action I853)
		(is_typeI I853)
		(start_action I853 "07/01/2017 04:08")
		(end_action I853 "07/01/2017 08:23")
		(duration_action I853 255)
		(parameters_typeI I853 driver184)

		(index_action B9868 29244)
		(is_action B9868)
		(is_typeB B9868)
		(start_action B9868 "07/01/2017 08:23")
		(end_action B9868 "07/01/2017 08:24")
		(duration_action B9868 1)
		(parameters_typeB B9868 driver184)

		(index_action B9869 29245)
		(is_action B9869)
		(is_typeB B9869)
		(start_action B9869 "07/01/2017 08:26")
		(end_action B9869 "07/01/2017 08:59")
		(duration_action B9869 33)
		(parameters_typeB B9869 driver184)

		(index_action D11665 29246)
		(is_action D11665)
		(is_typeD D11665)
		(start_action D11665 "07/01/2017 08:59")
		(end_action D11665 "07/01/2017 10:22")
		(duration_action D11665 83)
		(parameters_typeD D11665 driver184)

		(index_action B9870 29247)
		(is_action B9870)
		(is_typeB B9870)
		(start_action B9870 "07/01/2017 10:22")
		(end_action B9870 "07/01/2017 10:57")
		(duration_action B9870 35)
		(parameters_typeB B9870 driver184)

		(index_action D11666 29248)
		(is_action D11666)
		(is_typeD D11666)
		(start_action D11666 "07/01/2017 10:57")
		(end_action D11666 "07/01/2017 13:18")
		(duration_action D11666 141)
		(parameters_typeD D11666 driver184)

		(index_action B9871 29249)
		(is_action B9871)
		(is_typeB B9871)
		(start_action B9871 "07/01/2017 13:18")
		(end_action B9871 "07/01/2017 13:26")
		(duration_action B9871 8)
		(parameters_typeB B9871 driver184)

		(index_action D11667 29250)
		(is_action D11667)
		(is_typeD D11667)
		(start_action D11667 "07/01/2017 13:26")
		(end_action D11667 "07/01/2017 13:28")
		(duration_action D11667 2)
		(parameters_typeD D11667 driver184)

		(index_action B9872 29251)
		(is_action B9872)
		(is_typeB B9872)
		(start_action B9872 "07/01/2017 13:28")
		(end_action B9872 "07/01/2017 13:35")
		(duration_action B9872 7)
		(parameters_typeB B9872 driver184)

		(index_action O6861 29252)
		(is_action O6861)
		(is_typeO O6861)
		(start_action O6861 "07/01/2017 13:35")
		(end_action O6861 "07/01/2017 13:36")
		(duration_action O6861 1)
		(parameters_typeO O6861 driver184)

		(index_action D11668 29253)
		(is_action D11668)
		(is_typeD D11668)
		(start_action D11668 "07/01/2017 13:36")
		(end_action D11668 "07/01/2017 13:48")
		(duration_action D11668 12)
		(parameters_typeD D11668 driver184)

		(index_action O6862 29254)
		(is_action O6862)
		(is_typeO O6862)
		(start_action O6862 "07/01/2017 13:48")
		(end_action O6862 "07/01/2017 13:55")
		(duration_action O6862 7)
		(parameters_typeO O6862 driver184)

		(index_action D11669 29255)
		(is_action D11669)
		(is_typeD D11669)
		(start_action D11669 "07/01/2017 13:55")
		(end_action D11669 "07/01/2017 13:56")
		(duration_action D11669 1)
		(parameters_typeD D11669 driver184)

		(index_action O6863 29256)
		(is_action O6863)
		(is_typeO O6863)
		(start_action O6863 "07/01/2017 13:56")
		(end_action O6863 "07/01/2017 13:59")
		(duration_action O6863 3)
		(parameters_typeO O6863 driver184)

		(index_action D11670 29257)
		(is_action D11670)
		(is_typeD D11670)
		(start_action D11670 "07/01/2017 13:59")
		(end_action D11670 "07/01/2017 14:05")
		(duration_action D11670 6)
		(parameters_typeD D11670 driver184)

		(index_action B9873 29258)
		(is_action B9873)
		(is_typeB B9873)
		(start_action B9873 "07/01/2017 14:05")
		(end_action B9873 "07/01/2017 15:08")
		(duration_action B9873 63)
		(parameters_typeB B9873 driver184)

		(index_action D11671 29259)
		(is_action D11671)
		(is_typeD D11671)
		(start_action D11671 "07/01/2017 15:08")
		(end_action D11671 "07/01/2017 15:15")
		(duration_action D11671 7)
		(parameters_typeD D11671 driver184)

		(index_action B9874 29260)
		(is_action B9874)
		(is_typeB B9874)
		(start_action B9874 "07/01/2017 15:15")
		(end_action B9874 "09/01/2017 18:28")
		(duration_action B9874 3073)
		(parameters_typeB B9874 driver184)

		(index_action D11672 29261)
		(is_action D11672)
		(is_typeD D11672)
		(start_action D11672 "09/01/2017 18:28")
		(end_action D11672 "09/01/2017 18:30")
		(duration_action D11672 2)
		(parameters_typeD D11672 driver184)

		(index_action O6864 29262)
		(is_action O6864)
		(is_typeO O6864)
		(start_action O6864 "09/01/2017 18:30")
		(end_action O6864 "09/01/2017 18:36")
		(duration_action O6864 6)
		(parameters_typeO O6864 driver184)

		(index_action D11673 29263)
		(is_action D11673)
		(is_typeD D11673)
		(start_action D11673 "09/01/2017 18:36")
		(end_action D11673 "09/01/2017 18:38")
		(duration_action D11673 2)
		(parameters_typeD D11673 driver184)

		(index_action B9875 29264)
		(is_action B9875)
		(is_typeB B9875)
		(start_action B9875 "09/01/2017 18:38")
		(end_action B9875 "09/01/2017 18:46")
		(duration_action B9875 8)
		(parameters_typeB B9875 driver184)

		(index_action D11674 29265)
		(is_action D11674)
		(is_typeD D11674)
		(start_action D11674 "09/01/2017 18:46")
		(end_action D11674 "09/01/2017 22:57")
		(duration_action D11674 251)
		(parameters_typeD D11674 driver184)

		(index_action B9876 29266)
		(is_action B9876)
		(is_typeB B9876)
		(start_action B9876 "09/01/2017 22:57")
		(end_action B9876 "09/01/2017 22:58")
		(duration_action B9876 1)
		(parameters_typeB B9876 driver184)

		(index_action B9877 29267)
		(is_action B9877)
		(is_typeB B9877)
		(start_action B9877 "09/01/2017 23:02")
		(end_action B9877 "09/01/2017 23:09")
		(duration_action B9877 7)
		(parameters_typeB B9877 driver184)

		(index_action I854 29268)
		(is_action I854)
		(is_typeI I854)
		(start_action I854 "09/01/2017 23:09")
		(end_action I854 "10/01/2017 03:17")
		(duration_action I854 248)
		(parameters_typeI I854 driver184)

		(index_action B9878 29269)
		(is_action B9878)
		(is_typeB B9878)
		(start_action B9878 "10/01/2017 03:20")
		(end_action B9878 "10/01/2017 04:08")
		(duration_action B9878 48)
		(parameters_typeB B9878 driver184)

		(index_action D11675 29270)
		(is_action D11675)
		(is_typeD D11675)
		(start_action D11675 "10/01/2017 04:08")
		(end_action D11675 "10/01/2017 08:40")
		(duration_action D11675 272)
		(parameters_typeD D11675 driver184)

		(index_action I855 29271)
		(is_action I855)
		(is_typeI I855)
		(start_action I855 "10/01/2017 08:44")
		(end_action I855 "10/01/2017 08:45")
		(duration_action I855 1)
		(parameters_typeI I855 driver184)

		(index_action B9879 29272)
		(is_action B9879)
		(is_typeB B9879)
		(start_action B9879 "10/01/2017 08:45")
		(end_action B9879 "10/01/2017 08:55")
		(duration_action B9879 10)
		(parameters_typeB B9879 driver184)

		(index_action I856 29273)
		(is_action I856)
		(is_typeI I856)
		(start_action I856 "10/01/2017 08:55")
		(end_action I856 "10/01/2017 08:57")
		(duration_action I856 2)
		(parameters_typeI I856 driver184)

		(index_action B9880 29274)
		(is_action B9880)
		(is_typeB B9880)
		(start_action B9880 "10/01/2017 08:57")
		(end_action B9880 "10/01/2017 09:03")
		(duration_action B9880 6)
		(parameters_typeB B9880 driver184)

		(index_action I857 29275)
		(is_action I857)
		(is_typeI I857)
		(start_action I857 "10/01/2017 09:03")
		(end_action I857 "10/01/2017 11:37")
		(duration_action I857 154)
		(parameters_typeI I857 driver184)

		(index_action B9881 29276)
		(is_action B9881)
		(is_typeB B9881)
		(start_action B9881 "10/01/2017 11:37")
		(end_action B9881 "10/01/2017 11:58")
		(duration_action B9881 21)
		(parameters_typeB B9881 driver184)

		(index_action I858 29277)
		(is_action I858)
		(is_typeI I858)
		(start_action I858 "10/01/2017 11:58")
		(end_action I858 "10/01/2017 13:48")
		(duration_action I858 110)
		(parameters_typeI I858 driver184)

		(index_action B9882 29278)
		(is_action B9882)
		(is_typeB B9882)
		(start_action B9882 "10/01/2017 13:48")
		(end_action B9882 "10/01/2017 23:38")
		(duration_action B9882 590)
		(parameters_typeB B9882 driver184)

		(index_action I859 29279)
		(is_action I859)
		(is_typeI I859)
		(start_action I859 "10/01/2017 23:38")
		(end_action I859 "11/01/2017 03:42")
		(duration_action I859 244)
		(parameters_typeI I859 driver184)

		(index_action B9883 29280)
		(is_action B9883)
		(is_typeB B9883)
		(start_action B9883 "11/01/2017 03:42")
		(end_action B9883 "11/01/2017 03:43")
		(duration_action B9883 1)
		(parameters_typeB B9883 driver184)

		(index_action B9884 29281)
		(is_action B9884)
		(is_typeB B9884)
		(start_action B9884 "11/01/2017 03:45")
		(end_action B9884 "11/01/2017 03:48")
		(duration_action B9884 3)
		(parameters_typeB B9884 driver184)

		(index_action D11676 29282)
		(is_action D11676)
		(is_typeD D11676)
		(start_action D11676 "11/01/2017 03:48")
		(end_action D11676 "11/01/2017 05:04")
		(duration_action D11676 76)
		(parameters_typeD D11676 driver184)

		(index_action O6865 29283)
		(is_action O6865)
		(is_typeO O6865)
		(start_action O6865 "11/01/2017 05:04")
		(end_action O6865 "11/01/2017 05:06")
		(duration_action O6865 2)
		(parameters_typeO O6865 driver184)

		(index_action D11677 29284)
		(is_action D11677)
		(is_typeD D11677)
		(start_action D11677 "11/01/2017 05:06")
		(end_action D11677 "11/01/2017 05:07")
		(duration_action D11677 1)
		(parameters_typeD D11677 driver184)

		(index_action O6866 29285)
		(is_action O6866)
		(is_typeO O6866)
		(start_action O6866 "11/01/2017 05:07")
		(end_action O6866 "11/01/2017 05:08")
		(duration_action O6866 1)
		(parameters_typeO O6866 driver184)

		(index_action B9885 29286)
		(is_action B9885)
		(is_typeB B9885)
		(start_action B9885 "11/01/2017 05:08")
		(end_action B9885 "11/01/2017 05:36")
		(duration_action B9885 28)
		(parameters_typeB B9885 driver184)

		(index_action D11678 29287)
		(is_action D11678)
		(is_typeD D11678)
		(start_action D11678 "11/01/2017 05:36")
		(end_action D11678 "11/01/2017 07:55")
		(duration_action D11678 139)
		(parameters_typeD D11678 driver184)

		(index_action O6867 29288)
		(is_action O6867)
		(is_typeO O6867)
		(start_action O6867 "11/01/2017 07:55")
		(end_action O6867 "11/01/2017 07:59")
		(duration_action O6867 4)
		(parameters_typeO O6867 driver184)

		(index_action D11679 29289)
		(is_action D11679)
		(is_typeD D11679)
		(start_action D11679 "11/01/2017 07:59")
		(end_action D11679 "11/01/2017 08:00")
		(duration_action D11679 1)
		(parameters_typeD D11679 driver184)

		(index_action O6868 29290)
		(is_action O6868)
		(is_typeO O6868)
		(start_action O6868 "11/01/2017 08:00")
		(end_action O6868 "11/01/2017 08:01")
		(duration_action O6868 1)
		(parameters_typeO O6868 driver184)

		(index_action B9886 29291)
		(is_action B9886)
		(is_typeB B9886)
		(start_action B9886 "11/01/2017 08:01")
		(end_action B9886 "11/01/2017 09:20")
		(duration_action B9886 79)
		(parameters_typeB B9886 driver184)

		(index_action O6869 29292)
		(is_action O6869)
		(is_typeO O6869)
		(start_action O6869 "11/01/2017 09:20")
		(end_action O6869 "11/01/2017 09:30")
		(duration_action O6869 10)
		(parameters_typeO O6869 driver184)

		(index_action B9887 29293)
		(is_action B9887)
		(is_typeB B9887)
		(start_action B9887 "11/01/2017 09:30")
		(end_action B9887 "11/01/2017 18:46")
		(duration_action B9887 556)
		(parameters_typeB B9887 driver184)

		(index_action O6870 29294)
		(is_action O6870)
		(is_typeO O6870)
		(start_action O6870 "11/01/2017 18:46")
		(end_action O6870 "11/01/2017 18:54")
		(duration_action O6870 8)
		(parameters_typeO O6870 driver184)

		(index_action D11680 29295)
		(is_action D11680)
		(is_typeD D11680)
		(start_action D11680 "11/01/2017 18:54")
		(end_action D11680 "11/01/2017 23:19")
		(duration_action D11680 265)
		(parameters_typeD D11680 driver184)

		(index_action B9888 29296)
		(is_action B9888)
		(is_typeB B9888)
		(start_action B9888 "11/01/2017 23:19")
		(end_action B9888 "11/01/2017 23:20")
		(duration_action B9888 1)
		(parameters_typeB B9888 driver184)

		(index_action B9889 29297)
		(is_action B9889)
		(is_typeB B9889)
		(start_action B9889 "11/01/2017 23:24")
		(end_action B9889 "11/01/2017 23:40")
		(duration_action B9889 16)
		(parameters_typeB B9889 driver184)

		(index_action I860 29298)
		(is_action I860)
		(is_typeI I860)
		(start_action I860 "11/01/2017 23:40")
		(end_action I860 "12/01/2017 00:14")
		(duration_action I860 34)
		(parameters_typeI I860 driver184)

		(index_action B9890 29299)
		(is_action B9890)
		(is_typeB B9890)
		(start_action B9890 "12/01/2017 00:14")
		(end_action B9890 "12/01/2017 00:20")
		(duration_action B9890 6)
		(parameters_typeB B9890 driver184)

		(index_action I861 29300)
		(is_action I861)
		(is_typeI I861)
		(start_action I861 "12/01/2017 00:20")
		(end_action I861 "12/01/2017 02:48")
		(duration_action I861 148)
		(parameters_typeI I861 driver184)

		(index_action B9891 29301)
		(is_action B9891)
		(is_typeB B9891)
		(start_action B9891 "12/01/2017 02:48")
		(end_action B9891 "12/01/2017 03:02")
		(duration_action B9891 14)
		(parameters_typeB B9891 driver184)

		(index_action I862 29302)
		(is_action I862)
		(is_typeI I862)
		(start_action I862 "12/01/2017 03:02")
		(end_action I862 "12/01/2017 04:30")
		(duration_action I862 88)
		(parameters_typeI I862 driver184)

		(index_action B9892 29303)
		(is_action B9892)
		(is_typeB B9892)
		(start_action B9892 "12/01/2017 04:33")
		(end_action B9892 "12/01/2017 04:38")
		(duration_action B9892 5)
		(parameters_typeB B9892 driver184)

		(index_action D11681 29304)
		(is_action D11681)
		(is_typeD D11681)
		(start_action D11681 "12/01/2017 04:38")
		(end_action D11681 "12/01/2017 06:51")
		(duration_action D11681 133)
		(parameters_typeD D11681 driver184)

		(index_action O6871 29305)
		(is_action O6871)
		(is_typeO O6871)
		(start_action O6871 "12/01/2017 06:51")
		(end_action O6871 "12/01/2017 06:59")
		(duration_action O6871 8)
		(parameters_typeO O6871 driver184)

		(index_action D11682 29306)
		(is_action D11682)
		(is_typeD D11682)
		(start_action D11682 "12/01/2017 06:59")
		(end_action D11682 "12/01/2017 07:22")
		(duration_action D11682 23)
		(parameters_typeD D11682 driver184)

		(index_action B9893 29307)
		(is_action B9893)
		(is_typeB B9893)
		(start_action B9893 "12/01/2017 07:22")
		(end_action B9893 "12/01/2017 07:30")
		(duration_action B9893 8)
		(parameters_typeB B9893 driver184)

		(index_action D11683 29308)
		(is_action D11683)
		(is_typeD D11683)
		(start_action D11683 "12/01/2017 07:30")
		(end_action D11683 "12/01/2017 09:10")
		(duration_action D11683 100)
		(parameters_typeD D11683 driver184)

		(index_action B9894 29309)
		(is_action B9894)
		(is_typeB B9894)
		(start_action B9894 "12/01/2017 09:15")
		(end_action B9894 "12/01/2017 09:26")
		(duration_action B9894 11)
		(parameters_typeB B9894 driver184)

		(index_action I863 29310)
		(is_action I863)
		(is_typeI I863)
		(start_action I863 "12/01/2017 09:26")
		(end_action I863 "12/01/2017 11:47")
		(duration_action I863 141)
		(parameters_typeI I863 driver184)

		(index_action B9895 29311)
		(is_action B9895)
		(is_typeB B9895)
		(start_action B9895 "12/01/2017 11:47")
		(end_action B9895 "12/01/2017 12:01")
		(duration_action B9895 14)
		(parameters_typeB B9895 driver184)

		(index_action I864 29312)
		(is_action I864)
		(is_typeI I864)
		(start_action I864 "12/01/2017 12:01")
		(end_action I864 "12/01/2017 12:26")
		(duration_action I864 25)
		(parameters_typeI I864 driver184)

		(index_action B9896 29313)
		(is_action B9896)
		(is_typeB B9896)
		(start_action B9896 "12/01/2017 12:26")
		(end_action B9896 "12/01/2017 12:31")
		(duration_action B9896 5)
		(parameters_typeB B9896 driver184)

		(index_action I865 29314)
		(is_action I865)
		(is_typeI I865)
		(start_action I865 "12/01/2017 12:31")
		(end_action I865 "12/01/2017 12:39")
		(duration_action I865 8)
		(parameters_typeI I865 driver184)

		(index_action B9897 29315)
		(is_action B9897)
		(is_typeB B9897)
		(start_action B9897 "12/01/2017 12:39")
		(end_action B9897 "12/01/2017 12:42")
		(duration_action B9897 3)
		(parameters_typeB B9897 driver184)

		(index_action O6872 29316)
		(is_action O6872)
		(is_typeO O6872)
		(start_action O6872 "12/01/2017 12:42")
		(end_action O6872 "12/01/2017 13:03")
		(duration_action O6872 21)
		(parameters_typeO O6872 driver184)

		(index_action I866 29317)
		(is_action I866)
		(is_typeI I866)
		(start_action I866 "12/01/2017 13:03")
		(end_action I866 "12/01/2017 13:21")
		(duration_action I866 18)
		(parameters_typeI I866 driver184)

		(index_action B9898 29318)
		(is_action B9898)
		(is_typeB B9898)
		(start_action B9898 "12/01/2017 13:21")
		(end_action B9898 "12/01/2017 13:52")
		(duration_action B9898 31)
		(parameters_typeB B9898 driver184)

		(index_action I867 29319)
		(is_action I867)
		(is_typeI I867)
		(start_action I867 "12/01/2017 13:52")
		(end_action I867 "12/01/2017 14:08")
		(duration_action I867 16)
		(parameters_typeI I867 driver184)

		(index_action B9899 29320)
		(is_action B9899)
		(is_typeB B9899)
		(start_action B9899 "12/01/2017 14:08")
		(end_action B9899 "12/01/2017 14:09")
		(duration_action B9899 1)
		(parameters_typeB B9899 driver184)

		(index_action I868 29321)
		(is_action I868)
		(is_typeI I868)
		(start_action I868 "12/01/2017 14:09")
		(end_action I868 "12/01/2017 14:10")
		(duration_action I868 1)
		(parameters_typeI I868 driver184)

		(index_action B9900 29322)
		(is_action B9900)
		(is_typeB B9900)
		(start_action B9900 "12/01/2017 14:10")
		(end_action B9900 "13/01/2017 01:04")
		(duration_action B9900 654)
		(parameters_typeB B9900 driver184)

		(index_action I869 29323)
		(is_action I869)
		(is_typeI I869)
		(start_action I869 "13/01/2017 01:04")
		(end_action I869 "13/01/2017 05:24")
		(duration_action I869 260)
		(parameters_typeI I869 driver184)

		(index_action B9901 29324)
		(is_action B9901)
		(is_typeB B9901)
		(start_action B9901 "13/01/2017 05:27")
		(end_action B9901 "13/01/2017 05:32")
		(duration_action B9901 5)
		(parameters_typeB B9901 driver184)

		(index_action D11684 29325)
		(is_action D11684)
		(is_typeD D11684)
		(start_action D11684 "13/01/2017 05:32")
		(end_action D11684 "13/01/2017 08:13")
		(duration_action D11684 161)
		(parameters_typeD D11684 driver184)

		(index_action B9902 29326)
		(is_action B9902)
		(is_typeB B9902)
		(start_action B9902 "13/01/2017 08:13")
		(end_action B9902 "13/01/2017 08:22")
		(duration_action B9902 9)
		(parameters_typeB B9902 driver184)

		(index_action D11685 29327)
		(is_action D11685)
		(is_typeD D11685)
		(start_action D11685 "13/01/2017 08:22")
		(end_action D11685 "13/01/2017 08:25")
		(duration_action D11685 3)
		(parameters_typeD D11685 driver184)

		(index_action B9903 29328)
		(is_action B9903)
		(is_typeB B9903)
		(start_action B9903 "13/01/2017 08:25")
		(end_action B9903 "13/01/2017 08:32")
		(duration_action B9903 7)
		(parameters_typeB B9903 driver184)

		(index_action D11686 29329)
		(is_action D11686)
		(is_typeD D11686)
		(start_action D11686 "13/01/2017 08:32")
		(end_action D11686 "13/01/2017 08:36")
		(duration_action D11686 4)
		(parameters_typeD D11686 driver184)

		(index_action B9904 29330)
		(is_action B9904)
		(is_typeB B9904)
		(start_action B9904 "13/01/2017 08:36")
		(end_action B9904 "13/01/2017 08:49")
		(duration_action B9904 13)
		(parameters_typeB B9904 driver184)

		(index_action O6873 29331)
		(is_action O6873)
		(is_typeO O6873)
		(start_action O6873 "13/01/2017 08:49")
		(end_action O6873 "13/01/2017 08:52")
		(duration_action O6873 3)
		(parameters_typeO O6873 driver184)

		(index_action B9905 29332)
		(is_action B9905)
		(is_typeB B9905)
		(start_action B9905 "13/01/2017 08:52")
		(end_action B9905 "13/01/2017 09:17")
		(duration_action B9905 25)
		(parameters_typeB B9905 driver184)

		(index_action O6874 29333)
		(is_action O6874)
		(is_typeO O6874)
		(start_action O6874 "13/01/2017 09:17")
		(end_action O6874 "13/01/2017 12:14")
		(duration_action O6874 177)
		(parameters_typeO O6874 driver184)

		(index_action D11687 29334)
		(is_action D11687)
		(is_typeD D11687)
		(start_action D11687 "13/01/2017 12:14")
		(end_action D11687 "13/01/2017 12:15")
		(duration_action D11687 1)
		(parameters_typeD D11687 driver184)

		(index_action O6875 29335)
		(is_action O6875)
		(is_typeO O6875)
		(start_action O6875 "13/01/2017 12:15")
		(end_action O6875 "13/01/2017 12:19")
		(duration_action O6875 4)
		(parameters_typeO O6875 driver184)

		(index_action D11688 29336)
		(is_action D11688)
		(is_typeD D11688)
		(start_action D11688 "13/01/2017 12:19")
		(end_action D11688 "13/01/2017 12:57")
		(duration_action D11688 38)
		(parameters_typeD D11688 driver184)

		(index_action B9906 29337)
		(is_action B9906)
		(is_typeB B9906)
		(start_action B9906 "13/01/2017 12:57")
		(end_action B9906 "13/01/2017 13:01")
		(duration_action B9906 4)
		(parameters_typeB B9906 driver184)

		(index_action D11689 29338)
		(is_action D11689)
		(is_typeD D11689)
		(start_action D11689 "13/01/2017 13:01")
		(end_action D11689 "13/01/2017 13:54")
		(duration_action D11689 53)
		(parameters_typeD D11689 driver184)

		(index_action I870 29339)
		(is_action I870)
		(is_typeI I870)
		(start_action I870 "13/01/2017 13:58")
		(end_action I870 "13/01/2017 15:41")
		(duration_action I870 103)
		(parameters_typeI I870 driver184)

		(index_action B9907 29340)
		(is_action B9907)
		(is_typeB B9907)
		(start_action B9907 "13/01/2017 15:41")
		(end_action B9907 "13/01/2017 15:57")
		(duration_action B9907 16)
		(parameters_typeB B9907 driver184)

		(index_action I871 29341)
		(is_action I871)
		(is_typeI I871)
		(start_action I871 "13/01/2017 15:57")
		(end_action I871 "13/01/2017 17:58")
		(duration_action I871 121)
		(parameters_typeI I871 driver184)

		(index_action B9908 29342)
		(is_action B9908)
		(is_typeB B9908)
		(start_action B9908 "13/01/2017 17:58")
		(end_action B9908 "13/01/2017 17:59")
		(duration_action B9908 1)
		(parameters_typeB B9908 driver184)

		(index_action I872 29343)
		(is_action I872)
		(is_typeI I872)
		(start_action I872 "13/01/2017 17:59")
		(end_action I872 "13/01/2017 18:13")
		(duration_action I872 14)
		(parameters_typeI I872 driver184)

		(index_action B9909 29344)
		(is_action B9909)
		(is_typeB B9909)
		(start_action B9909 "13/01/2017 18:13")
		(end_action B9909 "13/01/2017 18:28")
		(duration_action B9909 15)
		(parameters_typeB B9909 driver184)

		(index_action I873 29345)
		(is_action I873)
		(is_typeI I873)
		(start_action I873 "13/01/2017 18:28")
		(end_action I873 "13/01/2017 18:41")
		(duration_action I873 13)
		(parameters_typeI I873 driver184)

		(index_action B9910 29346)
		(is_action B9910)
		(is_typeB B9910)
		(start_action B9910 "13/01/2017 18:41")
		(end_action B9910 "13/01/2017 18:42")
		(duration_action B9910 1)
		(parameters_typeB B9910 driver184)

		(index_action B9911 29347)
		(is_action B9911)
		(is_typeB B9911)
		(start_action B9911 "13/01/2017 18:44")
		(end_action B9911 "13/01/2017 18:45")
		(duration_action B9911 1)
		(parameters_typeB B9911 driver184)

		(index_action D11690 29348)
		(is_action D11690)
		(is_typeD D11690)
		(start_action D11690 "13/01/2017 18:45")
		(end_action D11690 "13/01/2017 19:54")
		(duration_action D11690 69)
		(parameters_typeD D11690 driver184)

		(index_action B9912 29349)
		(is_action B9912)
		(is_typeB B9912)
		(start_action B9912 "13/01/2017 19:54")
		(end_action B9912 "13/01/2017 20:08")
		(duration_action B9912 14)
		(parameters_typeB B9912 driver184)

		(index_action D11691 29350)
		(is_action D11691)
		(is_typeD D11691)
		(start_action D11691 "13/01/2017 20:08")
		(end_action D11691 "13/01/2017 20:54")
		(duration_action D11691 46)
		(parameters_typeD D11691 driver184)

		(index_action O6876 29351)
		(is_action O6876)
		(is_typeO O6876)
		(start_action O6876 "13/01/2017 20:54")
		(end_action O6876 "13/01/2017 20:55")
		(duration_action O6876 1)
		(parameters_typeO O6876 driver184)

		(index_action B9913 29352)
		(is_action B9913)
		(is_typeB B9913)
		(start_action B9913 "13/01/2017 20:55")
		(end_action B9913 "14/01/2017 06:16")
		(duration_action B9913 561)
		(parameters_typeB B9913 driver184)

		(index_action D11692 29353)
		(is_action D11692)
		(is_typeD D11692)
		(start_action D11692 "14/01/2017 06:16")
		(end_action D11692 "14/01/2017 08:23")
		(duration_action D11692 127)
		(parameters_typeD D11692 driver184)

		(index_action O6877 29354)
		(is_action O6877)
		(is_typeO O6877)
		(start_action O6877 "14/01/2017 08:23")
		(end_action O6877 "14/01/2017 08:25")
		(duration_action O6877 2)
		(parameters_typeO O6877 driver184)

		(index_action D11693 29355)
		(is_action D11693)
		(is_typeD D11693)
		(start_action D11693 "14/01/2017 08:25")
		(end_action D11693 "14/01/2017 09:07")
		(duration_action D11693 42)
		(parameters_typeD D11693 driver184)

		(index_action B9914 29356)
		(is_action B9914)
		(is_typeB B9914)
		(start_action B9914 "14/01/2017 09:07")
		(end_action B9914 "14/01/2017 09:14")
		(duration_action B9914 7)
		(parameters_typeB B9914 driver184)

		(index_action D11694 29357)
		(is_action D11694)
		(is_typeD D11694)
		(start_action D11694 "14/01/2017 09:14")
		(end_action D11694 "14/01/2017 09:25")
		(duration_action D11694 11)
		(parameters_typeD D11694 driver184)

		(index_action O6878 29358)
		(is_action O6878)
		(is_typeO O6878)
		(start_action O6878 "14/01/2017 09:25")
		(end_action O6878 "14/01/2017 09:40")
		(duration_action O6878 15)
		(parameters_typeO O6878 driver184)

		(index_action D11695 29359)
		(is_action D11695)
		(is_typeD D11695)
		(start_action D11695 "14/01/2017 09:40")
		(end_action D11695 "14/01/2017 09:41")
		(duration_action D11695 1)
		(parameters_typeD D11695 driver184)

		(index_action O6879 29360)
		(is_action O6879)
		(is_typeO O6879)
		(start_action O6879 "14/01/2017 09:41")
		(end_action O6879 "14/01/2017 09:45")
		(duration_action O6879 4)
		(parameters_typeO O6879 driver184)

		(index_action D11696 29361)
		(is_action D11696)
		(is_typeD D11696)
		(start_action D11696 "14/01/2017 09:45")
		(end_action D11696 "14/01/2017 09:54")
		(duration_action D11696 9)
		(parameters_typeD D11696 driver184)

		(index_action O6880 29362)
		(is_action O6880)
		(is_typeO O6880)
		(start_action O6880 "14/01/2017 09:54")
		(end_action O6880 "14/01/2017 10:02")
		(duration_action O6880 8)
		(parameters_typeO O6880 driver184)

		(index_action B9915 29363)
		(is_action B9915)
		(is_typeB B9915)
		(start_action B9915 "14/01/2017 10:02")
		(end_action B9915 "14/01/2017 10:15")
		(duration_action B9915 13)
		(parameters_typeB B9915 driver184)

		(index_action O6881 29364)
		(is_action O6881)
		(is_typeO O6881)
		(start_action O6881 "14/01/2017 10:15")
		(end_action O6881 "14/01/2017 10:17")
		(duration_action O6881 2)
		(parameters_typeO O6881 driver184)

		(index_action D11697 29365)
		(is_action D11697)
		(is_typeD D11697)
		(start_action D11697 "14/01/2017 10:17")
		(end_action D11697 "14/01/2017 10:31")
		(duration_action D11697 14)
		(parameters_typeD D11697 driver184)

		(index_action O6882 29366)
		(is_action O6882)
		(is_typeO O6882)
		(start_action O6882 "14/01/2017 10:31")
		(end_action O6882 "14/01/2017 10:34")
		(duration_action O6882 3)
		(parameters_typeO O6882 driver184)

		(index_action D11698 29367)
		(is_action D11698)
		(is_typeD D11698)
		(start_action D11698 "14/01/2017 10:34")
		(end_action D11698 "14/01/2017 10:41")
		(duration_action D11698 7)
		(parameters_typeD D11698 driver184)

		(index_action B9916 29368)
		(is_action B9916)
		(is_typeB B9916)
		(start_action B9916 "14/01/2017 10:41")
		(end_action B9916 "14/01/2017 11:06")
		(duration_action B9916 25)
		(parameters_typeB B9916 driver184)

		(index_action D11699 29369)
		(is_action D11699)
		(is_typeD D11699)
		(start_action D11699 "14/01/2017 11:06")
		(end_action D11699 "14/01/2017 11:14")
		(duration_action D11699 8)
		(parameters_typeD D11699 driver184)

		(index_action B9917 29370)
		(is_action B9917)
		(is_typeB B9917)
		(start_action B9917 "14/01/2017 11:14")
		(end_action B9917 "16/01/2017 15:39")
		(duration_action B9917 3145)
		(parameters_typeB B9917 driver184)

	)
	(:tasks-goal
		:tasks (
			(WD driver184)
		)
	)
)