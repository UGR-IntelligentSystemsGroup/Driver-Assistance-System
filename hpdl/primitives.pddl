;CADA tarea primitva PUEDE AÑADIRSE AL PLAN EN DOS MODOS DISTINTOS: modo reconocer "token" o modo generar
;Por tanto cada tarea primitiva tiene asociada una tarea compuesta con dos metodos, uno para el modo reconocer plan y otro para el modo generar plan
; el modo GENERAR plan es el de siempre: se añade directamente la primitiva al plan (y si no se pueden cumplir las restricciones/condiciones pues fallará ). 
; el modo RECONOCER parte de que en el estado inicial hay una secuencia de acciones que hay que reconocer
; IMPORTANTE: estos dos metodos no son alternativas de hacer una tarea, son  dos formas excluyentes de hacer una tarea, e.d., si entra por un metodo y falla, 
; entonces no entra por el otro y la tarea compuesta directamente falla. Por eso tiene el simbolo ! (corte alla PROLOG)

(:task D
	:parameters (?d - Driver ?dur - number) 
	(!
		(:method modo_generar
			:precondition (modo_generar)
			:tasks
			(
				(:inline
					(bind ?dur
						(calcula_duracion_C ?d))
					()
				)
				(D_p ?d ?dur))
		)
		(:method modo_reconocer
			:precondition (modo_reconocer)
			:tasks
			(
				(add_the_current_action_to_plan typeC ?dur)
				;incrementar el current index para reconocer la siguiente accion de la secuencia)
				(:inline
					()
					(increase (current_index_action) 1)
				)
			)

		)
	)

) ; observar, ESTO SIGNIFICA lo siguiente

;add_the corrent action to plan consiste en:
; k = current_index
; Comprobar la condicion de  reconocimiento de token
; accion(k) es de tipo Conducir (en el caso de :task C...
; Si se cumple la condicion de reconocimiento de token
; capturar parametros (parameters_typeC (symbol(accion(k))) ?p1 ?p2 ... ?pn) , hay que saber cuantos parameters tiene cada accion
; capturar inicio, fin, duracion
; ( (AND (=?start inicio)(= ?end fin) (= ?duration duracion))
;	 (D_p ?p1 ?p2 ... ?pn)
; Si se inserta con exito, entonces es cuando hay que INCREMENTAR_CURRENT_INDEX para capturar la siguiente acción del plan

; ES IMPORTANTE, CRUCIAL, PASARLE EL TIPO "TypoConduccion" porque la interpretación aquí es:
; "El planificador espera que, para que la accion se reconozca como parte de una secuencia <del_tipo_qu_sea>, 
;	(1) la accion tiene que ser NECESARIAMENTE de tipo <typeC> y
;  (2) las restricciones temporales de la accion tienen que ser satisfacibles con el estado actual del plan reconocido"

;*********************************************************************************************************
; POR CADA TIPO DE ACCION PRIMITIVA ASOCIAR UNA TAREA COMPUESTA QUE TENGA MODO RECONOCER Y MODO GENERAR
;*********************************************************************************************************

(:task O
	:parameters (?d - Driver ?dur - number) 
	(!
		(:method modo_generar
			:precondition (modo_generar)
			:tasks (
				(:inline
					(bind ?dur
						(calcula_duracion_O ?d))
					()
				)
				(O_p ?d ?dur)
			)
		)

		(:method modo_reconocer
			:precondition (modo_reconocer)
			:tasks (
				(add_the_current_action_to_plan typeO ?dur)
				;incrementar el current index para reconocer la siguiente accion de la secuencia)
				(:inline
					()
					(increase (current_index_action) 1)
				)
			)
		)
	)
)

(:task B
	:parameters (?d - Driver ?dur - number) 
	(!
		(:method modo_generar
			:precondition (modo_generar)
			:tasks (
				(:inline
					(bind ?dur
						(calcula_duracion_P ?d))
					()
				)
				(B_p ?d ?dur)
			)
		)
		(:method modo_reconocer
			:precondition (modo_reconocer)
			:tasks (
				(add_the_current_action_to_plan typeP ?dur)
				;incrementar el current index para reconocer la siguiente accion de la secuencia)
				(:inline
					()
					(increase (current_index_action) 1)
				)				
			)
		)
	)
)

(:task I
	:parameters (?d - Driver ?dur - number) 
	(!
		(:method modo_generar
			:precondition (modo_generar)
			:tasks (
				(:inline
					(bind ?dur
						(calcula_duracion_E ?d))
					()
				)
				(I_p ?d ?dur)
			)
		)
		(:method modo_reconocer
			:precondition (modo_reconocer)
			:tasks (
				(add_the_current_action_to_plan typeE ?dur)
				;incrementar el current index para reconocer la siguiente accion de la secuencia)
				(:inline
					()
					(increase (current_index_action) 1)
				)
			)
		)
	)
)

; =========================================================================
; PREDICADOS DERIVADOS QUE REPRESENTAN LA "CONDICION DE RECONOCIMIENTO DE TOKEN"
; 
; SE REPLICA LA MISMA CONDICION PARA CADA TIPO DE ACCION PRIMITIVA (COPE)
; Solo cambia el (is_type)
; =========================================================================

(:derived
	(currentindex_es_typeC ?k ?sa)	; ?K y ?sa se pasan "POR REFERENCIA" (en HPDL se puede, en OTROS PDDL lenguajes no), ES DECIR, se calculan dentro
	(and (bind ?k
			(current_index_action))	; CAPTURO EL INDICE ACTUAL DE SECUENCIA DE ACCIONES
		(index_action ?sa ?k)		; CAPTURO EL SIMBOLO DE LA ACCIONES(K)
		(is_typeC ?sa)				; PREGUNTO SI EL SIMBOLO ES typeC
	)
)

(:derived
	(currentindex_es_typeO ?k ?sa)
	(and (bind ?k
			(current_index_action))
		(index_action ?sa ?k)
		(is_typeO ?sa)
	)
)

(:derived
	(currentindex_es_typeP ?k ?sa)
	(and (bind ?k
			(current_index_action))
		(index_action ?sa ?k)
		(is_typeP ?sa)
	)
)

(:derived
	(currentindex_es_typeE ?k ?sa)
	(and (bind ?k
			(current_index_action))
		(index_action ?sa ?k)
		(is_typeE ?sa)
	)
)

; -------------------------------------------------------------------------

(:task add_the_current_action_to_plan
	:parameters (?tact - TipoAccion ?dur - number) (!
	(:method tipo_Conducir
		; captura el indice actual de la secuencia de acciones y el simbolo de accion asociado
		; si en la secuencia de entrada hay una accion typeC y "me espero" una acción typeC
		:precondition (and (currentindex_es_typeC ?k ?sa) (= ?tact typeC))
		:tasks (
			(:inline
				(and (parameters_typeC ?sa ?driver)
					(start_action ?sa ?inicio)
					(end_action ?sa ?final)
					(duration_action ?sa ?dur))
				()
			)
			;captura el contexto
			(:inline
				(and (token-context ?tkctxt)
					(slice-context ?slctxt)
					(legal-slice-context ?lsctxt)
					(daily-context ?dayctxt)
					(weekly-context ?weectxt)
					(monthly-context ?monctxt))
				()
			)
			(
				(and (= ?start ?inicio) (= ?end ?final) (= ?duration ?dur))
			 	(D_p2 ?driver ?dur ?tkctxt ?slctxt ?lsctxt ?dayctxt ?weectxt ?monctxt)
			)
		)
	)

	(:method tipo_OTROS
		:precondition (and (currentindex_es_typeO ?k ?sa) (= ?tact typeO)); captura el indice actual de la secuencia de acciones y el simbolo de accion asociado
		:tasks (
			(:inline
				(and (parameters_typeO ?sa ?driver)
					(start_action ?sa ?inicio)
					(end_action ?sa ?final)
					(duration_action ?sa ?dur))
				()
			)
			;captura el contexto
			(:inline
				(and (token-context ?tkctxt)
					(slice-context ?slctxt)
					(legal-slice-context ?lsctxt)
					(daily-context ?dayctxt)
					(weekly-context ?weectxt)
					(monthly-context ?monctxt))
				()
			)
			(
				(and (= ?start ?inicio) (= ?end ?final) (= ?duration ?dur))
				(O_p2 ?driver ?dur ?tkctxt ?slctxt ?lsctxt ?dayctxt ?weectxt ?monctxt)
			)
		)
	)

	(:method tipo_PAUSA
		:precondition (and (currentindex_es_typeP ?k ?sa) (= ?tact typeP)); captura el indice actual de la secuencia de acciones y el simbolo de accion asociado
		:tasks (
			(:inline
				(and (parameters_typeP ?sa ?driver)
					(start_action ?sa ?inicio)
					(end_action ?sa ?final)
					(duration_action ?sa ?dur))
				()
			)
			;captura el contexto
			(:inline
				(and (token-context ?tkctxt)
					(slice-context ?slctxt)
					(legal-slice-context ?lsctxt)
					(daily-context ?dayctxt)
					(weekly-context ?weectxt)
					(monthly-context ?monctxt))
				()
			)
			(
				(and (= ?start ?inicio) (= ?end ?final) (= ?duration ?dur))
				(B_p2 ?driver ?dur ?tkctxt ?slctxt ?lsctxt ?dayctxt ?weectxt ?monctxt)
			)
		)
	)

	(:method tipo_ESPERA
		:precondition (and (currentindex_es_typeE ?k ?sa) (= ?tact typeE)); captura el indice actual de la secuencia de acciones y el simbolo de accion asociado
		:tasks (
			(:inline
				(and (parameters_typeE ?sa ?driver)
					(start_action ?sa ?inicio)
					(end_action ?sa ?final)
					(duration_action ?sa ?dur))
				()
			)
			;captura el contexto
			(:inline
				(and (token-context ?tkctxt)
					(slice-context ?slctxt)
					(legal-slice-context ?lsctxt)
					(daily-context ?dayctxt)
					(weekly-context ?weectxt)
					(monthly-context ?monctxt))
				()
			)
			(
				(and (= ?start ?inicio) (= ?end ?final) (= ?duration ?dur))
				(I_p2 ?driver ?dur ?tkctxt ?slctxt ?lsctxt ?dayctxt ?weectxt ?monctxt)
			)
		)
	)
	)
)

; (:durative-action b_tk 
; 	:parameters (?ctxt - context)
; 	:meta( 
; 		(:tag prettyprint "");BEGIN TOKEN ?ctxt")
; 		)
; 	:duration (= ?duration 0)
; 	:condition (token-context ?current)
; 	:effect (and (token-context ?ctxt) (not (token-context ?current))))

; (:durative-action e_tk 
; 	:parameters (?ctxt - context)
; 	:meta( 
; 		(:tag prettyprint "");END TOKEN ?ctxt")
; 		)
; 	:duration (= ?duration 0)
; 	:condition()
; 	:effect (and (not (token-context ?ctxt)) (token-context none)))

; -------------------------------------------------------------------------
; Contexts
; -------------------------------------------------------------------------

(:task b_tk
	:parameters (?ctxt - context) 
	(:method unico
		:precondition ()
		:tasks (
			:inline (token-context ?current)
			(and (token-context ?ctxt) 
				 (not (token-context ?current))
			)
		)
	)
)

(:task e_tk
	:parameters (?ctxt - context) 
	(:method unico
		:precondition ()
		:tasks (
			:inline ()
			(and (not (token-context ?ctxt)) (token-context none))
		)
	)
)

; -------------------------------------------------------------------------

(:task b_slice
	:parameters (?ctxt - context) 
	(:method unico
		:precondition ()
		:tasks (
			:inline
			(slice-context ?current)
			(and (slice-context ?ctxt) (not (slice-context ?current)))
		)
	)
)

(:task e_slice
	:parameters (?ctxt - context) 
	(:method unico
		:precondition ()
		:tasks (
			:inline
			()
			(and (not (slice-context ?ctxt)) (slice-context none))
		)

	)
)

; -------------------------------------------------------------------------

(:task b_legal_slice
	:parameters (?ctxt - context) 
	(:method unico
		:precondition ()
		:tasks (
			:inline
			(legal-slice-context ?current)
			(and (legal-slice-context ?ctxt) (not (legal-slice-context ?current)))
		)
	)
)

(:task e_legal_slice
	:parameters (?ctxt - context) 
	(:method unico
		:precondition ()
		:tasks (
			:inline
			()
			(and (not (legal-slice-context ?ctxt)) (legal-slice-context none))
		)

	)
)

; -------------------------------------------------------------------------

(:task b_daily_context
	:parameters (?ctxt - context) 
	(:method unico
		:precondition ()
		:tasks (
			:inline
			(daily-context ?current)
			(and (daily-context ?ctxt) (not (daily-context ?current)))
		)
	)
)

(:task e_daily_context
	:parameters (?ctxt - context) 
	(:method unico
		:precondition ()
		:tasks (
			:inline
			()
			(and (not (daily-context ?ctxt)) (daily-context none))
		)

	)
)

; -------------------------------------------------------------------------
; Primitives
; -------------------------------------------------------------------------
; DRIVING

(:durative-action D_p ;_p es sufijo de primitiva
	:parameters (?d - Driver ?dur - number)
	:duration (= ?duration ?dur)
	:condition ()
	:effect (increase (tiempo_conduccion ?d) ?dur)
)

(:durative-action D_p2 ;_p es sufijo de primitiva; 2 is because action as contexts in parameters
	:parameters (?d - Driver ?dur - number ?tkctxt ?slctxt ?lsctxt ?dayctxt ?weectxt ?monctxt - context)
	:meta (
		;(:tag prettyprint "?dayctxt ?lsctxt    ?slctxt ?tkctxt   CONDUCIENDO ?dur")
		; (:tag prettyprint "?d,?start,?end,?duration,CONDUCIENDO,?dayctxt,?lsctxt,?slctxt,?tkctxt"))
		(:tag prettyprint "?d	?start	?end	?duration	Driving	?dayctxt	?lsctxt	?slctxt	?tkctxt"))
		:duration (= ?duration ?dur)
		:condition (and
			(:print "Recognized [DRIVING] task for driver ")
			(:print ?d)
			(:print " of ")
			(:print ?dur)
			(:print "minutes\n")
		)
		:effect (increase (tiempo_conduccion ?d) ?dur)
)

; -------------------------------------------------------------------------
; OTHER WORK

(:durative-action O_p
	:parameters (?d - Driver ?dur - number)
	:duration (= ?duration ?dur)
	:condition ()
	:effect (increase (tiempo_otros ?d) ?dur)
)

(:durative-action O_p2
	:parameters (?d - Driver ?dur - number ?tkctxt ?slctxt ?lsctxt ?dayctxt ?weectxt ?monctxt - context)
	:meta (
		;(:tag prettyprint "?dayctxt ?lsctxt    ?slctxt ?tkctxt     PARADA ?dur")
		; (:tag prettyprint "?d,?start,?end,?duration,OTRO TRABAJO,?dayctxt,?lsctxt,?slctxt,?tkctxt"))
		(:tag prettyprint "?d	?start	?end	?duration	Other	?dayctxt	?lsctxt	?slctxt	?tkctxt"))
		:duration (= ?duration ?dur)
		:condition (and
			(:print "Recognized [OTHER] task for driver ")
			(:print ?d)
			(:print " of ")
			(:print ?dur)
			(:print "minutes\n")
		)
		:effect (increase (tiempo_otros ?d) ?dur)
)

; -------------------------------------------------------------------------
; BREAK

(:durative-action B_p
	:parameters (?d - Driver ?dur - number)
	:duration (= ?duration ?dur)
	:condition ()
	:effect (increase (tiempo_parada ?d) ?dur)
)

(:durative-action B_p2
	:parameters (?d - Driver ?dur - number ?tkctxt ?slctxt ?lsctxt ?dayctxt ?weectxt ?monctxt - context)
	:meta (
		;(:tag prettyprint "?dayctxt ?lsctxt    ?slctxt ?tkctxt     PARADA ?dur")
		; (:tag prettyprint "?d,?start,?end,?duration,PARADA,?dayctxt,?lsctxt,?slctxt,?tkctxt"))
		(:tag prettyprint "?d	?start	?end	?duration	Break	?dayctxt	?lsctxt	?slctxt	?tkctxt"))
		:duration (= ?duration ?dur)
		:condition (and
			(:print "Recognized [BREAK] task for driver ")
			(:print ?d)
			(:print " of ")
			(:print ?dur)
			(:print "minutes\n")
		)
		:effect (increase (tiempo_parada ?d) ?dur)
)

; -------------------------------------------------------------------------
; IDLE

(:durative-action I_p
	:parameters (?d - Driver ?dur - number)
	:duration (= ?duration ?dur)
	:condition ()
	:effect (increase (tiempo_espera ?d) ?dur)
)

(:durative-action I_p2
	:parameters (?d - Driver ?dur - number ?tkctxt ?slctxt ?lsctxt ?dayctxt ?weectxt ?monctxt - context)
	:meta (
		;(:tag prettyprint "?dayctxt ?lsctxt    ?slctxt ?tkctxt     ESPERA ?dur")
		(:tag prettyprint "?d	?start	?end	?duration	Idle	?dayctxt	?lsctxt	?slctxt	?tkctxt"))
		:duration (= ?duration ?dur)
		:condition (and
			(:print "Recognized [IDLE] task for driver ")
			(:print ?d)
			(:print " of ")
			(:print ?dur)
			(:print "minutes\n")
		)
		:effect (increase (tiempo_espera ?d) ?dur)
)

; -------------------------------------------------------------------------

; (:derived (diferente ?x ?y) {return ?x != ?y})
; (:derived (igual ?x ?x) ())
				
(:action break
	:parameters ()
	:precondition ()
	:effect ()
)