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

- (! ...) en el archivo de primitivas, en las tareas. Qué hace?

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

## Commands

./planner/planner -d hpdl/domain.pddl -p hpdl/problema-recognition.pddl

## Notes

### Notation

- B = Break

- A = Activity ?

- CDD = Continuos Driving Activity?

- NDD = Non-Driving Activity?

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
B_T8:: PROBLEMATICO BREAK OF (9, 45-24+9) COMPENSATION BREAK
B_T9: BREAK OF TEAM.
B_T10: BREAK OF [45h,infty)
```

