(define (problem drone_problem_d1_r1_l6_p6_c6_g6_ct2_tc4)
(:domain emergencia)
(:objects
	drone1 - drone
	depot - location
	loc1 - location
	loc2 - location
	loc3 - location
	loc4 - location
	loc5 - location
	loc6 - location
	crate1 - crate
	crate2 - crate
	crate3 - crate
	crate4 - crate
	crate5 - crate
	crate6 - crate
	food - content
	medicine - content
	person1 - person
	person2 - person
	person3 - person
	person4 - person
	person5 - person
	person6 - person
	transporter1 - transporter
	n0 - num
	n1 - num
	n2 - num
	n3 - num
	n4 - num
)
(:init
	(= (total-cost) 0)
	(at-drone drone1 depot)
	(free-arm drone1)
	(at-transporter transporter1 depot)
	(load transporter1 n0)
	(next n0 n1)
	(next n1 n2)
	(next n2 n3)
	(next n3 n4)
	(at-crate crate1 depot)
	(available crate1)
	(at-crate crate2 depot)
	(available crate2)
	(at-crate crate3 depot)
	(available crate3)
	(at-crate crate4 depot)
	(available crate4)
	(at-crate crate5 depot)
	(available crate5)
	(at-crate crate6 depot)
	(available crate6)
	(has-content crate1 food)
	(has-content crate2 food)
	(has-content crate3 food)
	(has-content crate4 food)
	(has-content crate5 medicine)
	(has-content crate6 medicine)
	(at-person person1 loc3)
	(at-person person2 loc4)
	(at-person person3 loc3)
	(at-person person4 loc5)
	(at-person person5 loc6)
	(at-person person6 loc2)
	(= (fly-cost depot loc1) 223)
	(= (fly-cost depot loc2) 68)
	(= (fly-cost depot loc3) 182)
	(= (fly-cost depot loc4) 131)
	(= (fly-cost depot loc5) 154)
	(= (fly-cost depot loc6) 161)
)
	(= (fly-cost loc1 depot) 223)
	(= (fly-cost loc1 loc2) 189)
	(= (fly-cost loc1 loc3) 67)
	(= (fly-cost loc1 loc4) 96)
	(= (fly-cost loc1 loc5) 74)
	(= (fly-cost loc1 loc6) 69)
)
	(= (fly-cost loc2 depot) 68)
	(= (fly-cost loc2 loc1) 189)
	(= (fly-cost loc2 loc3) 134)
	(= (fly-cost loc2 loc4) 94)
	(= (fly-cost loc2 loc5) 115)
	(= (fly-cost loc2 loc6) 140)
)
	(= (fly-cost loc3 depot) 182)
	(= (fly-cost loc3 loc1) 67)
	(= (fly-cost loc3 loc2) 134)
	(= (fly-cost loc3 loc4) 55)
	(= (fly-cost loc3 loc5) 34)
	(= (fly-cost loc3 loc6) 72)
)
	(= (fly-cost loc4 depot) 131)
	(= (fly-cost loc4 loc1) 96)
	(= (fly-cost loc4 loc2) 94)
	(= (fly-cost loc4 loc3) 55)
	(= (fly-cost loc4 loc5) 24)
	(= (fly-cost loc4 loc6) 51)
)
	(= (fly-cost loc5 depot) 154)
	(= (fly-cost loc5 loc1) 74)
	(= (fly-cost loc5 loc2) 115)
	(= (fly-cost loc5 loc3) 34)
	(= (fly-cost loc5 loc4) 24)
	(= (fly-cost loc5 loc6) 46)
)
	(= (fly-cost loc6 depot) 161)
	(= (fly-cost loc6 loc1) 69)
	(= (fly-cost loc6 loc2) 140)
	(= (fly-cost loc6 loc3) 72)
	(= (fly-cost loc6 loc4) 51)
	(= (fly-cost loc6 loc5) 46)
)
(:goal (and
	(at-drone drone1 depot)
	(has person1 medicine)
	(has person3 food)
	(has person4 food)
	(has person5 food)
	(has person6 food)
	(has person6 medicine)
	))
)
(:metric minimize (total-cost))
)
