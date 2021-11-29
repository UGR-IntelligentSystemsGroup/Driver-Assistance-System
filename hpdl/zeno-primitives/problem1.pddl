        almeria barcelona bilbao cadiz cordoba gibraltar granada huelva jaen madrid malaga sevilla - city
        box1 box2 box3 - box

        ; ------------------------------------------------
        ; Zenotravel
        ; ------------------------------------------------

        ; Distances
        (= (distance almeria barcelona) 809)
		(= (distance almeria bilbao) 958)
		(= (distance almeria cadiz) 463)
		(= (distance almeria cordoba) 316)
		(= (distance almeria gibraltar) 339)
		(= (distance almeria granada) 162)
		(= (distance almeria huelva) 505)
		(= (distance almeria jaen) 220)
		(= (distance almeria madrid) 547)
		(= (distance almeria malaga) 207)
		(= (distance almeria sevilla) 410)

		(= (distance barcelona almeria) 809)
		(= (distance barcelona bilbao) 620)
		(= (distance barcelona cadiz) 1284)
		(= (distance barcelona cordoba) 908)
		(= (distance barcelona gibraltar) 1124)
		(= (distance barcelona granada) 868)
		(= (distance barcelona huelva) 1140)
		(= (distance barcelona jaen) 804)
		(= (distance barcelona madrid) 621)
		(= (distance barcelona malaga) 997)
		(= (distance barcelona sevilla) 1046)

		(= (distance bilbao almeria) 958)
		(= (distance bilbao barcelona) 620)
		(= (distance bilbao cadiz) 1058)
		(= (distance bilbao cordoba) 796)
		(= (distance bilbao gibraltar) 1110)
		(= (distance bilbao granada) 829)
		(= (distance bilbao huelva) 939)
		(= (distance bilbao jaen) 730)
		(= (distance bilbao madrid) 395)
		(= (distance bilbao malaga) 939)
		(= (distance bilbao sevilla) 933)

		(= (distance cadiz almeria) 463)
		(= (distance cadiz barcelona) 1284)
		(= (distance cadiz bilbao) 1058)
		(= (distance cadiz cordoba) 261)
		(= (distance cadiz gibraltar) 124)
		(= (distance cadiz granada) 296)
		(= (distance cadiz huelva) 214)
		(= (distance cadiz jaen) 330)
		(= (distance cadiz madrid) 654)
		(= (distance cadiz malaga) 240)
		(= (distance cadiz sevilla) 126)

		(= (distance cordoba almeria) 809)
		(= (distance cordoba barcelona) 908)
		(= (distance cordoba bilbao) 796)
		(= (distance cordoba cadiz) 261)
		(= (distance cordoba gibraltar) 294)
		(= (distance cordoba granada) 160)
		(= (distance cordoba huelva) 241)
		(= (distance cordoba jaen) 108)
		(= (distance cordoba madrid) 396)
		(= (distance cordoba malaga) 165)
		(= (distance cordoba sevilla) 143)

		(= (distance gibraltar almeria) 339)
		(= (distance gibraltar barcelona) 1124)
		(= (distance gibraltar bilbao) 1110)
		(= (distance gibraltar cadiz) 124)
		(= (distance gibraltar cordoba) 294)
		(= (distance gibraltar granada) 255)
		(= (distance gibraltar huelva) 289)
		(= (distance gibraltar jaen) 335)
		(= (distance gibraltar madrid) 662)
		(= (distance gibraltar malaga) 134)
		(= (distance gibraltar sevilla) 201)

		(= (distance granada almeria) 162)
		(= (distance granada barcelona) 868)
		(= (distance granada bilbao) 829)
		(= (distance granada cadiz) 296)
		(= (distance granada cordoba) 160)
		(= (distance granada gibraltar) 255)
		(= (distance granada huelva) 346)
		(= (distance granada jaen) 93)
		(= (distance granada madrid) 421)
		(= (distance granada malaga) 125)
		(= (distance granada sevilla) 252)

		(= (distance huelva almeria) 505)
		(= (distance huelva barcelona) 1140)
		(= (distance huelva bilbao) 929)
		(= (distance huelva cadiz) 214)
		(= (distance huelva cordoba) 241)
		(= (distance huelva gibraltar) 289)
		(= (distance huelva granada) 346)
		(= (distance huelva jaen) 347)
		(= (distance huelva madrid) 591)
		(= (distance huelva malaga) 301)
		(= (distance huelva sevilla) 95)

		(= (distance jaen almeria) 220)
		(= (distance jaen barcelona) 804)
		(= (distance jaen bilbao) 730)
		(= (distance jaen cadiz) 330)
		(= (distance jaen cordoba) 108)
		(= (distance jaen gibraltar) 335)
		(= (distance jaen granada) 93)
		(= (distance jaen huelva) 347)
		(= (distance jaen madrid) 335)
		(= (distance jaen malaga) 203)
		(= (distance jaen sevilla) 246)

		(= (distance madrid almeria) 547)
		(= (distance madrid barcelona) 621)
		(= (distance madrid bilbao) 395)
		(= (distance madrid cadiz) 654)
		(= (distance madrid cordoba) 396)
		(= (distance madrid gibraltar) 662)
		(= (distance madrid granada) 421)
		(= (distance madrid huelva) 591)
		(= (distance madrid jaen) 335)
		(= (distance madrid malaga) 532)
		(= (distance madrid sevilla) 534)

		(= (distance malaga almeria) 207)
		(= (distance malaga barcelona) 997)
		(= (distance malaga bilbao) 939)
		(= (distance malaga cadiz) 240)
		(= (distance malaga cordoba) 165)
		(= (distance malaga gibraltar) 134)
		(= (distance malaga granada) 125)
		(= (distance malaga huelva) 301)
		(= (distance malaga jaen) 203)
		(= (distance malaga madrid) 532)
		(= (distance malaga sevilla) 209)

		(= (distance sevilla almeria) 410)
		(= (distance sevilla barcelona) 1046)
		(= (distance sevilla bilbao) 933)
		(= (distance sevilla cadiz) 126)
		(= (distance sevilla cordoba) 143)
		(= (distance sevilla gibraltar) 201)
		(= (distance sevilla granada) 252)
		(= (distance sevilla huelva) 95)
		(= (distance sevilla jaen) 246)
		(= (distance sevilla madrid) 534)
		(= (distance sevilla malaga) 209) ;km
		
        ; Driver situation
		(= (actual-fuel driver1) 50) ; l
		(= (total-fuel-used driver1) 0) ; l
		(= (fuel-consumption-rate driver1) 0.35) ; l/km
		(= (fuel-limit driver1) 1500) ; l
		(= (speed driver1) 100) ; km/h


        (= (remaining_transport_dt) 0)

		(at driver1 sevilla)
		(at box1 sevilla)
		(at box2 sevilla)
		(at box3 sevilla)
		
		(= (load driver1) 0)
		(= (max-load driver1) 15)

		(destination box2 almeria)
		(destination box1 barcelona)
		(destination box3 bilbao)

		(= (weight box1) 2)
		(= (weight box2) 3)
		(= (weight box3) 7)

        ; ------------------------------------------------
        ; Recognition
        ; ------------------------------------------------