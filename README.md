# IMLAP - Driver Activity Recognition

A system to:

- Tag driver activity in compliance with the HOS regulation.
- Suggest legal transport activities in accordance to fuel consumption.
- Classify driving sequences for an easy monitoring of driver behaviour.

## :unlock: Requirements

Just download this repo and compile the SIADEX planner. Easy as that!
<!-- - Python3 -->
<!-- - SIADEX HTN planner (get it [here](https://github.com/IgnacioVellido/VGDL-to-HTN-Parser/tree/master/planners/Siadex)) -->

## :computer: Usage

At this moment each functionality is separated in its own module and has to be executed one by one. We intent to group it all further on for an easy usage process.

### Translating tachograph data into HTN knowledge

We provide scripts to transform a tachograph into HTN domains and problems. Please see our data examples as it requires specific formatting.

<!-- You could also define your own HTN problem (using the HPDL language) -->

### Tagging Driver Activities

Having a previous defined problem, just call the SIADEX planner with the following command:

```
./planner/planner -d hpdl/domain.pddl -p <problem.pddl> -o <output_path>
```

A tagged log in TSV format will be outputted.

### Tagging

Functionality not yet finished.

## ⏲️ HOS Regulation

This projects is based on the european **H**ours **O**f **S**ervice regulation No 561/2006, and you can find a copy of it [here](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX%3A32006R0561). The most important elements to consider are reflected in the following images:

![Weekly Driving Example](./doc/graphs/wd_example.svg)

![Driving Day Types](./doc/graphs/dd_types.svg)

![Driving Sequence Types](./doc/graphs/cdd_types.svg)

![Rest Day Types](./doc/graphs/rd_types.svg)

A detailed explanation from (Legal aspects in road transport optimization in Europe, Asvin Goel): 

*According to Regulation (EC) No 561/2006, a driver must not drive for more than 4.5h without taking a break of at least 45 min duration, during which the driver may not carry out any work. The break can also be taken in two parts, whereas the first part must have a duration of at least 15 min and the second part must have a duration of at least 30 min.
After a total of 9h of driving, a driver must take a rest period of 11h duration, during which the driver may freely dispose of her or his time. Similar to break periods, rest periods can also be taken in two parts, whereas the first part must have a duration of at least three hours and the second part must have a duration of at least nine hours. Thus, if a rest period is taken in two parts, a total rest of 12h is required before the driver may continue to drive again.
Three times a week, the regular duration of a rest period may be reduced to at least 9h, and twice a week, the total driving time between rests may be extended to 10 h. In any case, the required amount of rest must have been taken within 24 h after the end of the previous rest period.
The accumulated amount of driving and the accumulated amount of working within a week are restricted to at most 56 and 60h and a weekly rest period of at least 45 h must be taken after at most 144 h after the end of the previous weekly rest period. Alternatively, a reduced weekly rest period of 24 h may be taken if the reduction is compensated by an equivalent period of rest taken in a subsequent week.
The regulation constrains the total accumulated driving time during any two consecutive calendar weeks to at most 90 h and in any period of four months, the average working time during a calendar week must not exceed 48 h.*

### :books: Experimentation and output example

Our results are stored in the **out** folder, and in this table you can find an example for a legal driving sequence followed by a transport suggestion:

| **#Driver** | **DateTimeStart** | **DateTimeEnd**  | **Duration(min)** | **Activity** | **Week** | **Day**   | **DayType** | **Sequence** | **BreakType** | **Token** | **Legal** | **ZenoInfo** |
|-------------|-------------------|------------------|-------------------|--------------|----------|-----------|-------------|--------------|---------------|-----------|-----------|--------------|
| driver1 | 15/01/2017 11:56 | 15/01/2017 12:00 | 4.000000   | Driving     | 3.000000 | 12.000000 | edd | first  | uninterrupted | A     | yes |                   |
| driver1 | 15/01/2017 12:00 | 15/01/2017 12:04 | 4.000000   | Break       | 3.000000 | 12.000000 | edd | first  | uninterrupted | B_T0  | yes |                   |
| driver1 | 15/01/2017 12:04 | 15/01/2017 12:05 | 1.000000   | Driving     | 3.000000 | 12.000000 | edd | first  | uninterrupted | A     | yes |                   |
| driver1 | 15/01/2017 12:05 | 15/01/2017 12:08 | 3.000000   | Other       | 3.000000 | 12.000000 | edd | first  | uninterrupted | A     | yes |                   |
| driver1 | 15/01/2017 12:08 | 15/01/2017 14:16 | 128.000000 | Break       | 3.000000 | 12.000000 | edd | first  | uninterrupted | B_T1  | yes |                   |
| driver1 | 15/01/2017 14:16 | 15/01/2017 14:19 | 3.000000   | Driving     | 3.000000 | 12.000000 | edd | second | split_1       | A     | yes |                   |
| driver1 | 15/01/2017 14:19 | 15/01/2017 14:25 | 6.000000   | Break       | 3.000000 | 12.000000 | edd | second | split_1       | B_T0  | yes |                   |
| driver1 | 15/01/2017 14:25 | 15/01/2017 14:28 | 3.000000   | Other       | 3.000000 | 12.000000 | edd | second | split_1       | A     | yes |                   |
| driver1 | 15/01/2017 14:28 | 15/01/2017 14:29 | 1.000000   | Driving     | 3.000000 | 12.000000 | edd | second | split_1       | A     | yes |                   |
| driver1 | 15/01/2017 14:29 | 15/01/2017 14:39 | 10.000000  | Break       | 3.000000 | 12.000000 | edd | second | split_1       | B_T0  | yes |                   |
| driver1 | 15/01/2017 14:39 | 15/01/2017 14:55 | 16.000000  | Driving     | 3.000000 | 12.000000 | edd | second | split_1       | A     | yes |                   |
| driver1 | 15/01/2017 14:55 | 15/01/2017 15:21 | 26.000000  | Break       | 3.000000 | 12.000000 | edd | second | split_1       | B_T2  | yes |                   |
| driver1 | 15/01/2017 15:21 | 15/01/2017 19:16 | 235.000000 | Driving     | 3.000000 | 12.000000 | edd | second | split_2       | A     | yes |                   |
| driver1 | 15/01/2017 19:16 | 15/01/2017 19:48 | 32.000000  | Break       | 3.000000 | 12.000000 | edd | second | split_2       | B_T3  | yes |                   |
| driver1 | 15/01/2017 19:48 | 15/01/2017 21:48 | 120.000000 | Driving     | 3.000000 | 12.000000 | edd | third  | split_1       | A     | yes |                   |
| driver1 | 15/01/2017 21:48 | 15/01/2017 22:23 | 35.000000  | Break       | 3.000000 | 12.000000 | edd | third  | split_1       | B_T2  | yes |                   |
| driver1 | 15/01/2017 22:23 | 16/01/2017 00:24 | 121.000000 | Driving     | 3.000000 | 12.000000 | edd | third  | split_2       | A     | yes |                   |
| driver1 | 16/01/2017 00:24 | 16/01/2017 11:24 | 660.000000 | Sug-Break   | 3.000000 | 12.000000 | edd | third  | split_2       | DR_T1 | yes |                   |
| driver1 | 16/01/2017 11:24 | 16/01/2017 11:27 | 3.000000   | Sug-Load    | 3.000000 | 13.000000 | ndd | first  | uninterrupted | A     | yes | box2              |
| driver1 | 16/01/2017 11:27 | 16/01/2017 11:30 | 3.000000   | Sug-Load    | 3.000000 | 13.000000 | ndd | first  | uninterrupted | A     | yes | box1              |
| driver1 | 16/01/2017 11:30 | 16/01/2017 11:33 | 3.000000   | Sug-Load    | 3.000000 | 13.000000 | ndd | first  | uninterrupted | A     | yes | box3              |
| driver1 | 16/01/2017 11:33 | 16/01/2017 11:43 | 10.000000  | Sug-Refuel  | 3.000000 | 13.000000 | ndd | first  | uninterrupted | A     | yes |                   |
| driver1 | 16/01/2017 11:43 | 16/01/2017 15:49 | 246.000000 | Sug-Driving | 3.000000 | 13.000000 | ndd | first  | uninterrupted | A     | yes | sevilla-almeria   |
| driver1 | 16/01/2017 15:49 | 16/01/2017 15:52 | 3.000000   | Sug-Unload  | 3.000000 | 13.000000 | ndd | first  | uninterrupted | A     | yes | box2              |
| driver1 | 16/01/2017 15:52 | 16/01/2017 16:16 | 24.000000  | Sug-Driving | 3.000000 | 13.000000 | ndd | first  | uninterrupted | A     | yes | almeria-barcelona |
| driver1 | 16/01/2017 16:16 | 16/01/2017 17:01 | 45.000000  | Sug-Break   | 3.000000 | 13.000000 | ndd | first  | uninterrupted | B_T1  | yes |                   |
| driver1 | 16/01/2017 17:01 | 16/01/2017 21:31 | 270.000000 | Sug-Driving | 3.000000 | 13.000000 | ndd | second | uninterrupted | A     | yes | almeria-barcelona |
| driver1 | 16/01/2017 21:31 | 17/01/2017 08:31 | 660.000000 | Sug-Break   | 3.000000 | 13.000000 | ndd | second | uninterrupted | DR_T1 | yes |                   |
