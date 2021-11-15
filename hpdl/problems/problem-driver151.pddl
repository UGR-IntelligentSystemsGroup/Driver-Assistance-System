(define (problem prueba0) (:domain GantaBi)
	(:customization
		(= :time-format "%d/%m/%Y %H:%M")
		(= :time-horizon-relative 86400) ;; que son los minutos que tienen 2 meses
		(= :time-start "01/01/2017 00:00")
		(= :time-unit :minutes)
	)
	(:objects
		driver151 - Driver

		D9383 D9384 D9385 D9386 D9387 D9388 D9389 D9390 D9391 D9392 D9393 D9394 D9395 D9396 D9397 D9398 D9399 D9400 D9401 D9402 D9403 D9404 D9405 D9406 D9407 D9408 D9409 D9410 D9411 D9412 D9413 D9414 D9415 D9416 D9417 D9418 D9419 D9420 D9421 D9422 D9423 D9424 D9425 D9426 D9427 D9428 D9429 D9430 D9431 D9432 D9433 D9434 D9435 D9436 D9437 D9438 D9439 D9440 D9441 D9442 D9443 D9444 D9445 D9446 D9447 D9448 D9449 D9450 D9451 D9452 D9453 D9454 D9455
 - TaskInstanceSymbol
		O5397 O5398 O5399 O5400 O5401 O5402 O5403 O5404 O5405 O5406 O5407 O5408 O5409 O5410 O5411 O5412 O5413 O5414 O5415 O5416 O5417 O5418 O5419 O5420 O5421 O5422 O5423 O5424 O5425 O5426 O5427 O5428 O5429 O5430 O5431 O5432 O5433 O5434 O5435 O5436 O5437 O5438 O5439
 - TaskInstanceSymbol
		B8005 B8006 B8007 B8008 B8009 B8010 B8011 B8012 B8013 B8014 B8015 B8016 B8017 B8018 B8019 B8020 B8021 B8022 B8023 B8024 B8025 B8026 B8027 B8028 B8029 B8030 B8031 B8032 B8033 B8034 B8035 B8036 B8037 B8038 B8039 B8040 B8041 B8042 B8043 B8044 B8045 B8046 B8047 B8048 B8049 B8050 B8051 B8052 B8053 B8054 B8055 B8056 B8057 B8058 B8059 B8060 B8061
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

		(= (current_index_action) 23401)

		(= (last_dr) "01/01/2017 18:42")
		(= (last_wr) "01/01/2017 18:42")
		(= (actual-timestamp) "01/01/2017 18:42")

		; Events
		(index_action O5397 23401)
		(is_action O5397)
		(is_typeO O5397)
		(start_action O5397 "01/01/2017 18:42")
		(end_action O5397 "01/01/2017 18:44")
		(duration_action O5397 2)
		(parameters_typeO O5397 driver151)

		(index_action D9383 23402)
		(is_action D9383)
		(is_typeD D9383)
		(start_action D9383 "01/01/2017 18:44")
		(end_action D9383 "01/01/2017 18:45")
		(duration_action D9383 1)
		(parameters_typeD D9383 driver151)

		(index_action O5398 23403)
		(is_action O5398)
		(is_typeO O5398)
		(start_action O5398 "01/01/2017 18:45")
		(end_action O5398 "01/01/2017 19:03")
		(duration_action O5398 18)
		(parameters_typeO O5398 driver151)

		(index_action D9384 23404)
		(is_action D9384)
		(is_typeD D9384)
		(start_action D9384 "01/01/2017 19:03")
		(end_action D9384 "01/01/2017 19:16")
		(duration_action D9384 13)
		(parameters_typeD D9384 driver151)

		(index_action B8005 23405)
		(is_action B8005)
		(is_typeB B8005)
		(start_action B8005 "01/01/2017 19:16")
		(end_action B8005 "01/01/2017 19:18")
		(duration_action B8005 2)
		(parameters_typeB B8005 driver151)

		(index_action D9385 23406)
		(is_action D9385)
		(is_typeD D9385)
		(start_action D9385 "01/01/2017 19:18")
		(end_action D9385 "01/01/2017 19:21")
		(duration_action D9385 3)
		(parameters_typeD D9385 driver151)

		(index_action O5399 23407)
		(is_action O5399)
		(is_typeO O5399)
		(start_action O5399 "01/01/2017 19:21")
		(end_action O5399 "01/01/2017 19:22")
		(duration_action O5399 1)
		(parameters_typeO O5399 driver151)

		(index_action B8006 23408)
		(is_action B8006)
		(is_typeB B8006)
		(start_action B8006 "01/01/2017 19:22")
		(end_action B8006 "01/01/2017 22:06")
		(duration_action B8006 164)
		(parameters_typeB B8006 driver151)

		(index_action D9386 23409)
		(is_action D9386)
		(is_typeD D9386)
		(start_action D9386 "01/01/2017 22:06")
		(end_action D9386 "01/01/2017 22:09")
		(duration_action D9386 3)
		(parameters_typeD D9386 driver151)

		(index_action B8007 23410)
		(is_action B8007)
		(is_typeB B8007)
		(start_action B8007 "01/01/2017 22:09")
		(end_action B8007 "01/01/2017 23:34")
		(duration_action B8007 85)
		(parameters_typeB B8007 driver151)

		(index_action O5400 23411)
		(is_action O5400)
		(is_typeO O5400)
		(start_action O5400 "01/01/2017 23:34")
		(end_action O5400 "01/01/2017 23:36")
		(duration_action O5400 2)
		(parameters_typeO O5400 driver151)

		(index_action D9387 23412)
		(is_action D9387)
		(is_typeD D9387)
		(start_action D9387 "01/01/2017 23:36")
		(end_action D9387 "01/01/2017 23:50")
		(duration_action D9387 14)
		(parameters_typeD D9387 driver151)

		(index_action B8008 23413)
		(is_action B8008)
		(is_typeB B8008)
		(start_action B8008 "01/01/2017 23:50")
		(end_action B8008 "01/01/2017 23:59")
		(duration_action B8008 9)
		(parameters_typeB B8008 driver151)

		(index_action D9388 23414)
		(is_action D9388)
		(is_typeD D9388)
		(start_action D9388 "01/01/2017 23:59")
		(end_action D9388 "02/01/2017 00:02")
		(duration_action D9388 3)
		(parameters_typeD D9388 driver151)

		(index_action O5401 23415)
		(is_action O5401)
		(is_typeO O5401)
		(start_action O5401 "02/01/2017 00:02")
		(end_action O5401 "02/01/2017 00:04")
		(duration_action O5401 2)
		(parameters_typeO O5401 driver151)

		(index_action D9389 23416)
		(is_action D9389)
		(is_typeD D9389)
		(start_action D9389 "02/01/2017 00:04")
		(end_action D9389 "02/01/2017 00:05")
		(duration_action D9389 1)
		(parameters_typeD D9389 driver151)

		(index_action O5402 23417)
		(is_action O5402)
		(is_typeO O5402)
		(start_action O5402 "02/01/2017 00:05")
		(end_action O5402 "02/01/2017 00:06")
		(duration_action O5402 1)
		(parameters_typeO O5402 driver151)

		(index_action B8009 23418)
		(is_action B8009)
		(is_typeB B8009)
		(start_action B8009 "02/01/2017 00:06")
		(end_action B8009 "02/01/2017 08:29")
		(duration_action B8009 503)
		(parameters_typeB B8009 driver151)

		(index_action B8010 23419)
		(is_action B8010)
		(is_typeB B8010)
		(start_action B8010 "02/01/2017 08:38")
		(end_action B8010 "05/01/2017 20:59")
		(duration_action B8010 5061)
		(parameters_typeB B8010 driver151)

		(index_action B8011 23420)
		(is_action B8011)
		(is_typeB B8011)
		(start_action B8011 "05/01/2017 21:00")
		(end_action B8011 "06/01/2017 06:01")
		(duration_action B8011 541)
		(parameters_typeB B8011 driver151)

		(index_action O5403 23421)
		(is_action O5403)
		(is_typeO O5403)
		(start_action O5403 "06/01/2017 06:01")
		(end_action O5403 "06/01/2017 06:10")
		(duration_action O5403 9)
		(parameters_typeO O5403 driver151)

		(index_action D9390 23422)
		(is_action D9390)
		(is_typeD D9390)
		(start_action D9390 "06/01/2017 06:10")
		(end_action D9390 "06/01/2017 07:42")
		(duration_action D9390 92)
		(parameters_typeD D9390 driver151)

		(index_action B8012 23423)
		(is_action B8012)
		(is_typeB B8012)
		(start_action B8012 "06/01/2017 07:42")
		(end_action B8012 "06/01/2017 08:02")
		(duration_action B8012 20)
		(parameters_typeB B8012 driver151)

		(index_action D9391 23424)
		(is_action D9391)
		(is_typeD D9391)
		(start_action D9391 "06/01/2017 08:02")
		(end_action D9391 "06/01/2017 08:04")
		(duration_action D9391 2)
		(parameters_typeD D9391 driver151)

		(index_action B8013 23425)
		(is_action B8013)
		(is_typeB B8013)
		(start_action B8013 "06/01/2017 08:04")
		(end_action B8013 "06/01/2017 09:24")
		(duration_action B8013 80)
		(parameters_typeB B8013 driver151)

		(index_action D9392 23426)
		(is_action D9392)
		(is_typeD D9392)
		(start_action D9392 "06/01/2017 09:24")
		(end_action D9392 "06/01/2017 09:26")
		(duration_action D9392 2)
		(parameters_typeD D9392 driver151)

		(index_action B8014 23427)
		(is_action B8014)
		(is_typeB B8014)
		(start_action B8014 "06/01/2017 09:26")
		(end_action B8014 "06/01/2017 10:08")
		(duration_action B8014 42)
		(parameters_typeB B8014 driver151)

		(index_action O5404 23428)
		(is_action O5404)
		(is_typeO O5404)
		(start_action O5404 "06/01/2017 10:08")
		(end_action O5404 "06/01/2017 10:40")
		(duration_action O5404 32)
		(parameters_typeO O5404 driver151)

		(index_action D9393 23429)
		(is_action D9393)
		(is_typeD D9393)
		(start_action D9393 "06/01/2017 10:40")
		(end_action D9393 "06/01/2017 14:41")
		(duration_action D9393 241)
		(parameters_typeD D9393 driver151)

		(index_action B8015 23430)
		(is_action B8015)
		(is_typeB B8015)
		(start_action B8015 "06/01/2017 14:41")
		(end_action B8015 "06/01/2017 15:34")
		(duration_action B8015 53)
		(parameters_typeB B8015 driver151)

		(index_action D9394 23431)
		(is_action D9394)
		(is_typeD D9394)
		(start_action D9394 "06/01/2017 15:34")
		(end_action D9394 "06/01/2017 16:27")
		(duration_action D9394 53)
		(parameters_typeD D9394 driver151)

		(index_action B8016 23432)
		(is_action B8016)
		(is_typeB B8016)
		(start_action B8016 "06/01/2017 16:27")
		(end_action B8016 "06/01/2017 16:43")
		(duration_action B8016 16)
		(parameters_typeB B8016 driver151)

		(index_action D9395 23433)
		(is_action D9395)
		(is_typeD D9395)
		(start_action D9395 "06/01/2017 16:43")
		(end_action D9395 "06/01/2017 17:42")
		(duration_action D9395 59)
		(parameters_typeD D9395 driver151)

		(index_action O5405 23434)
		(is_action O5405)
		(is_typeO O5405)
		(start_action O5405 "06/01/2017 17:42")
		(end_action O5405 "06/01/2017 17:50")
		(duration_action O5405 8)
		(parameters_typeO O5405 driver151)

		(index_action D9396 23435)
		(is_action D9396)
		(is_typeD D9396)
		(start_action D9396 "06/01/2017 17:50")
		(end_action D9396 "06/01/2017 18:00")
		(duration_action D9396 10)
		(parameters_typeD D9396 driver151)

		(index_action B8017 23436)
		(is_action B8017)
		(is_typeB B8017)
		(start_action B8017 "06/01/2017 18:00")
		(end_action B8017 "06/01/2017 18:05")
		(duration_action B8017 5)
		(parameters_typeB B8017 driver151)

		(index_action D9397 23437)
		(is_action D9397)
		(is_typeD D9397)
		(start_action D9397 "06/01/2017 18:05")
		(end_action D9397 "06/01/2017 18:15")
		(duration_action D9397 10)
		(parameters_typeD D9397 driver151)

		(index_action O5406 23438)
		(is_action O5406)
		(is_typeO O5406)
		(start_action O5406 "06/01/2017 18:15")
		(end_action O5406 "06/01/2017 18:17")
		(duration_action O5406 2)
		(parameters_typeO O5406 driver151)

		(index_action D9398 23439)
		(is_action D9398)
		(is_typeD D9398)
		(start_action D9398 "06/01/2017 18:17")
		(end_action D9398 "06/01/2017 18:19")
		(duration_action D9398 2)
		(parameters_typeD D9398 driver151)

		(index_action O5407 23440)
		(is_action O5407)
		(is_typeO O5407)
		(start_action O5407 "06/01/2017 18:19")
		(end_action O5407 "06/01/2017 18:22")
		(duration_action O5407 3)
		(parameters_typeO O5407 driver151)

		(index_action D9399 23441)
		(is_action D9399)
		(is_typeD D9399)
		(start_action D9399 "06/01/2017 18:22")
		(end_action D9399 "06/01/2017 18:23")
		(duration_action D9399 1)
		(parameters_typeD D9399 driver151)

		(index_action O5408 23442)
		(is_action O5408)
		(is_typeO O5408)
		(start_action O5408 "06/01/2017 18:23")
		(end_action O5408 "06/01/2017 18:29")
		(duration_action O5408 6)
		(parameters_typeO O5408 driver151)

		(index_action D9400 23443)
		(is_action D9400)
		(is_typeD D9400)
		(start_action D9400 "06/01/2017 18:29")
		(end_action D9400 "06/01/2017 18:30")
		(duration_action D9400 1)
		(parameters_typeD D9400 driver151)

		(index_action O5409 23444)
		(is_action O5409)
		(is_typeO O5409)
		(start_action O5409 "06/01/2017 18:30")
		(end_action O5409 "06/01/2017 18:35")
		(duration_action O5409 5)
		(parameters_typeO O5409 driver151)

		(index_action D9401 23445)
		(is_action D9401)
		(is_typeD D9401)
		(start_action D9401 "06/01/2017 18:35")
		(end_action D9401 "06/01/2017 18:49")
		(duration_action D9401 14)
		(parameters_typeD D9401 driver151)

		(index_action B8018 23446)
		(is_action B8018)
		(is_typeB B8018)
		(start_action B8018 "06/01/2017 18:49")
		(end_action B8018 "06/01/2017 19:21")
		(duration_action B8018 32)
		(parameters_typeB B8018 driver151)

		(index_action D9402 23447)
		(is_action D9402)
		(is_typeD D9402)
		(start_action D9402 "06/01/2017 19:21")
		(end_action D9402 "06/01/2017 19:25")
		(duration_action D9402 4)
		(parameters_typeD D9402 driver151)

		(index_action B8019 23448)
		(is_action B8019)
		(is_typeB B8019)
		(start_action B8019 "06/01/2017 19:25")
		(end_action B8019 "06/01/2017 19:47")
		(duration_action B8019 22)
		(parameters_typeB B8019 driver151)

		(index_action D9403 23449)
		(is_action D9403)
		(is_typeD D9403)
		(start_action D9403 "06/01/2017 19:47")
		(end_action D9403 "06/01/2017 20:35")
		(duration_action D9403 48)
		(parameters_typeD D9403 driver151)

		(index_action B8020 23450)
		(is_action B8020)
		(is_typeB B8020)
		(start_action B8020 "06/01/2017 20:35")
		(end_action B8020 "07/01/2017 05:38")
		(duration_action B8020 543)
		(parameters_typeB B8020 driver151)

		(index_action O5410 23451)
		(is_action O5410)
		(is_typeO O5410)
		(start_action O5410 "07/01/2017 05:38")
		(end_action O5410 "07/01/2017 05:58")
		(duration_action O5410 20)
		(parameters_typeO O5410 driver151)

		(index_action D9404 23452)
		(is_action D9404)
		(is_typeD D9404)
		(start_action D9404 "07/01/2017 05:58")
		(end_action D9404 "07/01/2017 06:06")
		(duration_action D9404 8)
		(parameters_typeD D9404 driver151)

		(index_action O5411 23453)
		(is_action O5411)
		(is_typeO O5411)
		(start_action O5411 "07/01/2017 06:06")
		(end_action O5411 "07/01/2017 06:08")
		(duration_action O5411 2)
		(parameters_typeO O5411 driver151)

		(index_action D9405 23454)
		(is_action D9405)
		(is_typeD D9405)
		(start_action D9405 "07/01/2017 06:08")
		(end_action D9405 "07/01/2017 09:44")
		(duration_action D9405 216)
		(parameters_typeD D9405 driver151)

		(index_action B8021 23455)
		(is_action B8021)
		(is_typeB B8021)
		(start_action B8021 "07/01/2017 09:44")
		(end_action B8021 "07/01/2017 10:43")
		(duration_action B8021 59)
		(parameters_typeB B8021 driver151)

		(index_action D9406 23456)
		(is_action D9406)
		(is_typeD D9406)
		(start_action D9406 "07/01/2017 10:43")
		(end_action D9406 "07/01/2017 11:59")
		(duration_action D9406 76)
		(parameters_typeD D9406 driver151)

		(index_action O5412 23457)
		(is_action O5412)
		(is_typeO O5412)
		(start_action O5412 "07/01/2017 11:59")
		(end_action O5412 "07/01/2017 12:01")
		(duration_action O5412 2)
		(parameters_typeO O5412 driver151)

		(index_action D9407 23458)
		(is_action D9407)
		(is_typeD D9407)
		(start_action D9407 "07/01/2017 12:01")
		(end_action D9407 "07/01/2017 13:30")
		(duration_action D9407 89)
		(parameters_typeD D9407 driver151)

		(index_action B8022 23459)
		(is_action B8022)
		(is_typeB B8022)
		(start_action B8022 "07/01/2017 13:30")
		(end_action B8022 "07/01/2017 14:21")
		(duration_action B8022 51)
		(parameters_typeB B8022 driver151)

		(index_action D9408 23460)
		(is_action D9408)
		(is_typeD D9408)
		(start_action D9408 "07/01/2017 14:21")
		(end_action D9408 "07/01/2017 17:48")
		(duration_action D9408 207)
		(parameters_typeD D9408 driver151)

		(index_action O5413 23461)
		(is_action O5413)
		(is_typeO O5413)
		(start_action O5413 "07/01/2017 17:48")
		(end_action O5413 "07/01/2017 17:52")
		(duration_action O5413 4)
		(parameters_typeO O5413 driver151)

		(index_action D9409 23462)
		(is_action D9409)
		(is_typeD D9409)
		(start_action D9409 "07/01/2017 17:52")
		(end_action D9409 "07/01/2017 17:57")
		(duration_action D9409 5)
		(parameters_typeD D9409 driver151)

		(index_action O5414 23463)
		(is_action O5414)
		(is_typeO O5414)
		(start_action O5414 "07/01/2017 17:57")
		(end_action O5414 "07/01/2017 18:00")
		(duration_action O5414 3)
		(parameters_typeO O5414 driver151)

		(index_action D9410 23464)
		(is_action D9410)
		(is_typeD D9410)
		(start_action D9410 "07/01/2017 18:00")
		(end_action D9410 "07/01/2017 18:01")
		(duration_action D9410 1)
		(parameters_typeD D9410 driver151)

		(index_action O5415 23465)
		(is_action O5415)
		(is_typeO O5415)
		(start_action O5415 "07/01/2017 18:01")
		(end_action O5415 "07/01/2017 18:03")
		(duration_action O5415 2)
		(parameters_typeO O5415 driver151)

		(index_action D9411 23466)
		(is_action D9411)
		(is_typeD D9411)
		(start_action D9411 "07/01/2017 18:03")
		(end_action D9411 "07/01/2017 18:04")
		(duration_action D9411 1)
		(parameters_typeD D9411 driver151)

		(index_action B8023 23467)
		(is_action B8023)
		(is_typeB B8023)
		(start_action B8023 "07/01/2017 18:04")
		(end_action B8023 "08/01/2017 05:46")
		(duration_action B8023 702)
		(parameters_typeB B8023 driver151)

		(index_action O5416 23468)
		(is_action O5416)
		(is_typeO O5416)
		(start_action O5416 "08/01/2017 05:46")
		(end_action O5416 "08/01/2017 06:00")
		(duration_action O5416 14)
		(parameters_typeO O5416 driver151)

		(index_action D9412 23469)
		(is_action D9412)
		(is_typeD D9412)
		(start_action D9412 "08/01/2017 06:00")
		(end_action D9412 "08/01/2017 09:19")
		(duration_action D9412 199)
		(parameters_typeD D9412 driver151)

		(index_action B8024 23470)
		(is_action B8024)
		(is_typeB B8024)
		(start_action B8024 "08/01/2017 09:19")
		(end_action B8024 "08/01/2017 10:08")
		(duration_action B8024 49)
		(parameters_typeB B8024 driver151)

		(index_action D9413 23471)
		(is_action D9413)
		(is_typeD D9413)
		(start_action D9413 "08/01/2017 10:08")
		(end_action D9413 "08/01/2017 11:26")
		(duration_action D9413 78)
		(parameters_typeD D9413 driver151)

		(index_action B8025 23472)
		(is_action B8025)
		(is_typeB B8025)
		(start_action B8025 "08/01/2017 11:26")
		(end_action B8025 "08/01/2017 11:30")
		(duration_action B8025 4)
		(parameters_typeB B8025 driver151)

		(index_action D9414 23473)
		(is_action D9414)
		(is_typeD D9414)
		(start_action D9414 "08/01/2017 11:30")
		(end_action D9414 "08/01/2017 11:33")
		(duration_action D9414 3)
		(parameters_typeD D9414 driver151)

		(index_action B8026 23474)
		(is_action B8026)
		(is_typeB B8026)
		(start_action B8026 "08/01/2017 11:33")
		(end_action B8026 "08/01/2017 12:12")
		(duration_action B8026 39)
		(parameters_typeB B8026 driver151)

		(index_action O5417 23475)
		(is_action O5417)
		(is_typeO O5417)
		(start_action O5417 "08/01/2017 12:12")
		(end_action O5417 "08/01/2017 12:34")
		(duration_action O5417 22)
		(parameters_typeO O5417 driver151)

		(index_action D9415 23476)
		(is_action D9415)
		(is_typeD D9415)
		(start_action D9415 "08/01/2017 12:34")
		(end_action D9415 "08/01/2017 15:03")
		(duration_action D9415 149)
		(parameters_typeD D9415 driver151)

		(index_action B8027 23477)
		(is_action B8027)
		(is_typeB B8027)
		(start_action B8027 "08/01/2017 15:03")
		(end_action B8027 "08/01/2017 15:36")
		(duration_action B8027 33)
		(parameters_typeB B8027 driver151)

		(index_action D9416 23478)
		(is_action D9416)
		(is_typeD D9416)
		(start_action D9416 "08/01/2017 15:36")
		(end_action D9416 "08/01/2017 18:25")
		(duration_action D9416 169)
		(parameters_typeD D9416 driver151)

		(index_action B8028 23479)
		(is_action B8028)
		(is_typeB B8028)
		(start_action B8028 "08/01/2017 18:25")
		(end_action B8028 "09/01/2017 06:32")
		(duration_action B8028 727)
		(parameters_typeB B8028 driver151)

		(index_action D9417 23480)
		(is_action D9417)
		(is_typeD D9417)
		(start_action D9417 "09/01/2017 06:32")
		(end_action D9417 "09/01/2017 07:54")
		(duration_action D9417 82)
		(parameters_typeD D9417 driver151)

		(index_action O5418 23481)
		(is_action O5418)
		(is_typeO O5418)
		(start_action O5418 "09/01/2017 07:57")
		(end_action O5418 "09/01/2017 07:58")
		(duration_action O5418 1)
		(parameters_typeO O5418 driver151)

		(index_action D9418 23482)
		(is_action D9418)
		(is_typeD D9418)
		(start_action D9418 "09/01/2017 07:58")
		(end_action D9418 "09/01/2017 08:04")
		(duration_action D9418 6)
		(parameters_typeD D9418 driver151)

		(index_action B8029 23483)
		(is_action B8029)
		(is_typeB B8029)
		(start_action B8029 "09/01/2017 08:04")
		(end_action B8029 "09/01/2017 08:21")
		(duration_action B8029 17)
		(parameters_typeB B8029 driver151)

		(index_action D9419 23484)
		(is_action D9419)
		(is_typeD D9419)
		(start_action D9419 "09/01/2017 08:21")
		(end_action D9419 "09/01/2017 08:23")
		(duration_action D9419 2)
		(parameters_typeD D9419 driver151)

		(index_action O5419 23485)
		(is_action O5419)
		(is_typeO O5419)
		(start_action O5419 "09/01/2017 08:23")
		(end_action O5419 "09/01/2017 08:25")
		(duration_action O5419 2)
		(parameters_typeO O5419 driver151)

		(index_action B8030 23486)
		(is_action B8030)
		(is_typeB B8030)
		(start_action B8030 "09/01/2017 08:25")
		(end_action B8030 "09/01/2017 08:55")
		(duration_action B8030 30)
		(parameters_typeB B8030 driver151)

		(index_action O5420 23487)
		(is_action O5420)
		(is_typeO O5420)
		(start_action O5420 "09/01/2017 08:55")
		(end_action O5420 "09/01/2017 08:56")
		(duration_action O5420 1)
		(parameters_typeO O5420 driver151)

		(index_action D9420 23488)
		(is_action D9420)
		(is_typeD D9420)
		(start_action D9420 "09/01/2017 08:56")
		(end_action D9420 "09/01/2017 09:05")
		(duration_action D9420 9)
		(parameters_typeD D9420 driver151)

		(index_action B8031 23489)
		(is_action B8031)
		(is_typeB B8031)
		(start_action B8031 "09/01/2017 09:05")
		(end_action B8031 "10/01/2017 21:17")
		(duration_action B8031 2172)
		(parameters_typeB B8031 driver151)

		(index_action B8032 23490)
		(is_action B8032)
		(is_typeB B8032)
		(start_action B8032 "10/01/2017 21:18")
		(end_action B8032 "11/01/2017 17:07")
		(duration_action B8032 1189)
		(parameters_typeB B8032 driver151)

		(index_action D9421 23491)
		(is_action D9421)
		(is_typeD D9421)
		(start_action D9421 "11/01/2017 17:07")
		(end_action D9421 "11/01/2017 21:02")
		(duration_action D9421 235)
		(parameters_typeD D9421 driver151)

		(index_action B8033 23492)
		(is_action B8033)
		(is_typeB B8033)
		(start_action B8033 "11/01/2017 21:02")
		(end_action B8033 "11/01/2017 21:49")
		(duration_action B8033 47)
		(parameters_typeB B8033 driver151)

		(index_action D9422 23493)
		(is_action D9422)
		(is_typeD D9422)
		(start_action D9422 "11/01/2017 21:49")
		(end_action D9422 "11/01/2017 23:26")
		(duration_action D9422 97)
		(parameters_typeD D9422 driver151)

		(index_action O5421 23494)
		(is_action O5421)
		(is_typeO O5421)
		(start_action O5421 "11/01/2017 23:26")
		(end_action O5421 "11/01/2017 23:27")
		(duration_action O5421 1)
		(parameters_typeO O5421 driver151)

		(index_action B8034 23495)
		(is_action B8034)
		(is_typeB B8034)
		(start_action B8034 "11/01/2017 23:27")
		(end_action B8034 "12/01/2017 16:27")
		(duration_action B8034 1020)
		(parameters_typeB B8034 driver151)

		(index_action O5422 23496)
		(is_action O5422)
		(is_typeO O5422)
		(start_action O5422 "12/01/2017 16:27")
		(end_action O5422 "12/01/2017 16:28")
		(duration_action O5422 1)
		(parameters_typeO O5422 driver151)

		(index_action D9423 23497)
		(is_action D9423)
		(is_typeD D9423)
		(start_action D9423 "12/01/2017 16:28")
		(end_action D9423 "12/01/2017 16:31")
		(duration_action D9423 3)
		(parameters_typeD D9423 driver151)

		(index_action B8035 23498)
		(is_action B8035)
		(is_typeB B8035)
		(start_action B8035 "12/01/2017 16:31")
		(end_action B8035 "12/01/2017 16:35")
		(duration_action B8035 4)
		(parameters_typeB B8035 driver151)

		(index_action D9424 23499)
		(is_action D9424)
		(is_typeD D9424)
		(start_action D9424 "12/01/2017 16:35")
		(end_action D9424 "12/01/2017 16:41")
		(duration_action D9424 6)
		(parameters_typeD D9424 driver151)

		(index_action B8036 23500)
		(is_action B8036)
		(is_typeB B8036)
		(start_action B8036 "12/01/2017 16:41")
		(end_action B8036 "12/01/2017 16:47")
		(duration_action B8036 6)
		(parameters_typeB B8036 driver151)

		(index_action D9425 23501)
		(is_action D9425)
		(is_typeD D9425)
		(start_action D9425 "12/01/2017 16:47")
		(end_action D9425 "12/01/2017 16:49")
		(duration_action D9425 2)
		(parameters_typeD D9425 driver151)

		(index_action B8037 23502)
		(is_action B8037)
		(is_typeB B8037)
		(start_action B8037 "12/01/2017 16:49")
		(end_action B8037 "12/01/2017 16:57")
		(duration_action B8037 8)
		(parameters_typeB B8037 driver151)

		(index_action D9426 23503)
		(is_action D9426)
		(is_typeD D9426)
		(start_action D9426 "12/01/2017 16:57")
		(end_action D9426 "12/01/2017 17:38")
		(duration_action D9426 41)
		(parameters_typeD D9426 driver151)

		(index_action B8038 23504)
		(is_action B8038)
		(is_typeB B8038)
		(start_action B8038 "12/01/2017 17:38")
		(end_action B8038 "12/01/2017 18:03")
		(duration_action B8038 25)
		(parameters_typeB B8038 driver151)

		(index_action O5423 23505)
		(is_action O5423)
		(is_typeO O5423)
		(start_action O5423 "12/01/2017 18:03")
		(end_action O5423 "12/01/2017 18:05")
		(duration_action O5423 2)
		(parameters_typeO O5423 driver151)

		(index_action D9427 23506)
		(is_action D9427)
		(is_typeD D9427)
		(start_action D9427 "12/01/2017 18:05")
		(end_action D9427 "12/01/2017 18:13")
		(duration_action D9427 8)
		(parameters_typeD D9427 driver151)

		(index_action B8039 23507)
		(is_action B8039)
		(is_typeB B8039)
		(start_action B8039 "12/01/2017 18:13")
		(end_action B8039 "12/01/2017 18:22")
		(duration_action B8039 9)
		(parameters_typeB B8039 driver151)

		(index_action O5424 23508)
		(is_action O5424)
		(is_typeO O5424)
		(start_action O5424 "12/01/2017 18:22")
		(end_action O5424 "12/01/2017 18:23")
		(duration_action O5424 1)
		(parameters_typeO O5424 driver151)

		(index_action D9428 23509)
		(is_action D9428)
		(is_typeD D9428)
		(start_action D9428 "12/01/2017 18:23")
		(end_action D9428 "12/01/2017 18:26")
		(duration_action D9428 3)
		(parameters_typeD D9428 driver151)

		(index_action B8040 23510)
		(is_action B8040)
		(is_typeB B8040)
		(start_action B8040 "12/01/2017 18:26")
		(end_action B8040 "12/01/2017 18:54")
		(duration_action B8040 28)
		(parameters_typeB B8040 driver151)

		(index_action D9429 23511)
		(is_action D9429)
		(is_typeD D9429)
		(start_action D9429 "12/01/2017 18:54")
		(end_action D9429 "12/01/2017 19:36")
		(duration_action D9429 42)
		(parameters_typeD D9429 driver151)

		(index_action B8041 23512)
		(is_action B8041)
		(is_typeB B8041)
		(start_action B8041 "12/01/2017 19:36")
		(end_action B8041 "12/01/2017 20:09")
		(duration_action B8041 33)
		(parameters_typeB B8041 driver151)

		(index_action D9430 23513)
		(is_action D9430)
		(is_typeD D9430)
		(start_action D9430 "12/01/2017 20:09")
		(end_action D9430 "12/01/2017 20:11")
		(duration_action D9430 2)
		(parameters_typeD D9430 driver151)

		(index_action O5425 23514)
		(is_action O5425)
		(is_typeO O5425)
		(start_action O5425 "12/01/2017 20:11")
		(end_action O5425 "12/01/2017 20:41")
		(duration_action O5425 30)
		(parameters_typeO O5425 driver151)

		(index_action D9431 23515)
		(is_action D9431)
		(is_typeD D9431)
		(start_action D9431 "12/01/2017 20:41")
		(end_action D9431 "12/01/2017 20:42")
		(duration_action D9431 1)
		(parameters_typeD D9431 driver151)

		(index_action O5426 23516)
		(is_action O5426)
		(is_typeO O5426)
		(start_action O5426 "12/01/2017 20:42")
		(end_action O5426 "12/01/2017 20:44")
		(duration_action O5426 2)
		(parameters_typeO O5426 driver151)

		(index_action D9432 23517)
		(is_action D9432)
		(is_typeD D9432)
		(start_action D9432 "12/01/2017 20:44")
		(end_action D9432 "12/01/2017 20:45")
		(duration_action D9432 1)
		(parameters_typeD D9432 driver151)

		(index_action B8042 23518)
		(is_action B8042)
		(is_typeB B8042)
		(start_action B8042 "12/01/2017 20:45")
		(end_action B8042 "12/01/2017 21:07")
		(duration_action B8042 22)
		(parameters_typeB B8042 driver151)

		(index_action O5427 23519)
		(is_action O5427)
		(is_typeO O5427)
		(start_action O5427 "12/01/2017 21:07")
		(end_action O5427 "12/01/2017 21:11")
		(duration_action O5427 4)
		(parameters_typeO O5427 driver151)

		(index_action B8043 23520)
		(is_action B8043)
		(is_typeB B8043)
		(start_action B8043 "12/01/2017 21:11")
		(end_action B8043 "12/01/2017 21:24")
		(duration_action B8043 13)
		(parameters_typeB B8043 driver151)

		(index_action O5428 23521)
		(is_action O5428)
		(is_typeO O5428)
		(start_action O5428 "12/01/2017 21:24")
		(end_action O5428 "12/01/2017 22:37")
		(duration_action O5428 73)
		(parameters_typeO O5428 driver151)

		(index_action D9433 23522)
		(is_action D9433)
		(is_typeD D9433)
		(start_action D9433 "12/01/2017 22:37")
		(end_action D9433 "12/01/2017 22:38")
		(duration_action D9433 1)
		(parameters_typeD D9433 driver151)

		(index_action B8044 23523)
		(is_action B8044)
		(is_typeB B8044)
		(start_action B8044 "12/01/2017 22:38")
		(end_action B8044 "12/01/2017 23:06")
		(duration_action B8044 28)
		(parameters_typeB B8044 driver151)

		(index_action O5429 23524)
		(is_action O5429)
		(is_typeO O5429)
		(start_action O5429 "12/01/2017 23:06")
		(end_action O5429 "12/01/2017 23:11")
		(duration_action O5429 5)
		(parameters_typeO O5429 driver151)

		(index_action B8045 23525)
		(is_action B8045)
		(is_typeB B8045)
		(start_action B8045 "12/01/2017 23:11")
		(end_action B8045 "12/01/2017 23:12")
		(duration_action B8045 1)
		(parameters_typeB B8045 driver151)

		(index_action D9434 23526)
		(is_action D9434)
		(is_typeD D9434)
		(start_action D9434 "12/01/2017 23:12")
		(end_action D9434 "13/01/2017 01:52")
		(duration_action D9434 160)
		(parameters_typeD D9434 driver151)

		(index_action B8046 23527)
		(is_action B8046)
		(is_typeB B8046)
		(start_action B8046 "13/01/2017 01:52")
		(end_action B8046 "13/01/2017 03:14")
		(duration_action B8046 82)
		(parameters_typeB B8046 driver151)

		(index_action D9435 23528)
		(is_action D9435)
		(is_typeD D9435)
		(start_action D9435 "13/01/2017 03:14")
		(end_action D9435 "13/01/2017 07:17")
		(duration_action D9435 243)
		(parameters_typeD D9435 driver151)

		(index_action O5430 23529)
		(is_action O5430)
		(is_typeO O5430)
		(start_action O5430 "13/01/2017 07:17")
		(end_action O5430 "13/01/2017 07:20")
		(duration_action O5430 3)
		(parameters_typeO O5430 driver151)

		(index_action D9436 23530)
		(is_action D9436)
		(is_typeD D9436)
		(start_action D9436 "13/01/2017 07:20")
		(end_action D9436 "13/01/2017 07:24")
		(duration_action D9436 4)
		(parameters_typeD D9436 driver151)

		(index_action B8047 23531)
		(is_action B8047)
		(is_typeB B8047)
		(start_action B8047 "13/01/2017 07:24")
		(end_action B8047 "13/01/2017 16:28")
		(duration_action B8047 544)
		(parameters_typeB B8047 driver151)

		(index_action D9437 23532)
		(is_action D9437)
		(is_typeD D9437)
		(start_action D9437 "13/01/2017 16:28")
		(end_action D9437 "13/01/2017 19:19")
		(duration_action D9437 171)
		(parameters_typeD D9437 driver151)

		(index_action B8048 23533)
		(is_action B8048)
		(is_typeB B8048)
		(start_action B8048 "13/01/2017 19:19")
		(end_action B8048 "13/01/2017 19:20")
		(duration_action B8048 1)
		(parameters_typeB B8048 driver151)

		(index_action O5431 23534)
		(is_action O5431)
		(is_typeO O5431)
		(start_action O5431 "13/01/2017 19:20")
		(end_action O5431 "13/01/2017 19:37")
		(duration_action O5431 17)
		(parameters_typeO O5431 driver151)

		(index_action B8049 23535)
		(is_action B8049)
		(is_typeB B8049)
		(start_action B8049 "13/01/2017 19:37")
		(end_action B8049 "13/01/2017 19:45")
		(duration_action B8049 8)
		(parameters_typeB B8049 driver151)

		(index_action D9438 23536)
		(is_action D9438)
		(is_typeD D9438)
		(start_action D9438 "13/01/2017 19:45")
		(end_action D9438 "13/01/2017 19:48")
		(duration_action D9438 3)
		(parameters_typeD D9438 driver151)

		(index_action B8050 23537)
		(is_action B8050)
		(is_typeB B8050)
		(start_action B8050 "13/01/2017 19:48")
		(end_action B8050 "13/01/2017 20:35")
		(duration_action B8050 47)
		(parameters_typeB B8050 driver151)

		(index_action D9439 23538)
		(is_action D9439)
		(is_typeD D9439)
		(start_action D9439 "13/01/2017 20:35")
		(end_action D9439 "13/01/2017 23:56")
		(duration_action D9439 201)
		(parameters_typeD D9439 driver151)

		(index_action B8051 23539)
		(is_action B8051)
		(is_typeB B8051)
		(start_action B8051 "13/01/2017 23:56")
		(end_action B8051 "14/01/2017 00:46")
		(duration_action B8051 50)
		(parameters_typeB B8051 driver151)

		(index_action O5432 23540)
		(is_action O5432)
		(is_typeO O5432)
		(start_action O5432 "14/01/2017 00:46")
		(end_action O5432 "14/01/2017 00:48")
		(duration_action O5432 2)
		(parameters_typeO O5432 driver151)

		(index_action D9440 23541)
		(is_action D9440)
		(is_typeD D9440)
		(start_action D9440 "14/01/2017 00:48")
		(end_action D9440 "14/01/2017 04:30")
		(duration_action D9440 222)
		(parameters_typeD D9440 driver151)

		(index_action B8052 23542)
		(is_action B8052)
		(is_typeB B8052)
		(start_action B8052 "14/01/2017 04:30")
		(end_action B8052 "14/01/2017 13:33")
		(duration_action B8052 543)
		(parameters_typeB B8052 driver151)

		(index_action O5433 23543)
		(is_action O5433)
		(is_typeO O5433)
		(start_action O5433 "14/01/2017 13:33")
		(end_action O5433 "14/01/2017 13:37")
		(duration_action O5433 4)
		(parameters_typeO O5433 driver151)

		(index_action D9441 23544)
		(is_action D9441)
		(is_typeD D9441)
		(start_action D9441 "14/01/2017 13:37")
		(end_action D9441 "14/01/2017 16:45")
		(duration_action D9441 188)
		(parameters_typeD D9441 driver151)

		(index_action B8053 23545)
		(is_action B8053)
		(is_typeB B8053)
		(start_action B8053 "14/01/2017 16:45")
		(end_action B8053 "14/01/2017 17:01")
		(duration_action B8053 16)
		(parameters_typeB B8053 driver151)

		(index_action D9442 23546)
		(is_action D9442)
		(is_typeD D9442)
		(start_action D9442 "14/01/2017 17:01")
		(end_action D9442 "14/01/2017 18:02")
		(duration_action D9442 61)
		(parameters_typeD D9442 driver151)

		(index_action B8054 23547)
		(is_action B8054)
		(is_typeB B8054)
		(start_action B8054 "14/01/2017 18:02")
		(end_action B8054 "14/01/2017 18:33")
		(duration_action B8054 31)
		(parameters_typeB B8054 driver151)

		(index_action D9443 23548)
		(is_action D9443)
		(is_typeD D9443)
		(start_action D9443 "14/01/2017 18:33")
		(end_action D9443 "14/01/2017 19:33")
		(duration_action D9443 60)
		(parameters_typeD D9443 driver151)

		(index_action B8055 23549)
		(is_action B8055)
		(is_typeB B8055)
		(start_action B8055 "14/01/2017 19:33")
		(end_action B8055 "14/01/2017 19:51")
		(duration_action B8055 18)
		(parameters_typeB B8055 driver151)

		(index_action O5434 23550)
		(is_action O5434)
		(is_typeO O5434)
		(start_action O5434 "14/01/2017 19:51")
		(end_action O5434 "14/01/2017 19:52")
		(duration_action O5434 1)
		(parameters_typeO O5434 driver151)

		(index_action D9444 23551)
		(is_action D9444)
		(is_typeD D9444)
		(start_action D9444 "14/01/2017 19:52")
		(end_action D9444 "14/01/2017 19:53")
		(duration_action D9444 1)
		(parameters_typeD D9444 driver151)

		(index_action O5435 23552)
		(is_action O5435)
		(is_typeO O5435)
		(start_action O5435 "14/01/2017 19:53")
		(end_action O5435 "14/01/2017 19:55")
		(duration_action O5435 2)
		(parameters_typeO O5435 driver151)

		(index_action D9445 23553)
		(is_action D9445)
		(is_typeD D9445)
		(start_action D9445 "14/01/2017 19:55")
		(end_action D9445 "14/01/2017 20:18")
		(duration_action D9445 23)
		(parameters_typeD D9445 driver151)

		(index_action O5436 23554)
		(is_action O5436)
		(is_typeO O5436)
		(start_action O5436 "14/01/2017 20:18")
		(end_action O5436 "14/01/2017 20:20")
		(duration_action O5436 2)
		(parameters_typeO O5436 driver151)

		(index_action D9446 23555)
		(is_action D9446)
		(is_typeD D9446)
		(start_action D9446 "14/01/2017 20:20")
		(end_action D9446 "14/01/2017 20:22")
		(duration_action D9446 2)
		(parameters_typeD D9446 driver151)

		(index_action B8056 23556)
		(is_action B8056)
		(is_typeB B8056)
		(start_action B8056 "14/01/2017 20:22")
		(end_action B8056 "14/01/2017 20:55")
		(duration_action B8056 33)
		(parameters_typeB B8056 driver151)

		(index_action D9447 23557)
		(is_action D9447)
		(is_typeD D9447)
		(start_action D9447 "14/01/2017 20:55")
		(end_action D9447 "14/01/2017 23:41")
		(duration_action D9447 166)
		(parameters_typeD D9447 driver151)

		(index_action O5437 23558)
		(is_action O5437)
		(is_typeO O5437)
		(start_action O5437 "14/01/2017 23:41")
		(end_action O5437 "14/01/2017 23:46")
		(duration_action O5437 5)
		(parameters_typeO O5437 driver151)

		(index_action D9448 23559)
		(is_action D9448)
		(is_typeD D9448)
		(start_action D9448 "14/01/2017 23:46")
		(end_action D9448 "14/01/2017 23:48")
		(duration_action D9448 2)
		(parameters_typeD D9448 driver151)

		(index_action O5438 23560)
		(is_action O5438)
		(is_typeO O5438)
		(start_action O5438 "14/01/2017 23:48")
		(end_action O5438 "14/01/2017 23:50")
		(duration_action O5438 2)
		(parameters_typeO O5438 driver151)

		(index_action D9449 23561)
		(is_action D9449)
		(is_typeD D9449)
		(start_action D9449 "14/01/2017 23:50")
		(end_action D9449 "14/01/2017 23:51")
		(duration_action D9449 1)
		(parameters_typeD D9449 driver151)

		(index_action B8057 23562)
		(is_action B8057)
		(is_typeB B8057)
		(start_action B8057 "14/01/2017 23:51")
		(end_action B8057 "15/01/2017 08:53")
		(duration_action B8057 542)
		(parameters_typeB B8057 driver151)

		(index_action D9450 23563)
		(is_action D9450)
		(is_typeD D9450)
		(start_action D9450 "15/01/2017 08:53")
		(end_action D9450 "15/01/2017 09:00")
		(duration_action D9450 7)
		(parameters_typeD D9450 driver151)

		(index_action B8058 23564)
		(is_action B8058)
		(is_typeB B8058)
		(start_action B8058 "15/01/2017 09:00")
		(end_action B8058 "15/01/2017 09:05")
		(duration_action B8058 5)
		(parameters_typeB B8058 driver151)

		(index_action D9451 23565)
		(is_action D9451)
		(is_typeD D9451)
		(start_action D9451 "15/01/2017 09:05")
		(end_action D9451 "15/01/2017 09:09")
		(duration_action D9451 4)
		(parameters_typeD D9451 driver151)

		(index_action B8059 23566)
		(is_action B8059)
		(is_typeB B8059)
		(start_action B8059 "15/01/2017 09:09")
		(end_action B8059 "15/01/2017 18:10")
		(duration_action B8059 541)
		(parameters_typeB B8059 driver151)

		(index_action D9452 23567)
		(is_action D9452)
		(is_typeD D9452)
		(start_action D9452 "15/01/2017 18:10")
		(end_action D9452 "15/01/2017 18:17")
		(duration_action D9452 7)
		(parameters_typeD D9452 driver151)

		(index_action B8060 23568)
		(is_action B8060)
		(is_typeB B8060)
		(start_action B8060 "15/01/2017 18:17")
		(end_action B8060 "15/01/2017 18:44")
		(duration_action B8060 27)
		(parameters_typeB B8060 driver151)

		(index_action D9453 23569)
		(is_action D9453)
		(is_typeD D9453)
		(start_action D9453 "15/01/2017 18:44")
		(end_action D9453 "15/01/2017 18:45")
		(duration_action D9453 1)
		(parameters_typeD D9453 driver151)

		(index_action O5439 23570)
		(is_action O5439)
		(is_typeO O5439)
		(start_action O5439 "15/01/2017 18:45")
		(end_action O5439 "15/01/2017 18:52")
		(duration_action O5439 7)
		(parameters_typeO O5439 driver151)

		(index_action D9454 23571)
		(is_action D9454)
		(is_typeD D9454)
		(start_action D9454 "15/01/2017 18:52")
		(end_action D9454 "15/01/2017 22:57")
		(duration_action D9454 245)
		(parameters_typeD D9454 driver151)

		(index_action B8061 23572)
		(is_action B8061)
		(is_typeB B8061)
		(start_action B8061 "15/01/2017 22:57")
		(end_action B8061 "15/01/2017 23:43")
		(duration_action B8061 46)
		(parameters_typeB B8061 driver151)

		(index_action D9455 23573)
		(is_action D9455)
		(is_typeD D9455)
		(start_action D9455 "15/01/2017 23:43")
		(end_action D9455 "16/01/2017 01:45")
		(duration_action D9455 122)
		(parameters_typeD D9455 driver151)

	)
	(:tasks-goal
		:tasks (
			(WD driver151)
		)
	)
)