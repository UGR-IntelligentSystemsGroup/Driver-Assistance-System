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

- En el paper del ICAPS hay un par

- (! ...) en el archivo de primitivas, en las tareas. Qué hace? (corte alla PROLOG)?

- Por qué las durative-actions no tienen un último paréntesis que cierre?

- Qué pasa con las tareas comentadas?
  - Para conduce_un_dia falta conduce_un_dia_AMPLIADA

- Por dónde empiezo? Qué fallos tiene?
  - Entiendo que uno de los fallos son los NA, no reconoce si es NDD o EDD

- task RD, method B_T5: Por qué está comentado B_T4? idem con B_T6. Es que falta añadir esos métodos?

- Ejemplo_Dataset_Anonimizado: Datos erróneos.
  - El encabezado está mal. Hay que cambiar 2ª latitud de inicio por latitud_final.

  - En las pausas cambian las coordenadas. El cuentakilómetros en cambio no.

  - Coordenadas incoherentes. En pausas pasa de ~400.000 a ~40.000.000

  - En sí los valores no tienen sentido, deberían ser +-90 o +-180. Probablemente estén usando decimales sin haberlos marcados, pero de cuánta precisión?

- Muy pocos "En espera". Es normal?

- Cuál es el dataset "más limpio"? (Del que partir)

- task P_A: el orden de los métodos está considerado?

- **IMPORTANTE** Dibujar la estructura jerárquica de tareas.

- Cierta inconsistencia en la nomenclatura al nombrar tareas y métodos. B_T1 - B_T1 vs B_T2 - SINGLE

- task break es para un salto de línea?

- Completar notación.

- La secuencia b_tk - A - e_tk - RD se repite varias veces. Agruparla?

- Función (mensaje fulfill) no parece que debería estar aquí. También hay cosas en el problema que parecen que vienen de lo de Multimorbidity (las estoy quitando). El tipo "jornada" no, pero creo que no debería estar.

- En general muchas funciones y predicados que no se usan.

- b_tk y e_tk qué hacen? La primera quita el contexto actual y pasa uno nuevo, mientras que la segunda cambia el actual por el contexto na?

- Por lo que parece no puedo usar las trazas del doc, son para otra versión del dominio.

- Pausa vs Espera. Idle vs Pause.

- Si hay una memoria o cualquier tipo de documento adicional con información sobre esto lo agradecería.

- (modo_generar) bucle infinito? Qué hace? se añade directamente la primitiva al plan (y si no se pueden cumplir las restricciones/condiciones pues fallará?

- **IMPORTANTE** Hay que cambiar los nombres y seguir un formato (inglés o español, pero siempre el mismo)

- Cómo generar los problemas? Objetos, goal y predicados. No me refiero a la traducción del log.

- En el output (event log anotado) me salen na (supongo que será normal). Pero que aparezcan variables es un bug, no? Por lo que veo es solo en OTRO TRABAJO (durative-action O_p), y es por no pasarle la variable como parámetro (por lo que no está instanciada).

- No está modelado el weakly rest (WD), verdad?

- Los breaks no cambian el contexto, por qué?

- cdd_t2  means  continued daily driving of type 3???? Lo he pasado a 2 en la gramática

- La gramática de atributos es puramente informativa?

- Habrá que modelar también el Team Daily Driving?

- R_g9 = Rest 9h? idem con R_g11?

- **IMPORTANTE** Si cada vez que se llama a las tareas semi-básicas (A, B_T1...) se cambia de contexto, no podría hacerse dentro de ellas?. En los Breaks está comentado, por qué?
  - Si fuera para usar en unas b_tk, en otras b_slice y b_legal_slice lo entendería, pero no es el caso.
  - Concretely, every task in the right hand side of a production {a : b1 .. bn }, is extended as {a : sb1 b1 eb1 ... sbn bn ebn} where the new tasks sbi,ebi are used to (1) delimit the start (sbi) and end (ebi) of the decomposition of a task (sbi), (2) add to the state information about the label corresponding to that task (which can be interpreted as the current decomposition context). For example the production {cdd : cdds cdde} is extended as {cdd : scdds cdds ecdds scdde cdde ecdde}, scdds asserts the context ’cdds’ to the state, and ecdds retracts that context. Finallly, the primitive durative actions associated with each event are extended with new parameters (one for each type of label) and tasks devoted to recognize events (as the one shown in Figure 4) are extended to capture the information added to the state by the newly added delimiting tasks, and adding primitive tasks which embody information about the context.

- **IMPORTANTE** Cuál tiene que ser la salida? (Formato)
  - Driver - DatetimeStart - DatetimeEnd - Duration - Activity (DOBI) -- Day (ndd/edd) - DrivingPeriod (split/continuos) - Sequence (cdds/cdde) - Token (elt, b_t1, b_t2, b_t3, rd_normal, rd_reduced, wr_normal, wr_reduced) ???
  - Because of that, every event in the event log is annotated with four labels3 according to the contexts day (with possible values ndd or edd), driving period (continuous or splitted), sequence (cdds or cdde) and token (elt, b t1, b t2, b t3, rd normal, rd reduced, wr normal, wr reduced).

- En los prettyprint de las acciones DOBI he pasado de CSV con ; a TSV. La salida es más legible de por sí, y a la hora de pasarlo a un dataset no habría problema.

- Por qué no hay O_p2 ni E_p2? Los he cambiado para que haya alternativa con contexto

- **IMPORTANTE** La regulación HOS cambió en junio de 2020: https://www.fmcsa.dot.gov/regulations/hours-of-service

- DXX, OXX... las XX significan algo?

## Commands

./planner/planner -d hpdl/domain.pddl -p hpdl/problem-recognition.pddl

./planner/siadex-verbose -d hpdl/domain.pddl -p hpdl/problem-recognition.pddl

## Notes

- El tacógrafo abarca más de un día

- C_p2 ;_p es sufijo de primitiva; 2 is because action as contexts in parameters

- Los metatags son una extensión del lenguaje que actualmente está en fase experimental, por lo que puede cambiar en futuras versiones. El concepto subyacente a los metatags es poder incluir
información extra en el dominio, que aunque no sea directamente utilizable por el planificador,
pueda ser utilizada por otros módulos, o en un análisis posterior del plan resultante.

- El corte (!) es otro de los conceptos introducidos para mejorar la eficiencia del proceso de planificación. Este concepto está tomado del lenguaje PROLOG [PROLOG] donde se utiliza para “olvidar” las unificaciones previas si se vuelve por backtracking. Obviamente el uso del corte afecta a la completitud del proceso de refutación, por lo que debe de ser utilizado con cuidado. En HTN-PDDL es posible usar el corte para parar el backtracking en dos lugares distintos:

  - En la definición de precondiciones: Su uso es exactamente el mismo que el corte de PROLOG. Se toma de la lista de posibles unificaciones una de forma no determinista y se descarta el resto. Si se vuelve por backtracking no se vuelven a considerar el resto de las unificaciones. En dominios con muchas unificaciones usado con cuidado puede utilizarse para acelerar mucho el procesamiento y reducir el backtracking, sin que por ello se vea afectada la completitud.

  - En la lista de métodos de una tarea abstracta. Sirve para que una vez que se han probado como ciertas las precondiciones de un método se descarte probar con el resto de métodos. Nuevamente usado con cuidado este corte tampoco tiene por que afectar a la completitud del algoritmo. El escritor de dominios puede conocer que los métodos son mutuamente excluyentes y que una vez que se prueba con uno, el resto ya son inválidos.

- NA context by default or after daily_reset

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
| CDD | Continuos Daily Driving
| CDD_T1 | Continued Daily Driving of type 1 (normal, sin partición)
| CDD_T2 | Continued Daily Driving of type 2 (particionada)
| CDDs_S | Continuos Daily Driving - Start
| CDDs_E | Continuos Daily Driving - End
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
B_T1: BREAK OF [45min, 3h)
B_T2: BREAK of [15min, 30min)
B_T3: BREAK OF [30min, 45min)

// RESTS are breaks of at least 3 hours.
B_T4: break of [3h, 9h)
B_T5: break of [9h, 11h)
B_T6: BREAK OF [11h, 24h)
B_T7: BREAK OF [24h, 45h)
B_T8:: BREAK OF (9, 45-24+9) - COMPENSATION BREAK - PROBLEMATICO 
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

Posible task 0: 
  DailyDriving
    base:
    m0: NDD