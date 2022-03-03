# ⏲️ HOS Regulation

This projects is based on the european **H**ours **O**f **S**ervice regulation No 561/2006 (you can find a copy of it [here](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX%3A32006R0561)). The most important elements to consider are reflected in the following images:

![Weekly Driving Example](./graphs/wd_example.svg)

![Driving Day Types](./graphs/dd_types.svg)

![Driving Sequence Types](./graphs/cdd_types.svg)

![Rest Day Types](./graphs/rd_types.svg)

A detailed explanation from (Legal aspects in road transport optimization in Europe, Asvin Goel): 

*According to Regulation (EC) No 561/2006, a driver must not drive for more than 4.5h without taking a break of at least 45 min duration, during which the driver may not carry out any work. The break can also be taken in two parts, whereas the first part must have a duration of at least 15 min and the second part must have a duration of at least 30 min.
After a total of 9h of driving, a driver must take a rest period of 11h duration, during which the driver may freely dispose of her or his time. Similar to break periods, rest periods can also be taken in two parts, whereas the first part must have a duration of at least three hours and the second part must have a duration of at least nine hours. Thus, if a rest period is taken in two parts, a total rest of 12h is required before the driver may continue to drive again.
Three times a week, the regular duration of a rest period may be reduced to at least 9h, and twice a week, the total driving time between rests may be extended to 10 h. In any case, the required amount of rest must have been taken within 24 h after the end of the previous rest period.
The accumulated amount of driving and the accumulated amount of working within a week are restricted to at most 56 and 60h and a weekly rest period of at least 45 h must be taken after at most 144 h after the end of the previous weekly rest period. Alternatively, a reduced weekly rest period of 24 h may be taken if the reduction is compensated by an equivalent period of rest taken in a subsequent week.
The regulation constrains the total accumulated driving time during any two consecutive calendar weeks to at most 90 h and in any period of four months, the average working time during a calendar week must not exceed 48 h.*

## :pencil: Notation

We used the following notation for activity tokens:

| Symbol | Meaning                                |
|--------|----------------------------------------|
| CDD    | Continuous Driving Day                 |
| NDD    | Normal Driving Day (<=9h)              |
| EDD    | Extended Driving Day (9h,10h]          |
| | |
| B_T1   | Uninterrupted Break Type 1 (>45m)      |
| B_T2   | First split of Split-Break (>15m)      |
| B_T3   | Second split of Split-Break (>30m)     |
| | |
| DR_T1  | Normal Daily Rest (>11h)               |
| DR_T2  | Reduced Daily Rest [9h,11h]            |
| DR_T3  | First split of Split Daily Rest (>3h)  |
| DR_T4  | Second split of Split Daily Rest (>9h) |
| | |
| WR_T1  | Normal Weekly Rest (>45h)              |
| WR_T2  | Reduced Weekly Rest [24h,45h]          |