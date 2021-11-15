(define (problem prueba0) (:domain GantaBi)
	(:customization
		(= :time-format "%d/%m/%Y %H:%M")
		(= :time-horizon-relative 86400) ;; que son los minutos que tienen 2 meses
		(= :time-start "01/01/2017 00:00")
		(= :time-unit :minutes)
	)
	(:objects
		driver31 - Driver

		D2382 D2383 D2384 D2385 D2386 D2387 D2388 D2389 D2390 D2391 D2392 D2393 D2394 D2395 D2396 D2397 D2398 D2399 D2400 D2401 D2402 D2403 D2404 D2405 D2406 D2407 D2408 D2409 D2410 D2411 D2412 D2413 D2414 D2415 D2416 D2417 D2418 D2419 D2420 D2421 D2422 D2423 D2424 D2425 D2426 D2427 D2428 D2429 D2430 D2431 D2432 D2433 D2434 D2435 D2436 D2437 D2438 D2439 D2440 D2441 D2442 D2443 D2444 D2445 D2446 D2447
 - TaskInstanceSymbol
		O1399 O1400 O1401 O1402 O1403 O1404 O1405 O1406 O1407 O1408 O1409 O1410 O1411 O1412 O1413 O1414 O1415 O1416 O1417 O1418 O1419 O1420 O1421 O1422 O1423 O1424 O1425 O1426 O1427 O1428 O1429 O1430 O1431 O1432 O1433 O1434 O1435 O1436 O1437 O1438 O1439 O1440 O1441 O1442 O1443 O1444 O1445
 - TaskInstanceSymbol
		B1748 B1749 B1750 B1751 B1752 B1753 B1754 B1755 B1756 B1757 B1758 B1759 B1760 B1761 B1762 B1763 B1764 B1765 B1766 B1767 B1768 B1769 B1770 B1771 B1772 B1773 B1774 B1775 B1776 B1777 B1778 B1779 B1780 B1781 B1782 B1783 B1784 B1785 B1786 B1787 B1788 B1789 B1790 B1791 B1792 B1793 B1794 B1795
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

		(= (current_index_action) 5531)

		(= (last_dr) "09/01/2017 16:56")
		(= (last_wr) "09/01/2017 16:56")
		(= (actual-timestamp) "09/01/2017 16:56")

		; Events
		(index_action B1748 5531)
		(is_action B1748)
		(is_typeB B1748)
		(start_action B1748 "09/01/2017 16:56")
		(end_action B1748 "09/01/2017 17:07")
		(duration_action B1748 11)
		(parameters_typeB B1748 driver31)

		(index_action D2382 5532)
		(is_action D2382)
		(is_typeD D2382)
		(start_action D2382 "09/01/2017 17:07")
		(end_action D2382 "09/01/2017 17:10")
		(duration_action D2382 3)
		(parameters_typeD D2382 driver31)

		(index_action O1399 5533)
		(is_action O1399)
		(is_typeO O1399)
		(start_action O1399 "09/01/2017 17:10")
		(end_action O1399 "09/01/2017 17:20")
		(duration_action O1399 10)
		(parameters_typeO O1399 driver31)

		(index_action D2383 5534)
		(is_action D2383)
		(is_typeD D2383)
		(start_action D2383 "09/01/2017 17:20")
		(end_action D2383 "09/01/2017 17:32")
		(duration_action D2383 12)
		(parameters_typeD D2383 driver31)

		(index_action O1400 5535)
		(is_action O1400)
		(is_typeO O1400)
		(start_action O1400 "09/01/2017 17:32")
		(end_action O1400 "09/01/2017 17:37")
		(duration_action O1400 5)
		(parameters_typeO O1400 driver31)

		(index_action D2384 5536)
		(is_action D2384)
		(is_typeD D2384)
		(start_action D2384 "09/01/2017 17:37")
		(end_action D2384 "09/01/2017 17:38")
		(duration_action D2384 1)
		(parameters_typeD D2384 driver31)

		(index_action O1401 5537)
		(is_action O1401)
		(is_typeO O1401)
		(start_action O1401 "09/01/2017 17:38")
		(end_action O1401 "09/01/2017 17:49")
		(duration_action O1401 11)
		(parameters_typeO O1401 driver31)

		(index_action D2385 5538)
		(is_action D2385)
		(is_typeD D2385)
		(start_action D2385 "09/01/2017 17:49")
		(end_action D2385 "09/01/2017 17:50")
		(duration_action D2385 1)
		(parameters_typeD D2385 driver31)

		(index_action O1402 5539)
		(is_action O1402)
		(is_typeO O1402)
		(start_action O1402 "09/01/2017 17:50")
		(end_action O1402 "09/01/2017 18:06")
		(duration_action O1402 16)
		(parameters_typeO O1402 driver31)

		(index_action D2386 5540)
		(is_action D2386)
		(is_typeD D2386)
		(start_action D2386 "09/01/2017 18:06")
		(end_action D2386 "09/01/2017 18:07")
		(duration_action D2386 1)
		(parameters_typeD D2386 driver31)

		(index_action O1403 5541)
		(is_action O1403)
		(is_typeO O1403)
		(start_action O1403 "09/01/2017 18:07")
		(end_action O1403 "09/01/2017 18:17")
		(duration_action O1403 10)
		(parameters_typeO O1403 driver31)

		(index_action D2387 5542)
		(is_action D2387)
		(is_typeD D2387)
		(start_action D2387 "09/01/2017 18:17")
		(end_action D2387 "09/01/2017 18:18")
		(duration_action D2387 1)
		(parameters_typeD D2387 driver31)

		(index_action O1404 5543)
		(is_action O1404)
		(is_typeO O1404)
		(start_action O1404 "09/01/2017 18:18")
		(end_action O1404 "09/01/2017 18:55")
		(duration_action O1404 37)
		(parameters_typeO O1404 driver31)

		(index_action D2388 5544)
		(is_action D2388)
		(is_typeD D2388)
		(start_action D2388 "09/01/2017 18:55")
		(end_action D2388 "09/01/2017 19:00")
		(duration_action D2388 5)
		(parameters_typeD D2388 driver31)

		(index_action O1405 5545)
		(is_action O1405)
		(is_typeO O1405)
		(start_action O1405 "09/01/2017 19:00")
		(end_action O1405 "09/01/2017 19:03")
		(duration_action O1405 3)
		(parameters_typeO O1405 driver31)

		(index_action D2389 5546)
		(is_action D2389)
		(is_typeD D2389)
		(start_action D2389 "09/01/2017 19:03")
		(end_action D2389 "09/01/2017 19:04")
		(duration_action D2389 1)
		(parameters_typeD D2389 driver31)

		(index_action O1406 5547)
		(is_action O1406)
		(is_typeO O1406)
		(start_action O1406 "09/01/2017 19:04")
		(end_action O1406 "09/01/2017 19:06")
		(duration_action O1406 2)
		(parameters_typeO O1406 driver31)

		(index_action D2390 5548)
		(is_action D2390)
		(is_typeD D2390)
		(start_action D2390 "09/01/2017 19:06")
		(end_action D2390 "09/01/2017 19:10")
		(duration_action D2390 4)
		(parameters_typeD D2390 driver31)

		(index_action O1407 5549)
		(is_action O1407)
		(is_typeO O1407)
		(start_action O1407 "09/01/2017 19:10")
		(end_action O1407 "09/01/2017 19:13")
		(duration_action O1407 3)
		(parameters_typeO O1407 driver31)

		(index_action D2391 5550)
		(is_action D2391)
		(is_typeD D2391)
		(start_action D2391 "09/01/2017 19:13")
		(end_action D2391 "09/01/2017 20:26")
		(duration_action D2391 73)
		(parameters_typeD D2391 driver31)

		(index_action B1749 5551)
		(is_action B1749)
		(is_typeB B1749)
		(start_action B1749 "09/01/2017 20:26")
		(end_action B1749 "10/01/2017 05:33")
		(duration_action B1749 547)
		(parameters_typeB B1749 driver31)

		(index_action D2392 5552)
		(is_action D2392)
		(is_typeD D2392)
		(start_action D2392 "10/01/2017 05:33")
		(end_action D2392 "10/01/2017 05:34")
		(duration_action D2392 1)
		(parameters_typeD D2392 driver31)

		(index_action O1408 5553)
		(is_action O1408)
		(is_typeO O1408)
		(start_action O1408 "10/01/2017 05:34")
		(end_action O1408 "10/01/2017 05:38")
		(duration_action O1408 4)
		(parameters_typeO O1408 driver31)

		(index_action D2393 5554)
		(is_action D2393)
		(is_typeD D2393)
		(start_action D2393 "10/01/2017 05:38")
		(end_action D2393 "10/01/2017 07:49")
		(duration_action D2393 131)
		(parameters_typeD D2393 driver31)

		(index_action O1409 5555)
		(is_action O1409)
		(is_typeO O1409)
		(start_action O1409 "10/01/2017 07:49")
		(end_action O1409 "10/01/2017 07:53")
		(duration_action O1409 4)
		(parameters_typeO O1409 driver31)

		(index_action D2394 5556)
		(is_action D2394)
		(is_typeD D2394)
		(start_action D2394 "10/01/2017 07:53")
		(end_action D2394 "10/01/2017 07:54")
		(duration_action D2394 1)
		(parameters_typeD D2394 driver31)

		(index_action B1750 5557)
		(is_action B1750)
		(is_typeB B1750)
		(start_action B1750 "10/01/2017 07:54")
		(end_action B1750 "10/01/2017 08:04")
		(duration_action B1750 10)
		(parameters_typeB B1750 driver31)

		(index_action D2395 5558)
		(is_action D2395)
		(is_typeD D2395)
		(start_action D2395 "10/01/2017 08:04")
		(end_action D2395 "10/01/2017 08:10")
		(duration_action D2395 6)
		(parameters_typeD D2395 driver31)

		(index_action B1751 5559)
		(is_action B1751)
		(is_typeB B1751)
		(start_action B1751 "10/01/2017 08:10")
		(end_action B1751 "10/01/2017 09:49")
		(duration_action B1751 99)
		(parameters_typeB B1751 driver31)

		(index_action D2396 5560)
		(is_action D2396)
		(is_typeD D2396)
		(start_action D2396 "10/01/2017 09:49")
		(end_action D2396 "10/01/2017 09:52")
		(duration_action D2396 3)
		(parameters_typeD D2396 driver31)

		(index_action O1410 5561)
		(is_action O1410)
		(is_typeO O1410)
		(start_action O1410 "10/01/2017 09:52")
		(end_action O1410 "10/01/2017 09:54")
		(duration_action O1410 2)
		(parameters_typeO O1410 driver31)

		(index_action D2397 5562)
		(is_action D2397)
		(is_typeD D2397)
		(start_action D2397 "10/01/2017 09:54")
		(end_action D2397 "10/01/2017 09:59")
		(duration_action D2397 5)
		(parameters_typeD D2397 driver31)

		(index_action B1752 5563)
		(is_action B1752)
		(is_typeB B1752)
		(start_action B1752 "10/01/2017 09:59")
		(end_action B1752 "10/01/2017 12:08")
		(duration_action B1752 129)
		(parameters_typeB B1752 driver31)

		(index_action D2398 5564)
		(is_action D2398)
		(is_typeD D2398)
		(start_action D2398 "10/01/2017 12:08")
		(end_action D2398 "10/01/2017 13:40")
		(duration_action D2398 92)
		(parameters_typeD D2398 driver31)

		(index_action B1753 5565)
		(is_action B1753)
		(is_typeB B1753)
		(start_action B1753 "10/01/2017 13:40")
		(end_action B1753 "10/01/2017 14:29")
		(duration_action B1753 49)
		(parameters_typeB B1753 driver31)

		(index_action D2399 5566)
		(is_action D2399)
		(is_typeD D2399)
		(start_action D2399 "10/01/2017 14:29")
		(end_action D2399 "10/01/2017 15:49")
		(duration_action D2399 80)
		(parameters_typeD D2399 driver31)

		(index_action O1411 5567)
		(is_action O1411)
		(is_typeO O1411)
		(start_action O1411 "10/01/2017 15:49")
		(end_action O1411 "10/01/2017 15:53")
		(duration_action O1411 4)
		(parameters_typeO O1411 driver31)

		(index_action B1754 5568)
		(is_action B1754)
		(is_typeB B1754)
		(start_action B1754 "10/01/2017 15:53")
		(end_action B1754 "10/01/2017 16:10")
		(duration_action B1754 17)
		(parameters_typeB B1754 driver31)

		(index_action D2400 5569)
		(is_action D2400)
		(is_typeD D2400)
		(start_action D2400 "10/01/2017 16:10")
		(end_action D2400 "10/01/2017 16:11")
		(duration_action D2400 1)
		(parameters_typeD D2400 driver31)

		(index_action B1755 5570)
		(is_action B1755)
		(is_typeB B1755)
		(start_action B1755 "10/01/2017 16:11")
		(end_action B1755 "10/01/2017 16:16")
		(duration_action B1755 5)
		(parameters_typeB B1755 driver31)

		(index_action D2401 5571)
		(is_action D2401)
		(is_typeD D2401)
		(start_action D2401 "10/01/2017 16:16")
		(end_action D2401 "10/01/2017 16:17")
		(duration_action D2401 1)
		(parameters_typeD D2401 driver31)

		(index_action O1412 5572)
		(is_action O1412)
		(is_typeO O1412)
		(start_action O1412 "10/01/2017 16:17")
		(end_action O1412 "10/01/2017 16:20")
		(duration_action O1412 3)
		(parameters_typeO O1412 driver31)

		(index_action B1756 5573)
		(is_action B1756)
		(is_typeB B1756)
		(start_action B1756 "10/01/2017 16:20")
		(end_action B1756 "10/01/2017 16:22")
		(duration_action B1756 2)
		(parameters_typeB B1756 driver31)

		(index_action D2402 5574)
		(is_action D2402)
		(is_typeD D2402)
		(start_action D2402 "10/01/2017 16:22")
		(end_action D2402 "10/01/2017 16:23")
		(duration_action D2402 1)
		(parameters_typeD D2402 driver31)

		(index_action B1757 5575)
		(is_action B1757)
		(is_typeB B1757)
		(start_action B1757 "10/01/2017 16:23")
		(end_action B1757 "10/01/2017 16:25")
		(duration_action B1757 2)
		(parameters_typeB B1757 driver31)

		(index_action O1413 5576)
		(is_action O1413)
		(is_typeO O1413)
		(start_action O1413 "10/01/2017 16:25")
		(end_action O1413 "10/01/2017 16:33")
		(duration_action O1413 8)
		(parameters_typeO O1413 driver31)

		(index_action B1758 5577)
		(is_action B1758)
		(is_typeB B1758)
		(start_action B1758 "10/01/2017 16:33")
		(end_action B1758 "10/01/2017 16:34")
		(duration_action B1758 1)
		(parameters_typeB B1758 driver31)

		(index_action O1414 5578)
		(is_action O1414)
		(is_typeO O1414)
		(start_action O1414 "10/01/2017 16:34")
		(end_action O1414 "10/01/2017 16:38")
		(duration_action O1414 4)
		(parameters_typeO O1414 driver31)

		(index_action D2403 5579)
		(is_action D2403)
		(is_typeD D2403)
		(start_action D2403 "10/01/2017 16:38")
		(end_action D2403 "10/01/2017 16:40")
		(duration_action D2403 2)
		(parameters_typeD D2403 driver31)

		(index_action O1415 5580)
		(is_action O1415)
		(is_typeO O1415)
		(start_action O1415 "10/01/2017 16:40")
		(end_action O1415 "10/01/2017 16:43")
		(duration_action O1415 3)
		(parameters_typeO O1415 driver31)

		(index_action D2404 5581)
		(is_action D2404)
		(is_typeD D2404)
		(start_action D2404 "10/01/2017 16:43")
		(end_action D2404 "10/01/2017 16:46")
		(duration_action D2404 3)
		(parameters_typeD D2404 driver31)

		(index_action O1416 5582)
		(is_action O1416)
		(is_typeO O1416)
		(start_action O1416 "10/01/2017 16:46")
		(end_action O1416 "10/01/2017 16:47")
		(duration_action O1416 1)
		(parameters_typeO O1416 driver31)

		(index_action B1759 5583)
		(is_action B1759)
		(is_typeB B1759)
		(start_action B1759 "10/01/2017 16:47")
		(end_action B1759 "10/01/2017 16:48")
		(duration_action B1759 1)
		(parameters_typeB B1759 driver31)

		(index_action D2405 5584)
		(is_action D2405)
		(is_typeD D2405)
		(start_action D2405 "10/01/2017 16:48")
		(end_action D2405 "10/01/2017 16:50")
		(duration_action D2405 2)
		(parameters_typeD D2405 driver31)

		(index_action B1760 5585)
		(is_action B1760)
		(is_typeB B1760)
		(start_action B1760 "10/01/2017 16:50")
		(end_action B1760 "10/01/2017 17:36")
		(duration_action B1760 46)
		(parameters_typeB B1760 driver31)

		(index_action D2406 5586)
		(is_action D2406)
		(is_typeD D2406)
		(start_action D2406 "10/01/2017 17:36")
		(end_action D2406 "10/01/2017 17:39")
		(duration_action D2406 3)
		(parameters_typeD D2406 driver31)

		(index_action B1761 5587)
		(is_action B1761)
		(is_typeB B1761)
		(start_action B1761 "10/01/2017 17:39")
		(end_action B1761 "10/01/2017 18:30")
		(duration_action B1761 51)
		(parameters_typeB B1761 driver31)

		(index_action D2407 5588)
		(is_action D2407)
		(is_typeD D2407)
		(start_action D2407 "10/01/2017 18:30")
		(end_action D2407 "10/01/2017 19:34")
		(duration_action D2407 64)
		(parameters_typeD D2407 driver31)

		(index_action B1762 5589)
		(is_action B1762)
		(is_typeB B1762)
		(start_action B1762 "10/01/2017 19:34")
		(end_action B1762 "11/01/2017 06:50")
		(duration_action B1762 676)
		(parameters_typeB B1762 driver31)

		(index_action D2408 5590)
		(is_action D2408)
		(is_typeD D2408)
		(start_action D2408 "11/01/2017 06:50")
		(end_action D2408 "11/01/2017 09:05")
		(duration_action D2408 135)
		(parameters_typeD D2408 driver31)

		(index_action B1763 5591)
		(is_action B1763)
		(is_typeB B1763)
		(start_action B1763 "11/01/2017 09:05")
		(end_action B1763 "11/01/2017 09:36")
		(duration_action B1763 31)
		(parameters_typeB B1763 driver31)

		(index_action O1417 5592)
		(is_action O1417)
		(is_typeO O1417)
		(start_action O1417 "11/01/2017 09:36")
		(end_action O1417 "11/01/2017 09:38")
		(duration_action O1417 2)
		(parameters_typeO O1417 driver31)

		(index_action D2409 5593)
		(is_action D2409)
		(is_typeD D2409)
		(start_action D2409 "11/01/2017 09:38")
		(end_action D2409 "11/01/2017 09:39")
		(duration_action D2409 1)
		(parameters_typeD D2409 driver31)

		(index_action O1418 5594)
		(is_action O1418)
		(is_typeO O1418)
		(start_action O1418 "11/01/2017 09:39")
		(end_action O1418 "11/01/2017 09:40")
		(duration_action O1418 1)
		(parameters_typeO O1418 driver31)

		(index_action B1764 5595)
		(is_action B1764)
		(is_typeB B1764)
		(start_action B1764 "11/01/2017 09:40")
		(end_action B1764 "11/01/2017 11:10")
		(duration_action B1764 90)
		(parameters_typeB B1764 driver31)

		(index_action O1419 5596)
		(is_action O1419)
		(is_typeO O1419)
		(start_action O1419 "11/01/2017 11:10")
		(end_action O1419 "11/01/2017 11:12")
		(duration_action O1419 2)
		(parameters_typeO O1419 driver31)

		(index_action D2410 5597)
		(is_action D2410)
		(is_typeD D2410)
		(start_action D2410 "11/01/2017 11:12")
		(end_action D2410 "11/01/2017 13:40")
		(duration_action D2410 148)
		(parameters_typeD D2410 driver31)

		(index_action O1420 5598)
		(is_action O1420)
		(is_typeO O1420)
		(start_action O1420 "11/01/2017 13:40")
		(end_action O1420 "11/01/2017 13:49")
		(duration_action O1420 9)
		(parameters_typeO O1420 driver31)

		(index_action D2411 5599)
		(is_action D2411)
		(is_typeD D2411)
		(start_action D2411 "11/01/2017 13:49")
		(end_action D2411 "11/01/2017 14:06")
		(duration_action D2411 17)
		(parameters_typeD D2411 driver31)

		(index_action B1765 5600)
		(is_action B1765)
		(is_typeB B1765)
		(start_action B1765 "11/01/2017 14:06")
		(end_action B1765 "11/01/2017 14:42")
		(duration_action B1765 36)
		(parameters_typeB B1765 driver31)

		(index_action O1421 5601)
		(is_action O1421)
		(is_typeO O1421)
		(start_action O1421 "11/01/2017 14:42")
		(end_action O1421 "11/01/2017 14:48")
		(duration_action O1421 6)
		(parameters_typeO O1421 driver31)

		(index_action D2412 5602)
		(is_action D2412)
		(is_typeD D2412)
		(start_action D2412 "11/01/2017 14:48")
		(end_action D2412 "11/01/2017 14:51")
		(duration_action D2412 3)
		(parameters_typeD D2412 driver31)

		(index_action O1422 5603)
		(is_action O1422)
		(is_typeO O1422)
		(start_action O1422 "11/01/2017 14:51")
		(end_action O1422 "11/01/2017 15:02")
		(duration_action O1422 11)
		(parameters_typeO O1422 driver31)

		(index_action D2413 5604)
		(is_action D2413)
		(is_typeD D2413)
		(start_action D2413 "11/01/2017 15:02")
		(end_action D2413 "11/01/2017 15:03")
		(duration_action D2413 1)
		(parameters_typeD D2413 driver31)

		(index_action O1423 5605)
		(is_action O1423)
		(is_typeO O1423)
		(start_action O1423 "11/01/2017 15:03")
		(end_action O1423 "11/01/2017 15:06")
		(duration_action O1423 3)
		(parameters_typeO O1423 driver31)

		(index_action D2414 5606)
		(is_action D2414)
		(is_typeD D2414)
		(start_action D2414 "11/01/2017 15:06")
		(end_action D2414 "11/01/2017 15:22")
		(duration_action D2414 16)
		(parameters_typeD D2414 driver31)

		(index_action B1766 5607)
		(is_action B1766)
		(is_typeB B1766)
		(start_action B1766 "11/01/2017 15:22")
		(end_action B1766 "11/01/2017 18:09")
		(duration_action B1766 167)
		(parameters_typeB B1766 driver31)

		(index_action D2415 5608)
		(is_action D2415)
		(is_typeD D2415)
		(start_action D2415 "12/01/2017 11:49")
		(end_action D2415 "12/01/2017 12:25")
		(duration_action D2415 36)
		(parameters_typeD D2415 driver31)

		(index_action O1424 5609)
		(is_action O1424)
		(is_typeO O1424)
		(start_action O1424 "12/01/2017 12:25")
		(end_action O1424 "12/01/2017 12:27")
		(duration_action O1424 2)
		(parameters_typeO O1424 driver31)

		(index_action D2416 5610)
		(is_action D2416)
		(is_typeD D2416)
		(start_action D2416 "12/01/2017 12:27")
		(end_action D2416 "12/01/2017 13:42")
		(duration_action D2416 75)
		(parameters_typeD D2416 driver31)

		(index_action O1425 5611)
		(is_action O1425)
		(is_typeO O1425)
		(start_action O1425 "12/01/2017 13:42")
		(end_action O1425 "12/01/2017 13:44")
		(duration_action O1425 2)
		(parameters_typeO O1425 driver31)

		(index_action B1767 5612)
		(is_action B1767)
		(is_typeB B1767)
		(start_action B1767 "12/01/2017 13:44")
		(end_action B1767 "12/01/2017 13:45")
		(duration_action B1767 1)
		(parameters_typeB B1767 driver31)

		(index_action D2417 5613)
		(is_action D2417)
		(is_typeD D2417)
		(start_action D2417 "12/01/2017 13:45")
		(end_action D2417 "12/01/2017 13:46")
		(duration_action D2417 1)
		(parameters_typeD D2417 driver31)

		(index_action B1768 5614)
		(is_action B1768)
		(is_typeB B1768)
		(start_action B1768 "12/01/2017 13:46")
		(end_action B1768 "12/01/2017 13:50")
		(duration_action B1768 4)
		(parameters_typeB B1768 driver31)

		(index_action O1426 5615)
		(is_action O1426)
		(is_typeO O1426)
		(start_action O1426 "12/01/2017 13:50")
		(end_action O1426 "12/01/2017 14:00")
		(duration_action O1426 10)
		(parameters_typeO O1426 driver31)

		(index_action D2418 5616)
		(is_action D2418)
		(is_typeD D2418)
		(start_action D2418 "12/01/2017 14:00")
		(end_action D2418 "12/01/2017 14:04")
		(duration_action D2418 4)
		(parameters_typeD D2418 driver31)

		(index_action B1769 5617)
		(is_action B1769)
		(is_typeB B1769)
		(start_action B1769 "12/01/2017 14:04")
		(end_action B1769 "12/01/2017 14:06")
		(duration_action B1769 2)
		(parameters_typeB B1769 driver31)

		(index_action O1427 5618)
		(is_action O1427)
		(is_typeO O1427)
		(start_action O1427 "12/01/2017 14:06")
		(end_action O1427 "12/01/2017 14:10")
		(duration_action O1427 4)
		(parameters_typeO O1427 driver31)

		(index_action D2419 5619)
		(is_action D2419)
		(is_typeD D2419)
		(start_action D2419 "12/01/2017 14:10")
		(end_action D2419 "12/01/2017 14:11")
		(duration_action D2419 1)
		(parameters_typeD D2419 driver31)

		(index_action B1770 5620)
		(is_action B1770)
		(is_typeB B1770)
		(start_action B1770 "12/01/2017 14:11")
		(end_action B1770 "12/01/2017 14:26")
		(duration_action B1770 15)
		(parameters_typeB B1770 driver31)

		(index_action D2420 5621)
		(is_action D2420)
		(is_typeD D2420)
		(start_action D2420 "12/01/2017 14:26")
		(end_action D2420 "12/01/2017 14:27")
		(duration_action D2420 1)
		(parameters_typeD D2420 driver31)

		(index_action B1771 5622)
		(is_action B1771)
		(is_typeB B1771)
		(start_action B1771 "12/01/2017 14:27")
		(end_action B1771 "12/01/2017 14:41")
		(duration_action B1771 14)
		(parameters_typeB B1771 driver31)

		(index_action D2421 5623)
		(is_action D2421)
		(is_typeD D2421)
		(start_action D2421 "12/01/2017 14:41")
		(end_action D2421 "12/01/2017 14:42")
		(duration_action D2421 1)
		(parameters_typeD D2421 driver31)

		(index_action B1772 5624)
		(is_action B1772)
		(is_typeB B1772)
		(start_action B1772 "12/01/2017 14:42")
		(end_action B1772 "12/01/2017 14:58")
		(duration_action B1772 16)
		(parameters_typeB B1772 driver31)

		(index_action D2422 5625)
		(is_action D2422)
		(is_typeD D2422)
		(start_action D2422 "12/01/2017 14:58")
		(end_action D2422 "12/01/2017 14:59")
		(duration_action D2422 1)
		(parameters_typeD D2422 driver31)

		(index_action B1773 5626)
		(is_action B1773)
		(is_typeB B1773)
		(start_action B1773 "12/01/2017 14:59")
		(end_action B1773 "12/01/2017 15:14")
		(duration_action B1773 15)
		(parameters_typeB B1773 driver31)

		(index_action D2423 5627)
		(is_action D2423)
		(is_typeD D2423)
		(start_action D2423 "12/01/2017 15:14")
		(end_action D2423 "12/01/2017 15:16")
		(duration_action D2423 2)
		(parameters_typeD D2423 driver31)

		(index_action O1428 5628)
		(is_action O1428)
		(is_typeO O1428)
		(start_action O1428 "12/01/2017 15:16")
		(end_action O1428 "12/01/2017 15:18")
		(duration_action O1428 2)
		(parameters_typeO O1428 driver31)

		(index_action B1774 5629)
		(is_action B1774)
		(is_typeB B1774)
		(start_action B1774 "12/01/2017 15:18")
		(end_action B1774 "12/01/2017 15:29")
		(duration_action B1774 11)
		(parameters_typeB B1774 driver31)

		(index_action O1429 5630)
		(is_action O1429)
		(is_typeO O1429)
		(start_action O1429 "12/01/2017 15:29")
		(end_action O1429 "12/01/2017 15:32")
		(duration_action O1429 3)
		(parameters_typeO O1429 driver31)

		(index_action B1775 5631)
		(is_action B1775)
		(is_typeB B1775)
		(start_action B1775 "12/01/2017 15:32")
		(end_action B1775 "12/01/2017 16:26")
		(duration_action B1775 54)
		(parameters_typeB B1775 driver31)

		(index_action O1430 5632)
		(is_action O1430)
		(is_typeO O1430)
		(start_action O1430 "12/01/2017 16:26")
		(end_action O1430 "12/01/2017 16:39")
		(duration_action O1430 13)
		(parameters_typeO O1430 driver31)

		(index_action B1776 5633)
		(is_action B1776)
		(is_typeB B1776)
		(start_action B1776 "12/01/2017 16:39")
		(end_action B1776 "12/01/2017 17:00")
		(duration_action B1776 21)
		(parameters_typeB B1776 driver31)

		(index_action O1431 5634)
		(is_action O1431)
		(is_typeO O1431)
		(start_action O1431 "12/01/2017 17:00")
		(end_action O1431 "12/01/2017 17:06")
		(duration_action O1431 6)
		(parameters_typeO O1431 driver31)

		(index_action D2424 5635)
		(is_action D2424)
		(is_typeD D2424)
		(start_action D2424 "12/01/2017 17:06")
		(end_action D2424 "12/01/2017 17:07")
		(duration_action D2424 1)
		(parameters_typeD D2424 driver31)

		(index_action O1432 5636)
		(is_action O1432)
		(is_typeO O1432)
		(start_action O1432 "12/01/2017 17:07")
		(end_action O1432 "12/01/2017 17:09")
		(duration_action O1432 2)
		(parameters_typeO O1432 driver31)

		(index_action D2425 5637)
		(is_action D2425)
		(is_typeD D2425)
		(start_action D2425 "12/01/2017 17:09")
		(end_action D2425 "12/01/2017 17:22")
		(duration_action D2425 13)
		(parameters_typeD D2425 driver31)

		(index_action O1433 5638)
		(is_action O1433)
		(is_typeO O1433)
		(start_action O1433 "12/01/2017 17:22")
		(end_action O1433 "12/01/2017 17:24")
		(duration_action O1433 2)
		(parameters_typeO O1433 driver31)

		(index_action B1777 5639)
		(is_action B1777)
		(is_typeB B1777)
		(start_action B1777 "12/01/2017 17:24")
		(end_action B1777 "12/01/2017 17:41")
		(duration_action B1777 17)
		(parameters_typeB B1777 driver31)

		(index_action D2426 5640)
		(is_action D2426)
		(is_typeD D2426)
		(start_action D2426 "12/01/2017 17:41")
		(end_action D2426 "12/01/2017 17:42")
		(duration_action D2426 1)
		(parameters_typeD D2426 driver31)

		(index_action B1778 5641)
		(is_action B1778)
		(is_typeB B1778)
		(start_action B1778 "12/01/2017 17:42")
		(end_action B1778 "12/01/2017 18:00")
		(duration_action B1778 18)
		(parameters_typeB B1778 driver31)

		(index_action D2427 5642)
		(is_action D2427)
		(is_typeD D2427)
		(start_action D2427 "12/01/2017 18:00")
		(end_action D2427 "12/01/2017 18:01")
		(duration_action D2427 1)
		(parameters_typeD D2427 driver31)

		(index_action B1779 5643)
		(is_action B1779)
		(is_typeB B1779)
		(start_action B1779 "12/01/2017 18:01")
		(end_action B1779 "12/01/2017 18:32")
		(duration_action B1779 31)
		(parameters_typeB B1779 driver31)

		(index_action D2428 5644)
		(is_action D2428)
		(is_typeD D2428)
		(start_action D2428 "12/01/2017 18:32")
		(end_action D2428 "12/01/2017 18:33")
		(duration_action D2428 1)
		(parameters_typeD D2428 driver31)

		(index_action B1780 5645)
		(is_action B1780)
		(is_typeB B1780)
		(start_action B1780 "12/01/2017 18:33")
		(end_action B1780 "12/01/2017 18:44")
		(duration_action B1780 11)
		(parameters_typeB B1780 driver31)

		(index_action D2429 5646)
		(is_action D2429)
		(is_typeD D2429)
		(start_action D2429 "12/01/2017 18:44")
		(end_action D2429 "12/01/2017 18:46")
		(duration_action D2429 2)
		(parameters_typeD D2429 driver31)

		(index_action B1781 5647)
		(is_action B1781)
		(is_typeB B1781)
		(start_action B1781 "12/01/2017 18:46")
		(end_action B1781 "12/01/2017 19:00")
		(duration_action B1781 14)
		(parameters_typeB B1781 driver31)

		(index_action D2430 5648)
		(is_action D2430)
		(is_typeD D2430)
		(start_action D2430 "12/01/2017 19:00")
		(end_action D2430 "12/01/2017 19:03")
		(duration_action D2430 3)
		(parameters_typeD D2430 driver31)

		(index_action B1782 5649)
		(is_action B1782)
		(is_typeB B1782)
		(start_action B1782 "12/01/2017 19:03")
		(end_action B1782 "12/01/2017 19:06")
		(duration_action B1782 3)
		(parameters_typeB B1782 driver31)

		(index_action O1434 5650)
		(is_action O1434)
		(is_typeO O1434)
		(start_action O1434 "12/01/2017 19:06")
		(end_action O1434 "12/01/2017 19:16")
		(duration_action O1434 10)
		(parameters_typeO O1434 driver31)

		(index_action B1783 5651)
		(is_action B1783)
		(is_typeB B1783)
		(start_action B1783 "12/01/2017 19:16")
		(end_action B1783 "12/01/2017 19:21")
		(duration_action B1783 5)
		(parameters_typeB B1783 driver31)

		(index_action O1435 5652)
		(is_action O1435)
		(is_typeO O1435)
		(start_action O1435 "12/01/2017 19:21")
		(end_action O1435 "12/01/2017 19:23")
		(duration_action O1435 2)
		(parameters_typeO O1435 driver31)

		(index_action D2431 5653)
		(is_action D2431)
		(is_typeD D2431)
		(start_action D2431 "12/01/2017 19:23")
		(end_action D2431 "12/01/2017 19:24")
		(duration_action D2431 1)
		(parameters_typeD D2431 driver31)

		(index_action O1436 5654)
		(is_action O1436)
		(is_typeO O1436)
		(start_action O1436 "12/01/2017 19:24")
		(end_action O1436 "12/01/2017 19:29")
		(duration_action O1436 5)
		(parameters_typeO O1436 driver31)

		(index_action D2432 5655)
		(is_action D2432)
		(is_typeD D2432)
		(start_action D2432 "12/01/2017 19:29")
		(end_action D2432 "12/01/2017 19:31")
		(duration_action D2432 2)
		(parameters_typeD D2432 driver31)

		(index_action O1437 5656)
		(is_action O1437)
		(is_typeO O1437)
		(start_action O1437 "12/01/2017 19:31")
		(end_action O1437 "12/01/2017 19:33")
		(duration_action O1437 2)
		(parameters_typeO O1437 driver31)

		(index_action D2433 5657)
		(is_action D2433)
		(is_typeD D2433)
		(start_action D2433 "12/01/2017 19:33")
		(end_action D2433 "12/01/2017 19:48")
		(duration_action D2433 15)
		(parameters_typeD D2433 driver31)

		(index_action O1438 5658)
		(is_action O1438)
		(is_typeO O1438)
		(start_action O1438 "12/01/2017 19:48")
		(end_action O1438 "12/01/2017 19:58")
		(duration_action O1438 10)
		(parameters_typeO O1438 driver31)

		(index_action D2434 5659)
		(is_action D2434)
		(is_typeD D2434)
		(start_action D2434 "12/01/2017 19:58")
		(end_action D2434 "12/01/2017 19:59")
		(duration_action D2434 1)
		(parameters_typeD D2434 driver31)

		(index_action B1784 5660)
		(is_action B1784)
		(is_typeB B1784)
		(start_action B1784 "12/01/2017 20:03")
		(end_action B1784 "12/01/2017 20:05")
		(duration_action B1784 2)
		(parameters_typeB B1784 driver31)

		(index_action D2435 5661)
		(is_action D2435)
		(is_typeD D2435)
		(start_action D2435 "12/01/2017 20:05")
		(end_action D2435 "12/01/2017 22:44")
		(duration_action D2435 159)
		(parameters_typeD D2435 driver31)

		(index_action B1785 5662)
		(is_action B1785)
		(is_typeB B1785)
		(start_action B1785 "12/01/2017 22:44")
		(end_action B1785 "13/01/2017 07:47")
		(duration_action B1785 543)
		(parameters_typeB B1785 driver31)

		(index_action D2436 5663)
		(is_action D2436)
		(is_typeD D2436)
		(start_action D2436 "13/01/2017 07:47")
		(end_action D2436 "13/01/2017 08:50")
		(duration_action D2436 63)
		(parameters_typeD D2436 driver31)

		(index_action B1786 5664)
		(is_action B1786)
		(is_typeB B1786)
		(start_action B1786 "13/01/2017 08:50")
		(end_action B1786 "13/01/2017 08:52")
		(duration_action B1786 2)
		(parameters_typeB B1786 driver31)

		(index_action D2437 5665)
		(is_action D2437)
		(is_typeD D2437)
		(start_action D2437 "13/01/2017 08:52")
		(end_action D2437 "13/01/2017 08:53")
		(duration_action D2437 1)
		(parameters_typeD D2437 driver31)

		(index_action B1787 5666)
		(is_action B1787)
		(is_typeB B1787)
		(start_action B1787 "13/01/2017 08:53")
		(end_action B1787 "13/01/2017 09:30")
		(duration_action B1787 37)
		(parameters_typeB B1787 driver31)

		(index_action D2438 5667)
		(is_action D2438)
		(is_typeD D2438)
		(start_action D2438 "13/01/2017 09:30")
		(end_action D2438 "13/01/2017 09:32")
		(duration_action D2438 2)
		(parameters_typeD D2438 driver31)

		(index_action B1788 5668)
		(is_action B1788)
		(is_typeB B1788)
		(start_action B1788 "13/01/2017 09:32")
		(end_action B1788 "13/01/2017 10:25")
		(duration_action B1788 53)
		(parameters_typeB B1788 driver31)

		(index_action O1439 5669)
		(is_action O1439)
		(is_typeO O1439)
		(start_action O1439 "13/01/2017 10:25")
		(end_action O1439 "13/01/2017 10:27")
		(duration_action O1439 2)
		(parameters_typeO O1439 driver31)

		(index_action D2439 5670)
		(is_action D2439)
		(is_typeD D2439)
		(start_action D2439 "13/01/2017 10:27")
		(end_action D2439 "13/01/2017 13:40")
		(duration_action D2439 193)
		(parameters_typeD D2439 driver31)

		(index_action O1440 5671)
		(is_action O1440)
		(is_typeO O1440)
		(start_action O1440 "13/01/2017 13:40")
		(end_action O1440 "13/01/2017 13:50")
		(duration_action O1440 10)
		(parameters_typeO O1440 driver31)

		(index_action B1789 5672)
		(is_action B1789)
		(is_typeB B1789)
		(start_action B1789 "13/01/2017 13:50")
		(end_action B1789 "13/01/2017 13:59")
		(duration_action B1789 9)
		(parameters_typeB B1789 driver31)

		(index_action D2440 5673)
		(is_action D2440)
		(is_typeD D2440)
		(start_action D2440 "13/01/2017 13:59")
		(end_action D2440 "13/01/2017 14:00")
		(duration_action D2440 1)
		(parameters_typeD D2440 driver31)

		(index_action O1441 5674)
		(is_action O1441)
		(is_typeO O1441)
		(start_action O1441 "13/01/2017 14:00")
		(end_action O1441 "13/01/2017 14:02")
		(duration_action O1441 2)
		(parameters_typeO O1441 driver31)

		(index_action B1790 5675)
		(is_action B1790)
		(is_typeB B1790)
		(start_action B1790 "13/01/2017 14:02")
		(end_action B1790 "13/01/2017 14:17")
		(duration_action B1790 15)
		(parameters_typeB B1790 driver31)

		(index_action D2441 5676)
		(is_action D2441)
		(is_typeD D2441)
		(start_action D2441 "13/01/2017 14:17")
		(end_action D2441 "13/01/2017 14:35")
		(duration_action D2441 18)
		(parameters_typeD D2441 driver31)

		(index_action B1791 5677)
		(is_action B1791)
		(is_typeB B1791)
		(start_action B1791 "13/01/2017 14:35")
		(end_action B1791 "13/01/2017 14:40")
		(duration_action B1791 5)
		(parameters_typeB B1791 driver31)

		(index_action D2442 5678)
		(is_action D2442)
		(is_typeD D2442)
		(start_action D2442 "13/01/2017 14:40")
		(end_action D2442 "13/01/2017 14:41")
		(duration_action D2442 1)
		(parameters_typeD D2442 driver31)

		(index_action O1442 5679)
		(is_action O1442)
		(is_typeO O1442)
		(start_action O1442 "13/01/2017 14:41")
		(end_action O1442 "13/01/2017 14:45")
		(duration_action O1442 4)
		(parameters_typeO O1442 driver31)

		(index_action B1792 5680)
		(is_action B1792)
		(is_typeB B1792)
		(start_action B1792 "13/01/2017 14:45")
		(end_action B1792 "13/01/2017 14:46")
		(duration_action B1792 1)
		(parameters_typeB B1792 driver31)

		(index_action D2443 5681)
		(is_action D2443)
		(is_typeD D2443)
		(start_action D2443 "13/01/2017 14:46")
		(end_action D2443 "13/01/2017 14:47")
		(duration_action D2443 1)
		(parameters_typeD D2443 driver31)

		(index_action O1443 5682)
		(is_action O1443)
		(is_typeO O1443)
		(start_action O1443 "13/01/2017 14:47")
		(end_action O1443 "13/01/2017 14:57")
		(duration_action O1443 10)
		(parameters_typeO O1443 driver31)

		(index_action D2444 5683)
		(is_action D2444)
		(is_typeD D2444)
		(start_action D2444 "13/01/2017 14:57")
		(end_action D2444 "13/01/2017 15:02")
		(duration_action D2444 5)
		(parameters_typeD D2444 driver31)

		(index_action O1444 5684)
		(is_action O1444)
		(is_typeO O1444)
		(start_action O1444 "13/01/2017 15:02")
		(end_action O1444 "13/01/2017 15:04")
		(duration_action O1444 2)
		(parameters_typeO O1444 driver31)

		(index_action B1793 5685)
		(is_action B1793)
		(is_typeB B1793)
		(start_action B1793 "13/01/2017 15:04")
		(end_action B1793 "13/01/2017 15:05")
		(duration_action B1793 1)
		(parameters_typeB B1793 driver31)

		(index_action D2445 5686)
		(is_action D2445)
		(is_typeD D2445)
		(start_action D2445 "13/01/2017 15:05")
		(end_action D2445 "13/01/2017 15:07")
		(duration_action D2445 2)
		(parameters_typeD D2445 driver31)

		(index_action O1445 5687)
		(is_action O1445)
		(is_typeO O1445)
		(start_action O1445 "13/01/2017 15:07")
		(end_action O1445 "13/01/2017 15:10")
		(duration_action O1445 3)
		(parameters_typeO O1445 driver31)

		(index_action D2446 5688)
		(is_action D2446)
		(is_typeD D2446)
		(start_action D2446 "13/01/2017 15:10")
		(end_action D2446 "13/01/2017 15:48")
		(duration_action D2446 38)
		(parameters_typeD D2446 driver31)

		(index_action B1794 5689)
		(is_action B1794)
		(is_typeB B1794)
		(start_action B1794 "13/01/2017 15:48")
		(end_action B1794 "13/01/2017 16:34")
		(duration_action B1794 46)
		(parameters_typeB B1794 driver31)

		(index_action D2447 5690)
		(is_action D2447)
		(is_typeD D2447)
		(start_action D2447 "13/01/2017 16:34")
		(end_action D2447 "13/01/2017 17:04")
		(duration_action D2447 30)
		(parameters_typeD D2447 driver31)

		(index_action B1795 5691)
		(is_action B1795)
		(is_typeB B1795)
		(start_action B1795 "13/01/2017 17:04")
		(end_action B1795 "16/01/2017 06:41")
		(duration_action B1795 3697)
		(parameters_typeB B1795 driver31)

	)
	(:tasks-goal
		:tasks (
			(WD driver31)
		)
	)
)