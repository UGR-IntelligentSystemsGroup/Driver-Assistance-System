(define (problem prueba0) (:domain GantaBi)
	
    (:customization
        ;(= :time-format "%d/%m/%Y %H:%M:%S")
        (= :time-format "%d/%m/%Y %H:%M")
        (= :time-horizon-relative 86400) ;; que son los minutos que tienen 2 meses
        (= :time-start "01/01/2017 00:00:00")
        (= :time-unit :minutes)
    )

    (:objects
		driver1 driver2 driver3 - Driver
		jornada1 jornada2 jornada3 jornada4 jornada5 jornada6 jornada7
		jornada8 jornada9 jornada10 jornada11 jornada12 jornada13 jornada14 - Jornada

		C1 C2 C3 C4 C5 C6 C7 C8 C9 C10 C11 C12 C13 C14 C15 C16 C17 C18 C19 C20 C21 C22 C23 C24 C25 C26 C27 C28 C29 C30 C31 C32 C33 C34 C35 C36 C37 C38 C39 C40 C41 C42 C43 C44 C45 C46 C47 C48 C49 C50 C51 C52 C53 C54 C55 C56 C57 C58 C59 C60 C61 C62 C63 C64 C65 C66 C67 C68
        O1 O2 O3 O4 O5 O6 O7 O8 O9 O10 O11 O12 O13 O14 O15 O16 O17 O18 O19 O20 O21 O22 O23 O24 O25 O26 O27 O28
        P1 P2 P3 P4 P5 P6 P7 P8 P9 P10 P11 P12 P13 P14 P15 P16 P17 P18 P19 P20 P21 P22 P23 P24 P25 P26 P27 P28 P29 P30 P31 P32 P33 P34 P35 P36 P37 P38 P39 P40 P41 P42 P43 P44 P45 P46 P47 P48 P49 P50 P51 P52 P53 P54 P55
        E1 E2 E3 - TaskInstanceSymbol
		S1 S2 S3 S4 S5 - Semana
	)

    (:init
        (token-context na)
		(slice-context na)
  	    (legal-slice-context na)
		(daily-context na)
		(weekly-context na)
		(monthly-context na)



 		;;(inicio_semana S1 "1/01/2018 00:00:00")
 		;;(fin_semana S1 "7/01/2018 23:59:59")

 	    (modo_reconocer)
 	    (modo_depuracion)
		 
 		;;INICIALIZAR FUNCIONES
 		(= (tiempo_conduccion driver1) 0)
 		(= (tiempo_conduccion driver2) 0)
 		(= (tiempo_conduccion driver3) 0)
		(= (tiempo_otros driver1) 0)
 		(= (tiempo_otros driver2) 0)
 		(= (tiempo_otros driver3) 0)
		(= (tiempo_parada driver1) 0)
 		(= (tiempo_parada driver2) 0)
 		(= (tiempo_parada driver3) 0)
		(= (tiempo_espera  driver1) 0)
 		(= (tiempo_espera driver2) 0)
 		(= (tiempo_espera driver3) 0)

 		(= (dt_day driver1) 0)
 		(= (dt_day driver2) 0)
 		(= (dt_day driver3) 0)
		(= (tiempo_otros_dia driver1) 0)
 		(= (tiempo_otros_dia driver2) 0)
 		(= (tiempo_otros_dia driver3) 0)
		(= (tiempo_parada_dia driver1) 0)
 		(= (tiempo_parada driver2) 0)
 		(= (tiempo_parada_dia driver3) 0)
		(= (tiempo_espera_dia driver1) 0)
 		(= (tiempo_espera_dia driver2) 0)
 		(= (tiempo_espera_dia driver3) 0)

		(= (minutos_consumidos) 0)
		(= (contador_veces_AMPLIADA_en_semana) 0)


		(= (current_index_action) 0) ;; el indice de acciones empieza en 0.

		; (is_action C1) ;; cada accion tiene un simbolo asociado este simbolo es de tipo accion 
		; (index_action C1 0); cada simbolo de accion tiene asociado un indice, que empieza en 0
		; (is_typeC C1)  ;; es una accion de tipo conducir ... 
		; (start_action C1 "01/07/2018 00:00:00");; las acciones tienen un punto de inicio
		; (end_action C1 "01/07/2018 00:37:00");; ... y un punto de fin
		; (duration_action C1 37);; ... y una duracion

		; ;;(action_C C1 parametersC1) ;; asi es como se representa un "hecho de tipo accion"
		; (parameters_typeC C1 driver1);; 

		;;(0 C1 typeC "01/07/2018 00:00:00" "01/07/2018 01:59:00" 120 driver1)
		;;(1 O1 typeO "01/07/2018 02:00:00" "01/07/2018 02:59:00" 60 driver1)
		;;(2 P1 typeP "01/07/2018 03:00:00" "01/07/2018 04:59:00" 120 driver1)
		;;(3 E1 typeE "01/07/2018 05:00:00" "01/07/2018 06:59:00" 120 driver1)
		;;(4 C2 typeC "01/07/2018 07:00:00" "01/07/2018 07:59:00" 60 driver1)
		;;(5 O2 typeO "01/07/2018 10:00:00" "01/07/2018 10:59:00" 60 driver1)

(index_action S1 0)
(is_action S1)
(is_typeS S1)
(start_action S1 "03/01/2017 01:05")
(end_action S1 "03/01/2017 16:20")
(duration_action S1 1900)
(parameters_typeS S1 driver1)

(index_action C9 1)
(is_action C9)
(is_typeC C9)
(start_action C9 "03/01/2017 16:20")
(end_action C9 "03/01/2017 18:39")
(duration_action C9 139)
(parameters_typeC C9 driver1)

(index_action O5 2)
(is_action O5)
(is_typeO O5)
(start_action O5 "03/01/2017 18:39")
(end_action O5 "03/01/2017 18:40")
(duration_action O5 1)
(parameters_typeO O5 driver1)

(index_action N2 3)
(is_action N2)
(is_typeN N2)
(start_action N2 "03/01/2017 18:40")
(end_action N2 "03/01/2017 09:25")
(duration_action N2 885)
(parameters_typeN N2 driver1)

(index_action C10 4)
(is_action C10)
(is_typeC C10)
(start_action C10 "04/01/2017 09:25")
(end_action C10 "04/01/2017 09:29")
(duration_action C10 4)
(parameters_typeC C10 driver1)

(index_action P5 5)
(is_action P5)
(is_typeP P5)
(start_action P5 "04/01/2017 09:29")
(end_action P5 "04/01/2017 09:47")
(duration_action P5 18)
(parameters_typeP P5 driver1)

(index_action N3 6)
(is_action N3)
(is_typeN N3)
(start_action N3 "04/01/2017 21:13")
(end_action N3 "04/01/2017 06:21")
(duration_action N3 548)
(parameters_typeN N3 driver1)

(index_action C15 7)
(is_action C15)
(is_typeC C15)
(start_action C15 "05/01/2017 06:21")
(end_action C15 "05/01/2017 07:43")
(duration_action C15 82)
(parameters_typeC C15 driver1) 

(index_action P9 8)
(is_action P9)
(is_typeP P9)
(start_action P9 "05/01/2017 07:43")

(end_action P9 "05/01/2017 08:02")
(duration_action P9 19)
(parameters_typeP P9 driver1)

(index_action C16 9)
(is_action C16)
(is_typeC C16)
(start_action C16 "05/01/2017 08:02")
(end_action C16 "05/01/2017 11:10")
(duration_action C16 188)
(parameters_typeC C16 driver1)

(index_action P10 10)
(is_action P10)
(is_typeP P10)
(start_action P10 "05/01/2017 11:10")
(end_action P10 "05/01/2017 11:59")
(duration_action P10 49)
(parameters_typeP P10 driver1)


	(index_action C17 11)
(is_action C17)
(is_typeC C17)
(start_action C17 "05/01/2017 11:59")
(end_action C17 "05/01/2017 14:54")
(duration_action C17 175)
(parameters_typeC C17 driver1)


(index_action P11 12)
(is_action P11)
(is_typeP P11)
(start_action P11 "05/01/2017 14:54")
(end_action P11 "05/01/2017 15:44")
(duration_action P11 50)
(parameters_typeP P11 driver1)

(index_action C18 13)
(is_action C18)
(is_typeC C18)
(start_action C18 "05/01/2017 15:44")
(end_action C18 "05/01/2017 15:46")
(duration_action C18 2)
(parameters_typeC C18 driver1)

(index_action P12 14)
(is_action P12)
(is_typeP P12)
(start_action P12 "05/01/2017 15:46")
(end_action P12 "05/01/2017 16:54")
(duration_action P12 68)
(parameters_typeP P12 driver1)

(index_action C19 15)
(is_action C19)
(is_typeC C19)
(start_action C19 "05/01/2017 16:54")
(end_action C19 "05/01/2017 17:35")
(duration_action C19 41)
(parameters_typeC C19 driver1)


(index_action C21 16)
(is_action C21)
(is_typeC C21)
(start_action C21 "05/01/2017 18:39")
(end_action C21 "05/01/2017 18:45")
(duration_action C21 6)
(parameters_typeC C21 driver1)

(index_action P15 17)
(is_action P15)
(is_typeP P15)
(start_action P15 "05/01/2017 18:45")
(end_action P15 "05/01/2017 18:56")
(duration_action P15 11)
(parameters_typeP P15 driver1)

(index_action C22 18)
(is_action C22)
(is_typeC C22)
(start_action C22 "05/01/2017 18:56")
(end_action C22 "05/01/2017 19:02")
(duration_action C22 6)
(parameters_typeC C22 driver1)


(index_action S2 19)
(is_action S2)
(is_typeS S2)
(start_action S2 "04/01/2017 21:13")
(end_action S2 "04/01/2017 06:21")
(duration_action S2 1500)
(parameters_typeS S2 driver1)

(index_action C23 20)
(is_action C23)
(is_typeC C23)
(start_action C23 "06/01/2017 07:36")
(end_action C23 "06/01/2017 07:38")
(duration_action C23 2)
(parameters_typeC C23 driver1)

 	
        ( = (current_rt) 0)
        ( = (dt_current_slice) 0)
 	)

	(:tasks-goal
		:tasks 
				;(P driver1 ?dur)
				;(add_the_current_action_to_plan typeP ?dur)	
				;(PROCESA_accion_normal driver1)
				(
				 ; 	(P_A driver1)
					; (P_A driver1)
					; (P_A driver1)
					; (P_A driver1)
					; (P_A driver1)
					; (P_A driver1)
					
					;(A driver1)
					(A_B_T3 driver1);;success
				)
		       			
		    	; (conduce_un_dia driver1)
	)
)