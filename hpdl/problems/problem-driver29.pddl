(define (problem prueba0) (:domain GantaBi)
	(:customization
		(= :time-format "%d/%m/%Y %H:%M")
		(= :time-horizon-relative 86400) ;; que son los minutos que tienen 2 meses
		(= :time-start "01/01/2017 00:00")
		(= :time-unit :minutes)
	)
	(:objects
		driver29 - Driver

		D2240 D2241 D2242 D2243 D2244 D2245 D2246 D2247 D2248 D2249 D2250 D2251 D2252 D2253 D2254 D2255 D2256 D2257 D2258 D2259 D2260 D2261 D2262 D2263 D2264 D2265 D2266 D2267 D2268 D2269 D2270 D2271 D2272 D2273 D2274 D2275 D2276 D2277 D2278 D2279 D2280 D2281 D2282 D2283 D2284 D2285 D2286 D2287 D2288 D2289 D2290 D2291 D2292 D2293 D2294 D2295 D2296 D2297 D2298 D2299 D2300 D2301 D2302 D2303
 - TaskInstanceSymbol
		O1306 O1307 O1308 O1309 O1310 O1311 O1312 O1313 O1314 O1315 O1316 O1317 O1318 O1319 O1320 O1321 O1322 O1323 O1324 O1325 O1326 O1327 O1328 O1329 O1330 O1331 O1332 O1333 O1334 O1335 O1336 O1337 O1338 O1339 O1340 O1341 O1342
 - TaskInstanceSymbol
		B1651 B1652 B1653 B1654 B1655 B1656 B1657 B1658 B1659 B1660 B1661 B1662 B1663 B1664 B1665 B1666 B1667 B1668 B1669 B1670 B1671 B1672 B1673 B1674 B1675 B1676 B1677 B1678 B1679 B1680 B1681 B1682 B1683 B1684 B1685 B1686 B1687 B1688 B1689 B1690 B1691 B1692 B1693 B1694 B1695 B1696 B1697
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

		(= (current_index_action) 5199)

		(= (last_dr) "02/01/2017 07:10")
		(= (last_wr) "02/01/2017 07:10")
		(= (actual-timestamp) "02/01/2017 07:10")

		; Events
		(index_action B1651 5199)
		(is_action B1651)
		(is_typeB B1651)
		(start_action B1651 "02/01/2017 07:10")
		(end_action B1651 "02/01/2017 07:16")
		(duration_action B1651 6)
		(parameters_typeB B1651 driver29)

		(index_action D2240 5200)
		(is_action D2240)
		(is_typeD D2240)
		(start_action D2240 "02/01/2017 07:16")
		(end_action D2240 "02/01/2017 07:23")
		(duration_action D2240 7)
		(parameters_typeD D2240 driver29)

		(index_action B1652 5201)
		(is_action B1652)
		(is_typeB B1652)
		(start_action B1652 "02/01/2017 07:23")
		(end_action B1652 "02/01/2017 07:31")
		(duration_action B1652 8)
		(parameters_typeB B1652 driver29)

		(index_action D2241 5202)
		(is_action D2241)
		(is_typeD D2241)
		(start_action D2241 "02/01/2017 07:31")
		(end_action D2241 "02/01/2017 07:40")
		(duration_action D2241 9)
		(parameters_typeD D2241 driver29)

		(index_action B1653 5203)
		(is_action B1653)
		(is_typeB B1653)
		(start_action B1653 "02/01/2017 07:40")
		(end_action B1653 "02/01/2017 10:04")
		(duration_action B1653 144)
		(parameters_typeB B1653 driver29)

		(index_action D2242 5204)
		(is_action D2242)
		(is_typeD D2242)
		(start_action D2242 "02/01/2017 10:04")
		(end_action D2242 "02/01/2017 10:25")
		(duration_action D2242 21)
		(parameters_typeD D2242 driver29)

		(index_action O1306 5205)
		(is_action O1306)
		(is_typeO O1306)
		(start_action O1306 "02/01/2017 10:25")
		(end_action O1306 "02/01/2017 10:26")
		(duration_action O1306 1)
		(parameters_typeO O1306 driver29)

		(index_action B1654 5206)
		(is_action B1654)
		(is_typeB B1654)
		(start_action B1654 "03/01/2017 11:36")
		(end_action B1654 "03/01/2017 11:50")
		(duration_action B1654 14)
		(parameters_typeB B1654 driver29)

		(index_action D2243 5207)
		(is_action D2243)
		(is_typeD D2243)
		(start_action D2243 "03/01/2017 11:50")
		(end_action D2243 "03/01/2017 11:59")
		(duration_action D2243 9)
		(parameters_typeD D2243 driver29)

		(index_action B1655 5208)
		(is_action B1655)
		(is_typeB B1655)
		(start_action B1655 "03/01/2017 11:59")
		(end_action B1655 "03/01/2017 12:38")
		(duration_action B1655 39)
		(parameters_typeB B1655 driver29)

		(index_action D2244 5209)
		(is_action D2244)
		(is_typeD D2244)
		(start_action D2244 "03/01/2017 12:38")
		(end_action D2244 "03/01/2017 12:43")
		(duration_action D2244 5)
		(parameters_typeD D2244 driver29)

		(index_action B1656 5210)
		(is_action B1656)
		(is_typeB B1656)
		(start_action B1656 "03/01/2017 12:43")
		(end_action B1656 "03/01/2017 15:09")
		(duration_action B1656 146)
		(parameters_typeB B1656 driver29)

		(index_action O1307 5211)
		(is_action O1307)
		(is_typeO O1307)
		(start_action O1307 "03/01/2017 15:09")
		(end_action O1307 "03/01/2017 15:15")
		(duration_action O1307 6)
		(parameters_typeO O1307 driver29)

		(index_action B1657 5212)
		(is_action B1657)
		(is_typeB B1657)
		(start_action B1657 "03/01/2017 15:15")
		(end_action B1657 "03/01/2017 18:24")
		(duration_action B1657 189)
		(parameters_typeB B1657 driver29)

		(index_action D2245 5213)
		(is_action D2245)
		(is_typeD D2245)
		(start_action D2245 "03/01/2017 18:24")
		(end_action D2245 "03/01/2017 18:31")
		(duration_action D2245 7)
		(parameters_typeD D2245 driver29)

		(index_action O1308 5214)
		(is_action O1308)
		(is_typeO O1308)
		(start_action O1308 "03/01/2017 18:31")
		(end_action O1308 "03/01/2017 18:33")
		(duration_action O1308 2)
		(parameters_typeO O1308 driver29)

		(index_action D2246 5215)
		(is_action D2246)
		(is_typeD D2246)
		(start_action D2246 "03/01/2017 18:33")
		(end_action D2246 "03/01/2017 18:34")
		(duration_action D2246 1)
		(parameters_typeD D2246 driver29)

		(index_action B1658 5216)
		(is_action B1658)
		(is_typeB B1658)
		(start_action B1658 "03/01/2017 18:34")
		(end_action B1658 "03/01/2017 18:36")
		(duration_action B1658 2)
		(parameters_typeB B1658 driver29)

		(index_action D2247 5217)
		(is_action D2247)
		(is_typeD D2247)
		(start_action D2247 "03/01/2017 18:36")
		(end_action D2247 "03/01/2017 18:43")
		(duration_action D2247 7)
		(parameters_typeD D2247 driver29)

		(index_action O1309 5218)
		(is_action O1309)
		(is_typeO O1309)
		(start_action O1309 "03/01/2017 18:43")
		(end_action O1309 "03/01/2017 18:53")
		(duration_action O1309 10)
		(parameters_typeO O1309 driver29)

		(index_action D2248 5219)
		(is_action D2248)
		(is_typeD D2248)
		(start_action D2248 "03/01/2017 18:53")
		(end_action D2248 "03/01/2017 18:56")
		(duration_action D2248 3)
		(parameters_typeD D2248 driver29)

		(index_action O1310 5220)
		(is_action O1310)
		(is_typeO O1310)
		(start_action O1310 "03/01/2017 18:56")
		(end_action O1310 "03/01/2017 18:58")
		(duration_action O1310 2)
		(parameters_typeO O1310 driver29)

		(index_action D2249 5221)
		(is_action D2249)
		(is_typeD D2249)
		(start_action D2249 "03/01/2017 18:58")
		(end_action D2249 "03/01/2017 19:10")
		(duration_action D2249 12)
		(parameters_typeD D2249 driver29)

		(index_action O1311 5222)
		(is_action O1311)
		(is_typeO O1311)
		(start_action O1311 "03/01/2017 19:10")
		(end_action O1311 "03/01/2017 19:12")
		(duration_action O1311 2)
		(parameters_typeO O1311 driver29)

		(index_action D2250 5223)
		(is_action D2250)
		(is_typeD D2250)
		(start_action D2250 "03/01/2017 19:12")
		(end_action D2250 "03/01/2017 19:14")
		(duration_action D2250 2)
		(parameters_typeD D2250 driver29)

		(index_action O1312 5224)
		(is_action O1312)
		(is_typeO O1312)
		(start_action O1312 "03/01/2017 19:14")
		(end_action O1312 "03/01/2017 19:17")
		(duration_action O1312 3)
		(parameters_typeO O1312 driver29)

		(index_action D2251 5225)
		(is_action D2251)
		(is_typeD D2251)
		(start_action D2251 "03/01/2017 19:17")
		(end_action D2251 "03/01/2017 19:18")
		(duration_action D2251 1)
		(parameters_typeD D2251 driver29)

		(index_action B1659 5226)
		(is_action B1659)
		(is_typeB B1659)
		(start_action B1659 "03/01/2017 19:18")
		(end_action B1659 "03/01/2017 19:20")
		(duration_action B1659 2)
		(parameters_typeB B1659 driver29)

		(index_action B1660 5227)
		(is_action B1660)
		(is_typeB B1660)
		(start_action B1660 "07/01/2017 17:17")
		(end_action B1660 "07/01/2017 17:19")
		(duration_action B1660 2)
		(parameters_typeB B1660 driver29)

		(index_action D2252 5228)
		(is_action D2252)
		(is_typeD D2252)
		(start_action D2252 "07/01/2017 17:19")
		(end_action D2252 "07/01/2017 17:27")
		(duration_action D2252 8)
		(parameters_typeD D2252 driver29)

		(index_action O1313 5229)
		(is_action O1313)
		(is_typeO O1313)
		(start_action O1313 "07/01/2017 17:27")
		(end_action O1313 "07/01/2017 17:29")
		(duration_action O1313 2)
		(parameters_typeO O1313 driver29)

		(index_action D2253 5230)
		(is_action D2253)
		(is_typeD D2253)
		(start_action D2253 "07/01/2017 17:29")
		(end_action D2253 "07/01/2017 17:38")
		(duration_action D2253 9)
		(parameters_typeD D2253 driver29)

		(index_action O1314 5231)
		(is_action O1314)
		(is_typeO O1314)
		(start_action O1314 "07/01/2017 17:38")
		(end_action O1314 "07/01/2017 17:41")
		(duration_action O1314 3)
		(parameters_typeO O1314 driver29)

		(index_action B1661 5232)
		(is_action B1661)
		(is_typeB B1661)
		(start_action B1661 "07/01/2017 17:41")
		(end_action B1661 "07/01/2017 17:45")
		(duration_action B1661 4)
		(parameters_typeB B1661 driver29)

		(index_action D2254 5233)
		(is_action D2254)
		(is_typeD D2254)
		(start_action D2254 "07/01/2017 17:45")
		(end_action D2254 "07/01/2017 17:46")
		(duration_action D2254 1)
		(parameters_typeD D2254 driver29)

		(index_action B1662 5234)
		(is_action B1662)
		(is_typeB B1662)
		(start_action B1662 "07/01/2017 17:46")
		(end_action B1662 "07/01/2017 18:11")
		(duration_action B1662 25)
		(parameters_typeB B1662 driver29)

		(index_action D2255 5235)
		(is_action D2255)
		(is_typeD D2255)
		(start_action D2255 "07/01/2017 18:11")
		(end_action D2255 "07/01/2017 18:12")
		(duration_action D2255 1)
		(parameters_typeD D2255 driver29)

		(index_action O1315 5236)
		(is_action O1315)
		(is_typeO O1315)
		(start_action O1315 "07/01/2017 18:12")
		(end_action O1315 "07/01/2017 18:22")
		(duration_action O1315 10)
		(parameters_typeO O1315 driver29)

		(index_action D2256 5237)
		(is_action D2256)
		(is_typeD D2256)
		(start_action D2256 "07/01/2017 18:22")
		(end_action D2256 "07/01/2017 18:26")
		(duration_action D2256 4)
		(parameters_typeD D2256 driver29)

		(index_action B1663 5238)
		(is_action B1663)
		(is_typeB B1663)
		(start_action B1663 "07/01/2017 18:26")
		(end_action B1663 "07/01/2017 18:29")
		(duration_action B1663 3)
		(parameters_typeB B1663 driver29)

		(index_action D2257 5239)
		(is_action D2257)
		(is_typeD D2257)
		(start_action D2257 "07/01/2017 18:29")
		(end_action D2257 "07/01/2017 18:38")
		(duration_action D2257 9)
		(parameters_typeD D2257 driver29)

		(index_action B1664 5240)
		(is_action B1664)
		(is_typeB B1664)
		(start_action B1664 "07/01/2017 18:38")
		(end_action B1664 "07/01/2017 18:56")
		(duration_action B1664 18)
		(parameters_typeB B1664 driver29)

		(index_action D2258 5241)
		(is_action D2258)
		(is_typeD D2258)
		(start_action D2258 "07/01/2017 18:56")
		(end_action D2258 "07/01/2017 22:52")
		(duration_action D2258 236)
		(parameters_typeD D2258 driver29)

		(index_action B1665 5242)
		(is_action B1665)
		(is_typeB B1665)
		(start_action B1665 "07/01/2017 22:52")
		(end_action B1665 "07/01/2017 23:45")
		(duration_action B1665 53)
		(parameters_typeB B1665 driver29)

		(index_action D2259 5243)
		(is_action D2259)
		(is_typeD D2259)
		(start_action D2259 "07/01/2017 23:45")
		(end_action D2259 "08/01/2017 04:05")
		(duration_action D2259 260)
		(parameters_typeD D2259 driver29)

		(index_action O1316 5244)
		(is_action O1316)
		(is_typeO O1316)
		(start_action O1316 "08/01/2017 04:05")
		(end_action O1316 "08/01/2017 04:23")
		(duration_action O1316 18)
		(parameters_typeO O1316 driver29)

		(index_action B1666 5245)
		(is_action B1666)
		(is_typeB B1666)
		(start_action B1666 "08/01/2017 04:23")
		(end_action B1666 "08/01/2017 04:24")
		(duration_action B1666 1)
		(parameters_typeB B1666 driver29)

		(index_action D2260 5246)
		(is_action D2260)
		(is_typeD D2260)
		(start_action D2260 "08/01/2017 04:24")
		(end_action D2260 "08/01/2017 04:25")
		(duration_action D2260 1)
		(parameters_typeD D2260 driver29)

		(index_action B1667 5247)
		(is_action B1667)
		(is_typeB B1667)
		(start_action B1667 "08/01/2017 04:25")
		(end_action B1667 "08/01/2017 05:12")
		(duration_action B1667 47)
		(parameters_typeB B1667 driver29)

		(index_action D2261 5248)
		(is_action D2261)
		(is_typeD D2261)
		(start_action D2261 "08/01/2017 05:12")
		(end_action D2261 "08/01/2017 05:13")
		(duration_action D2261 1)
		(parameters_typeD D2261 driver29)

		(index_action O1317 5249)
		(is_action O1317)
		(is_typeO O1317)
		(start_action O1317 "08/01/2017 05:13")
		(end_action O1317 "08/01/2017 05:21")
		(duration_action O1317 8)
		(parameters_typeO O1317 driver29)

		(index_action D2262 5250)
		(is_action D2262)
		(is_typeD D2262)
		(start_action D2262 "08/01/2017 05:21")
		(end_action D2262 "08/01/2017 05:31")
		(duration_action D2262 10)
		(parameters_typeD D2262 driver29)

		(index_action O1318 5251)
		(is_action O1318)
		(is_typeO O1318)
		(start_action O1318 "08/01/2017 05:31")
		(end_action O1318 "08/01/2017 05:41")
		(duration_action O1318 10)
		(parameters_typeO O1318 driver29)

		(index_action B1668 5252)
		(is_action B1668)
		(is_typeB B1668)
		(start_action B1668 "08/01/2017 05:41")
		(end_action B1668 "09/01/2017 17:01")
		(duration_action B1668 2120)
		(parameters_typeB B1668 driver29)

		(index_action D2263 5253)
		(is_action D2263)
		(is_typeD D2263)
		(start_action D2263 "09/01/2017 17:01")
		(end_action D2263 "09/01/2017 17:16")
		(duration_action D2263 15)
		(parameters_typeD D2263 driver29)

		(index_action B1669 5254)
		(is_action B1669)
		(is_typeB B1669)
		(start_action B1669 "09/01/2017 17:16")
		(end_action B1669 "09/01/2017 17:40")
		(duration_action B1669 24)
		(parameters_typeB B1669 driver29)

		(index_action D2264 5255)
		(is_action D2264)
		(is_typeD D2264)
		(start_action D2264 "09/01/2017 17:40")
		(end_action D2264 "09/01/2017 18:01")
		(duration_action D2264 21)
		(parameters_typeD D2264 driver29)

		(index_action B1670 5256)
		(is_action B1670)
		(is_typeB B1670)
		(start_action B1670 "09/01/2017 18:01")
		(end_action B1670 "09/01/2017 18:03")
		(duration_action B1670 2)
		(parameters_typeB B1670 driver29)

		(index_action D2265 5257)
		(is_action D2265)
		(is_typeD D2265)
		(start_action D2265 "09/01/2017 18:03")
		(end_action D2265 "09/01/2017 18:04")
		(duration_action D2265 1)
		(parameters_typeD D2265 driver29)

		(index_action B1671 5258)
		(is_action B1671)
		(is_typeB B1671)
		(start_action B1671 "09/01/2017 18:04")
		(end_action B1671 "09/01/2017 18:11")
		(duration_action B1671 7)
		(parameters_typeB B1671 driver29)

		(index_action D2266 5259)
		(is_action D2266)
		(is_typeD D2266)
		(start_action D2266 "09/01/2017 18:11")
		(end_action D2266 "09/01/2017 18:14")
		(duration_action D2266 3)
		(parameters_typeD D2266 driver29)

		(index_action B1672 5260)
		(is_action B1672)
		(is_typeB B1672)
		(start_action B1672 "09/01/2017 18:14")
		(end_action B1672 "09/01/2017 18:32")
		(duration_action B1672 18)
		(parameters_typeB B1672 driver29)

		(index_action D2267 5261)
		(is_action D2267)
		(is_typeD D2267)
		(start_action D2267 "09/01/2017 18:32")
		(end_action D2267 "09/01/2017 18:35")
		(duration_action D2267 3)
		(parameters_typeD D2267 driver29)

		(index_action B1673 5262)
		(is_action B1673)
		(is_typeB B1673)
		(start_action B1673 "09/01/2017 18:35")
		(end_action B1673 "09/01/2017 19:52")
		(duration_action B1673 77)
		(parameters_typeB B1673 driver29)

		(index_action O1319 5263)
		(is_action O1319)
		(is_typeO O1319)
		(start_action O1319 "09/01/2017 19:52")
		(end_action O1319 "09/01/2017 19:55")
		(duration_action O1319 3)
		(parameters_typeO O1319 driver29)

		(index_action D2268 5264)
		(is_action D2268)
		(is_typeD D2268)
		(start_action D2268 "09/01/2017 19:55")
		(end_action D2268 "09/01/2017 20:00")
		(duration_action D2268 5)
		(parameters_typeD D2268 driver29)

		(index_action B1674 5265)
		(is_action B1674)
		(is_typeB B1674)
		(start_action B1674 "09/01/2017 20:00")
		(end_action B1674 "09/01/2017 20:04")
		(duration_action B1674 4)
		(parameters_typeB B1674 driver29)

		(index_action D2269 5266)
		(is_action D2269)
		(is_typeD D2269)
		(start_action D2269 "09/01/2017 20:04")
		(end_action D2269 "09/01/2017 20:09")
		(duration_action D2269 5)
		(parameters_typeD D2269 driver29)

		(index_action B1675 5267)
		(is_action B1675)
		(is_typeB B1675)
		(start_action B1675 "09/01/2017 20:09")
		(end_action B1675 "09/01/2017 21:31")
		(duration_action B1675 82)
		(parameters_typeB B1675 driver29)

		(index_action O1320 5268)
		(is_action O1320)
		(is_typeO O1320)
		(start_action O1320 "09/01/2017 21:31")
		(end_action O1320 "09/01/2017 21:33")
		(duration_action O1320 2)
		(parameters_typeO O1320 driver29)

		(index_action B1676 5269)
		(is_action B1676)
		(is_typeB B1676)
		(start_action B1676 "09/01/2017 21:33")
		(end_action B1676 "09/01/2017 21:34")
		(duration_action B1676 1)
		(parameters_typeB B1676 driver29)

		(index_action D2270 5270)
		(is_action D2270)
		(is_typeD D2270)
		(start_action D2270 "09/01/2017 21:34")
		(end_action D2270 "09/01/2017 21:38")
		(duration_action D2270 4)
		(parameters_typeD D2270 driver29)

		(index_action B1677 5271)
		(is_action B1677)
		(is_typeB B1677)
		(start_action B1677 "09/01/2017 21:38")
		(end_action B1677 "09/01/2017 21:49")
		(duration_action B1677 11)
		(parameters_typeB B1677 driver29)

		(index_action D2271 5272)
		(is_action D2271)
		(is_typeD D2271)
		(start_action D2271 "09/01/2017 21:49")
		(end_action D2271 "10/01/2017 00:10")
		(duration_action D2271 141)
		(parameters_typeD D2271 driver29)

		(index_action B1678 5273)
		(is_action B1678)
		(is_typeB B1678)
		(start_action B1678 "10/01/2017 00:10")
		(end_action B1678 "10/01/2017 00:30")
		(duration_action B1678 20)
		(parameters_typeB B1678 driver29)

		(index_action D2272 5274)
		(is_action D2272)
		(is_typeD D2272)
		(start_action D2272 "10/01/2017 00:30")
		(end_action D2272 "10/01/2017 02:22")
		(duration_action D2272 112)
		(parameters_typeD D2272 driver29)

		(index_action B1679 5275)
		(is_action B1679)
		(is_typeB B1679)
		(start_action B1679 "10/01/2017 02:22")
		(end_action B1679 "10/01/2017 02:53")
		(duration_action B1679 31)
		(parameters_typeB B1679 driver29)

		(index_action D2273 5276)
		(is_action D2273)
		(is_typeD D2273)
		(start_action D2273 "10/01/2017 02:53")
		(end_action D2273 "10/01/2017 05:35")
		(duration_action D2273 162)
		(parameters_typeD D2273 driver29)

		(index_action O1321 5277)
		(is_action O1321)
		(is_typeO O1321)
		(start_action O1321 "10/01/2017 05:35")
		(end_action O1321 "10/01/2017 05:37")
		(duration_action O1321 2)
		(parameters_typeO O1321 driver29)

		(index_action D2274 5278)
		(is_action D2274)
		(is_typeD D2274)
		(start_action D2274 "10/01/2017 05:37")
		(end_action D2274 "10/01/2017 06:04")
		(duration_action D2274 27)
		(parameters_typeD D2274 driver29)

		(index_action O1322 5279)
		(is_action O1322)
		(is_typeO O1322)
		(start_action O1322 "10/01/2017 06:04")
		(end_action O1322 "10/01/2017 06:05")
		(duration_action O1322 1)
		(parameters_typeO O1322 driver29)

		(index_action B1680 5280)
		(is_action B1680)
		(is_typeB B1680)
		(start_action B1680 "10/01/2017 06:05")
		(end_action B1680 "10/01/2017 06:19")
		(duration_action B1680 14)
		(parameters_typeB B1680 driver29)

		(index_action D2275 5281)
		(is_action D2275)
		(is_typeD D2275)
		(start_action D2275 "10/01/2017 06:19")
		(end_action D2275 "10/01/2017 06:27")
		(duration_action D2275 8)
		(parameters_typeD D2275 driver29)

		(index_action O1323 5282)
		(is_action O1323)
		(is_typeO O1323)
		(start_action O1323 "10/01/2017 06:27")
		(end_action O1323 "10/01/2017 06:29")
		(duration_action O1323 2)
		(parameters_typeO O1323 driver29)

		(index_action D2276 5283)
		(is_action D2276)
		(is_typeD D2276)
		(start_action D2276 "10/01/2017 06:29")
		(end_action D2276 "10/01/2017 06:30")
		(duration_action D2276 1)
		(parameters_typeD D2276 driver29)

		(index_action B1681 5284)
		(is_action B1681)
		(is_typeB B1681)
		(start_action B1681 "10/01/2017 06:30")
		(end_action B1681 "10/01/2017 07:11")
		(duration_action B1681 41)
		(parameters_typeB B1681 driver29)

		(index_action D2277 5285)
		(is_action D2277)
		(is_typeD D2277)
		(start_action D2277 "10/01/2017 07:11")
		(end_action D2277 "10/01/2017 07:26")
		(duration_action D2277 15)
		(parameters_typeD D2277 driver29)

		(index_action O1324 5286)
		(is_action O1324)
		(is_typeO O1324)
		(start_action O1324 "10/01/2017 07:26")
		(end_action O1324 "10/01/2017 07:29")
		(duration_action O1324 3)
		(parameters_typeO O1324 driver29)

		(index_action B1682 5287)
		(is_action B1682)
		(is_typeB B1682)
		(start_action B1682 "13/01/2017 16:27")
		(end_action B1682 "13/01/2017 16:28")
		(duration_action B1682 1)
		(parameters_typeB B1682 driver29)

		(index_action D2278 5288)
		(is_action D2278)
		(is_typeD D2278)
		(start_action D2278 "13/01/2017 16:28")
		(end_action D2278 "13/01/2017 16:34")
		(duration_action D2278 6)
		(parameters_typeD D2278 driver29)

		(index_action O1325 5289)
		(is_action O1325)
		(is_typeO O1325)
		(start_action O1325 "13/01/2017 16:34")
		(end_action O1325 "13/01/2017 16:42")
		(duration_action O1325 8)
		(parameters_typeO O1325 driver29)

		(index_action D2279 5290)
		(is_action D2279)
		(is_typeD D2279)
		(start_action D2279 "13/01/2017 16:42")
		(end_action D2279 "13/01/2017 16:56")
		(duration_action D2279 14)
		(parameters_typeD D2279 driver29)

		(index_action O1326 5291)
		(is_action O1326)
		(is_typeO O1326)
		(start_action O1326 "13/01/2017 16:56")
		(end_action O1326 "13/01/2017 17:03")
		(duration_action O1326 7)
		(parameters_typeO O1326 driver29)

		(index_action D2280 5292)
		(is_action D2280)
		(is_typeD D2280)
		(start_action D2280 "13/01/2017 17:03")
		(end_action D2280 "13/01/2017 17:14")
		(duration_action D2280 11)
		(parameters_typeD D2280 driver29)

		(index_action O1327 5293)
		(is_action O1327)
		(is_typeO O1327)
		(start_action O1327 "13/01/2017 17:14")
		(end_action O1327 "13/01/2017 17:22")
		(duration_action O1327 8)
		(parameters_typeO O1327 driver29)

		(index_action D2281 5294)
		(is_action D2281)
		(is_typeD D2281)
		(start_action D2281 "13/01/2017 17:22")
		(end_action D2281 "13/01/2017 17:33")
		(duration_action D2281 11)
		(parameters_typeD D2281 driver29)

		(index_action O1328 5295)
		(is_action O1328)
		(is_typeO O1328)
		(start_action O1328 "13/01/2017 17:33")
		(end_action O1328 "13/01/2017 17:38")
		(duration_action O1328 5)
		(parameters_typeO O1328 driver29)

		(index_action D2282 5296)
		(is_action D2282)
		(is_typeD D2282)
		(start_action D2282 "13/01/2017 17:38")
		(end_action D2282 "13/01/2017 17:50")
		(duration_action D2282 12)
		(parameters_typeD D2282 driver29)

		(index_action O1329 5297)
		(is_action O1329)
		(is_typeO O1329)
		(start_action O1329 "13/01/2017 17:50")
		(end_action O1329 "13/01/2017 17:57")
		(duration_action O1329 7)
		(parameters_typeO O1329 driver29)

		(index_action D2283 5298)
		(is_action D2283)
		(is_typeD D2283)
		(start_action D2283 "13/01/2017 17:57")
		(end_action D2283 "13/01/2017 18:07")
		(duration_action D2283 10)
		(parameters_typeD D2283 driver29)

		(index_action B1683 5299)
		(is_action B1683)
		(is_typeB B1683)
		(start_action B1683 "13/01/2017 18:07")
		(end_action B1683 "13/01/2017 18:13")
		(duration_action B1683 6)
		(parameters_typeB B1683 driver29)

		(index_action D2284 5300)
		(is_action D2284)
		(is_typeD D2284)
		(start_action D2284 "13/01/2017 18:13")
		(end_action D2284 "13/01/2017 18:26")
		(duration_action D2284 13)
		(parameters_typeD D2284 driver29)

		(index_action O1330 5301)
		(is_action O1330)
		(is_typeO O1330)
		(start_action O1330 "13/01/2017 18:26")
		(end_action O1330 "13/01/2017 18:34")
		(duration_action O1330 8)
		(parameters_typeO O1330 driver29)

		(index_action D2285 5302)
		(is_action D2285)
		(is_typeD D2285)
		(start_action D2285 "13/01/2017 18:34")
		(end_action D2285 "13/01/2017 18:44")
		(duration_action D2285 10)
		(parameters_typeD D2285 driver29)

		(index_action B1684 5303)
		(is_action B1684)
		(is_typeB B1684)
		(start_action B1684 "13/01/2017 18:44")
		(end_action B1684 "13/01/2017 19:01")
		(duration_action B1684 17)
		(parameters_typeB B1684 driver29)

		(index_action D2286 5304)
		(is_action D2286)
		(is_typeD D2286)
		(start_action D2286 "13/01/2017 19:01")
		(end_action D2286 "13/01/2017 19:15")
		(duration_action D2286 14)
		(parameters_typeD D2286 driver29)

		(index_action O1331 5305)
		(is_action O1331)
		(is_typeO O1331)
		(start_action O1331 "13/01/2017 19:15")
		(end_action O1331 "13/01/2017 19:18")
		(duration_action O1331 3)
		(parameters_typeO O1331 driver29)

		(index_action D2287 5306)
		(is_action D2287)
		(is_typeD D2287)
		(start_action D2287 "13/01/2017 19:18")
		(end_action D2287 "13/01/2017 19:28")
		(duration_action D2287 10)
		(parameters_typeD D2287 driver29)

		(index_action B1685 5307)
		(is_action B1685)
		(is_typeB B1685)
		(start_action B1685 "13/01/2017 19:28")
		(end_action B1685 "13/01/2017 19:36")
		(duration_action B1685 8)
		(parameters_typeB B1685 driver29)

		(index_action D2288 5308)
		(is_action D2288)
		(is_typeD D2288)
		(start_action D2288 "13/01/2017 19:36")
		(end_action D2288 "13/01/2017 19:37")
		(duration_action D2288 1)
		(parameters_typeD D2288 driver29)

		(index_action O1332 5309)
		(is_action O1332)
		(is_typeO O1332)
		(start_action O1332 "13/01/2017 19:37")
		(end_action O1332 "13/01/2017 19:39")
		(duration_action O1332 2)
		(parameters_typeO O1332 driver29)

		(index_action B1686 5310)
		(is_action B1686)
		(is_typeB B1686)
		(start_action B1686 "14/01/2017 12:36")
		(end_action B1686 "14/01/2017 12:38")
		(duration_action B1686 2)
		(parameters_typeB B1686 driver29)

		(index_action D2289 5311)
		(is_action D2289)
		(is_typeD D2289)
		(start_action D2289 "14/01/2017 12:38")
		(end_action D2289 "14/01/2017 12:39")
		(duration_action D2289 1)
		(parameters_typeD D2289 driver29)

		(index_action O1333 5312)
		(is_action O1333)
		(is_typeO O1333)
		(start_action O1333 "14/01/2017 12:39")
		(end_action O1333 "14/01/2017 12:48")
		(duration_action O1333 9)
		(parameters_typeO O1333 driver29)

		(index_action D2290 5313)
		(is_action D2290)
		(is_typeD D2290)
		(start_action D2290 "14/01/2017 12:48")
		(end_action D2290 "14/01/2017 13:03")
		(duration_action D2290 15)
		(parameters_typeD D2290 driver29)

		(index_action O1334 5314)
		(is_action O1334)
		(is_typeO O1334)
		(start_action O1334 "14/01/2017 13:03")
		(end_action O1334 "14/01/2017 13:05")
		(duration_action O1334 2)
		(parameters_typeO O1334 driver29)

		(index_action D2291 5315)
		(is_action D2291)
		(is_typeD D2291)
		(start_action D2291 "14/01/2017 13:05")
		(end_action D2291 "14/01/2017 13:17")
		(duration_action D2291 12)
		(parameters_typeD D2291 driver29)

		(index_action B1687 5316)
		(is_action B1687)
		(is_typeB B1687)
		(start_action B1687 "14/01/2017 13:17")
		(end_action B1687 "14/01/2017 13:25")
		(duration_action B1687 8)
		(parameters_typeB B1687 driver29)

		(index_action D2292 5317)
		(is_action D2292)
		(is_typeD D2292)
		(start_action D2292 "14/01/2017 13:25")
		(end_action D2292 "14/01/2017 13:29")
		(duration_action D2292 4)
		(parameters_typeD D2292 driver29)

		(index_action B1688 5318)
		(is_action B1688)
		(is_typeB B1688)
		(start_action B1688 "14/01/2017 13:29")
		(end_action B1688 "14/01/2017 17:52")
		(duration_action B1688 263)
		(parameters_typeB B1688 driver29)

		(index_action D2293 5319)
		(is_action D2293)
		(is_typeD D2293)
		(start_action D2293 "14/01/2017 17:52")
		(end_action D2293 "14/01/2017 18:10")
		(duration_action D2293 18)
		(parameters_typeD D2293 driver29)

		(index_action B1689 5320)
		(is_action B1689)
		(is_typeB B1689)
		(start_action B1689 "14/01/2017 18:10")
		(end_action B1689 "14/01/2017 18:20")
		(duration_action B1689 10)
		(parameters_typeB B1689 driver29)

		(index_action D2294 5321)
		(is_action D2294)
		(is_typeD D2294)
		(start_action D2294 "14/01/2017 18:20")
		(end_action D2294 "14/01/2017 18:24")
		(duration_action D2294 4)
		(parameters_typeD D2294 driver29)

		(index_action B1690 5322)
		(is_action B1690)
		(is_typeB B1690)
		(start_action B1690 "14/01/2017 18:24")
		(end_action B1690 "14/01/2017 18:26")
		(duration_action B1690 2)
		(parameters_typeB B1690 driver29)

		(index_action B1691 5323)
		(is_action B1691)
		(is_typeB B1691)
		(start_action B1691 "14/01/2017 21:52")
		(end_action B1691 "15/01/2017 07:14")
		(duration_action B1691 562)
		(parameters_typeB B1691 driver29)

		(index_action O1335 5324)
		(is_action O1335)
		(is_typeO O1335)
		(start_action O1335 "15/01/2017 07:14")
		(end_action O1335 "15/01/2017 07:16")
		(duration_action O1335 2)
		(parameters_typeO O1335 driver29)

		(index_action D2295 5325)
		(is_action D2295)
		(is_typeD D2295)
		(start_action D2295 "15/01/2017 07:16")
		(end_action D2295 "15/01/2017 07:21")
		(duration_action D2295 5)
		(parameters_typeD D2295 driver29)

		(index_action B1692 5326)
		(is_action B1692)
		(is_typeB B1692)
		(start_action B1692 "15/01/2017 07:21")
		(end_action B1692 "15/01/2017 07:28")
		(duration_action B1692 7)
		(parameters_typeB B1692 driver29)

		(index_action D2296 5327)
		(is_action D2296)
		(is_typeD D2296)
		(start_action D2296 "15/01/2017 07:28")
		(end_action D2296 "15/01/2017 07:37")
		(duration_action D2296 9)
		(parameters_typeD D2296 driver29)

		(index_action B1693 5328)
		(is_action B1693)
		(is_typeB B1693)
		(start_action B1693 "15/01/2017 07:37")
		(end_action B1693 "15/01/2017 08:10")
		(duration_action B1693 33)
		(parameters_typeB B1693 driver29)

		(index_action D2297 5329)
		(is_action D2297)
		(is_typeD D2297)
		(start_action D2297 "15/01/2017 08:10")
		(end_action D2297 "15/01/2017 08:19")
		(duration_action D2297 9)
		(parameters_typeD D2297 driver29)

		(index_action O1336 5330)
		(is_action O1336)
		(is_typeO O1336)
		(start_action O1336 "15/01/2017 08:19")
		(end_action O1336 "15/01/2017 08:21")
		(duration_action O1336 2)
		(parameters_typeO O1336 driver29)

		(index_action D2298 5331)
		(is_action D2298)
		(is_typeD D2298)
		(start_action D2298 "15/01/2017 08:21")
		(end_action D2298 "15/01/2017 08:22")
		(duration_action D2298 1)
		(parameters_typeD D2298 driver29)

		(index_action O1337 5332)
		(is_action O1337)
		(is_typeO O1337)
		(start_action O1337 "15/01/2017 08:22")
		(end_action O1337 "15/01/2017 08:24")
		(duration_action O1337 2)
		(parameters_typeO O1337 driver29)

		(index_action D2299 5333)
		(is_action D2299)
		(is_typeD D2299)
		(start_action D2299 "15/01/2017 08:24")
		(end_action D2299 "15/01/2017 08:25")
		(duration_action D2299 1)
		(parameters_typeD D2299 driver29)

		(index_action O1338 5334)
		(is_action O1338)
		(is_typeO O1338)
		(start_action O1338 "15/01/2017 08:25")
		(end_action O1338 "15/01/2017 08:27")
		(duration_action O1338 2)
		(parameters_typeO O1338 driver29)

		(index_action D2300 5335)
		(is_action D2300)
		(is_typeD D2300)
		(start_action D2300 "15/01/2017 08:27")
		(end_action D2300 "15/01/2017 08:29")
		(duration_action D2300 2)
		(parameters_typeD D2300 driver29)

		(index_action B1694 5336)
		(is_action B1694)
		(is_typeB B1694)
		(start_action B1694 "15/01/2017 08:29")
		(end_action B1694 "15/01/2017 17:49")
		(duration_action B1694 560)
		(parameters_typeB B1694 driver29)

		(index_action D2301 5337)
		(is_action D2301)
		(is_typeD D2301)
		(start_action D2301 "15/01/2017 17:49")
		(end_action D2301 "15/01/2017 17:59")
		(duration_action D2301 10)
		(parameters_typeD D2301 driver29)

		(index_action O1339 5338)
		(is_action O1339)
		(is_typeO O1339)
		(start_action O1339 "15/01/2017 17:59")
		(end_action O1339 "15/01/2017 18:02")
		(duration_action O1339 3)
		(parameters_typeO O1339 driver29)

		(index_action D2302 5339)
		(is_action D2302)
		(is_typeD D2302)
		(start_action D2302 "15/01/2017 18:02")
		(end_action D2302 "15/01/2017 18:05")
		(duration_action D2302 3)
		(parameters_typeD D2302 driver29)

		(index_action O1340 5340)
		(is_action O1340)
		(is_typeO O1340)
		(start_action O1340 "15/01/2017 18:05")
		(end_action O1340 "15/01/2017 18:08")
		(duration_action O1340 3)
		(parameters_typeO O1340 driver29)

		(index_action B1695 5341)
		(is_action B1695)
		(is_typeB B1695)
		(start_action B1695 "15/01/2017 18:08")
		(end_action B1695 "15/01/2017 18:32")
		(duration_action B1695 24)
		(parameters_typeB B1695 driver29)

		(index_action O1341 5342)
		(is_action O1341)
		(is_typeO O1341)
		(start_action O1341 "15/01/2017 18:32")
		(end_action O1341 "15/01/2017 18:33")
		(duration_action O1341 1)
		(parameters_typeO O1341 driver29)

		(index_action D2303 5343)
		(is_action D2303)
		(is_typeD D2303)
		(start_action D2303 "15/01/2017 18:33")
		(end_action D2303 "15/01/2017 18:40")
		(duration_action D2303 7)
		(parameters_typeD D2303 driver29)

		(index_action B1696 5344)
		(is_action B1696)
		(is_typeB B1696)
		(start_action B1696 "15/01/2017 18:40")
		(end_action B1696 "15/01/2017 18:43")
		(duration_action B1696 3)
		(parameters_typeB B1696 driver29)

		(index_action O1342 5345)
		(is_action O1342)
		(is_typeO O1342)
		(start_action O1342 "15/01/2017 18:43")
		(end_action O1342 "15/01/2017 18:46")
		(duration_action O1342 3)
		(parameters_typeO O1342 driver29)

		(index_action B1697 5346)
		(is_action B1697)
		(is_typeB B1697)
		(start_action B1697 "15/01/2017 18:46")
		(end_action B1697 "16/01/2017 12:54")
		(duration_action B1697 1088)
		(parameters_typeB B1697 driver29)

	)
	(:tasks-goal
		:tasks (
			(WD driver29)
		)
	)
)