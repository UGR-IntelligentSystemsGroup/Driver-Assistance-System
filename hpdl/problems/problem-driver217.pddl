(define (problem prueba0) (:domain GantaBi)
	(:customization
		(= :time-format "%d/%m/%Y %H:%M")
		(= :time-horizon-relative 86400) ;; que son los minutos que tienen 2 meses
		(= :time-start "01/01/2017 00:00")
		(= :time-unit :minutes)
	)
	(:objects
		driver217 - Driver

		D13320 D13321 D13322 D13323 D13324 D13325 D13326 D13327 D13328 D13329 D13330 D13331 D13332 D13333 D13334 D13335 D13336 D13337 D13338 D13339 D13340 D13341 D13342 D13343 D13344 D13345 D13346 D13347 D13348 D13349 D13350 D13351 D13352 D13353 D13354 D13355 D13356 D13357 D13358 D13359 D13360 D13361 D13362 D13363
 - TaskInstanceSymbol
		O7955 O7956 O7957 O7958 O7959 O7960 O7961 O7962 O7963 O7964 O7965 O7966 O7967 O7968 O7969 O7970 O7971 O7972 O7973 O7974 O7975 O7976 O7977 O7978 O7979 O7980 O7981 O7982 O7983 O7984 O7985 O7986 O7987 O7988
 - TaskInstanceSymbol
		B11603 B11604 B11605 B11606 B11607 B11608 B11609 B11610 B11611 B11612 B11613 B11614 B11615 B11616 B11617 B11618 B11619 B11620 B11621 B11622 B11623 B11624 B11625 B11626 B11627 B11628 B11629 B11630 B11631 B11632 B11633 B11634 B11635 B11636 B11637 B11638 B11639 B11640 B11641 B11642 B11643 B11644 B11645 B11646 B11647 B11648 B11649 B11650 B11651
 - TaskInstanceSymbol
		I1336 I1337 I1338 I1339 I1340 I1341 I1342 I1343 I1344 I1345 I1346 I1347 I1348 I1349 I1350 I1351 I1352 I1353 I1354 - TaskInstanceSymbol
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

		(= (current_index_action) 34210)

		(= (last_dr) "02/01/2017 13:09")
		(= (last_wr) "02/01/2017 13:09")
		(= (actual-timestamp) "02/01/2017 13:09")

		; Events
		(index_action I1336 34210)
		(is_action I1336)
		(is_typeI I1336)
		(start_action I1336 "02/01/2017 13:09")
		(end_action I1336 "02/01/2017 17:39")
		(duration_action I1336 270)
		(parameters_typeI I1336 driver217)

		(index_action B11603 34211)
		(is_action B11603)
		(is_typeB B11603)
		(start_action B11603 "02/01/2017 17:39")
		(end_action B11603 "03/01/2017 07:53")
		(duration_action B11603 854)
		(parameters_typeB B11603 driver217)

		(index_action I1337 34212)
		(is_action I1337)
		(is_typeI I1337)
		(start_action I1337 "03/01/2017 07:53")
		(end_action I1337 "03/01/2017 08:39")
		(duration_action I1337 46)
		(parameters_typeI I1337 driver217)

		(index_action B11604 34213)
		(is_action B11604)
		(is_typeB B11604)
		(start_action B11604 "03/01/2017 08:39")
		(end_action B11604 "03/01/2017 09:02")
		(duration_action B11604 23)
		(parameters_typeB B11604 driver217)

		(index_action I1338 34214)
		(is_action I1338)
		(is_typeI I1338)
		(start_action I1338 "03/01/2017 09:02")
		(end_action I1338 "03/01/2017 12:17")
		(duration_action I1338 195)
		(parameters_typeI I1338 driver217)

		(index_action B11605 34215)
		(is_action B11605)
		(is_typeB B11605)
		(start_action B11605 "03/01/2017 12:19")
		(end_action B11605 "03/01/2017 12:33")
		(duration_action B11605 14)
		(parameters_typeB B11605 driver217)

		(index_action D13320 34216)
		(is_action D13320)
		(is_typeD D13320)
		(start_action D13320 "03/01/2017 12:33")
		(end_action D13320 "03/01/2017 13:38")
		(duration_action D13320 65)
		(parameters_typeD D13320 driver217)

		(index_action B11606 34217)
		(is_action B11606)
		(is_typeB B11606)
		(start_action B11606 "03/01/2017 13:38")
		(end_action B11606 "03/01/2017 14:10")
		(duration_action B11606 32)
		(parameters_typeB B11606 driver217)

		(index_action D13321 34218)
		(is_action D13321)
		(is_typeD D13321)
		(start_action D13321 "03/01/2017 14:10")
		(end_action D13321 "03/01/2017 16:19")
		(duration_action D13321 129)
		(parameters_typeD D13321 driver217)

		(index_action B11607 34219)
		(is_action B11607)
		(is_typeB B11607)
		(start_action B11607 "03/01/2017 16:19")
		(end_action B11607 "04/01/2017 01:25")
		(duration_action B11607 546)
		(parameters_typeB B11607 driver217)

		(index_action D13322 34220)
		(is_action D13322)
		(is_typeD D13322)
		(start_action D13322 "04/01/2017 01:25")
		(end_action D13322 "04/01/2017 03:24")
		(duration_action D13322 119)
		(parameters_typeD D13322 driver217)

		(index_action O7955 34221)
		(is_action O7955)
		(is_typeO O7955)
		(start_action O7955 "04/01/2017 03:24")
		(end_action O7955 "04/01/2017 03:40")
		(duration_action O7955 16)
		(parameters_typeO O7955 driver217)

		(index_action D13323 34222)
		(is_action D13323)
		(is_typeD D13323)
		(start_action D13323 "04/01/2017 03:40")
		(end_action D13323 "04/01/2017 04:50")
		(duration_action D13323 70)
		(parameters_typeD D13323 driver217)

		(index_action O7956 34223)
		(is_action O7956)
		(is_typeO O7956)
		(start_action O7956 "04/01/2017 04:50")
		(end_action O7956 "04/01/2017 04:53")
		(duration_action O7956 3)
		(parameters_typeO O7956 driver217)

		(index_action D13324 34224)
		(is_action D13324)
		(is_typeD D13324)
		(start_action D13324 "04/01/2017 04:53")
		(end_action D13324 "04/01/2017 05:13")
		(duration_action D13324 20)
		(parameters_typeD D13324 driver217)

		(index_action B11608 34225)
		(is_action B11608)
		(is_typeB B11608)
		(start_action B11608 "04/01/2017 05:17")
		(end_action B11608 "04/01/2017 05:44")
		(duration_action B11608 27)
		(parameters_typeB B11608 driver217)

		(index_action I1339 34226)
		(is_action I1339)
		(is_typeI I1339)
		(start_action I1339 "04/01/2017 05:44")
		(end_action I1339 "04/01/2017 09:31")
		(duration_action I1339 227)
		(parameters_typeI I1339 driver217)

		(index_action B11609 34227)
		(is_action B11609)
		(is_typeB B11609)
		(start_action B11609 "04/01/2017 09:33")
		(end_action B11609 "04/01/2017 10:01")
		(duration_action B11609 28)
		(parameters_typeB B11609 driver217)

		(index_action D13325 34228)
		(is_action D13325)
		(is_typeD D13325)
		(start_action D13325 "04/01/2017 10:01")
		(end_action D13325 "04/01/2017 11:47")
		(duration_action D13325 106)
		(parameters_typeD D13325 driver217)

		(index_action O7957 34229)
		(is_action O7957)
		(is_typeO O7957)
		(start_action O7957 "04/01/2017 11:47")
		(end_action O7957 "04/01/2017 11:49")
		(duration_action O7957 2)
		(parameters_typeO O7957 driver217)

		(index_action D13326 34230)
		(is_action D13326)
		(is_typeD D13326)
		(start_action D13326 "04/01/2017 11:49")
		(end_action D13326 "04/01/2017 12:02")
		(duration_action D13326 13)
		(parameters_typeD D13326 driver217)

		(index_action B11610 34231)
		(is_action B11610)
		(is_typeB B11610)
		(start_action B11610 "04/01/2017 12:02")
		(end_action B11610 "04/01/2017 23:10")
		(duration_action B11610 668)
		(parameters_typeB B11610 driver217)

		(index_action D13327 34232)
		(is_action D13327)
		(is_typeD D13327)
		(start_action D13327 "04/01/2017 23:10")
		(end_action D13327 "05/01/2017 00:24")
		(duration_action D13327 74)
		(parameters_typeD D13327 driver217)

		(index_action O7958 34233)
		(is_action O7958)
		(is_typeO O7958)
		(start_action O7958 "05/01/2017 00:24")
		(end_action O7958 "05/01/2017 00:45")
		(duration_action O7958 21)
		(parameters_typeO O7958 driver217)

		(index_action B11611 34234)
		(is_action B11611)
		(is_typeB B11611)
		(start_action B11611 "05/01/2017 00:45")
		(end_action B11611 "05/01/2017 01:00")
		(duration_action B11611 15)
		(parameters_typeB B11611 driver217)

		(index_action B11612 34235)
		(is_action B11612)
		(is_typeB B11612)
		(start_action B11612 "05/01/2017 01:04")
		(end_action B11612 "05/01/2017 01:11")
		(duration_action B11612 7)
		(parameters_typeB B11612 driver217)

		(index_action I1340 34236)
		(is_action I1340)
		(is_typeI I1340)
		(start_action I1340 "05/01/2017 01:11")
		(end_action I1340 "05/01/2017 04:50")
		(duration_action I1340 219)
		(parameters_typeI I1340 driver217)

		(index_action B11613 34237)
		(is_action B11613)
		(is_typeB B11613)
		(start_action B11613 "05/01/2017 04:50")
		(end_action B11613 "05/01/2017 04:51")
		(duration_action B11613 1)
		(parameters_typeB B11613 driver217)

		(index_action B11614 34238)
		(is_action B11614)
		(is_typeB B11614)
		(start_action B11614 "05/01/2017 04:53")
		(end_action B11614 "05/01/2017 05:36")
		(duration_action B11614 43)
		(parameters_typeB B11614 driver217)

		(index_action D13328 34239)
		(is_action D13328)
		(is_typeD D13328)
		(start_action D13328 "05/01/2017 05:36")
		(end_action D13328 "05/01/2017 08:38")
		(duration_action D13328 182)
		(parameters_typeD D13328 driver217)

		(index_action O7959 34240)
		(is_action O7959)
		(is_typeO O7959)
		(start_action O7959 "05/01/2017 08:38")
		(end_action O7959 "05/01/2017 08:44")
		(duration_action O7959 6)
		(parameters_typeO O7959 driver217)

		(index_action D13329 34241)
		(is_action D13329)
		(is_typeD D13329)
		(start_action D13329 "05/01/2017 08:44")
		(end_action D13329 "05/01/2017 08:54")
		(duration_action D13329 10)
		(parameters_typeD D13329 driver217)

		(index_action O7960 34242)
		(is_action O7960)
		(is_typeO O7960)
		(start_action O7960 "05/01/2017 08:54")
		(end_action O7960 "05/01/2017 09:10")
		(duration_action O7960 16)
		(parameters_typeO O7960 driver217)

		(index_action B11615 34243)
		(is_action B11615)
		(is_typeB B11615)
		(start_action B11615 "05/01/2017 09:10")
		(end_action B11615 "05/01/2017 10:24")
		(duration_action B11615 74)
		(parameters_typeB B11615 driver217)

		(index_action O7961 34244)
		(is_action O7961)
		(is_typeO O7961)
		(start_action O7961 "05/01/2017 10:24")
		(end_action O7961 "05/01/2017 10:26")
		(duration_action O7961 2)
		(parameters_typeO O7961 driver217)

		(index_action D13330 34245)
		(is_action D13330)
		(is_typeD D13330)
		(start_action D13330 "05/01/2017 10:26")
		(end_action D13330 "05/01/2017 10:27")
		(duration_action D13330 1)
		(parameters_typeD D13330 driver217)

		(index_action O7962 34246)
		(is_action O7962)
		(is_typeO O7962)
		(start_action O7962 "05/01/2017 10:27")
		(end_action O7962 "05/01/2017 10:32")
		(duration_action O7962 5)
		(parameters_typeO O7962 driver217)

		(index_action D13331 34247)
		(is_action D13331)
		(is_typeD D13331)
		(start_action D13331 "05/01/2017 10:32")
		(end_action D13331 "05/01/2017 11:34")
		(duration_action D13331 62)
		(parameters_typeD D13331 driver217)

		(index_action O7963 34248)
		(is_action O7963)
		(is_typeO O7963)
		(start_action O7963 "05/01/2017 11:34")
		(end_action O7963 "05/01/2017 11:36")
		(duration_action O7963 2)
		(parameters_typeO O7963 driver217)

		(index_action D13332 34249)
		(is_action D13332)
		(is_typeD D13332)
		(start_action D13332 "05/01/2017 11:36")
		(end_action D13332 "05/01/2017 11:48")
		(duration_action D13332 12)
		(parameters_typeD D13332 driver217)

		(index_action O7964 34250)
		(is_action O7964)
		(is_typeO O7964)
		(start_action O7964 "05/01/2017 11:48")
		(end_action O7964 "05/01/2017 11:50")
		(duration_action O7964 2)
		(parameters_typeO O7964 driver217)

		(index_action D13333 34251)
		(is_action D13333)
		(is_typeD D13333)
		(start_action D13333 "05/01/2017 11:50")
		(end_action D13333 "05/01/2017 11:54")
		(duration_action D13333 4)
		(parameters_typeD D13333 driver217)

		(index_action O7965 34252)
		(is_action O7965)
		(is_typeO O7965)
		(start_action O7965 "05/01/2017 11:54")
		(end_action O7965 "05/01/2017 12:07")
		(duration_action O7965 13)
		(parameters_typeO O7965 driver217)

		(index_action B11616 34253)
		(is_action B11616)
		(is_typeB B11616)
		(start_action B11616 "05/01/2017 12:07")
		(end_action B11616 "05/01/2017 12:11")
		(duration_action B11616 4)
		(parameters_typeB B11616 driver217)

		(index_action D13334 34254)
		(is_action D13334)
		(is_typeD D13334)
		(start_action D13334 "05/01/2017 12:11")
		(end_action D13334 "05/01/2017 12:15")
		(duration_action D13334 4)
		(parameters_typeD D13334 driver217)

		(index_action B11617 34255)
		(is_action B11617)
		(is_typeB B11617)
		(start_action B11617 "05/01/2017 12:15")
		(end_action B11617 "05/01/2017 12:19")
		(duration_action B11617 4)
		(parameters_typeB B11617 driver217)

		(index_action D13335 34256)
		(is_action D13335)
		(is_typeD D13335)
		(start_action D13335 "05/01/2017 12:19")
		(end_action D13335 "05/01/2017 12:21")
		(duration_action D13335 2)
		(parameters_typeD D13335 driver217)

		(index_action B11618 34257)
		(is_action B11618)
		(is_typeB B11618)
		(start_action B11618 "05/01/2017 12:21")
		(end_action B11618 "05/01/2017 14:00")
		(duration_action B11618 99)
		(parameters_typeB B11618 driver217)

		(index_action O7966 34258)
		(is_action O7966)
		(is_typeO O7966)
		(start_action O7966 "05/01/2017 14:00")
		(end_action O7966 "05/01/2017 14:05")
		(duration_action O7966 5)
		(parameters_typeO O7966 driver217)

		(index_action D13336 34259)
		(is_action D13336)
		(is_typeD D13336)
		(start_action D13336 "05/01/2017 14:05")
		(end_action D13336 "05/01/2017 14:07")
		(duration_action D13336 2)
		(parameters_typeD D13336 driver217)

		(index_action B11619 34260)
		(is_action B11619)
		(is_typeB B11619)
		(start_action B11619 "05/01/2017 14:07")
		(end_action B11619 "05/01/2017 14:34")
		(duration_action B11619 27)
		(parameters_typeB B11619 driver217)

		(index_action D13337 34261)
		(is_action D13337)
		(is_typeD D13337)
		(start_action D13337 "05/01/2017 14:34")
		(end_action D13337 "05/01/2017 14:40")
		(duration_action D13337 6)
		(parameters_typeD D13337 driver217)

		(index_action B11620 34262)
		(is_action B11620)
		(is_typeB B11620)
		(start_action B11620 "05/01/2017 14:40")
		(end_action B11620 "09/01/2017 14:29")
		(duration_action B11620 5749)
		(parameters_typeB B11620 driver217)

		(index_action D13338 34263)
		(is_action D13338)
		(is_typeD D13338)
		(start_action D13338 "09/01/2017 14:29")
		(end_action D13338 "09/01/2017 14:40")
		(duration_action D13338 11)
		(parameters_typeD D13338 driver217)

		(index_action O7967 34264)
		(is_action O7967)
		(is_typeO O7967)
		(start_action O7967 "09/01/2017 14:40")
		(end_action O7967 "09/01/2017 15:07")
		(duration_action O7967 27)
		(parameters_typeO O7967 driver217)

		(index_action D13339 34265)
		(is_action D13339)
		(is_typeD D13339)
		(start_action D13339 "09/01/2017 15:07")
		(end_action D13339 "09/01/2017 15:08")
		(duration_action D13339 1)
		(parameters_typeD D13339 driver217)

		(index_action O7968 34266)
		(is_action O7968)
		(is_typeO O7968)
		(start_action O7968 "09/01/2017 15:08")
		(end_action O7968 "09/01/2017 15:17")
		(duration_action O7968 9)
		(parameters_typeO O7968 driver217)

		(index_action D13340 34267)
		(is_action D13340)
		(is_typeD D13340)
		(start_action D13340 "09/01/2017 15:17")
		(end_action D13340 "09/01/2017 15:19")
		(duration_action D13340 2)
		(parameters_typeD D13340 driver217)

		(index_action O7969 34268)
		(is_action O7969)
		(is_typeO O7969)
		(start_action O7969 "09/01/2017 15:19")
		(end_action O7969 "09/01/2017 15:22")
		(duration_action O7969 3)
		(parameters_typeO O7969 driver217)

		(index_action D13341 34269)
		(is_action D13341)
		(is_typeD D13341)
		(start_action D13341 "09/01/2017 15:22")
		(end_action D13341 "09/01/2017 15:25")
		(duration_action D13341 3)
		(parameters_typeD D13341 driver217)

		(index_action O7970 34270)
		(is_action O7970)
		(is_typeO O7970)
		(start_action O7970 "09/01/2017 15:25")
		(end_action O7970 "09/01/2017 16:00")
		(duration_action O7970 35)
		(parameters_typeO O7970 driver217)

		(index_action B11621 34271)
		(is_action B11621)
		(is_typeB B11621)
		(start_action B11621 "09/01/2017 16:00")
		(end_action B11621 "09/01/2017 16:05")
		(duration_action B11621 5)
		(parameters_typeB B11621 driver217)

		(index_action D13342 34272)
		(is_action D13342)
		(is_typeD D13342)
		(start_action D13342 "09/01/2017 16:05")
		(end_action D13342 "09/01/2017 16:07")
		(duration_action D13342 2)
		(parameters_typeD D13342 driver217)

		(index_action O7971 34273)
		(is_action O7971)
		(is_typeO O7971)
		(start_action O7971 "09/01/2017 16:07")
		(end_action O7971 "09/01/2017 16:09")
		(duration_action O7971 2)
		(parameters_typeO O7971 driver217)

		(index_action D13343 34274)
		(is_action D13343)
		(is_typeD D13343)
		(start_action D13343 "09/01/2017 16:09")
		(end_action D13343 "09/01/2017 16:14")
		(duration_action D13343 5)
		(parameters_typeD D13343 driver217)

		(index_action O7972 34275)
		(is_action O7972)
		(is_typeO O7972)
		(start_action O7972 "09/01/2017 16:14")
		(end_action O7972 "09/01/2017 16:16")
		(duration_action O7972 2)
		(parameters_typeO O7972 driver217)

		(index_action D13344 34276)
		(is_action D13344)
		(is_typeD D13344)
		(start_action D13344 "09/01/2017 16:16")
		(end_action D13344 "09/01/2017 20:03")
		(duration_action D13344 227)
		(parameters_typeD D13344 driver217)

		(index_action I1341 34277)
		(is_action I1341)
		(is_typeI I1341)
		(start_action I1341 "09/01/2017 20:07")
		(end_action I1341 "09/01/2017 20:41")
		(duration_action I1341 34)
		(parameters_typeI I1341 driver217)

		(index_action B11622 34278)
		(is_action B11622)
		(is_typeB B11622)
		(start_action B11622 "09/01/2017 20:41")
		(end_action B11622 "10/01/2017 07:26")
		(duration_action B11622 645)
		(parameters_typeB B11622 driver217)

		(index_action I1342 34279)
		(is_action I1342)
		(is_typeI I1342)
		(start_action I1342 "10/01/2017 07:26")
		(end_action I1342 "10/01/2017 12:24")
		(duration_action I1342 298)
		(parameters_typeI I1342 driver217)

		(index_action B11623 34280)
		(is_action B11623)
		(is_typeB B11623)
		(start_action B11623 "10/01/2017 12:26")
		(end_action B11623 "10/01/2017 12:46")
		(duration_action B11623 20)
		(parameters_typeB B11623 driver217)

		(index_action D13345 34281)
		(is_action D13345)
		(is_typeD D13345)
		(start_action D13345 "10/01/2017 12:46")
		(end_action D13345 "10/01/2017 14:43")
		(duration_action D13345 117)
		(parameters_typeD D13345 driver217)

		(index_action O7973 34282)
		(is_action O7973)
		(is_typeO O7973)
		(start_action O7973 "10/01/2017 14:43")
		(end_action O7973 "10/01/2017 14:52")
		(duration_action O7973 9)
		(parameters_typeO O7973 driver217)

		(index_action B11624 34283)
		(is_action B11624)
		(is_typeB B11624)
		(start_action B11624 "10/01/2017 14:52")
		(end_action B11624 "10/01/2017 14:53")
		(duration_action B11624 1)
		(parameters_typeB B11624 driver217)

		(index_action O7974 34284)
		(is_action O7974)
		(is_typeO O7974)
		(start_action O7974 "10/01/2017 14:53")
		(end_action O7974 "10/01/2017 15:08")
		(duration_action O7974 15)
		(parameters_typeO O7974 driver217)

		(index_action B11625 34285)
		(is_action B11625)
		(is_typeB B11625)
		(start_action B11625 "10/01/2017 15:08")
		(end_action B11625 "10/01/2017 15:21")
		(duration_action B11625 13)
		(parameters_typeB B11625 driver217)

		(index_action D13346 34286)
		(is_action D13346)
		(is_typeD D13346)
		(start_action D13346 "10/01/2017 15:21")
		(end_action D13346 "10/01/2017 15:22")
		(duration_action D13346 1)
		(parameters_typeD D13346 driver217)

		(index_action O7975 34287)
		(is_action O7975)
		(is_typeO O7975)
		(start_action O7975 "10/01/2017 15:22")
		(end_action O7975 "10/01/2017 15:26")
		(duration_action O7975 4)
		(parameters_typeO O7975 driver217)

		(index_action D13347 34288)
		(is_action D13347)
		(is_typeD D13347)
		(start_action D13347 "10/01/2017 15:26")
		(end_action D13347 "10/01/2017 17:37")
		(duration_action D13347 131)
		(parameters_typeD D13347 driver217)

		(index_action B11626 34289)
		(is_action B11626)
		(is_typeB B11626)
		(start_action B11626 "10/01/2017 17:42")
		(end_action B11626 "10/01/2017 17:46")
		(duration_action B11626 4)
		(parameters_typeB B11626 driver217)

		(index_action I1343 34290)
		(is_action I1343)
		(is_typeI I1343)
		(start_action I1343 "10/01/2017 17:46")
		(end_action I1343 "10/01/2017 20:32")
		(duration_action I1343 166)
		(parameters_typeI I1343 driver217)

		(index_action B11627 34291)
		(is_action B11627)
		(is_typeB B11627)
		(start_action B11627 "10/01/2017 20:32")
		(end_action B11627 "10/01/2017 20:55")
		(duration_action B11627 23)
		(parameters_typeB B11627 driver217)

		(index_action I1344 34292)
		(is_action I1344)
		(is_typeI I1344)
		(start_action I1344 "10/01/2017 20:55")
		(end_action I1344 "10/01/2017 22:22")
		(duration_action I1344 87)
		(parameters_typeI I1344 driver217)

		(index_action B11628 34293)
		(is_action B11628)
		(is_typeB B11628)
		(start_action B11628 "10/01/2017 22:24")
		(end_action B11628 "10/01/2017 22:27")
		(duration_action B11628 3)
		(parameters_typeB B11628 driver217)

		(index_action D13348 34294)
		(is_action D13348)
		(is_typeD D13348)
		(start_action D13348 "10/01/2017 22:27")
		(end_action D13348 "11/01/2017 02:17")
		(duration_action D13348 230)
		(parameters_typeD D13348 driver217)

		(index_action B11629 34295)
		(is_action B11629)
		(is_typeB B11629)
		(start_action B11629 "11/01/2017 02:17")
		(end_action B11629 "11/01/2017 11:26")
		(duration_action B11629 549)
		(parameters_typeB B11629 driver217)

		(index_action D13349 34296)
		(is_action D13349)
		(is_typeD D13349)
		(start_action D13349 "11/01/2017 11:26")
		(end_action D13349 "11/01/2017 13:12")
		(duration_action D13349 106)
		(parameters_typeD D13349 driver217)

		(index_action B11630 34297)
		(is_action B11630)
		(is_typeB B11630)
		(start_action B11630 "11/01/2017 13:12")
		(end_action B11630 "11/01/2017 13:23")
		(duration_action B11630 11)
		(parameters_typeB B11630 driver217)

		(index_action D13350 34298)
		(is_action D13350)
		(is_typeD D13350)
		(start_action D13350 "11/01/2017 13:23")
		(end_action D13350 "11/01/2017 15:48")
		(duration_action D13350 145)
		(parameters_typeD D13350 driver217)

		(index_action I1345 34299)
		(is_action I1345)
		(is_typeI I1345)
		(start_action I1345 "11/01/2017 15:53")
		(end_action I1345 "11/01/2017 19:47")
		(duration_action I1345 234)
		(parameters_typeI I1345 driver217)

		(index_action B11631 34300)
		(is_action B11631)
		(is_typeB B11631)
		(start_action B11631 "11/01/2017 19:47")
		(end_action B11631 "11/01/2017 19:51")
		(duration_action B11631 4)
		(parameters_typeB B11631 driver217)

		(index_action B11632 34301)
		(is_action B11632)
		(is_typeB B11632)
		(start_action B11632 "11/01/2017 19:53")
		(end_action B11632 "11/01/2017 19:59")
		(duration_action B11632 6)
		(parameters_typeB B11632 driver217)

		(index_action D13351 34302)
		(is_action D13351)
		(is_typeD D13351)
		(start_action D13351 "11/01/2017 19:59")
		(end_action D13351 "11/01/2017 22:22")
		(duration_action D13351 143)
		(parameters_typeD D13351 driver217)

		(index_action O7976 34303)
		(is_action O7976)
		(is_typeO O7976)
		(start_action O7976 "11/01/2017 22:22")
		(end_action O7976 "11/01/2017 22:25")
		(duration_action O7976 3)
		(parameters_typeO O7976 driver217)

		(index_action D13352 34304)
		(is_action D13352)
		(is_typeD D13352)
		(start_action D13352 "11/01/2017 22:25")
		(end_action D13352 "11/01/2017 22:50")
		(duration_action D13352 25)
		(parameters_typeD D13352 driver217)

		(index_action O7977 34305)
		(is_action O7977)
		(is_typeO O7977)
		(start_action O7977 "11/01/2017 22:50")
		(end_action O7977 "11/01/2017 22:53")
		(duration_action O7977 3)
		(parameters_typeO O7977 driver217)

		(index_action B11633 34306)
		(is_action B11633)
		(is_typeB B11633)
		(start_action B11633 "11/01/2017 22:53")
		(end_action B11633 "12/01/2017 08:07")
		(duration_action B11633 554)
		(parameters_typeB B11633 driver217)

		(index_action D13353 34307)
		(is_action D13353)
		(is_typeD D13353)
		(start_action D13353 "12/01/2017 08:07")
		(end_action D13353 "12/01/2017 08:14")
		(duration_action D13353 7)
		(parameters_typeD D13353 driver217)

		(index_action O7978 34308)
		(is_action O7978)
		(is_typeO O7978)
		(start_action O7978 "12/01/2017 08:14")
		(end_action O7978 "12/01/2017 08:16")
		(duration_action O7978 2)
		(parameters_typeO O7978 driver217)

		(index_action B11634 34309)
		(is_action B11634)
		(is_typeB B11634)
		(start_action B11634 "12/01/2017 08:16")
		(end_action B11634 "12/01/2017 10:47")
		(duration_action B11634 151)
		(parameters_typeB B11634 driver217)

		(index_action O7979 34310)
		(is_action O7979)
		(is_typeO O7979)
		(start_action O7979 "12/01/2017 10:47")
		(end_action O7979 "12/01/2017 10:51")
		(duration_action O7979 4)
		(parameters_typeO O7979 driver217)

		(index_action D13354 34311)
		(is_action D13354)
		(is_typeD D13354)
		(start_action D13354 "12/01/2017 10:51")
		(end_action D13354 "12/01/2017 10:57")
		(duration_action D13354 6)
		(parameters_typeD D13354 driver217)

		(index_action O7980 34312)
		(is_action O7980)
		(is_typeO O7980)
		(start_action O7980 "12/01/2017 10:57")
		(end_action O7980 "12/01/2017 11:04")
		(duration_action O7980 7)
		(parameters_typeO O7980 driver217)

		(index_action B11635 34313)
		(is_action B11635)
		(is_typeB B11635)
		(start_action B11635 "12/01/2017 11:04")
		(end_action B11635 "12/01/2017 11:29")
		(duration_action B11635 25)
		(parameters_typeB B11635 driver217)

		(index_action D13355 34314)
		(is_action D13355)
		(is_typeD D13355)
		(start_action D13355 "12/01/2017 11:29")
		(end_action D13355 "12/01/2017 11:30")
		(duration_action D13355 1)
		(parameters_typeD D13355 driver217)

		(index_action O7981 34315)
		(is_action O7981)
		(is_typeO O7981)
		(start_action O7981 "12/01/2017 11:30")
		(end_action O7981 "12/01/2017 11:33")
		(duration_action O7981 3)
		(parameters_typeO O7981 driver217)

		(index_action D13356 34316)
		(is_action D13356)
		(is_typeD D13356)
		(start_action D13356 "12/01/2017 11:33")
		(end_action D13356 "12/01/2017 15:39")
		(duration_action D13356 246)
		(parameters_typeD D13356 driver217)

		(index_action O7982 34317)
		(is_action O7982)
		(is_typeO O7982)
		(start_action O7982 "12/01/2017 15:39")
		(end_action O7982 "12/01/2017 15:45")
		(duration_action O7982 6)
		(parameters_typeO O7982 driver217)

		(index_action B11636 34318)
		(is_action B11636)
		(is_typeB B11636)
		(start_action B11636 "12/01/2017 15:50")
		(end_action B11636 "12/01/2017 15:54")
		(duration_action B11636 4)
		(parameters_typeB B11636 driver217)

		(index_action I1346 34319)
		(is_action I1346)
		(is_typeI I1346)
		(start_action I1346 "12/01/2017 15:54")
		(end_action I1346 "12/01/2017 15:58")
		(duration_action I1346 4)
		(parameters_typeI I1346 driver217)

		(index_action B11637 34320)
		(is_action B11637)
		(is_typeB B11637)
		(start_action B11637 "12/01/2017 15:58")
		(end_action B11637 "12/01/2017 17:25")
		(duration_action B11637 87)
		(parameters_typeB B11637 driver217)

		(index_action I1347 34321)
		(is_action I1347)
		(is_typeI I1347)
		(start_action I1347 "12/01/2017 17:25")
		(end_action I1347 "12/01/2017 17:37")
		(duration_action I1347 12)
		(parameters_typeI I1347 driver217)

		(index_action B11638 34322)
		(is_action B11638)
		(is_typeB B11638)
		(start_action B11638 "12/01/2017 17:37")
		(end_action B11638 "12/01/2017 17:54")
		(duration_action B11638 17)
		(parameters_typeB B11638 driver217)

		(index_action I1348 34323)
		(is_action I1348)
		(is_typeI I1348)
		(start_action I1348 "12/01/2017 17:54")
		(end_action I1348 "12/01/2017 21:48")
		(duration_action I1348 234)
		(parameters_typeI I1348 driver217)

		(index_action B11639 34324)
		(is_action B11639)
		(is_typeB B11639)
		(start_action B11639 "12/01/2017 21:48")
		(end_action B11639 "12/01/2017 22:36")
		(duration_action B11639 48)
		(parameters_typeB B11639 driver217)

		(index_action I1349 34325)
		(is_action I1349)
		(is_typeI I1349)
		(start_action I1349 "12/01/2017 22:36")
		(end_action I1349 "13/01/2017 00:51")
		(duration_action I1349 135)
		(parameters_typeI I1349 driver217)

		(index_action B11640 34326)
		(is_action B11640)
		(is_typeB B11640)
		(start_action B11640 "13/01/2017 00:51")
		(end_action B11640 "13/01/2017 00:54")
		(duration_action B11640 3)
		(parameters_typeB B11640 driver217)

		(index_action I1350 34327)
		(is_action I1350)
		(is_typeI I1350)
		(start_action I1350 "13/01/2017 00:54")
		(end_action I1350 "13/01/2017 00:57")
		(duration_action I1350 3)
		(parameters_typeI I1350 driver217)

		(index_action B11641 34328)
		(is_action B11641)
		(is_typeB B11641)
		(start_action B11641 "13/01/2017 00:57")
		(end_action B11641 "13/01/2017 10:09")
		(duration_action B11641 552)
		(parameters_typeB B11641 driver217)

		(index_action I1351 34329)
		(is_action I1351)
		(is_typeI I1351)
		(start_action I1351 "13/01/2017 10:09")
		(end_action I1351 "13/01/2017 14:22")
		(duration_action I1351 253)
		(parameters_typeI I1351 driver217)

		(index_action B11642 34330)
		(is_action B11642)
		(is_typeB B11642)
		(start_action B11642 "13/01/2017 14:22")
		(end_action B11642 "13/01/2017 14:23")
		(duration_action B11642 1)
		(parameters_typeB B11642 driver217)

		(index_action B11643 34331)
		(is_action B11643)
		(is_typeB B11643)
		(start_action B11643 "13/01/2017 14:25")
		(end_action B11643 "13/01/2017 14:48")
		(duration_action B11643 23)
		(parameters_typeB B11643 driver217)

		(index_action D13357 34332)
		(is_action D13357)
		(is_typeD D13357)
		(start_action D13357 "13/01/2017 14:48")
		(end_action D13357 "13/01/2017 16:47")
		(duration_action D13357 119)
		(parameters_typeD D13357 driver217)

		(index_action O7983 34333)
		(is_action O7983)
		(is_typeO O7983)
		(start_action O7983 "13/01/2017 16:47")
		(end_action O7983 "13/01/2017 16:48")
		(duration_action O7983 1)
		(parameters_typeO O7983 driver217)

		(index_action B11644 34334)
		(is_action B11644)
		(is_typeB B11644)
		(start_action B11644 "13/01/2017 16:48")
		(end_action B11644 "13/01/2017 16:55")
		(duration_action B11644 7)
		(parameters_typeB B11644 driver217)

		(index_action D13358 34335)
		(is_action D13358)
		(is_typeD D13358)
		(start_action D13358 "13/01/2017 16:55")
		(end_action D13358 "13/01/2017 19:11")
		(duration_action D13358 136)
		(parameters_typeD D13358 driver217)

		(index_action B11645 34336)
		(is_action B11645)
		(is_typeB B11645)
		(start_action B11645 "13/01/2017 19:15")
		(end_action B11645 "13/01/2017 19:16")
		(duration_action B11645 1)
		(parameters_typeB B11645 driver217)

		(index_action I1352 34337)
		(is_action I1352)
		(is_typeI I1352)
		(start_action I1352 "13/01/2017 19:16")
		(end_action I1352 "13/01/2017 23:36")
		(duration_action I1352 260)
		(parameters_typeI I1352 driver217)

		(index_action B11646 34338)
		(is_action B11646)
		(is_typeB B11646)
		(start_action B11646 "13/01/2017 23:36")
		(end_action B11646 "13/01/2017 23:37")
		(duration_action B11646 1)
		(parameters_typeB B11646 driver217)

		(index_action D13359 34339)
		(is_action D13359)
		(is_typeD D13359)
		(start_action D13359 "13/01/2017 23:39")
		(end_action D13359 "14/01/2017 01:15")
		(duration_action D13359 96)
		(parameters_typeD D13359 driver217)

		(index_action O7984 34340)
		(is_action O7984)
		(is_typeO O7984)
		(start_action O7984 "14/01/2017 01:15")
		(end_action O7984 "14/01/2017 01:21")
		(duration_action O7984 6)
		(parameters_typeO O7984 driver217)

		(index_action B11647 34341)
		(is_action B11647)
		(is_typeB B11647)
		(start_action B11647 "14/01/2017 01:21")
		(end_action B11647 "14/01/2017 10:33")
		(duration_action B11647 552)
		(parameters_typeB B11647 driver217)

		(index_action D13360 34342)
		(is_action D13360)
		(is_typeD D13360)
		(start_action D13360 "14/01/2017 10:33")
		(end_action D13360 "14/01/2017 10:36")
		(duration_action D13360 3)
		(parameters_typeD D13360 driver217)

		(index_action O7985 34343)
		(is_action O7985)
		(is_typeO O7985)
		(start_action O7985 "14/01/2017 10:36")
		(end_action O7985 "14/01/2017 10:38")
		(duration_action O7985 2)
		(parameters_typeO O7985 driver217)

		(index_action D13361 34344)
		(is_action D13361)
		(is_typeD D13361)
		(start_action D13361 "14/01/2017 10:38")
		(end_action D13361 "14/01/2017 10:39")
		(duration_action D13361 1)
		(parameters_typeD D13361 driver217)

		(index_action O7986 34345)
		(is_action O7986)
		(is_typeO O7986)
		(start_action O7986 "14/01/2017 10:39")
		(end_action O7986 "14/01/2017 10:47")
		(duration_action O7986 8)
		(parameters_typeO O7986 driver217)

		(index_action D13362 34346)
		(is_action D13362)
		(is_typeD D13362)
		(start_action D13362 "14/01/2017 10:47")
		(end_action D13362 "14/01/2017 12:35")
		(duration_action D13362 108)
		(parameters_typeD D13362 driver217)

		(index_action O7987 34347)
		(is_action O7987)
		(is_typeO O7987)
		(start_action O7987 "14/01/2017 12:35")
		(end_action O7987 "14/01/2017 12:46")
		(duration_action O7987 11)
		(parameters_typeO O7987 driver217)

		(index_action B11648 34348)
		(is_action B11648)
		(is_typeB B11648)
		(start_action B11648 "14/01/2017 12:46")
		(end_action B11648 "14/01/2017 12:49")
		(duration_action B11648 3)
		(parameters_typeB B11648 driver217)

		(index_action O7988 34349)
		(is_action O7988)
		(is_typeO O7988)
		(start_action O7988 "14/01/2017 12:49")
		(end_action O7988 "14/01/2017 12:53")
		(duration_action O7988 4)
		(parameters_typeO O7988 driver217)

		(index_action D13363 34350)
		(is_action D13363)
		(is_typeD D13363)
		(start_action D13363 "14/01/2017 12:53")
		(end_action D13363 "14/01/2017 14:48")
		(duration_action D13363 115)
		(parameters_typeD D13363 driver217)

		(index_action B11649 34351)
		(is_action B11649)
		(is_typeB B11649)
		(start_action B11649 "14/01/2017 14:52")
		(end_action B11649 "14/01/2017 14:53")
		(duration_action B11649 1)
		(parameters_typeB B11649 driver217)

		(index_action I1353 34352)
		(is_action I1353)
		(is_typeI I1353)
		(start_action I1353 "14/01/2017 14:53")
		(end_action I1353 "14/01/2017 17:57")
		(duration_action I1353 184)
		(parameters_typeI I1353 driver217)

		(index_action B11650 34353)
		(is_action B11650)
		(is_typeB B11650)
		(start_action B11650 "14/01/2017 17:57")
		(end_action B11650 "14/01/2017 18:18")
		(duration_action B11650 21)
		(parameters_typeB B11650 driver217)

		(index_action I1354 34354)
		(is_action I1354)
		(is_typeI I1354)
		(start_action I1354 "14/01/2017 18:18")
		(end_action I1354 "14/01/2017 18:24")
		(duration_action I1354 6)
		(parameters_typeI I1354 driver217)

		(index_action B11651 34355)
		(is_action B11651)
		(is_typeB B11651)
		(start_action B11651 "14/01/2017 18:24")
		(end_action B11651 "16/01/2017 17:43")
		(duration_action B11651 2839)
		(parameters_typeB B11651 driver217)

	)
	(:tasks-goal
		:tasks (
			(WD driver217)
		)
	)
)