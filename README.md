# IMLAP - Driver Activity Recognition

Integrating Machine Learning with Automated Planning

## Planning

1. tomar y analizar el log de gantabi,

2. formarse en el dominio para recognition, depurar y corregirlo (Septiembre).

3. Una vez que funcione bien, crear el modelo descriptivo, aplicar técnicas de clasificación para caracterizar los recursos (Octubre),

4. con esa caracterización completar/extender/enriquecer el dominio de recognition de forma que no solo reconozca qué es lo que persigue sino también cómo completar el plan actual (inicialmente las tareas para completar el plan inspiradas en zeno y logistics)(Noviembre).

5. Experimentación (Diciembre).

6. Pensar cómo incorporar y manejar incertidumbre.

## Doubts

- El tiempo de otros trabajos no cuenta para nada, no? Me resulta raro pero no viene explícitamente dicho en ningún lado.

- Token de salida split, ¿con o sin número?




- **IMPORTANTE** Cuál tiene que ser la salida? (Formato)
  - Driver - DatetimeStart - DatetimeEnd - Duration - Activity (DOBI) -- DrivingDayType (ndd/edd) - DrivingPeriod (split/continuous) - Sequence (cdds/cdde) - Token (elt=A, b_t1, b_t2, b_t3, rd_normal=Rg11, rd_reduced=Rg3, wr_normal=Rg45, wr_reduced=Rg24) ???

  - Because of that, every event in the event log is annotated with four labels3 according to the contexts day (with possible values ndd or edd), driving period (continuous or splitted), sequence (cdds or cdde) and token (elt, b t1, b t2, b t3, rd normal, rd reduced, wr normal, wr reduced).

  - La cosa es que la salida no es lo mismo que pone aquí, verdad?

  - Un token más diciendo que se ajusta a la regulación? O los none indican eso?

  - Hablar también de la conducción semanal y descanso de compensación

- **IMPORTANTE** La regulación HOS cambió en junio de 2020: https://www.fmcsa.dot.gov/regulations/hours-of-service

- Por dónde empiezo? Qué fallos tiene?
  - Entiendo que uno de los fallos son los NA, no reconoce si es NDD o EDD

  - Tambien veo que hay Breaks que marca con contexto de Activity. Parece que son los de <15m. Se deberían marcar como Idle? La cosa es que en el dataset vienen que son pausas, lo pongo entonces como B_T0. Técnicamente si está cerca de 15 y viene después de una conducción debería considerarse como Break, pero si es de pocos minutos es más lógico considerarlo como Idle.

  - The HoS regulation establishes that a basic sequence is a sequence of any number of activities such that the duration of any Pause is strictly less than 15 mins. Tengo entonces que poner B_T0 como A?

- Si hay una memoria o cualquier tipo de documento adicional con información sobre esto lo agradecería.

- Para asegurarme: El backtracking deshace los efectos de un inline, verdad? Refiriéndome a casos como:
  - (b_daily_context NDD) <- Inline, si sale se deshace, no?
  - (CDD ?d)
  - (e_daily_context NDD)

- B_T3 pasa como máximo de 45m a 3h, pero si pasa de 45 debería ser una anomalía. No sería mejor modelarlo con otra tarea? Por qué si se quita no funciona?

- Por qué esa nomenclatura en los Breaks (1,2,3), no sería más legible que estén ordenados?

- **IMPORTANTE** Las horas de Other no se deberían contar? Sino estamos contando jornadas de >9h como NDD si conduce poco (probablemente sea un repartidor que pasa más tiempo entregando cosas)

- No entiendo por qué la task EDD es así. Cada CDDs_S tiene un RD dentro por lo que en total habría 3 para una supuesta jornada. La cosa es que el día 06/01 lo coge bien.

- Cuál es el dataset "más limpio"? (Del que partir)

- DXX, OXX... las XX significan algo?

- Los breaks pequeños no cambiaban el contexto, por algún motivo? No se quieren esos tokens en el log?

- Qué será más eficiente, (horas_en_minutos) o (hora_en_minutos)?

- En general no entiendo bien los contextos. En el paper sí, pero no lo implementado. Es para añadir tokens a la salida, no?

- 183 minutos sigue siendo un B_T3 o un B_T4?

- Muy pocos "En espera". Es normal?

- Por qué las durative-actions no tienen un último paréntesis que cierre?

- task P_A: el orden de los métodos está considerado?

- Por lo que parece no puedo usar las trazas del doc, son para otra versión del dominio.

- (modo_generar) bucle infinito? Qué hace? se añade directamente la primitiva al plan (y si no se pueden cumplir las restricciones/condiciones pues fallará?
  - Para generar acciones deberíamos saber localización y recursos, no?

  - Lo que sí se podría hacer (con lo que hay) es indicar que tiene que hacer actividades y sus descansos.

- No está modelado el weakly rest (WD), verdad?

- La gramática de atributos es puramente informativa?

- Habrá que modelar también el Team Daily Driving?

- Acción 115: Dos conductores? Va desde 11 17pm a 12 3am, siguiendo sin pausa grande hasta 12 6am -> O eso o es una jornada de 13h, capaz

- Ejemplo_Dataset_Anonimizado: Datos erróneos.
  - El encabezado está mal. Hay que cambiar 2ª latitud de inicio por latitud_final.

  - En las pausas cambian las coordenadas. El cuentakilómetros en cambio no.

  - Coordenadas incoherentes. En pausas pasa de ~400.000 a ~40.000.000

  - En sí los valores no tienen sentido, deberían ser +-90 o +-180. Probablemente estén usando decimales sin haberlos marcados, pero de cuánta precisión?

- Si pillo las últimas actividades (desde 136 hasta el final) me mata el proceso por falta de memoria.
  - Creo que es por la recursión en la task CDD_T2_SEQUENCE. Si el caso base no funciona debe por narices probarlo de nuevo pero con la recursión? Si le pongo el (!) consigo que me lo lea bien -> Pero no coges los token cdd_t2_start y cdd_t2_slice, por lo que lo quito

## Commands

./planner/planner -d hpdl/domain.pddl -p hpdl/problem-recognition.pddl

./planner/siadex-verbose -d hpdl/domain.pddl -p hpdl/problem-recognition.pddl

## Notes

- C_p2 ;_p es sufijo de primitiva; 2 is because action as contexts in parameters

- Los metatags son una extensión del lenguaje que actualmente está en fase experimental, por lo que puede cambiar en futuras versiones. El concepto subyacente a los metatags es poder incluir información extra en el dominio, que aunque no sea directamente utilizable por el planificador, pueda ser utilizada por otros módulos, o en un análisis posterior del plan resultante.

- El corte (!) es otro de los conceptos introducidos para mejorar la eficiencia del proceso de planificación. Este concepto está tomado del lenguaje PROLOG [PROLOG] donde se utiliza para “olvidar” las unificaciones previas si se vuelve por backtracking. Obviamente el uso del corte afecta a la completitud del proceso de refutación, por lo que debe de ser utilizado con cuidado. En HTN-PDDL es posible usar el corte para parar el backtracking en dos lugares distintos:

  - En la definición de precondiciones: Su uso es exactamente el mismo que el corte de PROLOG. Se toma de la lista de posibles unificaciones una de forma no determinista y se descarta el resto. Si se vuelve por backtracking no se vuelven a considerar el resto de las unificaciones. En dominios con muchas unificaciones usado con cuidado puede utilizarse para acelerar mucho el procesamiento y reducir el backtracking, sin que por ello se vea afectada la completitud.

  - En la lista de métodos de una tarea abstracta. Sirve para que una vez que se han probado como ciertas las precondiciones de un método se descarte probar con el resto de métodos. Nuevamente usado con cuidado este corte tampoco tiene por que afectar a la completitud del algoritmo. El escritor de dominios puede conocer que los métodos son mutuamente excluyentes y que una vez que se prueba con uno, el resto ya son inválidos.

- According to Regulation (EC) No 561/2006, a driver must not drive for more than 4.5h without taking a break of at least 45 min duration, during which the driver may not carry out any work. The break can also be taken in two parts, whereas the first part must have a duration of at least 15 min and the second part must have a duration of at least 30 min. After a total of 9 h of driving, a driver must take a rest period of 11 h duration, during which the driver may freely dispose of her or his time. Similar to break periods, rest periods can also be taken in two parts, whereas the first part must have a duration of at least three hours and the second part must have a duration of at least nine hours. Thus, if a rest period is taken in two parts, a total rest of 12 h is required before the driver may continue to drive again. Three times a week, the regular duration of a rest period may be reduced to at least 9 h, and twice a week, the total driving time between rests may be extended to 10 h. In any case, the required amount of rest must have been taken within 24 h after the end of the previous rest period. The accumulated amount of driving and the accumulated amount of working within a week are restricted to at most 56 and 60 h and a weekly rest period of at least 45 h must be taken after at most 144 h after the end of the previous weekly rest period. Alternatively, a reduced weekly rest period of 24 h may be taken if the reduction is compensated by an equivalent period of rest taken in a subsequent week. The regulation constrains the total accumulated driving time during any two consecutive calendar weeks to at most 90 h and in any period of four months, the average working time during a calendar week must not exceed 48 h.

### Changes

- NA context by default or after daily_reset -> Lo cambio a NONE

- Generado dataset.csv desde Ejemplo Dataset 2

- Usando nomenclatura inglesa

- Quitando métodos, predicados y funciones que no se usan

- Limpiado los archivos pddl

- parsers del dataset rehechos.

- Árbol de actividades hecho (versión antigua)

- Añadido (casi, creo) todos los tipos de breaks

- En los prettyprint de las acciones DOBI he pasado de CSV con ; a TSV. La salida es más legible de por sí, y a la hora de pasarlo a un dataset no habría problema.

- **IMPORTANTE** Si cada vez que se llama a las tareas semi-básicas (A, B_T1...) se cambia de contexto, no podría hacerse dentro de ellas?. En los Breaks está comentado, por qué?
  - Si fuera para usar en unas b_tk, en otras b_slice y b_legal_slice lo entendería, pero no es el caso.

  - Concretely, every task in the right hand side of a production {a : b1 .. bn }, is extended as {a : sb1 b1 eb1 ... sbn bn ebn} where the new tasks sbi,ebi are used to (1) delimit the start (sbi) and end (ebi) of the decomposition of a task (sbi), (2) add to the state information about the label corresponding to that task (which can be interpreted as the current decomposition context). For example the production {cdd : cdds cdde} is extended as {cdd : scdds cdds ecdds scdde cdde ecdde}, scdds asserts the context ’cdds’ to the state, and ecdds retracts that context. Finallly, the primitive durative actions associated with each event are extended with new parameters (one for each type of label) and tasks devoted to recognize events (as the one shown in Figure 4) are extended to capture the information added to the state by the newly added delimiting tasks, and adding primitive tasks which embody information about the context.

  - Puestos dentro

- Por qué no hay O_p2 ni E_p2? Los he cambiado para que haya alternativa con contexto

- Output:
  - DayType (ndd/edd), BreakType (split/uninterrupted/none), Sequence (start/end/unique), Token (A, B_T0...)
  - unique: No splits, Activities ending with a RD
  - breakType none: No breaks that are not RD

  - DayType: Normal (9h) or Extended(10h)
  - Sequence: First sequence (<4.5h), second or third (only if EDD)
  - BreakType: Split, uninterrupted or unique (if ending in RD)
  - Split: First or second
  - Token: Specific activity

- Simplificado el dominio

- Intervalos de los Breaks ampliados para no ser estrictos

### Notation

| Símbolo | Actividad        | Tipo Acción | Índice Registro |
|---------|------------------|-------------|-----------------|
| C (D)   | Conducción (Drive) | typeC     | 0               |
| E (I)   | Espera (Idle)      | typeE     | 1               |
| O (O)   | Otros  (Other)     | typeO     | 2               |
| P (B)   | Pausa  (Break)     | typeP     | 3               |
| N       | Descanso Diario  | typeN       | 4               |
| S       | Descanso Semanal | typeS       | 5               |

| Símbolo | Significado |
|-----|----|
| B | Break |
| A | Actividad (si break -> B < 15m)|
| P_A | Process Activity, trozo de A
| CDD | continuous Daily Driving
| CDD_T1 | Continued Daily Driving of type 1 (normal, sin partición)
| CDD_T2 | Continued Daily Driving of type 2 (particionada)
| CDDs_S | continuous Daily Driving - Start
| CDDs_E | continuous Daily Driving - End
| NDD | Normal Daily Driving
| EDD | Extended Daily Driving - En total <10h
| RD | Daily Rest
| RW | Weekly Rest
| TDD | Team Daily Driving
| SRDD | Split Rest Daily Driving
| WD | Weekly Driving
|||
| slice | Subsequence
| rt | Rest time
| dt | Driving time
| BWD |
| A_B_T3 | SUBSECUENCIA TERMINADA EN B_T3
| elt | element
| baseq | basic sequence

### Tipos de descansos

```
B_T0; BREAK LESSER THAN 15 mins

//From 15 mins a pause is considered a BREAK
B_T2: BREAK of [15min, 30min)   -> [15, 45)
B_T3: BREAK OF [30min, 45min)   -> [30, 60)
B_T1: BREAK OF [45min, 3h)      -> [45, 3.5)

// RESTS are breaks of at least 3 hours.
B_T4: break of [3h, 9h)
B_T5: break of [9h, 11h)
B_T6: BREAK OF [11h, 24h)
B_T7: BREAK OF [24h, 45h)
B_T8: BREAK OF (9, 45-24+9) - COMPENSATION BREAK - PROBLEMATICO 
B_T9: BREAK OF TEAM.
B_T10: BREAK OF [45h,infty)
```

### Log

|  |  |
| --- | --- |
| (index_action O5 18) | Nombre de la acción (en este caso Other Work) e índice en la secuencia completa
| (is_action O5) | Para indicar que es una acción
| (is_typeO O5) | Indicar el tipo Other Work
| (start_action O5 "03/01/2017 18:39") | Datetime de inicio
| (end_action O5 "03/01/2017 18:40") | Datetime de fin
| (duration_action O5 1) | Duración en segundos
| (parameters_typeO O5 driver1) | Conductor asociado

CDD_T1 (Driving continous): A(4.5th) - B_T1(45m) - A - RD(>9h)
CDD_T2 (Driving split): A(4.5h) - B_T1/2/3 - A - B_T1/2/3   (Si el primero fue 3, luego 1, e viceversa? O siempre la primera de 15)


; (:inline
; 	(bind ?n
; 		(dt_current_cdd))
; 	()
; )
; (:inline
;     (:print ?n)
;     ()
; )
; (:inline
;     (:print "HOLA")
;     ()
; )