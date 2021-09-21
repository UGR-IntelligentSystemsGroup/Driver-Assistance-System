grammar HoSGrammar;

/* Represent the types of activities: Drive Other Break Idle*/
/* B_T1 .. B_T3 represente BREAKS lesser than 3 hs, are assumed as tokens, see below*/
tokens {
	D,
	O,
	B,
	I,
	B_T1,
	B_T2,
	B_T3
}

// ============================================================================

// Normal Daily Driving
ndd
    : cdd {dt(cdd)<= 9hr} 
    | anomaly_t1
    ;

// OLD: I think is better to think about ANOMALIES cdd : cdds_e; a normal daily driving is a
// sequence of ccd with a driving time at most of 9 hours.
anomaly_t1
    : a rd {COND: dur(a) < 4.5hrs}
    ;

// ============================================================================

//a sequence of continued daily driving is composed of two slices: a starting one and an ending one
cdd
    : cdds_s cdds_e
    ;

// or may be only an ending slice. cdds_e;

// ============================================================================

//a starting subsequence of cdd may be of type1 or type2
cdds_s
    : cdd_t1_start 
    | cdd_t2_start
    ;

//an ending subsequence of cdd may be of type1 or type2
cdds_e
    : cdd_t1_end 
    | cdd_t2_end
    ;

// ============================================================================

//cdd_t1 means continued daily driving of type 1 i.e. slice of type 'a' ended either with a break of at least 45mins (or a daily rest)

//a starting subsequence of cdd is a slice of type 'a' ended  with a break of at least 45mins 
cdd_t1_start
    : a B_T1 {COND: dur(a) <= 4.5hrs}
    ;

// trozo1
//     : a B_T1 {COND: dur(a) <= 4.5hrs};

//an ending subsequence of cdd is a slice of type 'a' ended  with a daily rest 
cdd_t1_end
    : a rd {COND: dur(a) <= 4.5hrs}
    ;

// ============================================================================

//cdd_t2 means continued daily driving of type 2, a starting sequence of cdd is composed of two slices of type a, splited by a B_T2 break and ended with a B_T3 break, or viceversa. 

// a sequence of cdd_t2_slices, i.e, 
cdd_t2_seq
    : cdd_t2_slice
	| cdd_t2_slice cdd_t2_seq   //intentionally with no condition
    ; 

cdd_t2_start
    : cdd_t2_seq {COND: dt(cdd_t2_seq)<=4.5hs AND rt(cdd_t2_seq) >= 45mins}
    ;

// an ending subsequence of cdd (of type 2) is composed of two slices of type a, splited by a B_T2 (or break and ended with a daily rest
cdd_t2_end
    : cdd_t2_seq a rd 
        {COND: dt(cdd_t2_seq)+dt(a) <= 4.5hrs AND rt(cdd_t2_seq) >= 15mins}
    ;

// a starting sequence of cdd (type2: splitted) is composed of several slices, cdd_t2_slice, each finished by a break such that the sum of durations of the type a slices is less than 4.5hours and the breaks greater than 45 mins.
cdd_t2_slice
    : a B_T2 
    | a B_T3 
    | a B_T1
    ;

// ============================================================================

// sequence OF ACTIVITIES (COPE/DOBI) DRIVE OTHER BREAK IDLE, SUCH THAT B <15 MIN
a
    : p_a {COND: rt(p_a) < 15mins} {dt(a):= dt(p_a}
	| p_a {COND: rt(p_a) < 15mins} a {dt(a) := dt(p_a)+dt(a[2])}
    ;

// PROCESS ACTIVITY
p_a
    : D {dt(p_a) := dur(D)}
	| B {rt(p_a) := dur(B)}
	| B_T1 {rt(p_a) := dur(B_T1)}
	| B_T2 {rt(p_a) := dur(B_T2)}
	| B_T3 {rt(p_a) := dur(B_T3)}
	| O {rt(p_a) := dur(B_T1)}
	| I {rt(p_a) := dur(B_T1)}
    ;

// ============================================================================

// Daily rests, may be normal or reduced
rd
    : rd_normal 
    | rd_reduced
    ;

rd_normal
    : B {dur(B)>= 11m, dur(B) < 24h}
    ;

//3 times a week
rd_reduced
    : B {dur(B)>=9, dur(B)< 11h }
    ;

// ============================================================================

// B_T0; BREAK LESSER THAN 15 mins

// From 15 mins a pause is considered a BREAK
// B_T1: BREAK OF [45min, 3h)
// B_T2: BREAK of [15min, 30min)
// B_T3: BREAK OF [30min, 45min)

// // RESTS are breaks of at least 3 hours.
// B_T4: break of [3h, 9h)
// B_T5: break of [9h, 11h)
// B_T6: BREAK OF [11h, 24h)
// B_T7: BREAK OF [24h, 45h)
// B_T8:: BREAK OF (9, 45-24+9) - COMPENSATION BREAK - PROBLEMATICO 
// B_T9: BREAK OF TEAM.
// B_T10: BREAK OF [45h,infty)