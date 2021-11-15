(define (problem prueba0) (:domain GantaBi)
	(:customization
		(= :time-format "%d/%m/%Y %H:%M")
		(= :time-horizon-relative 86400) ;; que son los minutos que tienen 2 meses
		(= :time-start "01/01/2017 00:00")
		(= :time-unit :minutes)
	)
	(:objects
		driver147 - Driver

		D9066 D9067 D9068 D9069 D9070 D9071 D9072 D9073 D9074 D9075 D9076 D9077 D9078 D9079 D9080 D9081 D9082 D9083 D9084 D9085 D9086 D9087 D9088 D9089 D9090 D9091 D9092 D9093 D9094 D9095 D9096 D9097 D9098 D9099 D9100 D9101 D9102 D9103 D9104 D9105 D9106 D9107 D9108 D9109 D9110 D9111 D9112 D9113 D9114 D9115 D9116 D9117 D9118 D9119 D9120 D9121 D9122 D9123 D9124 D9125 D9126 D9127 D9128 D9129 D9130 D9131 D9132 D9133 D9134 D9135 D9136 D9137
 - TaskInstanceSymbol
		O5222 O5223 O5224 O5225 O5226 O5227 O5228 O5229 O5230 O5231 O5232 O5233 O5234 O5235 O5236 O5237 O5238 O5239 O5240 O5241 O5242 O5243 O5244 O5245 O5246 O5247 O5248 O5249 O5250 O5251 O5252 O5253 O5254 O5255
 - TaskInstanceSymbol
		B7732 B7733 B7734 B7735 B7736 B7737 B7738 B7739 B7740 B7741 B7742 B7743 B7744 B7745 B7746 B7747 B7748 B7749 B7750 B7751 B7752 B7753 B7754 B7755 B7756 B7757 B7758 B7759 B7760 B7761 B7762 B7763 B7764 B7765 B7766 B7767 B7768 B7769 B7770 B7771 B7772 B7773 B7774 B7775 B7776 B7777 B7778 B7779 B7780 B7781 B7782 B7783
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

		(= (current_index_action) 22600)

		(= (last_dr) "01/01/2017 02:05")
		(= (last_wr) "01/01/2017 02:05")
		(= (actual-timestamp) "01/01/2017 02:05")

		; Events
		(index_action O5222 22600)
		(is_action O5222)
		(is_typeO O5222)
		(start_action O5222 "01/01/2017 02:05")
		(end_action O5222 "01/01/2017 02:07")
		(duration_action O5222 2)
		(parameters_typeO O5222 driver147)

		(index_action D9066 22601)
		(is_action D9066)
		(is_typeD D9066)
		(start_action D9066 "01/01/2017 02:07")
		(end_action D9066 "01/01/2017 02:08")
		(duration_action D9066 1)
		(parameters_typeD D9066 driver147)

		(index_action O5223 22602)
		(is_action O5223)
		(is_typeO O5223)
		(start_action O5223 "01/01/2017 02:08")
		(end_action O5223 "01/01/2017 02:11")
		(duration_action O5223 3)
		(parameters_typeO O5223 driver147)

		(index_action D9067 22603)
		(is_action D9067)
		(is_typeD D9067)
		(start_action D9067 "01/01/2017 02:11")
		(end_action D9067 "01/01/2017 02:30")
		(duration_action D9067 19)
		(parameters_typeD D9067 driver147)

		(index_action B7732 22604)
		(is_action B7732)
		(is_typeB B7732)
		(start_action B7732 "01/01/2017 02:30")
		(end_action B7732 "01/01/2017 03:17")
		(duration_action B7732 47)
		(parameters_typeB B7732 driver147)

		(index_action D9068 22605)
		(is_action D9068)
		(is_typeD D9068)
		(start_action D9068 "01/01/2017 03:17")
		(end_action D9068 "01/01/2017 04:15")
		(duration_action D9068 58)
		(parameters_typeD D9068 driver147)

		(index_action B7733 22606)
		(is_action B7733)
		(is_typeB B7733)
		(start_action B7733 "01/01/2017 04:15")
		(end_action B7733 "01/01/2017 04:36")
		(duration_action B7733 21)
		(parameters_typeB B7733 driver147)

		(index_action D9069 22607)
		(is_action D9069)
		(is_typeD D9069)
		(start_action D9069 "01/01/2017 04:36")
		(end_action D9069 "01/01/2017 06:03")
		(duration_action D9069 87)
		(parameters_typeD D9069 driver147)

		(index_action B7734 22608)
		(is_action B7734)
		(is_typeB B7734)
		(start_action B7734 "01/01/2017 06:03")
		(end_action B7734 "01/01/2017 06:07")
		(duration_action B7734 4)
		(parameters_typeB B7734 driver147)

		(index_action D9070 22609)
		(is_action D9070)
		(is_typeD D9070)
		(start_action D9070 "01/01/2017 06:07")
		(end_action D9070 "01/01/2017 06:08")
		(duration_action D9070 1)
		(parameters_typeD D9070 driver147)

		(index_action B7735 22610)
		(is_action B7735)
		(is_typeB B7735)
		(start_action B7735 "01/01/2017 06:08")
		(end_action B7735 "02/01/2017 06:09")
		(duration_action B7735 1441)
		(parameters_typeB B7735 driver147)

		(index_action D9071 22611)
		(is_action D9071)
		(is_typeD D9071)
		(start_action D9071 "02/01/2017 06:09")
		(end_action D9071 "02/01/2017 06:10")
		(duration_action D9071 1)
		(parameters_typeD D9071 driver147)

		(index_action O5224 22612)
		(is_action O5224)
		(is_typeO O5224)
		(start_action O5224 "02/01/2017 06:10")
		(end_action O5224 "02/01/2017 06:14")
		(duration_action O5224 4)
		(parameters_typeO O5224 driver147)

		(index_action D9072 22613)
		(is_action D9072)
		(is_typeD D9072)
		(start_action D9072 "02/01/2017 06:14")
		(end_action D9072 "02/01/2017 06:16")
		(duration_action D9072 2)
		(parameters_typeD D9072 driver147)

		(index_action B7736 22614)
		(is_action B7736)
		(is_typeB B7736)
		(start_action B7736 "02/01/2017 06:16")
		(end_action B7736 "02/01/2017 06:19")
		(duration_action B7736 3)
		(parameters_typeB B7736 driver147)

		(index_action B7737 22615)
		(is_action B7737)
		(is_typeB B7737)
		(start_action B7737 "02/01/2017 07:15")
		(end_action B7737 "02/01/2017 13:21")
		(duration_action B7737 366)
		(parameters_typeB B7737 driver147)

		(index_action O5225 22616)
		(is_action O5225)
		(is_typeO O5225)
		(start_action O5225 "02/01/2017 13:21")
		(end_action O5225 "02/01/2017 13:26")
		(duration_action O5225 5)
		(parameters_typeO O5225 driver147)

		(index_action D9073 22617)
		(is_action D9073)
		(is_typeD D9073)
		(start_action D9073 "02/01/2017 13:26")
		(end_action D9073 "02/01/2017 17:57")
		(duration_action D9073 271)
		(parameters_typeD D9073 driver147)

		(index_action B7738 22618)
		(is_action B7738)
		(is_typeB B7738)
		(start_action B7738 "02/01/2017 17:57")
		(end_action B7738 "02/01/2017 18:43")
		(duration_action B7738 46)
		(parameters_typeB B7738 driver147)

		(index_action D9074 22619)
		(is_action D9074)
		(is_typeD D9074)
		(start_action D9074 "02/01/2017 18:43")
		(end_action D9074 "02/01/2017 19:49")
		(duration_action D9074 66)
		(parameters_typeD D9074 driver147)

		(index_action B7739 22620)
		(is_action B7739)
		(is_typeB B7739)
		(start_action B7739 "02/01/2017 19:49")
		(end_action B7739 "02/01/2017 19:57")
		(duration_action B7739 8)
		(parameters_typeB B7739 driver147)

		(index_action D9075 22621)
		(is_action D9075)
		(is_typeD D9075)
		(start_action D9075 "02/01/2017 19:57")
		(end_action D9075 "02/01/2017 19:58")
		(duration_action D9075 1)
		(parameters_typeD D9075 driver147)

		(index_action B7740 22622)
		(is_action B7740)
		(is_typeB B7740)
		(start_action B7740 "02/01/2017 19:58")
		(end_action B7740 "02/01/2017 20:46")
		(duration_action B7740 48)
		(parameters_typeB B7740 driver147)

		(index_action D9076 22623)
		(is_action D9076)
		(is_typeD D9076)
		(start_action D9076 "02/01/2017 20:46")
		(end_action D9076 "02/01/2017 20:53")
		(duration_action D9076 7)
		(parameters_typeD D9076 driver147)

		(index_action B7741 22624)
		(is_action B7741)
		(is_typeB B7741)
		(start_action B7741 "02/01/2017 20:53")
		(end_action B7741 "03/01/2017 13:48")
		(duration_action B7741 1015)
		(parameters_typeB B7741 driver147)

		(index_action D9077 22625)
		(is_action D9077)
		(is_typeD D9077)
		(start_action D9077 "03/01/2017 13:48")
		(end_action D9077 "03/01/2017 15:22")
		(duration_action D9077 94)
		(parameters_typeD D9077 driver147)

		(index_action B7742 22626)
		(is_action B7742)
		(is_typeB B7742)
		(start_action B7742 "03/01/2017 15:22")
		(end_action B7742 "04/01/2017 08:06")
		(duration_action B7742 1004)
		(parameters_typeB B7742 driver147)

		(index_action D9078 22627)
		(is_action D9078)
		(is_typeD D9078)
		(start_action D9078 "04/01/2017 08:06")
		(end_action D9078 "04/01/2017 08:16")
		(duration_action D9078 10)
		(parameters_typeD D9078 driver147)

		(index_action B7743 22628)
		(is_action B7743)
		(is_typeB B7743)
		(start_action B7743 "04/01/2017 08:16")
		(end_action B7743 "04/01/2017 10:20")
		(duration_action B7743 124)
		(parameters_typeB B7743 driver147)

		(index_action D9079 22629)
		(is_action D9079)
		(is_typeD D9079)
		(start_action D9079 "04/01/2017 10:20")
		(end_action D9079 "04/01/2017 10:21")
		(duration_action D9079 1)
		(parameters_typeD D9079 driver147)

		(index_action B7744 22630)
		(is_action B7744)
		(is_typeB B7744)
		(start_action B7744 "04/01/2017 10:21")
		(end_action B7744 "04/01/2017 11:36")
		(duration_action B7744 75)
		(parameters_typeB B7744 driver147)

		(index_action D9080 22631)
		(is_action D9080)
		(is_typeD D9080)
		(start_action D9080 "04/01/2017 11:36")
		(end_action D9080 "04/01/2017 11:39")
		(duration_action D9080 3)
		(parameters_typeD D9080 driver147)

		(index_action B7745 22632)
		(is_action B7745)
		(is_typeB B7745)
		(start_action B7745 "04/01/2017 11:39")
		(end_action B7745 "04/01/2017 12:26")
		(duration_action B7745 47)
		(parameters_typeB B7745 driver147)

		(index_action O5226 22633)
		(is_action O5226)
		(is_typeO O5226)
		(start_action O5226 "04/01/2017 12:26")
		(end_action O5226 "04/01/2017 12:29")
		(duration_action O5226 3)
		(parameters_typeO O5226 driver147)

		(index_action D9081 22634)
		(is_action D9081)
		(is_typeD D9081)
		(start_action D9081 "04/01/2017 12:29")
		(end_action D9081 "04/01/2017 12:31")
		(duration_action D9081 2)
		(parameters_typeD D9081 driver147)

		(index_action B7746 22635)
		(is_action B7746)
		(is_typeB B7746)
		(start_action B7746 "04/01/2017 12:31")
		(end_action B7746 "04/01/2017 12:42")
		(duration_action B7746 11)
		(parameters_typeB B7746 driver147)

		(index_action D9082 22636)
		(is_action D9082)
		(is_typeD D9082)
		(start_action D9082 "04/01/2017 12:42")
		(end_action D9082 "04/01/2017 13:10")
		(duration_action D9082 28)
		(parameters_typeD D9082 driver147)

		(index_action B7747 22637)
		(is_action B7747)
		(is_typeB B7747)
		(start_action B7747 "04/01/2017 13:10")
		(end_action B7747 "04/01/2017 13:27")
		(duration_action B7747 17)
		(parameters_typeB B7747 driver147)

		(index_action D9083 22638)
		(is_action D9083)
		(is_typeD D9083)
		(start_action D9083 "04/01/2017 13:27")
		(end_action D9083 "04/01/2017 13:29")
		(duration_action D9083 2)
		(parameters_typeD D9083 driver147)

		(index_action O5227 22639)
		(is_action O5227)
		(is_typeO O5227)
		(start_action O5227 "04/01/2017 13:29")
		(end_action O5227 "04/01/2017 13:31")
		(duration_action O5227 2)
		(parameters_typeO O5227 driver147)

		(index_action D9084 22640)
		(is_action D9084)
		(is_typeD D9084)
		(start_action D9084 "04/01/2017 13:31")
		(end_action D9084 "04/01/2017 13:32")
		(duration_action D9084 1)
		(parameters_typeD D9084 driver147)

		(index_action O5228 22641)
		(is_action O5228)
		(is_typeO O5228)
		(start_action O5228 "04/01/2017 13:32")
		(end_action O5228 "04/01/2017 13:37")
		(duration_action O5228 5)
		(parameters_typeO O5228 driver147)

		(index_action D9085 22642)
		(is_action D9085)
		(is_typeD D9085)
		(start_action D9085 "04/01/2017 13:37")
		(end_action D9085 "04/01/2017 13:52")
		(duration_action D9085 15)
		(parameters_typeD D9085 driver147)

		(index_action O5229 22643)
		(is_action O5229)
		(is_typeO O5229)
		(start_action O5229 "04/01/2017 13:52")
		(end_action O5229 "04/01/2017 13:54")
		(duration_action O5229 2)
		(parameters_typeO O5229 driver147)

		(index_action D9086 22644)
		(is_action D9086)
		(is_typeD D9086)
		(start_action D9086 "04/01/2017 13:54")
		(end_action D9086 "04/01/2017 17:30")
		(duration_action D9086 216)
		(parameters_typeD D9086 driver147)

		(index_action B7748 22645)
		(is_action B7748)
		(is_typeB B7748)
		(start_action B7748 "04/01/2017 17:30")
		(end_action B7748 "04/01/2017 18:18")
		(duration_action B7748 48)
		(parameters_typeB B7748 driver147)

		(index_action D9087 22646)
		(is_action D9087)
		(is_typeD D9087)
		(start_action D9087 "04/01/2017 18:18")
		(end_action D9087 "04/01/2017 21:10")
		(duration_action D9087 172)
		(parameters_typeD D9087 driver147)

		(index_action B7749 22647)
		(is_action B7749)
		(is_typeB B7749)
		(start_action B7749 "04/01/2017 21:10")
		(end_action B7749 "05/01/2017 06:24")
		(duration_action B7749 554)
		(parameters_typeB B7749 driver147)

		(index_action D9088 22648)
		(is_action D9088)
		(is_typeD D9088)
		(start_action D9088 "05/01/2017 06:24")
		(end_action D9088 "05/01/2017 10:39")
		(duration_action D9088 255)
		(parameters_typeD D9088 driver147)

		(index_action B7750 22649)
		(is_action B7750)
		(is_typeB B7750)
		(start_action B7750 "05/01/2017 10:39")
		(end_action B7750 "05/01/2017 11:30")
		(duration_action B7750 51)
		(parameters_typeB B7750 driver147)

		(index_action D9089 22650)
		(is_action D9089)
		(is_typeD D9089)
		(start_action D9089 "05/01/2017 11:30")
		(end_action D9089 "05/01/2017 13:09")
		(duration_action D9089 99)
		(parameters_typeD D9089 driver147)

		(index_action O5230 22651)
		(is_action O5230)
		(is_typeO O5230)
		(start_action O5230 "05/01/2017 13:09")
		(end_action O5230 "05/01/2017 13:11")
		(duration_action O5230 2)
		(parameters_typeO O5230 driver147)

		(index_action D9090 22652)
		(is_action D9090)
		(is_typeD D9090)
		(start_action D9090 "05/01/2017 13:11")
		(end_action D9090 "05/01/2017 13:12")
		(duration_action D9090 1)
		(parameters_typeD D9090 driver147)

		(index_action B7751 22653)
		(is_action B7751)
		(is_typeB B7751)
		(start_action B7751 "05/01/2017 13:12")
		(end_action B7751 "06/01/2017 06:30")
		(duration_action B7751 1038)
		(parameters_typeB B7751 driver147)

		(index_action D9091 22654)
		(is_action D9091)
		(is_typeD D9091)
		(start_action D9091 "06/01/2017 06:30")
		(end_action D9091 "06/01/2017 10:53")
		(duration_action D9091 263)
		(parameters_typeD D9091 driver147)

		(index_action B7752 22655)
		(is_action B7752)
		(is_typeB B7752)
		(start_action B7752 "06/01/2017 10:53")
		(end_action B7752 "06/01/2017 11:47")
		(duration_action B7752 54)
		(parameters_typeB B7752 driver147)

		(index_action D9092 22656)
		(is_action D9092)
		(is_typeD D9092)
		(start_action D9092 "06/01/2017 11:47")
		(end_action D9092 "06/01/2017 16:04")
		(duration_action D9092 257)
		(parameters_typeD D9092 driver147)

		(index_action B7753 22657)
		(is_action B7753)
		(is_typeB B7753)
		(start_action B7753 "06/01/2017 16:04")
		(end_action B7753 "06/01/2017 16:55")
		(duration_action B7753 51)
		(parameters_typeB B7753 driver147)

		(index_action O5231 22658)
		(is_action O5231)
		(is_typeO O5231)
		(start_action O5231 "06/01/2017 16:55")
		(end_action O5231 "06/01/2017 16:56")
		(duration_action O5231 1)
		(parameters_typeO O5231 driver147)

		(index_action D9093 22659)
		(is_action D9093)
		(is_typeD D9093)
		(start_action D9093 "06/01/2017 16:56")
		(end_action D9093 "06/01/2017 17:57")
		(duration_action D9093 61)
		(parameters_typeD D9093 driver147)

		(index_action O5232 22660)
		(is_action O5232)
		(is_typeO O5232)
		(start_action O5232 "06/01/2017 17:57")
		(end_action O5232 "06/01/2017 18:01")
		(duration_action O5232 4)
		(parameters_typeO O5232 driver147)

		(index_action D9094 22661)
		(is_action D9094)
		(is_typeD D9094)
		(start_action D9094 "06/01/2017 18:01")
		(end_action D9094 "06/01/2017 18:02")
		(duration_action D9094 1)
		(parameters_typeD D9094 driver147)

		(index_action B7754 22662)
		(is_action B7754)
		(is_typeB B7754)
		(start_action B7754 "06/01/2017 18:02")
		(end_action B7754 "07/01/2017 05:27")
		(duration_action B7754 685)
		(parameters_typeB B7754 driver147)

		(index_action D9095 22663)
		(is_action D9095)
		(is_typeD D9095)
		(start_action D9095 "07/01/2017 05:27")
		(end_action D9095 "07/01/2017 05:30")
		(duration_action D9095 3)
		(parameters_typeD D9095 driver147)

		(index_action B7755 22664)
		(is_action B7755)
		(is_typeB B7755)
		(start_action B7755 "07/01/2017 05:30")
		(end_action B7755 "07/01/2017 06:05")
		(duration_action B7755 35)
		(parameters_typeB B7755 driver147)

		(index_action D9096 22665)
		(is_action D9096)
		(is_typeD D9096)
		(start_action D9096 "07/01/2017 06:05")
		(end_action D9096 "07/01/2017 09:28")
		(duration_action D9096 203)
		(parameters_typeD D9096 driver147)

		(index_action B7756 22666)
		(is_action B7756)
		(is_typeB B7756)
		(start_action B7756 "07/01/2017 09:28")
		(end_action B7756 "07/01/2017 10:17")
		(duration_action B7756 49)
		(parameters_typeB B7756 driver147)

		(index_action D9097 22667)
		(is_action D9097)
		(is_typeD D9097)
		(start_action D9097 "07/01/2017 10:17")
		(end_action D9097 "07/01/2017 10:19")
		(duration_action D9097 2)
		(parameters_typeD D9097 driver147)

		(index_action O5233 22668)
		(is_action O5233)
		(is_typeO O5233)
		(start_action O5233 "07/01/2017 10:19")
		(end_action O5233 "07/01/2017 10:22")
		(duration_action O5233 3)
		(parameters_typeO O5233 driver147)

		(index_action D9098 22669)
		(is_action D9098)
		(is_typeD D9098)
		(start_action D9098 "07/01/2017 10:22")
		(end_action D9098 "07/01/2017 12:54")
		(duration_action D9098 152)
		(parameters_typeD D9098 driver147)

		(index_action B7757 22670)
		(is_action B7757)
		(is_typeB B7757)
		(start_action B7757 "07/01/2017 12:54")
		(end_action B7757 "07/01/2017 12:56")
		(duration_action B7757 2)
		(parameters_typeB B7757 driver147)

		(index_action D9099 22671)
		(is_action D9099)
		(is_typeD D9099)
		(start_action D9099 "07/01/2017 12:56")
		(end_action D9099 "07/01/2017 12:58")
		(duration_action D9099 2)
		(parameters_typeD D9099 driver147)

		(index_action O5234 22672)
		(is_action O5234)
		(is_typeO O5234)
		(start_action O5234 "07/01/2017 12:58")
		(end_action O5234 "07/01/2017 13:11")
		(duration_action O5234 13)
		(parameters_typeO O5234 driver147)

		(index_action D9100 22673)
		(is_action D9100)
		(is_typeD D9100)
		(start_action D9100 "07/01/2017 13:11")
		(end_action D9100 "07/01/2017 13:14")
		(duration_action D9100 3)
		(parameters_typeD D9100 driver147)

		(index_action O5235 22674)
		(is_action O5235)
		(is_typeO O5235)
		(start_action O5235 "07/01/2017 13:14")
		(end_action O5235 "07/01/2017 13:21")
		(duration_action O5235 7)
		(parameters_typeO O5235 driver147)

		(index_action D9101 22675)
		(is_action D9101)
		(is_typeD D9101)
		(start_action D9101 "07/01/2017 13:21")
		(end_action D9101 "07/01/2017 13:37")
		(duration_action D9101 16)
		(parameters_typeD D9101 driver147)

		(index_action B7758 22676)
		(is_action B7758)
		(is_typeB B7758)
		(start_action B7758 "07/01/2017 13:37")
		(end_action B7758 "07/01/2017 14:28")
		(duration_action B7758 51)
		(parameters_typeB B7758 driver147)

		(index_action O5236 22677)
		(is_action O5236)
		(is_typeO O5236)
		(start_action O5236 "07/01/2017 14:28")
		(end_action O5236 "07/01/2017 14:29")
		(duration_action O5236 1)
		(parameters_typeO O5236 driver147)

		(index_action D9102 22678)
		(is_action D9102)
		(is_typeD D9102)
		(start_action D9102 "07/01/2017 14:29")
		(end_action D9102 "07/01/2017 14:41")
		(duration_action D9102 12)
		(parameters_typeD D9102 driver147)

		(index_action B7759 22679)
		(is_action B7759)
		(is_typeB B7759)
		(start_action B7759 "07/01/2017 14:41")
		(end_action B7759 "07/01/2017 15:23")
		(duration_action B7759 42)
		(parameters_typeB B7759 driver147)

		(index_action D9103 22680)
		(is_action D9103)
		(is_typeD D9103)
		(start_action D9103 "07/01/2017 15:23")
		(end_action D9103 "07/01/2017 15:27")
		(duration_action D9103 4)
		(parameters_typeD D9103 driver147)

		(index_action O5237 22681)
		(is_action O5237)
		(is_typeO O5237)
		(start_action O5237 "07/01/2017 15:27")
		(end_action O5237 "07/01/2017 15:32")
		(duration_action O5237 5)
		(parameters_typeO O5237 driver147)

		(index_action D9104 22682)
		(is_action D9104)
		(is_typeD D9104)
		(start_action D9104 "07/01/2017 15:32")
		(end_action D9104 "07/01/2017 15:33")
		(duration_action D9104 1)
		(parameters_typeD D9104 driver147)

		(index_action B7760 22683)
		(is_action B7760)
		(is_typeB B7760)
		(start_action B7760 "07/01/2017 15:33")
		(end_action B7760 "10/01/2017 17:58")
		(duration_action B7760 4465)
		(parameters_typeB B7760 driver147)

		(index_action O5238 22684)
		(is_action O5238)
		(is_typeO O5238)
		(start_action O5238 "10/01/2017 17:58")
		(end_action O5238 "10/01/2017 17:59")
		(duration_action O5238 1)
		(parameters_typeO O5238 driver147)

		(index_action D9105 22685)
		(is_action D9105)
		(is_typeD D9105)
		(start_action D9105 "10/01/2017 17:59")
		(end_action D9105 "10/01/2017 18:00")
		(duration_action D9105 1)
		(parameters_typeD D9105 driver147)

		(index_action O5239 22686)
		(is_action O5239)
		(is_typeO O5239)
		(start_action O5239 "10/01/2017 18:00")
		(end_action O5239 "10/01/2017 18:02")
		(duration_action O5239 2)
		(parameters_typeO O5239 driver147)

		(index_action D9106 22687)
		(is_action D9106)
		(is_typeD D9106)
		(start_action D9106 "10/01/2017 18:02")
		(end_action D9106 "10/01/2017 18:04")
		(duration_action D9106 2)
		(parameters_typeD D9106 driver147)

		(index_action O5240 22688)
		(is_action O5240)
		(is_typeO O5240)
		(start_action O5240 "10/01/2017 18:04")
		(end_action O5240 "10/01/2017 18:13")
		(duration_action O5240 9)
		(parameters_typeO O5240 driver147)

		(index_action D9107 22689)
		(is_action D9107)
		(is_typeD D9107)
		(start_action D9107 "10/01/2017 18:13")
		(end_action D9107 "10/01/2017 18:14")
		(duration_action D9107 1)
		(parameters_typeD D9107 driver147)

		(index_action O5241 22690)
		(is_action O5241)
		(is_typeO O5241)
		(start_action O5241 "10/01/2017 18:14")
		(end_action O5241 "10/01/2017 18:18")
		(duration_action O5241 4)
		(parameters_typeO O5241 driver147)

		(index_action B7761 22691)
		(is_action B7761)
		(is_typeB B7761)
		(start_action B7761 "10/01/2017 18:18")
		(end_action B7761 "10/01/2017 20:28")
		(duration_action B7761 130)
		(parameters_typeB B7761 driver147)

		(index_action O5242 22692)
		(is_action O5242)
		(is_typeO O5242)
		(start_action O5242 "10/01/2017 20:28")
		(end_action O5242 "10/01/2017 20:30")
		(duration_action O5242 2)
		(parameters_typeO O5242 driver147)

		(index_action D9108 22693)
		(is_action D9108)
		(is_typeD D9108)
		(start_action D9108 "10/01/2017 20:30")
		(end_action D9108 "10/01/2017 20:38")
		(duration_action D9108 8)
		(parameters_typeD D9108 driver147)

		(index_action O5243 22694)
		(is_action O5243)
		(is_typeO O5243)
		(start_action O5243 "10/01/2017 20:38")
		(end_action O5243 "10/01/2017 20:47")
		(duration_action O5243 9)
		(parameters_typeO O5243 driver147)

		(index_action D9109 22695)
		(is_action D9109)
		(is_typeD D9109)
		(start_action D9109 "10/01/2017 20:47")
		(end_action D9109 "10/01/2017 20:52")
		(duration_action D9109 5)
		(parameters_typeD D9109 driver147)

		(index_action B7762 22696)
		(is_action B7762)
		(is_typeB B7762)
		(start_action B7762 "10/01/2017 20:52")
		(end_action B7762 "11/01/2017 08:46")
		(duration_action B7762 714)
		(parameters_typeB B7762 driver147)

		(index_action D9110 22697)
		(is_action D9110)
		(is_typeD D9110)
		(start_action D9110 "11/01/2017 08:46")
		(end_action D9110 "11/01/2017 09:03")
		(duration_action D9110 17)
		(parameters_typeD D9110 driver147)

		(index_action B7763 22698)
		(is_action B7763)
		(is_typeB B7763)
		(start_action B7763 "11/01/2017 09:03")
		(end_action B7763 "11/01/2017 09:45")
		(duration_action B7763 42)
		(parameters_typeB B7763 driver147)

		(index_action D9111 22699)
		(is_action D9111)
		(is_typeD D9111)
		(start_action D9111 "11/01/2017 09:45")
		(end_action D9111 "11/01/2017 09:46")
		(duration_action D9111 1)
		(parameters_typeD D9111 driver147)

		(index_action B7764 22700)
		(is_action B7764)
		(is_typeB B7764)
		(start_action B7764 "11/01/2017 09:46")
		(end_action B7764 "11/01/2017 10:29")
		(duration_action B7764 43)
		(parameters_typeB B7764 driver147)

		(index_action D9112 22701)
		(is_action D9112)
		(is_typeD D9112)
		(start_action D9112 "11/01/2017 10:29")
		(end_action D9112 "11/01/2017 10:30")
		(duration_action D9112 1)
		(parameters_typeD D9112 driver147)

		(index_action O5244 22702)
		(is_action O5244)
		(is_typeO O5244)
		(start_action O5244 "11/01/2017 10:30")
		(end_action O5244 "11/01/2017 10:32")
		(duration_action O5244 2)
		(parameters_typeO O5244 driver147)

		(index_action B7765 22703)
		(is_action B7765)
		(is_typeB B7765)
		(start_action B7765 "11/01/2017 10:32")
		(end_action B7765 "11/01/2017 18:09")
		(duration_action B7765 457)
		(parameters_typeB B7765 driver147)

		(index_action D9113 22704)
		(is_action D9113)
		(is_typeD D9113)
		(start_action D9113 "11/01/2017 18:09")
		(end_action D9113 "11/01/2017 18:10")
		(duration_action D9113 1)
		(parameters_typeD D9113 driver147)

		(index_action B7766 22705)
		(is_action B7766)
		(is_typeB B7766)
		(start_action B7766 "11/01/2017 18:10")
		(end_action B7766 "11/01/2017 18:15")
		(duration_action B7766 5)
		(parameters_typeB B7766 driver147)

		(index_action D9114 22706)
		(is_action D9114)
		(is_typeD D9114)
		(start_action D9114 "11/01/2017 18:15")
		(end_action D9114 "11/01/2017 18:41")
		(duration_action D9114 26)
		(parameters_typeD D9114 driver147)

		(index_action B7767 22707)
		(is_action B7767)
		(is_typeB B7767)
		(start_action B7767 "11/01/2017 18:41")
		(end_action B7767 "12/01/2017 08:20")
		(duration_action B7767 819)
		(parameters_typeB B7767 driver147)

		(index_action D9115 22708)
		(is_action D9115)
		(is_typeD D9115)
		(start_action D9115 "12/01/2017 08:20")
		(end_action D9115 "12/01/2017 08:25")
		(duration_action D9115 5)
		(parameters_typeD D9115 driver147)

		(index_action O5245 22709)
		(is_action O5245)
		(is_typeO O5245)
		(start_action O5245 "12/01/2017 08:25")
		(end_action O5245 "12/01/2017 08:36")
		(duration_action O5245 11)
		(parameters_typeO O5245 driver147)

		(index_action D9116 22710)
		(is_action D9116)
		(is_typeD D9116)
		(start_action D9116 "12/01/2017 08:36")
		(end_action D9116 "12/01/2017 09:06")
		(duration_action D9116 30)
		(parameters_typeD D9116 driver147)

		(index_action O5246 22711)
		(is_action O5246)
		(is_typeO O5246)
		(start_action O5246 "12/01/2017 09:06")
		(end_action O5246 "12/01/2017 09:07")
		(duration_action O5246 1)
		(parameters_typeO O5246 driver147)

		(index_action B7768 22712)
		(is_action B7768)
		(is_typeB B7768)
		(start_action B7768 "12/01/2017 09:07")
		(end_action B7768 "12/01/2017 09:20")
		(duration_action B7768 13)
		(parameters_typeB B7768 driver147)

		(index_action D9117 22713)
		(is_action D9117)
		(is_typeD D9117)
		(start_action D9117 "12/01/2017 09:20")
		(end_action D9117 "12/01/2017 09:22")
		(duration_action D9117 2)
		(parameters_typeD D9117 driver147)

		(index_action O5247 22714)
		(is_action O5247)
		(is_typeO O5247)
		(start_action O5247 "12/01/2017 09:22")
		(end_action O5247 "12/01/2017 09:24")
		(duration_action O5247 2)
		(parameters_typeO O5247 driver147)

		(index_action B7769 22715)
		(is_action B7769)
		(is_typeB B7769)
		(start_action B7769 "12/01/2017 09:24")
		(end_action B7769 "12/01/2017 09:59")
		(duration_action B7769 35)
		(parameters_typeB B7769 driver147)

		(index_action D9118 22716)
		(is_action D9118)
		(is_typeD D9118)
		(start_action D9118 "12/01/2017 09:59")
		(end_action D9118 "12/01/2017 10:30")
		(duration_action D9118 31)
		(parameters_typeD D9118 driver147)

		(index_action B7770 22717)
		(is_action B7770)
		(is_typeB B7770)
		(start_action B7770 "12/01/2017 10:30")
		(end_action B7770 "12/01/2017 10:38")
		(duration_action B7770 8)
		(parameters_typeB B7770 driver147)

		(index_action D9119 22718)
		(is_action D9119)
		(is_typeD D9119)
		(start_action D9119 "12/01/2017 10:38")
		(end_action D9119 "12/01/2017 10:39")
		(duration_action D9119 1)
		(parameters_typeD D9119 driver147)

		(index_action B7771 22719)
		(is_action B7771)
		(is_typeB B7771)
		(start_action B7771 "12/01/2017 10:39")
		(end_action B7771 "12/01/2017 10:41")
		(duration_action B7771 2)
		(parameters_typeB B7771 driver147)

		(index_action D9120 22720)
		(is_action D9120)
		(is_typeD D9120)
		(start_action D9120 "12/01/2017 10:41")
		(end_action D9120 "12/01/2017 10:43")
		(duration_action D9120 2)
		(parameters_typeD D9120 driver147)

		(index_action O5248 22721)
		(is_action O5248)
		(is_typeO O5248)
		(start_action O5248 "12/01/2017 10:43")
		(end_action O5248 "12/01/2017 11:21")
		(duration_action O5248 38)
		(parameters_typeO O5248 driver147)

		(index_action D9121 22722)
		(is_action D9121)
		(is_typeD D9121)
		(start_action D9121 "12/01/2017 11:21")
		(end_action D9121 "12/01/2017 11:23")
		(duration_action D9121 2)
		(parameters_typeD D9121 driver147)

		(index_action O5249 22723)
		(is_action O5249)
		(is_typeO O5249)
		(start_action O5249 "12/01/2017 11:23")
		(end_action O5249 "12/01/2017 11:26")
		(duration_action O5249 3)
		(parameters_typeO O5249 driver147)

		(index_action D9122 22724)
		(is_action D9122)
		(is_typeD D9122)
		(start_action D9122 "12/01/2017 11:26")
		(end_action D9122 "12/01/2017 14:05")
		(duration_action D9122 159)
		(parameters_typeD D9122 driver147)

		(index_action B7772 22725)
		(is_action B7772)
		(is_typeB B7772)
		(start_action B7772 "12/01/2017 14:05")
		(end_action B7772 "12/01/2017 14:35")
		(duration_action B7772 30)
		(parameters_typeB B7772 driver147)

		(index_action D9123 22726)
		(is_action D9123)
		(is_typeD D9123)
		(start_action D9123 "12/01/2017 14:35")
		(end_action D9123 "12/01/2017 17:43")
		(duration_action D9123 188)
		(parameters_typeD D9123 driver147)

		(index_action B7773 22727)
		(is_action B7773)
		(is_typeB B7773)
		(start_action B7773 "12/01/2017 17:43")
		(end_action B7773 "13/01/2017 06:08")
		(duration_action B7773 745)
		(parameters_typeB B7773 driver147)

		(index_action D9124 22728)
		(is_action D9124)
		(is_typeD D9124)
		(start_action D9124 "13/01/2017 06:08")
		(end_action D9124 "13/01/2017 09:31")
		(duration_action D9124 203)
		(parameters_typeD D9124 driver147)

		(index_action B7774 22729)
		(is_action B7774)
		(is_typeB B7774)
		(start_action B7774 "13/01/2017 09:31")
		(end_action B7774 "13/01/2017 10:03")
		(duration_action B7774 32)
		(parameters_typeB B7774 driver147)

		(index_action D9125 22730)
		(is_action D9125)
		(is_typeD D9125)
		(start_action D9125 "13/01/2017 10:03")
		(end_action D9125 "13/01/2017 10:05")
		(duration_action D9125 2)
		(parameters_typeD D9125 driver147)

		(index_action O5250 22731)
		(is_action O5250)
		(is_typeO O5250)
		(start_action O5250 "13/01/2017 10:05")
		(end_action O5250 "13/01/2017 10:07")
		(duration_action O5250 2)
		(parameters_typeO O5250 driver147)

		(index_action B7775 22732)
		(is_action B7775)
		(is_typeB B7775)
		(start_action B7775 "13/01/2017 10:07")
		(end_action B7775 "13/01/2017 10:08")
		(duration_action B7775 1)
		(parameters_typeB B7775 driver147)

		(index_action D9126 22733)
		(is_action D9126)
		(is_typeD D9126)
		(start_action D9126 "13/01/2017 10:08")
		(end_action D9126 "13/01/2017 10:09")
		(duration_action D9126 1)
		(parameters_typeD D9126 driver147)

		(index_action B7776 22734)
		(is_action B7776)
		(is_typeB B7776)
		(start_action B7776 "13/01/2017 10:09")
		(end_action B7776 "13/01/2017 10:41")
		(duration_action B7776 32)
		(parameters_typeB B7776 driver147)

		(index_action D9127 22735)
		(is_action D9127)
		(is_typeD D9127)
		(start_action D9127 "13/01/2017 10:41")
		(end_action D9127 "13/01/2017 14:42")
		(duration_action D9127 241)
		(parameters_typeD D9127 driver147)

		(index_action B7777 22736)
		(is_action B7777)
		(is_typeB B7777)
		(start_action B7777 "13/01/2017 14:42")
		(end_action B7777 "13/01/2017 14:45")
		(duration_action B7777 3)
		(parameters_typeB B7777 driver147)

		(index_action D9128 22737)
		(is_action D9128)
		(is_typeD D9128)
		(start_action D9128 "13/01/2017 14:45")
		(end_action D9128 "13/01/2017 14:46")
		(duration_action D9128 1)
		(parameters_typeD D9128 driver147)

		(index_action O5251 22738)
		(is_action O5251)
		(is_typeO O5251)
		(start_action O5251 "13/01/2017 14:46")
		(end_action O5251 "13/01/2017 14:54")
		(duration_action O5251 8)
		(parameters_typeO O5251 driver147)

		(index_action D9129 22739)
		(is_action D9129)
		(is_typeD D9129)
		(start_action D9129 "13/01/2017 14:54")
		(end_action D9129 "13/01/2017 15:01")
		(duration_action D9129 7)
		(parameters_typeD D9129 driver147)

		(index_action B7778 22740)
		(is_action B7778)
		(is_typeB B7778)
		(start_action B7778 "13/01/2017 15:01")
		(end_action B7778 "13/01/2017 15:39")
		(duration_action B7778 38)
		(parameters_typeB B7778 driver147)

		(index_action D9130 22741)
		(is_action D9130)
		(is_typeD D9130)
		(start_action D9130 "13/01/2017 15:39")
		(end_action D9130 "13/01/2017 15:40")
		(duration_action D9130 1)
		(parameters_typeD D9130 driver147)

		(index_action B7779 22742)
		(is_action B7779)
		(is_typeB B7779)
		(start_action B7779 "13/01/2017 15:40")
		(end_action B7779 "14/01/2017 03:06")
		(duration_action B7779 686)
		(parameters_typeB B7779 driver147)

		(index_action D9131 22743)
		(is_action D9131)
		(is_typeD D9131)
		(start_action D9131 "14/01/2017 03:06")
		(end_action D9131 "14/01/2017 03:12")
		(duration_action D9131 6)
		(parameters_typeD D9131 driver147)

		(index_action O5252 22744)
		(is_action O5252)
		(is_typeO O5252)
		(start_action O5252 "14/01/2017 03:12")
		(end_action O5252 "14/01/2017 03:19")
		(duration_action O5252 7)
		(parameters_typeO O5252 driver147)

		(index_action D9132 22745)
		(is_action D9132)
		(is_typeD D9132)
		(start_action D9132 "14/01/2017 03:19")
		(end_action D9132 "14/01/2017 06:06")
		(duration_action D9132 167)
		(parameters_typeD D9132 driver147)

		(index_action B7780 22746)
		(is_action B7780)
		(is_typeB B7780)
		(start_action B7780 "14/01/2017 06:06")
		(end_action B7780 "14/01/2017 07:02")
		(duration_action B7780 56)
		(parameters_typeB B7780 driver147)

		(index_action D9133 22747)
		(is_action D9133)
		(is_typeD D9133)
		(start_action D9133 "14/01/2017 07:02")
		(end_action D9133 "14/01/2017 09:53")
		(duration_action D9133 171)
		(parameters_typeD D9133 driver147)

		(index_action B7781 22748)
		(is_action B7781)
		(is_typeB B7781)
		(start_action B7781 "14/01/2017 09:53")
		(end_action B7781 "14/01/2017 10:01")
		(duration_action B7781 8)
		(parameters_typeB B7781 driver147)

		(index_action D9134 22749)
		(is_action D9134)
		(is_typeD D9134)
		(start_action D9134 "14/01/2017 10:01")
		(end_action D9134 "14/01/2017 10:02")
		(duration_action D9134 1)
		(parameters_typeD D9134 driver147)

		(index_action B7782 22750)
		(is_action B7782)
		(is_typeB B7782)
		(start_action B7782 "14/01/2017 10:02")
		(end_action B7782 "14/01/2017 10:51")
		(duration_action B7782 49)
		(parameters_typeB B7782 driver147)

		(index_action O5253 22751)
		(is_action O5253)
		(is_typeO O5253)
		(start_action O5253 "14/01/2017 10:51")
		(end_action O5253 "14/01/2017 10:52")
		(duration_action O5253 1)
		(parameters_typeO O5253 driver147)

		(index_action D9135 22752)
		(is_action D9135)
		(is_typeD D9135)
		(start_action D9135 "14/01/2017 10:52")
		(end_action D9135 "14/01/2017 13:50")
		(duration_action D9135 178)
		(parameters_typeD D9135 driver147)

		(index_action O5254 22753)
		(is_action O5254)
		(is_typeO O5254)
		(start_action O5254 "14/01/2017 13:50")
		(end_action O5254 "14/01/2017 13:58")
		(duration_action O5254 8)
		(parameters_typeO O5254 driver147)

		(index_action D9136 22754)
		(is_action D9136)
		(is_typeD D9136)
		(start_action D9136 "14/01/2017 13:58")
		(end_action D9136 "14/01/2017 13:59")
		(duration_action D9136 1)
		(parameters_typeD D9136 driver147)

		(index_action O5255 22755)
		(is_action O5255)
		(is_typeO O5255)
		(start_action O5255 "14/01/2017 13:59")
		(end_action O5255 "14/01/2017 14:02")
		(duration_action O5255 3)
		(parameters_typeO O5255 driver147)

		(index_action D9137 22756)
		(is_action D9137)
		(is_typeD D9137)
		(start_action D9137 "14/01/2017 14:02")
		(end_action D9137 "14/01/2017 14:05")
		(duration_action D9137 3)
		(parameters_typeD D9137 driver147)

		(index_action B7783 22757)
		(is_action B7783)
		(is_typeB B7783)
		(start_action B7783 "14/01/2017 14:05")
		(end_action B7783 "16/01/2017 08:05")
		(duration_action B7783 2520)
		(parameters_typeB B7783 driver147)

	)
	(:tasks-goal
		:tasks (
			(WD driver147)
		)
	)
)