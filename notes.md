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

- **IMPORTANTE** SIADEX puede estar mal: Si se llama/recorre una acción/inline que hace cierto un predicado ya cierto, si hace backtracking lo elimina (debería comprobar el estado anterior del predicado y restaurarlo, verdadero o cierto). Para solventarlo hay que poner en las precondiciones que ese predicado no es cierto. Puedo entender que si la acción se llama dos veces ocurra (puesto que los efectos solo deberían modelar lo que cambia), pero solo por recorrerla no parece intuitivo.

- Contextos semanales y bisemanales? Números, o decir que es normal?

- He mirado un poco y parece que no, pero se puede forzar el prettyprint de flotantes a enteros?

- Otros trabajos no computan horas de conducción, pero sí jornada máxima. **IMPORTANTE**: El dominio aún no lo tiene en cuenta.

- Contexto de salida split, ¿con o sin número?

- Intervalos de los Breaks ampliados para no ser estrictos. Si lo que queremos es reconocer patrones nos interesa, si lo que queremos es que los conductores se ajusten a la regulación no deberían ampliarse.

- Puedo subir el dataset, las trazas o los resultados a GitHub? Por si acaso son privados

- Puede que haya datos de conducción en equipo que no se tengan en cuenta (en menos de dos semanas dos conductores por misma matrícula)

- Habrá que modelar también el Team Daily Driving?

## Commands

./planner/planner -d hpdl/domain.pddl -p hpdl/problem-recognition.pddl

./planner/siadex-verbose -d hpdl/domain.pddl -p hpdl/problem-recognition.pddl

## Notes

- **IMPORTANTE** La regulación HOS cambió en junio de 2020: https://www.fmcsa.dot.gov/regulations/hours-of-service

- Las coordenadas del dataset usan precisión decimal de 6 dígitos pero falta el signo, por lo que no las podemos usar tal cuál. La longitud de fin está mal de todas maneras. También en las pausas cambian las coordenadas, mientras que el cuentakilómetros no.

- Los metatags son una extensión del lenguaje que actualmente está en fase experimental, por lo que puede cambiar en futuras versiones. El concepto subyacente a los metatags es poder incluir información extra en el dominio, que aunque no sea directamente utilizable por el planificador, pueda ser utilizada por otros módulos, o en un análisis posterior del plan resultante.

- El corte (!) es otro de los conceptos introducidos para mejorar la eficiencia del proceso de planificación. Este concepto está tomado del lenguaje PROLOG [PROLOG] donde se utiliza para “olvidar” las unificaciones previas si se vuelve por backtracking. Obviamente el uso del corte afecta a la completitud del proceso de refutación, por lo que debe de ser utilizado con cuidado. En HTN-PDDL es posible usar el corte para parar el backtracking en dos lugares distintos:

  - En la definición de precondiciones: Su uso es exactamente el mismo que el corte de PROLOG. Se toma de la lista de posibles unificaciones una de forma no determinista y se descarta el resto. Si se vuelve por backtracking no se vuelven a considerar el resto de las unificaciones. En dominios con muchas unificaciones usado con cuidado puede utilizarse para acelerar mucho el procesamiento y reducir el backtracking, sin que por ello se vea afectada la completitud.

  - En la lista de métodos de una tarea abstracta. Sirve para que una vez que se han probado como ciertas las precondiciones de un método se descarte probar con el resto de métodos. Nuevamente usado con cuidado este corte tampoco tiene por que afectar a la completitud del algoritmo. El escritor de dominios puede conocer que los métodos son mutuamente excluyentes y que una vez que se prueba con uno, el resto ya son inválidos.

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

---

Domain-strict:

- Simplificado el dominio

- Ajustado estrictamente a la regulación (los intervalos)

- Output:
  - Week: Week number
  - Day: Day number

  - DayType: Normal (ndd, 9h) or Extended (edd, 10h)
  - Sequence: First sequence (<4.5h), second or third (only if EDD)
  - BreakType: Split, uninterrupted or unique (if ending in RD)
  - Split: First or second
  - Token: Specific activity

  - Legal: Indica si se ha cometido una ilegalidad (no se ha reconocido algún patrón). Técnicamente si es __no__ -> Algún otro contexto es __none__

- Las 00:00 las paso al día siguiente en el dataset (algunas veces estaba de una forma y algunas de otra)

- Ahora sugiera conducción y descansos, teniendo en cuenta la secuencia actual y si debe acabar en WR o DR. Sug-Driving se debe considerar como cualquier actividad (Idle y OtherWork también). La duración es la máxima recomendada, pero se podría reducir.

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
| P_A | Process Activity
| CDD | continuous Daily Driving
| NDD | Normal Daily Driving
| EDD | Extended Daily Driving - En total <10h
| RD | Daily Rest
| RW | Weekly Rest
| TDD | Team Daily Driving
| WD | Weekly Driving
| bt | Break time
| dt | Driving time
| BWD | BiWeekly Driving

### Regulation

![Weekly Driving Example](./doc/graphs/wd_example.svg)

![Driving Day Types](./doc/graphs/dd_types.svg)

![Driving Sequence Types](./doc/graphs/cdd_types.svg)

![Rest Day Types](./doc/graphs/rd_types.svg)

- «conducción en equipo»: la situación en la que, durante cualquier período de conducción entre **cualesquiera dos períodos consecutivos de descanso diario, o entre un período de descanso diario y un período de descanso semanal**, haya al menos dos conductores en el **vehículo** que participen en la conducción. Durante la primera hora de conducción en equipo, la presencia de otro conductor o conductores es optativa, pero durante el período restante es obligatoria;

- According to Regulation (EC) No 561/2006, a driver must not drive for more than 4.5h without taking a break of at least 45 min duration, during which the driver may not carry out any work. The break can also be taken in two parts, whereas the first part must have a duration of at least 15 min and the second part must have a duration of at least 30 min.
After a total of 9h of driving, a driver must take a rest period of 11h duration, during which the driver may freely dispose of her or his time. Similar to break periods, rest periods can also be taken in two parts, whereas the first part must have a duration of at least three hours and the second part must have a duration of at least nine hours. Thus, if a rest period is taken in two parts, a total rest of 12h is required before the driver may continue to drive again.
Three times a week, the regular duration of a rest period may be reduced to at least 9h, and twice a week, the total driving time between rests may be extended to 10 h. In any case, the required amount of rest must have been taken within 24 h after the end of the previous rest period.
The accumulated amount of driving and the accumulated amount of working within a week are restricted to at most 56 and 60h and a weekly rest period of at least 45 h must be taken after at most 144 h after the end of the previous weekly rest period. Alternatively, a reduced weekly rest period of 24 h may be taken if the reduction is compensated by an equivalent period of rest taken in a subsequent week.
The regulation constrains the total accumulated driving time during any two consecutive calendar weeks to at most 90 h and in any period of four months, the average working time during a calendar week must not exceed 48 h.

  - CDD -> Driving of 4.5h

  - After CDD -> Uninterrupted Break >45m (B_T1)
    - After CDD -> Split1 Break >15m (B_T2) and Split2 Break >30m (B_T3)
  
  - Because DailyRest are >3h -> B_TX [,3h)

  - <=9h Driving -> NDD
  - [9h,10h] Driving -> EDD

  - After NDD/EDD -> Normal DailyRest >11h (DR_T1)
    - After NDD/EDD -> Reduced DailyRest [9h,11h] (DR_T2)
    - After NDD/EDD -> Split1 DailyRest >3h (DR_T3) and Split2 DailyRest >9h (DR_T4)
  
  - Week -> Monday 00:00 to Sunday 24:00

  - Normal WeeklyRest >45h (WR_T1)
  - Reduced WeeklyRest [24h,45h] (WR_T2)

  - DR_T2 -> Up to 3 times a week (Between WR)
  - DR -> In less than 24h (includes WR) (except team: DR >9h in less than 30h)
  - EDD -> Up to 2 times a week

  - BiWeekly -> At least 2 WR_T1
    - BiWeekly -> At least 1 WR_T1 and 1 WR_T2, compensated in the third week (un período de descanso semanal normal y un período de descanso semanal reducido de al menos 24 horas; no obstante, la reducción se compensará con un descanso equivalente tomado en una sola vez antes de finalizar la tercera semana siguiente a la semana de que se trate. Los descansos tomados como compensación por un período de descanso semanal reducido deberán tomarse junto con otro período de descanso de al menos nueve horas)

  - WR -> In less than 6 days (24h) after last WR

  - Weekly Driving -> Up to 56h
  - BiWeely Driving -> Up to 90h


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

---

```
driver1	12/01/2017 03:17	12/01/2017 06:30	193.000000	Break	edd	third	uninterrupted	DR_T3	yes
# ----------------------------------------------------NEW DAY----------------------------------------------------
#Driver	DateTimeStart	DateTimeEnd	Duration(min)	Activity	DayType	Sequence	BreakType	Token	Legal
driver1	12/01/2017 06:30	12/01/2017 06:33	3.000000	Driving	ndd	unique	uninterrupted	A	yes
driver1	12/01/2017 06:33	14/01/2017 12:02	3209.000000	Break	ndd	unique	uninterrupted	WR_T1	yes

Técnicamente esto es legal, la ley no dice lo contrario
```
---