(define (problem prueba0) (:domain GantaBi)
	(:customization
		(= :time-format "%d/%m/%Y %H:%M")
		(= :time-horizon-relative 86400) ;; que son los minutos que tienen 2 meses
		(= :time-start "01/01/2017 00:00")
		(= :time-unit :minutes)
	)
	(:objects
		driver90 - Driver

		D5874 D5875 D5876 D5877 D5878 D5879 D5880 D5881 D5882 D5883 D5884 D5885 D5886 D5887 D5888 D5889 D5890 D5891 D5892 D5893 D5894 D5895 D5896 D5897 D5898 D5899 D5900 D5901 D5902 D5903 D5904 D5905 D5906 D5907
 - TaskInstanceSymbol
		O3236 O3237 O3238 O3239 O3240 O3241 O3242 O3243 O3244 O3245 O3246 O3247 O3248 O3249 O3250 O3251 O3252 O3253 O3254 O3255 O3256 O3257 O3258 O3259 O3260 O3261 O3262 O3263 O3264 O3265 O3266 O3267 O3268 O3269 O3270
 - TaskInstanceSymbol
		B4801 B4802 B4803 B4804 B4805 B4806 B4807 B4808 B4809 B4810 B4811 B4812 B4813 B4814 B4815 B4816 B4817 B4818 B4819 B4820 B4821 B4822 B4823 B4824 B4825 B4826 B4827 B4828 B4829 B4830 B4831 B4832 B4833 B4834 B4835 B4836 B4837 B4838 B4839 B4840 B4841 B4842 B4843 B4844 B4845 B4846 B4847 B4848 B4849 B4850
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

		(= (current_index_action) 14101)

		(= (last_dr) "02/01/2017 18:46")
		(= (last_wr) "02/01/2017 18:46")
		(= (actual-timestamp) "02/01/2017 18:46")

		; Events
		(index_action O3236 14101)
		(is_action O3236)
		(is_typeO O3236)
		(start_action O3236 "02/01/2017 18:46")
		(end_action O3236 "02/01/2017 18:56")
		(duration_action O3236 10)
		(parameters_typeO O3236 driver90)

		(index_action D5874 14102)
		(is_action D5874)
		(is_typeD D5874)
		(start_action D5874 "02/01/2017 18:56")
		(end_action D5874 "02/01/2017 18:57")
		(duration_action D5874 1)
		(parameters_typeD D5874 driver90)

		(index_action O3237 14103)
		(is_action O3237)
		(is_typeO O3237)
		(start_action O3237 "02/01/2017 18:57")
		(end_action O3237 "02/01/2017 18:59")
		(duration_action O3237 2)
		(parameters_typeO O3237 driver90)

		(index_action B4801 14104)
		(is_action B4801)
		(is_typeB B4801)
		(start_action B4801 "02/01/2017 18:59")
		(end_action B4801 "02/01/2017 20:11")
		(duration_action B4801 72)
		(parameters_typeB B4801 driver90)

		(index_action O3238 14105)
		(is_action O3238)
		(is_typeO O3238)
		(start_action O3238 "02/01/2017 20:11")
		(end_action O3238 "02/01/2017 20:45")
		(duration_action O3238 34)
		(parameters_typeO O3238 driver90)

		(index_action D5875 14106)
		(is_action D5875)
		(is_typeD D5875)
		(start_action D5875 "02/01/2017 20:45")
		(end_action D5875 "02/01/2017 20:47")
		(duration_action D5875 2)
		(parameters_typeD D5875 driver90)

		(index_action B4802 14107)
		(is_action B4802)
		(is_typeB B4802)
		(start_action B4802 "02/01/2017 20:47")
		(end_action B4802 "02/01/2017 21:20")
		(duration_action B4802 33)
		(parameters_typeB B4802 driver90)

		(index_action B4803 14108)
		(is_action B4803)
		(is_typeB B4803)
		(start_action B4803 "03/01/2017 01:39")
		(end_action B4803 "03/01/2017 03:40")
		(duration_action B4803 121)
		(parameters_typeB B4803 driver90)

		(index_action B4804 14109)
		(is_action B4804)
		(is_typeB B4804)
		(start_action B4804 "03/01/2017 08:18")
		(end_action B4804 "03/01/2017 10:44")
		(duration_action B4804 146)
		(parameters_typeB B4804 driver90)

		(index_action D5876 14110)
		(is_action D5876)
		(is_typeD D5876)
		(start_action D5876 "03/01/2017 10:44")
		(end_action D5876 "03/01/2017 10:51")
		(duration_action D5876 7)
		(parameters_typeD D5876 driver90)

		(index_action O3239 14111)
		(is_action O3239)
		(is_typeO O3239)
		(start_action O3239 "03/01/2017 10:51")
		(end_action O3239 "03/01/2017 11:08")
		(duration_action O3239 17)
		(parameters_typeO O3239 driver90)

		(index_action B4805 14112)
		(is_action B4805)
		(is_typeB B4805)
		(start_action B4805 "03/01/2017 11:46")
		(end_action B4805 "03/01/2017 12:17")
		(duration_action B4805 31)
		(parameters_typeB B4805 driver90)

		(index_action B4806 14113)
		(is_action B4806)
		(is_typeB B4806)
		(start_action B4806 "03/01/2017 15:13")
		(end_action B4806 "03/01/2017 16:23")
		(duration_action B4806 70)
		(parameters_typeB B4806 driver90)

		(index_action O3240 14114)
		(is_action O3240)
		(is_typeO O3240)
		(start_action O3240 "03/01/2017 19:13")
		(end_action O3240 "03/01/2017 19:28")
		(duration_action O3240 15)
		(parameters_typeO O3240 driver90)

		(index_action D5877 14115)
		(is_action D5877)
		(is_typeD D5877)
		(start_action D5877 "03/01/2017 19:28")
		(end_action D5877 "03/01/2017 19:32")
		(duration_action D5877 4)
		(parameters_typeD D5877 driver90)

		(index_action B4807 14116)
		(is_action B4807)
		(is_typeB B4807)
		(start_action B4807 "03/01/2017 19:32")
		(end_action B4807 "04/01/2017 08:05")
		(duration_action B4807 753)
		(parameters_typeB B4807 driver90)

		(index_action D5878 14117)
		(is_action D5878)
		(is_typeD D5878)
		(start_action D5878 "04/01/2017 08:05")
		(end_action D5878 "04/01/2017 08:08")
		(duration_action D5878 3)
		(parameters_typeD D5878 driver90)

		(index_action O3241 14118)
		(is_action O3241)
		(is_typeO O3241)
		(start_action O3241 "04/01/2017 08:08")
		(end_action O3241 "04/01/2017 08:17")
		(duration_action O3241 9)
		(parameters_typeO O3241 driver90)

		(index_action B4808 14119)
		(is_action B4808)
		(is_typeB B4808)
		(start_action B4808 "04/01/2017 08:17")
		(end_action B4808 "04/01/2017 09:58")
		(duration_action B4808 101)
		(parameters_typeB B4808 driver90)

		(index_action D5879 14120)
		(is_action D5879)
		(is_typeD D5879)
		(start_action D5879 "04/01/2017 09:58")
		(end_action D5879 "04/01/2017 10:00")
		(duration_action D5879 2)
		(parameters_typeD D5879 driver90)

		(index_action O3242 14121)
		(is_action O3242)
		(is_typeO O3242)
		(start_action O3242 "04/01/2017 10:00")
		(end_action O3242 "04/01/2017 10:02")
		(duration_action O3242 2)
		(parameters_typeO O3242 driver90)

		(index_action D5880 14122)
		(is_action D5880)
		(is_typeD D5880)
		(start_action D5880 "04/01/2017 10:02")
		(end_action D5880 "04/01/2017 10:03")
		(duration_action D5880 1)
		(parameters_typeD D5880 driver90)

		(index_action B4809 14123)
		(is_action B4809)
		(is_typeB B4809)
		(start_action B4809 "04/01/2017 10:03")
		(end_action B4809 "04/01/2017 10:53")
		(duration_action B4809 50)
		(parameters_typeB B4809 driver90)

		(index_action O3243 14124)
		(is_action O3243)
		(is_typeO O3243)
		(start_action O3243 "04/01/2017 10:53")
		(end_action O3243 "04/01/2017 10:59")
		(duration_action O3243 6)
		(parameters_typeO O3243 driver90)

		(index_action D5881 14125)
		(is_action D5881)
		(is_typeD D5881)
		(start_action D5881 "04/01/2017 10:59")
		(end_action D5881 "04/01/2017 11:03")
		(duration_action D5881 4)
		(parameters_typeD D5881 driver90)

		(index_action B4810 14126)
		(is_action B4810)
		(is_typeB B4810)
		(start_action B4810 "04/01/2017 11:03")
		(end_action B4810 "04/01/2017 12:32")
		(duration_action B4810 89)
		(parameters_typeB B4810 driver90)

		(index_action B4811 14127)
		(is_action B4811)
		(is_typeB B4811)
		(start_action B4811 "04/01/2017 15:46")
		(end_action B4811 "04/01/2017 16:50")
		(duration_action B4811 64)
		(parameters_typeB B4811 driver90)

		(index_action O3244 14128)
		(is_action O3244)
		(is_typeO O3244)
		(start_action O3244 "04/01/2017 19:56")
		(end_action O3244 "04/01/2017 20:08")
		(duration_action O3244 12)
		(parameters_typeO O3244 driver90)

		(index_action B4812 14129)
		(is_action B4812)
		(is_typeB B4812)
		(start_action B4812 "04/01/2017 20:08")
		(end_action B4812 "05/01/2017 07:10")
		(duration_action B4812 662)
		(parameters_typeB B4812 driver90)

		(index_action O3245 14130)
		(is_action O3245)
		(is_typeO O3245)
		(start_action O3245 "05/01/2017 07:10")
		(end_action O3245 "05/01/2017 07:18")
		(duration_action O3245 8)
		(parameters_typeO O3245 driver90)

		(index_action D5882 14131)
		(is_action D5882)
		(is_typeD D5882)
		(start_action D5882 "05/01/2017 07:18")
		(end_action D5882 "05/01/2017 07:19")
		(duration_action D5882 1)
		(parameters_typeD D5882 driver90)

		(index_action O3246 14132)
		(is_action O3246)
		(is_typeO O3246)
		(start_action O3246 "05/01/2017 07:19")
		(end_action O3246 "05/01/2017 07:41")
		(duration_action O3246 22)
		(parameters_typeO O3246 driver90)

		(index_action O3247 14133)
		(is_action O3247)
		(is_typeO O3247)
		(start_action O3247 "05/01/2017 09:56")
		(end_action O3247 "05/01/2017 10:07")
		(duration_action O3247 11)
		(parameters_typeO O3247 driver90)

		(index_action B4813 14134)
		(is_action B4813)
		(is_typeB B4813)
		(start_action B4813 "05/01/2017 10:07")
		(end_action B4813 "05/01/2017 10:10")
		(duration_action B4813 3)
		(parameters_typeB B4813 driver90)

		(index_action O3248 14135)
		(is_action O3248)
		(is_typeO O3248)
		(start_action O3248 "05/01/2017 10:10")
		(end_action O3248 "05/01/2017 10:15")
		(duration_action O3248 5)
		(parameters_typeO O3248 driver90)

		(index_action D5883 14136)
		(is_action D5883)
		(is_typeD D5883)
		(start_action D5883 "05/01/2017 10:15")
		(end_action D5883 "05/01/2017 10:17")
		(duration_action D5883 2)
		(parameters_typeD D5883 driver90)

		(index_action O3249 14137)
		(is_action O3249)
		(is_typeO O3249)
		(start_action O3249 "05/01/2017 10:17")
		(end_action O3249 "05/01/2017 10:20")
		(duration_action O3249 3)
		(parameters_typeO O3249 driver90)

		(index_action B4814 14138)
		(is_action B4814)
		(is_typeB B4814)
		(start_action B4814 "05/01/2017 10:20")
		(end_action B4814 "05/01/2017 10:26")
		(duration_action B4814 6)
		(parameters_typeB B4814 driver90)

		(index_action O3250 14139)
		(is_action O3250)
		(is_typeO O3250)
		(start_action O3250 "05/01/2017 10:26")
		(end_action O3250 "05/01/2017 10:34")
		(duration_action O3250 8)
		(parameters_typeO O3250 driver90)

		(index_action B4815 14140)
		(is_action B4815)
		(is_typeB B4815)
		(start_action B4815 "05/01/2017 10:34")
		(end_action B4815 "05/01/2017 11:02")
		(duration_action B4815 28)
		(parameters_typeB B4815 driver90)

		(index_action D5884 14141)
		(is_action D5884)
		(is_typeD D5884)
		(start_action D5884 "05/01/2017 11:02")
		(end_action D5884 "05/01/2017 11:03")
		(duration_action D5884 1)
		(parameters_typeD D5884 driver90)

		(index_action B4816 14142)
		(is_action B4816)
		(is_typeB B4816)
		(start_action B4816 "05/01/2017 11:03")
		(end_action B4816 "05/01/2017 11:50")
		(duration_action B4816 47)
		(parameters_typeB B4816 driver90)

		(index_action D5885 14143)
		(is_action D5885)
		(is_typeD D5885)
		(start_action D5885 "05/01/2017 11:50")
		(end_action D5885 "05/01/2017 11:51")
		(duration_action D5885 1)
		(parameters_typeD D5885 driver90)

		(index_action O3251 14144)
		(is_action O3251)
		(is_typeO O3251)
		(start_action O3251 "05/01/2017 11:51")
		(end_action O3251 "05/01/2017 11:57")
		(duration_action O3251 6)
		(parameters_typeO O3251 driver90)

		(index_action D5886 14145)
		(is_action D5886)
		(is_typeD D5886)
		(start_action D5886 "05/01/2017 11:57")
		(end_action D5886 "05/01/2017 11:58")
		(duration_action D5886 1)
		(parameters_typeD D5886 driver90)

		(index_action O3252 14146)
		(is_action O3252)
		(is_typeO O3252)
		(start_action O3252 "05/01/2017 11:58")
		(end_action O3252 "05/01/2017 12:05")
		(duration_action O3252 7)
		(parameters_typeO O3252 driver90)

		(index_action D5887 14147)
		(is_action D5887)
		(is_typeD D5887)
		(start_action D5887 "05/01/2017 12:05")
		(end_action D5887 "05/01/2017 12:06")
		(duration_action D5887 1)
		(parameters_typeD D5887 driver90)

		(index_action B4817 14148)
		(is_action B4817)
		(is_typeB B4817)
		(start_action B4817 "05/01/2017 12:06")
		(end_action B4817 "05/01/2017 12:26")
		(duration_action B4817 20)
		(parameters_typeB B4817 driver90)

		(index_action B4818 14149)
		(is_action B4818)
		(is_typeB B4818)
		(start_action B4818 "05/01/2017 15:37")
		(end_action B4818 "05/01/2017 15:38")
		(duration_action B4818 1)
		(parameters_typeB B4818 driver90)

		(index_action D5888 14150)
		(is_action D5888)
		(is_typeD D5888)
		(start_action D5888 "05/01/2017 15:38")
		(end_action D5888 "05/01/2017 15:40")
		(duration_action D5888 2)
		(parameters_typeD D5888 driver90)

		(index_action B4819 14151)
		(is_action B4819)
		(is_typeB B4819)
		(start_action B4819 "05/01/2017 15:40")
		(end_action B4819 "05/01/2017 16:33")
		(duration_action B4819 53)
		(parameters_typeB B4819 driver90)

		(index_action D5889 14152)
		(is_action D5889)
		(is_typeD D5889)
		(start_action D5889 "05/01/2017 19:45")
		(end_action D5889 "05/01/2017 19:46")
		(duration_action D5889 1)
		(parameters_typeD D5889 driver90)

		(index_action B4820 14153)
		(is_action B4820)
		(is_typeB B4820)
		(start_action B4820 "05/01/2017 19:46")
		(end_action B4820 "06/01/2017 15:18")
		(duration_action B4820 1172)
		(parameters_typeB B4820 driver90)

		(index_action D5890 14154)
		(is_action D5890)
		(is_typeD D5890)
		(start_action D5890 "06/01/2017 15:18")
		(end_action D5890 "06/01/2017 15:36")
		(duration_action D5890 18)
		(parameters_typeD D5890 driver90)

		(index_action B4821 14155)
		(is_action B4821)
		(is_typeB B4821)
		(start_action B4821 "06/01/2017 15:36")
		(end_action B4821 "06/01/2017 17:17")
		(duration_action B4821 101)
		(parameters_typeB B4821 driver90)

		(index_action B4822 14156)
		(is_action B4822)
		(is_typeB B4822)
		(start_action B4822 "06/01/2017 18:16")
		(end_action B4822 "06/01/2017 19:33")
		(duration_action B4822 77)
		(parameters_typeB B4822 driver90)

		(index_action B4823 14157)
		(is_action B4823)
		(is_typeB B4823)
		(start_action B4823 "07/01/2017 01:54")
		(end_action B4823 "07/01/2017 02:04")
		(duration_action B4823 10)
		(parameters_typeB B4823 driver90)

		(index_action B4824 14158)
		(is_action B4824)
		(is_typeB B4824)
		(start_action B4824 "07/01/2017 03:48")
		(end_action B4824 "07/01/2017 13:45")
		(duration_action B4824 597)
		(parameters_typeB B4824 driver90)

		(index_action O3253 14159)
		(is_action O3253)
		(is_typeO O3253)
		(start_action O3253 "07/01/2017 17:36")
		(end_action O3253 "07/01/2017 18:30")
		(duration_action O3253 54)
		(parameters_typeO O3253 driver90)

		(index_action B4825 14160)
		(is_action B4825)
		(is_typeB B4825)
		(start_action B4825 "07/01/2017 18:30")
		(end_action B4825 "07/01/2017 18:41")
		(duration_action B4825 11)
		(parameters_typeB B4825 driver90)

		(index_action O3254 14161)
		(is_action O3254)
		(is_typeO O3254)
		(start_action O3254 "07/01/2017 20:27")
		(end_action O3254 "07/01/2017 20:39")
		(duration_action O3254 12)
		(parameters_typeO O3254 driver90)

		(index_action D5891 14162)
		(is_action D5891)
		(is_typeD D5891)
		(start_action D5891 "07/01/2017 20:39")
		(end_action D5891 "07/01/2017 20:40")
		(duration_action D5891 1)
		(parameters_typeD D5891 driver90)

		(index_action B4826 14163)
		(is_action B4826)
		(is_typeB B4826)
		(start_action B4826 "07/01/2017 20:40")
		(end_action B4826 "09/01/2017 15:10")
		(duration_action B4826 2550)
		(parameters_typeB B4826 driver90)

		(index_action D5892 14164)
		(is_action D5892)
		(is_typeD D5892)
		(start_action D5892 "09/01/2017 15:10")
		(end_action D5892 "09/01/2017 15:18")
		(duration_action D5892 8)
		(parameters_typeD D5892 driver90)

		(index_action O3255 14165)
		(is_action O3255)
		(is_typeO O3255)
		(start_action O3255 "09/01/2017 15:18")
		(end_action O3255 "09/01/2017 15:20")
		(duration_action O3255 2)
		(parameters_typeO O3255 driver90)

		(index_action D5893 14166)
		(is_action D5893)
		(is_typeD D5893)
		(start_action D5893 "09/01/2017 15:20")
		(end_action D5893 "09/01/2017 15:43")
		(duration_action D5893 23)
		(parameters_typeD D5893 driver90)

		(index_action B4827 14167)
		(is_action B4827)
		(is_typeB B4827)
		(start_action B4827 "09/01/2017 16:07")
		(end_action B4827 "09/01/2017 16:14")
		(duration_action B4827 7)
		(parameters_typeB B4827 driver90)

		(index_action D5894 14168)
		(is_action D5894)
		(is_typeD D5894)
		(start_action D5894 "09/01/2017 16:14")
		(end_action D5894 "09/01/2017 16:16")
		(duration_action D5894 2)
		(parameters_typeD D5894 driver90)

		(index_action O3256 14169)
		(is_action O3256)
		(is_typeO O3256)
		(start_action O3256 "09/01/2017 16:16")
		(end_action O3256 "09/01/2017 16:18")
		(duration_action O3256 2)
		(parameters_typeO O3256 driver90)

		(index_action B4828 14170)
		(is_action B4828)
		(is_typeB B4828)
		(start_action B4828 "09/01/2017 16:18")
		(end_action B4828 "09/01/2017 17:03")
		(duration_action B4828 45)
		(parameters_typeB B4828 driver90)

		(index_action O3257 14171)
		(is_action O3257)
		(is_typeO O3257)
		(start_action O3257 "09/01/2017 17:03")
		(end_action O3257 "09/01/2017 17:05")
		(duration_action O3257 2)
		(parameters_typeO O3257 driver90)

		(index_action D5895 14172)
		(is_action D5895)
		(is_typeD D5895)
		(start_action D5895 "09/01/2017 17:05")
		(end_action D5895 "09/01/2017 17:06")
		(duration_action D5895 1)
		(parameters_typeD D5895 driver90)

		(index_action O3258 14173)
		(is_action O3258)
		(is_typeO O3258)
		(start_action O3258 "09/01/2017 17:06")
		(end_action O3258 "09/01/2017 17:09")
		(duration_action O3258 3)
		(parameters_typeO O3258 driver90)

		(index_action D5896 14174)
		(is_action D5896)
		(is_typeD D5896)
		(start_action D5896 "09/01/2017 17:09")
		(end_action D5896 "09/01/2017 17:10")
		(duration_action D5896 1)
		(parameters_typeD D5896 driver90)

		(index_action O3259 14175)
		(is_action O3259)
		(is_typeO O3259)
		(start_action O3259 "09/01/2017 17:10")
		(end_action O3259 "09/01/2017 17:53")
		(duration_action O3259 43)
		(parameters_typeO O3259 driver90)

		(index_action B4829 14176)
		(is_action B4829)
		(is_typeB B4829)
		(start_action B4829 "09/01/2017 22:34")
		(end_action B4829 "09/01/2017 22:45")
		(duration_action B4829 11)
		(parameters_typeB B4829 driver90)

		(index_action B4830 14177)
		(is_action B4830)
		(is_typeB B4830)
		(start_action B4830 "10/01/2017 02:49")
		(end_action B4830 "10/01/2017 03:00")
		(duration_action B4830 11)
		(parameters_typeB B4830 driver90)

		(index_action B4831 14178)
		(is_action B4831)
		(is_typeB B4831)
		(start_action B4831 "10/01/2017 04:25")
		(end_action B4831 "10/01/2017 13:26")
		(duration_action B4831 541)
		(parameters_typeB B4831 driver90)

		(index_action D5897 14179)
		(is_action D5897)
		(is_typeD D5897)
		(start_action D5897 "10/01/2017 13:26")
		(end_action D5897 "10/01/2017 14:55")
		(duration_action D5897 89)
		(parameters_typeD D5897 driver90)

		(index_action B4832 14180)
		(is_action B4832)
		(is_typeB B4832)
		(start_action B4832 "10/01/2017 14:55")
		(end_action B4832 "10/01/2017 15:02")
		(duration_action B4832 7)
		(parameters_typeB B4832 driver90)

		(index_action D5898 14181)
		(is_action D5898)
		(is_typeD D5898)
		(start_action D5898 "10/01/2017 15:02")
		(end_action D5898 "10/01/2017 15:03")
		(duration_action D5898 1)
		(parameters_typeD D5898 driver90)

		(index_action O3260 14182)
		(is_action O3260)
		(is_typeO O3260)
		(start_action O3260 "10/01/2017 15:03")
		(end_action O3260 "10/01/2017 15:05")
		(duration_action O3260 2)
		(parameters_typeO O3260 driver90)

		(index_action B4833 14183)
		(is_action B4833)
		(is_typeB B4833)
		(start_action B4833 "10/01/2017 15:05")
		(end_action B4833 "10/01/2017 16:11")
		(duration_action B4833 66)
		(parameters_typeB B4833 driver90)

		(index_action D5899 14184)
		(is_action D5899)
		(is_typeD D5899)
		(start_action D5899 "10/01/2017 16:11")
		(end_action D5899 "10/01/2017 16:42")
		(duration_action D5899 31)
		(parameters_typeD D5899 driver90)

		(index_action B4834 14185)
		(is_action B4834)
		(is_typeB B4834)
		(start_action B4834 "10/01/2017 19:55")
		(end_action B4834 "10/01/2017 20:55")
		(duration_action B4834 60)
		(parameters_typeB B4834 driver90)

		(index_action B4835 14186)
		(is_action B4835)
		(is_typeB B4835)
		(start_action B4835 "10/01/2017 23:30")
		(end_action B4835 "11/01/2017 14:02")
		(duration_action B4835 872)
		(parameters_typeB B4835 driver90)

		(index_action B4836 14187)
		(is_action B4836)
		(is_typeB B4836)
		(start_action B4836 "11/01/2017 17:03")
		(end_action B4836 "12/01/2017 08:00")
		(duration_action B4836 897)
		(parameters_typeB B4836 driver90)

		(index_action O3261 14188)
		(is_action O3261)
		(is_typeO O3261)
		(start_action O3261 "12/01/2017 08:00")
		(end_action O3261 "12/01/2017 08:01")
		(duration_action O3261 1)
		(parameters_typeO O3261 driver90)

		(index_action B4837 14189)
		(is_action B4837)
		(is_typeB B4837)
		(start_action B4837 "12/01/2017 08:01")
		(end_action B4837 "12/01/2017 08:07")
		(duration_action B4837 6)
		(parameters_typeB B4837 driver90)

		(index_action D5900 14190)
		(is_action D5900)
		(is_typeD D5900)
		(start_action D5900 "12/01/2017 08:07")
		(end_action D5900 "12/01/2017 08:08")
		(duration_action D5900 1)
		(parameters_typeD D5900 driver90)

		(index_action O3262 14191)
		(is_action O3262)
		(is_typeO O3262)
		(start_action O3262 "12/01/2017 08:08")
		(end_action O3262 "12/01/2017 08:15")
		(duration_action O3262 7)
		(parameters_typeO O3262 driver90)

		(index_action B4838 14192)
		(is_action B4838)
		(is_typeB B4838)
		(start_action B4838 "12/01/2017 08:15")
		(end_action B4838 "12/01/2017 10:06")
		(duration_action B4838 111)
		(parameters_typeB B4838 driver90)

		(index_action O3263 14193)
		(is_action O3263)
		(is_typeO O3263)
		(start_action O3263 "12/01/2017 10:06")
		(end_action O3263 "12/01/2017 10:27")
		(duration_action O3263 21)
		(parameters_typeO O3263 driver90)

		(index_action D5901 14194)
		(is_action D5901)
		(is_typeD D5901)
		(start_action D5901 "12/01/2017 10:27")
		(end_action D5901 "12/01/2017 10:33")
		(duration_action D5901 6)
		(parameters_typeD D5901 driver90)

		(index_action B4839 14195)
		(is_action B4839)
		(is_typeB B4839)
		(start_action B4839 "12/01/2017 10:33")
		(end_action B4839 "12/01/2017 11:52")
		(duration_action B4839 79)
		(parameters_typeB B4839 driver90)

		(index_action D5902 14196)
		(is_action D5902)
		(is_typeD D5902)
		(start_action D5902 "12/01/2017 11:52")
		(end_action D5902 "12/01/2017 12:07")
		(duration_action D5902 15)
		(parameters_typeD D5902 driver90)

		(index_action O3264 14197)
		(is_action O3264)
		(is_typeO O3264)
		(start_action O3264 "12/01/2017 12:07")
		(end_action O3264 "12/01/2017 12:09")
		(duration_action O3264 2)
		(parameters_typeO O3264 driver90)

		(index_action D5903 14198)
		(is_action D5903)
		(is_typeD D5903)
		(start_action D5903 "12/01/2017 12:09")
		(end_action D5903 "12/01/2017 12:21")
		(duration_action D5903 12)
		(parameters_typeD D5903 driver90)

		(index_action O3265 14199)
		(is_action O3265)
		(is_typeO O3265)
		(start_action O3265 "12/01/2017 12:21")
		(end_action O3265 "12/01/2017 12:24")
		(duration_action O3265 3)
		(parameters_typeO O3265 driver90)

		(index_action D5904 14200)
		(is_action D5904)
		(is_typeD D5904)
		(start_action D5904 "12/01/2017 12:24")
		(end_action D5904 "12/01/2017 12:46")
		(duration_action D5904 22)
		(parameters_typeD D5904 driver90)

		(index_action B4840 14201)
		(is_action B4840)
		(is_typeB B4840)
		(start_action B4840 "12/01/2017 14:25")
		(end_action B4840 "12/01/2017 15:06")
		(duration_action B4840 41)
		(parameters_typeB B4840 driver90)

		(index_action B4841 14202)
		(is_action B4841)
		(is_typeB B4841)
		(start_action B4841 "12/01/2017 19:44")
		(end_action B4841 "13/01/2017 07:34")
		(duration_action B4841 710)
		(parameters_typeB B4841 driver90)

		(index_action O3266 14203)
		(is_action O3266)
		(is_typeO O3266)
		(start_action O3266 "13/01/2017 07:34")
		(end_action O3266 "13/01/2017 08:21")
		(duration_action O3266 47)
		(parameters_typeO O3266 driver90)

		(index_action D5905 14204)
		(is_action D5905)
		(is_typeD D5905)
		(start_action D5905 "13/01/2017 08:21")
		(end_action D5905 "13/01/2017 08:22")
		(duration_action D5905 1)
		(parameters_typeD D5905 driver90)

		(index_action O3267 14205)
		(is_action O3267)
		(is_typeO O3267)
		(start_action O3267 "13/01/2017 08:22")
		(end_action O3267 "13/01/2017 08:55")
		(duration_action O3267 33)
		(parameters_typeO O3267 driver90)

		(index_action B4842 14206)
		(is_action B4842)
		(is_typeB B4842)
		(start_action B4842 "13/01/2017 08:55")
		(end_action B4842 "13/01/2017 10:18")
		(duration_action B4842 83)
		(parameters_typeB B4842 driver90)

		(index_action B4843 14207)
		(is_action B4843)
		(is_typeB B4843)
		(start_action B4843 "13/01/2017 10:21")
		(end_action B4843 "13/01/2017 11:22")
		(duration_action B4843 61)
		(parameters_typeB B4843 driver90)

		(index_action B4844 14208)
		(is_action B4844)
		(is_typeB B4844)
		(start_action B4844 "13/01/2017 14:45")
		(end_action B4844 "14/01/2017 00:07")
		(duration_action B4844 562)
		(parameters_typeB B4844 driver90)

		(index_action B4845 14209)
		(is_action B4845)
		(is_typeB B4845)
		(start_action B4845 "14/01/2017 04:47")
		(end_action B4845 "14/01/2017 04:58")
		(duration_action B4845 11)
		(parameters_typeB B4845 driver90)

		(index_action B4846 14210)
		(is_action B4846)
		(is_typeB B4846)
		(start_action B4846 "14/01/2017 06:27")
		(end_action B4846 "14/01/2017 06:46")
		(duration_action B4846 19)
		(parameters_typeB B4846 driver90)

		(index_action O3268 14211)
		(is_action O3268)
		(is_typeO O3268)
		(start_action O3268 "14/01/2017 06:46")
		(end_action O3268 "14/01/2017 07:02")
		(duration_action O3268 16)
		(parameters_typeO O3268 driver90)

		(index_action B4847 14212)
		(is_action B4847)
		(is_typeB B4847)
		(start_action B4847 "14/01/2017 07:02")
		(end_action B4847 "14/01/2017 08:25")
		(duration_action B4847 83)
		(parameters_typeB B4847 driver90)

		(index_action B4848 14213)
		(is_action B4848)
		(is_typeB B4848)
		(start_action B4848 "14/01/2017 10:32")
		(end_action B4848 "14/01/2017 10:34")
		(duration_action B4848 2)
		(parameters_typeB B4848 driver90)

		(index_action D5906 14214)
		(is_action D5906)
		(is_typeD D5906)
		(start_action D5906 "14/01/2017 10:34")
		(end_action D5906 "14/01/2017 10:35")
		(duration_action D5906 1)
		(parameters_typeD D5906 driver90)

		(index_action O3269 14215)
		(is_action O3269)
		(is_typeO O3269)
		(start_action O3269 "14/01/2017 10:35")
		(end_action O3269 "14/01/2017 10:44")
		(duration_action O3269 9)
		(parameters_typeO O3269 driver90)

		(index_action B4849 14216)
		(is_action B4849)
		(is_typeB B4849)
		(start_action B4849 "14/01/2017 10:44")
		(end_action B4849 "14/01/2017 10:51")
		(duration_action B4849 7)
		(parameters_typeB B4849 driver90)

		(index_action O3270 14217)
		(is_action O3270)
		(is_typeO O3270)
		(start_action O3270 "14/01/2017 10:51")
		(end_action O3270 "14/01/2017 10:52")
		(duration_action O3270 1)
		(parameters_typeO O3270 driver90)

		(index_action D5907 14218)
		(is_action D5907)
		(is_typeD D5907)
		(start_action D5907 "14/01/2017 10:52")
		(end_action D5907 "14/01/2017 10:53")
		(duration_action D5907 1)
		(parameters_typeD D5907 driver90)

		(index_action B4850 14219)
		(is_action B4850)
		(is_typeB B4850)
		(start_action B4850 "14/01/2017 10:53")
		(end_action B4850 "14/01/2017 13:11")
		(duration_action B4850 138)
		(parameters_typeB B4850 driver90)

	)
	(:tasks-goal
		:tasks (
			(WD driver90)
		)
	)
)