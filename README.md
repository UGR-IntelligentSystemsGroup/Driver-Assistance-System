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

## Commands

./planner/planner -d hpdl/domain.pddl -p hpdl/problem-recognition.pddl

./planner/siadex-verbose -d hpdl/domain.pddl -p hpdl/problem-recognition.pddl

## Notes

### Notation

| Símbolo | Actividad        | Tipo Acción | Índice Registro |
|---------|------------------|-------------|-----------------|
| C (D)   | Conducción       | typeC       | 0               |
| E       | Espera           | typeE       | 1               |
| O       | Otros            | typeO       | 2               |
| P       | Pausa            | typeP       | 3               |
| N       | Descanso Diario  | typeN       | 4               |
| S       | Descanso Semanal | typeS       | 5               |

| Símbolo | Significado |
|-----|----|
| B | Break |
| A | Actividad (si break -> B < 15m)|
| CDD | Continuos Daily Driving?
| CDDs_S | Continuos Driving Days Start
| CDDs_E | Continuos Driving Days End
| NDD | Normal Daily Driving
| EDD | Extended Daily Driving
| slice | Subsequence
| rt | Rest time
| dt | Driving time
| WD | 
| BWD |
| RD | Daily Rest
| RW | Weekly Rest
| P_A | Principal Activity?
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