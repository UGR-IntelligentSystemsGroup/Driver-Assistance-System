(define (problem prueba0) (:domain GantaBi)
	(:customization
		(= :time-format "%d/%m/%Y %H:%M")
		(= :time-horizon-relative 86400) ;; que son los minutos que tienen 2 meses
		(= :time-start "01/01/2017 00:00")
		(= :time-unit :minutes)
	)
	(:objects
		driver204 - Driver

		D12581 D12582 D12583 D12584 D12585 D12586 D12587 D12588 D12589 D12590 D12591 D12592 D12593 D12594 D12595 D12596 D12597 D12598 D12599 D12600 D12601 D12602
 - TaskInstanceSymbol
		O7438 O7439 O7440 O7441 O7442 O7443 O7444 O7445 O7446 O7447 O7448 O7449
 - TaskInstanceSymbol
		B10958 B10959 B10960 B10961 B10962 B10963 B10964 B10965 B10966 B10967 B10968 B10969 B10970 B10971 B10972 B10973 B10974 B10975 B10976 B10977 B10978 B10979 B10980 B10981 B10982 B10983 B10984 B10985 B10986 B10987 B10988 B10989 B10990 B10991 B10992 B10993 B10994 B10995 B10996 B10997
 - TaskInstanceSymbol
		I1185 I1186 I1187 I1188 I1189 I1190 I1191 I1192 I1193 I1194 I1195 I1196 I1197 I1198 I1199 I1200 I1201 I1202 I1203 I1204 I1205 - TaskInstanceSymbol
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

		(= (current_index_action) 32158)

		(= (last_dr) "08/01/2017 11:03")
		(= (last_wr) "08/01/2017 11:03")
		(= (actual-timestamp) "08/01/2017 11:03")

		; Events
		(index_action B10958 32158)
		(is_action B10958)
		(is_typeB B10958)
		(start_action B10958 "08/01/2017 11:03")
		(end_action B10958 "10/01/2017 09:09")
		(duration_action B10958 2766)
		(parameters_typeB B10958 driver204)

		(index_action I1185 32159)
		(is_action I1185)
		(is_typeI I1185)
		(start_action I1185 "10/01/2017 09:09")
		(end_action I1185 "10/01/2017 11:58")
		(duration_action I1185 169)
		(parameters_typeI I1185 driver204)

		(index_action B10959 32160)
		(is_action B10959)
		(is_typeB B10959)
		(start_action B10959 "10/01/2017 11:58")
		(end_action B10959 "10/01/2017 13:01")
		(duration_action B10959 63)
		(parameters_typeB B10959 driver204)

		(index_action I1186 32161)
		(is_action I1186)
		(is_typeI I1186)
		(start_action I1186 "10/01/2017 13:01")
		(end_action I1186 "10/01/2017 13:30")
		(duration_action I1186 29)
		(parameters_typeI I1186 driver204)

		(index_action B10960 32162)
		(is_action B10960)
		(is_typeB B10960)
		(start_action B10960 "10/01/2017 13:30")
		(end_action B10960 "10/01/2017 13:31")
		(duration_action B10960 1)
		(parameters_typeB B10960 driver204)

		(index_action B10961 32163)
		(is_action B10961)
		(is_typeB B10961)
		(start_action B10961 "10/01/2017 13:33")
		(end_action B10961 "10/01/2017 13:47")
		(duration_action B10961 14)
		(parameters_typeB B10961 driver204)

		(index_action D12581 32164)
		(is_action D12581)
		(is_typeD D12581)
		(start_action D12581 "10/01/2017 13:47")
		(end_action D12581 "10/01/2017 17:10")
		(duration_action D12581 203)
		(parameters_typeD D12581 driver204)

		(index_action O7438 32165)
		(is_action O7438)
		(is_typeO O7438)
		(start_action O7438 "10/01/2017 17:10")
		(end_action O7438 "10/01/2017 17:12")
		(duration_action O7438 2)
		(parameters_typeO O7438 driver204)

		(index_action B10962 32166)
		(is_action B10962)
		(is_typeB B10962)
		(start_action B10962 "10/01/2017 17:12")
		(end_action B10962 "11/01/2017 07:02")
		(duration_action B10962 830)
		(parameters_typeB B10962 driver204)

		(index_action D12582 32167)
		(is_action D12582)
		(is_typeD D12582)
		(start_action D12582 "11/01/2017 07:02")
		(end_action D12582 "11/01/2017 07:04")
		(duration_action D12582 2)
		(parameters_typeD D12582 driver204)

		(index_action O7439 32168)
		(is_action O7439)
		(is_typeO O7439)
		(start_action O7439 "11/01/2017 07:04")
		(end_action O7439 "11/01/2017 07:06")
		(duration_action O7439 2)
		(parameters_typeO O7439 driver204)

		(index_action D12583 32169)
		(is_action D12583)
		(is_typeD D12583)
		(start_action D12583 "11/01/2017 07:06")
		(end_action D12583 "11/01/2017 07:08")
		(duration_action D12583 2)
		(parameters_typeD D12583 driver204)

		(index_action O7440 32170)
		(is_action O7440)
		(is_typeO O7440)
		(start_action O7440 "11/01/2017 07:08")
		(end_action O7440 "11/01/2017 07:30")
		(duration_action O7440 22)
		(parameters_typeO O7440 driver204)

		(index_action B10963 32171)
		(is_action B10963)
		(is_typeB B10963)
		(start_action B10963 "11/01/2017 07:30")
		(end_action B10963 "11/01/2017 08:57")
		(duration_action B10963 87)
		(parameters_typeB B10963 driver204)

		(index_action O7441 32172)
		(is_action O7441)
		(is_typeO O7441)
		(start_action O7441 "11/01/2017 08:57")
		(end_action O7441 "11/01/2017 09:09")
		(duration_action O7441 12)
		(parameters_typeO O7441 driver204)

		(index_action D12584 32173)
		(is_action D12584)
		(is_typeD D12584)
		(start_action D12584 "11/01/2017 09:09")
		(end_action D12584 "11/01/2017 11:12")
		(duration_action D12584 123)
		(parameters_typeD D12584 driver204)

		(index_action O7442 32174)
		(is_action O7442)
		(is_typeO O7442)
		(start_action O7442 "11/01/2017 11:12")
		(end_action O7442 "11/01/2017 11:14")
		(duration_action O7442 2)
		(parameters_typeO O7442 driver204)

		(index_action D12585 32175)
		(is_action D12585)
		(is_typeD D12585)
		(start_action D12585 "11/01/2017 11:14")
		(end_action D12585 "11/01/2017 13:29")
		(duration_action D12585 135)
		(parameters_typeD D12585 driver204)

		(index_action B10964 32176)
		(is_action B10964)
		(is_typeB B10964)
		(start_action B10964 "11/01/2017 13:33")
		(end_action B10964 "11/01/2017 13:34")
		(duration_action B10964 1)
		(parameters_typeB B10964 driver204)

		(index_action I1187 32177)
		(is_action I1187)
		(is_typeI I1187)
		(start_action I1187 "11/01/2017 13:34")
		(end_action I1187 "11/01/2017 15:04")
		(duration_action I1187 90)
		(parameters_typeI I1187 driver204)

		(index_action B10965 32178)
		(is_action B10965)
		(is_typeB B10965)
		(start_action B10965 "11/01/2017 15:04")
		(end_action B10965 "11/01/2017 15:18")
		(duration_action B10965 14)
		(parameters_typeB B10965 driver204)

		(index_action I1188 32179)
		(is_action I1188)
		(is_typeI I1188)
		(start_action I1188 "11/01/2017 15:18")
		(end_action I1188 "11/01/2017 17:58")
		(duration_action I1188 160)
		(parameters_typeI I1188 driver204)

		(index_action B10966 32180)
		(is_action B10966)
		(is_typeB B10966)
		(start_action B10966 "11/01/2017 18:01")
		(end_action B10966 "11/01/2017 18:02")
		(duration_action B10966 1)
		(parameters_typeB B10966 driver204)

		(index_action D12586 32181)
		(is_action D12586)
		(is_typeD D12586)
		(start_action D12586 "11/01/2017 18:02")
		(end_action D12586 "11/01/2017 18:44")
		(duration_action D12586 42)
		(parameters_typeD D12586 driver204)

		(index_action B10967 32182)
		(is_action B10967)
		(is_typeB B10967)
		(start_action B10967 "11/01/2017 18:44")
		(end_action B10967 "11/01/2017 18:55")
		(duration_action B10967 11)
		(parameters_typeB B10967 driver204)

		(index_action D12587 32183)
		(is_action D12587)
		(is_typeD D12587)
		(start_action D12587 "11/01/2017 18:55")
		(end_action D12587 "11/01/2017 22:31")
		(duration_action D12587 216)
		(parameters_typeD D12587 driver204)

		(index_action B10968 32184)
		(is_action B10968)
		(is_typeB B10968)
		(start_action B10968 "11/01/2017 22:36")
		(end_action B10968 "11/01/2017 22:45")
		(duration_action B10968 9)
		(parameters_typeB B10968 driver204)

		(index_action I1189 32185)
		(is_action I1189)
		(is_typeI I1189)
		(start_action I1189 "11/01/2017 22:45")
		(end_action I1189 "12/01/2017 00:19")
		(duration_action I1189 94)
		(parameters_typeI I1189 driver204)

		(index_action B10969 32186)
		(is_action B10969)
		(is_typeB B10969)
		(start_action B10969 "12/01/2017 00:19")
		(end_action B10969 "12/01/2017 00:27")
		(duration_action B10969 8)
		(parameters_typeB B10969 driver204)

		(index_action I1190 32187)
		(is_action I1190)
		(is_typeI I1190)
		(start_action I1190 "12/01/2017 00:27")
		(end_action I1190 "12/01/2017 03:05")
		(duration_action I1190 158)
		(parameters_typeI I1190 driver204)

		(index_action B10970 32188)
		(is_action B10970)
		(is_typeB B10970)
		(start_action B10970 "12/01/2017 03:05")
		(end_action B10970 "12/01/2017 12:16")
		(duration_action B10970 551)
		(parameters_typeB B10970 driver204)

		(index_action I1191 32189)
		(is_action I1191)
		(is_typeI I1191)
		(start_action I1191 "12/01/2017 12:16")
		(end_action I1191 "12/01/2017 13:23")
		(duration_action I1191 67)
		(parameters_typeI I1191 driver204)

		(index_action B10971 32190)
		(is_action B10971)
		(is_typeB B10971)
		(start_action B10971 "12/01/2017 13:23")
		(end_action B10971 "12/01/2017 13:37")
		(duration_action B10971 14)
		(parameters_typeB B10971 driver204)

		(index_action I1192 32191)
		(is_action I1192)
		(is_typeI I1192)
		(start_action I1192 "12/01/2017 13:37")
		(end_action I1192 "12/01/2017 15:02")
		(duration_action I1192 85)
		(parameters_typeI I1192 driver204)

		(index_action B10972 32192)
		(is_action B10972)
		(is_typeB B10972)
		(start_action B10972 "12/01/2017 15:02")
		(end_action B10972 "12/01/2017 15:10")
		(duration_action B10972 8)
		(parameters_typeB B10972 driver204)

		(index_action I1193 32193)
		(is_action I1193)
		(is_typeI I1193)
		(start_action I1193 "12/01/2017 15:10")
		(end_action I1193 "12/01/2017 17:05")
		(duration_action I1193 115)
		(parameters_typeI I1193 driver204)

		(index_action B10973 32194)
		(is_action B10973)
		(is_typeB B10973)
		(start_action B10973 "12/01/2017 17:05")
		(end_action B10973 "12/01/2017 17:06")
		(duration_action B10973 1)
		(parameters_typeB B10973 driver204)

		(index_action B10974 32195)
		(is_action B10974)
		(is_typeB B10974)
		(start_action B10974 "12/01/2017 17:08")
		(end_action B10974 "12/01/2017 17:22")
		(duration_action B10974 14)
		(parameters_typeB B10974 driver204)

		(index_action D12588 32196)
		(is_action D12588)
		(is_typeD D12588)
		(start_action D12588 "12/01/2017 17:22")
		(end_action D12588 "12/01/2017 17:24")
		(duration_action D12588 2)
		(parameters_typeD D12588 driver204)

		(index_action B10975 32197)
		(is_action B10975)
		(is_typeB B10975)
		(start_action B10975 "12/01/2017 17:24")
		(end_action B10975 "12/01/2017 17:38")
		(duration_action B10975 14)
		(parameters_typeB B10975 driver204)

		(index_action D12589 32198)
		(is_action D12589)
		(is_typeD D12589)
		(start_action D12589 "12/01/2017 17:38")
		(end_action D12589 "12/01/2017 17:50")
		(duration_action D12589 12)
		(parameters_typeD D12589 driver204)

		(index_action B10976 32199)
		(is_action B10976)
		(is_typeB B10976)
		(start_action B10976 "12/01/2017 17:50")
		(end_action B10976 "12/01/2017 18:13")
		(duration_action B10976 23)
		(parameters_typeB B10976 driver204)

		(index_action D12590 32200)
		(is_action D12590)
		(is_typeD D12590)
		(start_action D12590 "12/01/2017 18:13")
		(end_action D12590 "12/01/2017 22:15")
		(duration_action D12590 242)
		(parameters_typeD D12590 driver204)

		(index_action B10977 32201)
		(is_action B10977)
		(is_typeB B10977)
		(start_action B10977 "12/01/2017 22:19")
		(end_action B10977 "12/01/2017 22:23")
		(duration_action B10977 4)
		(parameters_typeB B10977 driver204)

		(index_action I1194 32202)
		(is_action I1194)
		(is_typeI I1194)
		(start_action I1194 "12/01/2017 22:23")
		(end_action I1194 "13/01/2017 02:45")
		(duration_action I1194 262)
		(parameters_typeI I1194 driver204)

		(index_action B10978 32203)
		(is_action B10978)
		(is_typeB B10978)
		(start_action B10978 "13/01/2017 02:45")
		(end_action B10978 "13/01/2017 02:46")
		(duration_action B10978 1)
		(parameters_typeB B10978 driver204)

		(index_action B10979 32204)
		(is_action B10979)
		(is_typeB B10979)
		(start_action B10979 "13/01/2017 02:49")
		(end_action B10979 "13/01/2017 02:52")
		(duration_action B10979 3)
		(parameters_typeB B10979 driver204)

		(index_action D12591 32205)
		(is_action D12591)
		(is_typeD D12591)
		(start_action D12591 "13/01/2017 02:52")
		(end_action D12591 "13/01/2017 07:08")
		(duration_action D12591 256)
		(parameters_typeD D12591 driver204)

		(index_action B10980 32206)
		(is_action B10980)
		(is_typeB B10980)
		(start_action B10980 "13/01/2017 07:08")
		(end_action B10980 "13/01/2017 16:16")
		(duration_action B10980 548)
		(parameters_typeB B10980 driver204)

		(index_action D12592 32207)
		(is_action D12592)
		(is_typeD D12592)
		(start_action D12592 "13/01/2017 16:16")
		(end_action D12592 "13/01/2017 17:44")
		(duration_action D12592 88)
		(parameters_typeD D12592 driver204)

		(index_action O7443 32208)
		(is_action O7443)
		(is_typeO O7443)
		(start_action O7443 "13/01/2017 17:44")
		(end_action O7443 "13/01/2017 17:48")
		(duration_action O7443 4)
		(parameters_typeO O7443 driver204)

		(index_action D12593 32209)
		(is_action D12593)
		(is_typeD D12593)
		(start_action D12593 "13/01/2017 17:48")
		(end_action D12593 "13/01/2017 19:27")
		(duration_action D12593 99)
		(parameters_typeD D12593 driver204)

		(index_action O7444 32210)
		(is_action O7444)
		(is_typeO O7444)
		(start_action O7444 "13/01/2017 19:27")
		(end_action O7444 "13/01/2017 19:54")
		(duration_action O7444 27)
		(parameters_typeO O7444 driver204)

		(index_action D12594 32211)
		(is_action D12594)
		(is_typeD D12594)
		(start_action D12594 "13/01/2017 19:54")
		(end_action D12594 "13/01/2017 19:57")
		(duration_action D12594 3)
		(parameters_typeD D12594 driver204)

		(index_action O7445 32212)
		(is_action O7445)
		(is_typeO O7445)
		(start_action O7445 "13/01/2017 19:57")
		(end_action O7445 "13/01/2017 20:00")
		(duration_action O7445 3)
		(parameters_typeO O7445 driver204)

		(index_action D12595 32213)
		(is_action D12595)
		(is_typeD D12595)
		(start_action D12595 "13/01/2017 20:00")
		(end_action D12595 "13/01/2017 20:01")
		(duration_action D12595 1)
		(parameters_typeD D12595 driver204)

		(index_action O7446 32214)
		(is_action O7446)
		(is_typeO O7446)
		(start_action O7446 "13/01/2017 20:01")
		(end_action O7446 "13/01/2017 20:05")
		(duration_action O7446 4)
		(parameters_typeO O7446 driver204)

		(index_action D12596 32215)
		(is_action D12596)
		(is_typeD D12596)
		(start_action D12596 "13/01/2017 20:05")
		(end_action D12596 "13/01/2017 20:10")
		(duration_action D12596 5)
		(parameters_typeD D12596 driver204)

		(index_action O7447 32216)
		(is_action O7447)
		(is_typeO O7447)
		(start_action O7447 "13/01/2017 20:10")
		(end_action O7447 "13/01/2017 20:14")
		(duration_action O7447 4)
		(parameters_typeO O7447 driver204)

		(index_action D12597 32217)
		(is_action D12597)
		(is_typeD D12597)
		(start_action D12597 "13/01/2017 20:14")
		(end_action D12597 "13/01/2017 20:27")
		(duration_action D12597 13)
		(parameters_typeD D12597 driver204)

		(index_action O7448 32218)
		(is_action O7448)
		(is_typeO O7448)
		(start_action O7448 "13/01/2017 20:27")
		(end_action O7448 "13/01/2017 20:28")
		(duration_action O7448 1)
		(parameters_typeO O7448 driver204)

		(index_action B10981 32219)
		(is_action B10981)
		(is_typeB B10981)
		(start_action B10981 "13/01/2017 20:28")
		(end_action B10981 "14/01/2017 20:33")
		(duration_action B10981 1445)
		(parameters_typeB B10981 driver204)

		(index_action D12598 32220)
		(is_action D12598)
		(is_typeD D12598)
		(start_action D12598 "14/01/2017 20:33")
		(end_action D12598 "14/01/2017 20:35")
		(duration_action D12598 2)
		(parameters_typeD D12598 driver204)

		(index_action O7449 32221)
		(is_action O7449)
		(is_typeO O7449)
		(start_action O7449 "14/01/2017 20:35")
		(end_action O7449 "14/01/2017 20:40")
		(duration_action O7449 5)
		(parameters_typeO O7449 driver204)

		(index_action D12599 32222)
		(is_action D12599)
		(is_typeD D12599)
		(start_action D12599 "14/01/2017 20:40")
		(end_action D12599 "15/01/2017 00:41")
		(duration_action D12599 241)
		(parameters_typeD D12599 driver204)

		(index_action B10982 32223)
		(is_action B10982)
		(is_typeB B10982)
		(start_action B10982 "15/01/2017 00:41")
		(end_action B10982 "15/01/2017 00:42")
		(duration_action B10982 1)
		(parameters_typeB B10982 driver204)

		(index_action B10983 32224)
		(is_action B10983)
		(is_typeB B10983)
		(start_action B10983 "15/01/2017 00:46")
		(end_action B10983 "15/01/2017 00:48")
		(duration_action B10983 2)
		(parameters_typeB B10983 driver204)

		(index_action I1195 32225)
		(is_action I1195)
		(is_typeI I1195)
		(start_action I1195 "15/01/2017 00:48")
		(end_action I1195 "15/01/2017 04:54")
		(duration_action I1195 246)
		(parameters_typeI I1195 driver204)

		(index_action B10984 32226)
		(is_action B10984)
		(is_typeB B10984)
		(start_action B10984 "15/01/2017 04:57")
		(end_action B10984 "15/01/2017 04:59")
		(duration_action B10984 2)
		(parameters_typeB B10984 driver204)

		(index_action D12600 32227)
		(is_action D12600)
		(is_typeD D12600)
		(start_action D12600 "15/01/2017 04:59")
		(end_action D12600 "15/01/2017 06:35")
		(duration_action D12600 96)
		(parameters_typeD D12600 driver204)

		(index_action B10985 32228)
		(is_action B10985)
		(is_typeB B10985)
		(start_action B10985 "15/01/2017 06:35")
		(end_action B10985 "15/01/2017 06:54")
		(duration_action B10985 19)
		(parameters_typeB B10985 driver204)

		(index_action D12601 32229)
		(is_action D12601)
		(is_typeD D12601)
		(start_action D12601 "15/01/2017 06:54")
		(end_action D12601 "15/01/2017 06:55")
		(duration_action D12601 1)
		(parameters_typeD D12601 driver204)

		(index_action B10986 32230)
		(is_action B10986)
		(is_typeB B10986)
		(start_action B10986 "15/01/2017 06:55")
		(end_action B10986 "15/01/2017 07:08")
		(duration_action B10986 13)
		(parameters_typeB B10986 driver204)

		(index_action D12602 32231)
		(is_action D12602)
		(is_typeD D12602)
		(start_action D12602 "15/01/2017 07:08")
		(end_action D12602 "15/01/2017 09:50")
		(duration_action D12602 162)
		(parameters_typeD D12602 driver204)

		(index_action B10987 32232)
		(is_action B10987)
		(is_typeB B10987)
		(start_action B10987 "15/01/2017 09:54")
		(end_action B10987 "15/01/2017 09:57")
		(duration_action B10987 3)
		(parameters_typeB B10987 driver204)

		(index_action I1196 32233)
		(is_action I1196)
		(is_typeI I1196)
		(start_action I1196 "15/01/2017 09:57")
		(end_action I1196 "15/01/2017 10:15")
		(duration_action I1196 18)
		(parameters_typeI I1196 driver204)

		(index_action B10988 32234)
		(is_action B10988)
		(is_typeB B10988)
		(start_action B10988 "15/01/2017 10:15")
		(end_action B10988 "15/01/2017 10:18")
		(duration_action B10988 3)
		(parameters_typeB B10988 driver204)

		(index_action I1197 32235)
		(is_action I1197)
		(is_typeI I1197)
		(start_action I1197 "15/01/2017 10:18")
		(end_action I1197 "15/01/2017 10:19")
		(duration_action I1197 1)
		(parameters_typeI I1197 driver204)

		(index_action B10989 32236)
		(is_action B10989)
		(is_typeB B10989)
		(start_action B10989 "15/01/2017 10:19")
		(end_action B10989 "15/01/2017 10:27")
		(duration_action B10989 8)
		(parameters_typeB B10989 driver204)

		(index_action I1198 32237)
		(is_action I1198)
		(is_typeI I1198)
		(start_action I1198 "15/01/2017 10:27")
		(end_action I1198 "15/01/2017 10:39")
		(duration_action I1198 12)
		(parameters_typeI I1198 driver204)

		(index_action B10990 32238)
		(is_action B10990)
		(is_typeB B10990)
		(start_action B10990 "15/01/2017 10:39")
		(end_action B10990 "15/01/2017 10:42")
		(duration_action B10990 3)
		(parameters_typeB B10990 driver204)

		(index_action I1199 32239)
		(is_action I1199)
		(is_typeI I1199)
		(start_action I1199 "15/01/2017 10:42")
		(end_action I1199 "15/01/2017 10:44")
		(duration_action I1199 2)
		(parameters_typeI I1199 driver204)

		(index_action B10991 32240)
		(is_action B10991)
		(is_typeB B10991)
		(start_action B10991 "15/01/2017 10:44")
		(end_action B10991 "15/01/2017 13:10")
		(duration_action B10991 146)
		(parameters_typeB B10991 driver204)

		(index_action I1200 32241)
		(is_action I1200)
		(is_typeI I1200)
		(start_action I1200 "15/01/2017 13:10")
		(end_action I1200 "15/01/2017 13:14")
		(duration_action I1200 4)
		(parameters_typeI I1200 driver204)

		(index_action B10992 32242)
		(is_action B10992)
		(is_typeB B10992)
		(start_action B10992 "15/01/2017 13:14")
		(end_action B10992 "15/01/2017 15:50")
		(duration_action B10992 156)
		(parameters_typeB B10992 driver204)

		(index_action I1201 32243)
		(is_action I1201)
		(is_typeI I1201)
		(start_action I1201 "15/01/2017 15:50")
		(end_action I1201 "15/01/2017 15:58")
		(duration_action I1201 8)
		(parameters_typeI I1201 driver204)

		(index_action B10993 32244)
		(is_action B10993)
		(is_typeB B10993)
		(start_action B10993 "15/01/2017 15:58")
		(end_action B10993 "15/01/2017 16:04")
		(duration_action B10993 6)
		(parameters_typeB B10993 driver204)

		(index_action I1202 32245)
		(is_action I1202)
		(is_typeI I1202)
		(start_action I1202 "15/01/2017 16:04")
		(end_action I1202 "15/01/2017 16:17")
		(duration_action I1202 13)
		(parameters_typeI I1202 driver204)

		(index_action B10994 32246)
		(is_action B10994)
		(is_typeB B10994)
		(start_action B10994 "15/01/2017 16:17")
		(end_action B10994 "15/01/2017 16:40")
		(duration_action B10994 23)
		(parameters_typeB B10994 driver204)

		(index_action I1203 32247)
		(is_action I1203)
		(is_typeI I1203)
		(start_action I1203 "15/01/2017 16:40")
		(end_action I1203 "15/01/2017 16:45")
		(duration_action I1203 5)
		(parameters_typeI I1203 driver204)

		(index_action B10995 32248)
		(is_action B10995)
		(is_typeB B10995)
		(start_action B10995 "15/01/2017 16:45")
		(end_action B10995 "15/01/2017 16:48")
		(duration_action B10995 3)
		(parameters_typeB B10995 driver204)

		(index_action I1204 32249)
		(is_action I1204)
		(is_typeI I1204)
		(start_action I1204 "15/01/2017 16:48")
		(end_action I1204 "15/01/2017 16:50")
		(duration_action I1204 2)
		(parameters_typeI I1204 driver204)

		(index_action B10996 32250)
		(is_action B10996)
		(is_typeB B10996)
		(start_action B10996 "15/01/2017 16:50")
		(end_action B10996 "15/01/2017 17:16")
		(duration_action B10996 26)
		(parameters_typeB B10996 driver204)

		(index_action I1205 32251)
		(is_action I1205)
		(is_typeI I1205)
		(start_action I1205 "15/01/2017 17:16")
		(end_action I1205 "15/01/2017 17:27")
		(duration_action I1205 11)
		(parameters_typeI I1205 driver204)

		(index_action B10997 32252)
		(is_action B10997)
		(is_typeB B10997)
		(start_action B10997 "15/01/2017 17:27")
		(end_action B10997 "16/01/2017 21:39")
		(duration_action B10997 1692)
		(parameters_typeB B10997 driver204)

	)
	(:tasks-goal
		:tasks (
			(WD driver204)
		)
	)
)