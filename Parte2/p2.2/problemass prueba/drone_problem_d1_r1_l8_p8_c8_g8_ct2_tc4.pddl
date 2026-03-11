(define (problem drone_problem_d1_r1_l8_p8_c8_g8_ct2_tc4)
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
	loc7 - location
	loc8 - location
	crate1 - crate
	crate2 - crate
	crate3 - crate
	crate4 - crate
	crate5 - crate
	crate6 - crate
	crate7 - crate
	crate8 - crate
	food - content
	medicine - content
	person1 - person
	person2 - person
	person3 - person
	person4 - person
	person5 - person
	person6 - person
	person7 - person
	person8 - person
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
	(at-crate crate7 depot)
	(available crate7)
	(at-crate crate8 depot)
	(available crate8)
	(has-content crate1 food)
	(has-content crate2 food)
	(has-content crate3 food)
	(has-content crate4 food)
	(has-content crate5 food)
	(has-content crate6 food)
	(has-content crate7 food)
	(has-content crate8 medicine)
	(at-person person1 loc4)
	(at-person person2 loc4)
	(at-person person3 loc3)
	(at-person person4 loc8)
	(at-person person5 loc2)
	(at-person person6 loc2)
	(at-person person7 loc6)
	(at-person person8 loc8)
	(= (fly-cost depot loc1) 219)
	(= (fly-cost depot loc2) 109)
	(= (fly-cost depot loc3) 148)
	(= (fly-cost depot loc4) 163)
	(= (fly-cost depot loc5) 146)
	(= (fly-cost depot loc6) 176)
	(= (fly-cost depot loc7) 142)
	(= (fly-cost depot loc8) 82)
)
	(= (fly-cost loc1 depot) 219)
	(= (fly-cost loc1 loc2) 185)
	(= (fly-cost loc1 loc3) 72)
	(= (fly-cost loc1 loc4) 95)
	(= (fly-cost loc1 loc5) 76)
	(= (fly-cost loc1 loc6) 46)
	(= (fly-cost loc1 loc7) 78)
	(= (fly-cost loc1 loc8) 138)
)
	(= (fly-cost loc2 depot) 109)
	(= (fly-cost loc2 loc1) 185)
	(= (fly-cost loc2 loc3) 127)
	(= (fly-cost loc2 loc4) 95)
	(= (fly-cost loc2 loc5) 116)
	(= (fly-cost loc2 loc6) 140)
	(= (fly-cost loc2 loc7) 130)
	(= (fly-cost loc2 loc8) 96)
)
	(= (fly-cost loc3 depot) 148)
	(= (fly-cost loc3 loc1) 72)
	(= (fly-cost loc3 loc2) 127)
	(= (fly-cost loc3 loc4) 64)
	(= (fly-cost loc3 loc5) 14)
	(= (fly-cost loc3 loc6) 32)
	(= (fly-cost loc3 loc7) 12)
	(= (fly-cost loc3 loc8) 66)
)
	(= (fly-cost loc4 depot) 163)
	(= (fly-cost loc4 loc1) 95)
	(= (fly-cost loc4 loc2) 95)
	(= (fly-cost loc4 loc3) 64)
	(= (fly-cost loc4 loc5) 51)
	(= (fly-cost loc4 loc6) 57)
	(= (fly-cost loc4 loc7) 74)
	(= (fly-cost loc4 loc8) 95)
)
	(= (fly-cost loc5 depot) 146)
	(= (fly-cost loc5 loc1) 76)
	(= (fly-cost loc5 loc2) 116)
	(= (fly-cost loc5 loc3) 14)
	(= (fly-cost loc5 loc4) 51)
	(= (fly-cost loc5 loc6) 31)
	(= (fly-cost loc5 loc7) 24)
	(= (fly-cost loc5 loc8) 66)
)
	(= (fly-cost loc6 depot) 176)
	(= (fly-cost loc6 loc1) 46)
	(= (fly-cost loc6 loc2) 140)
	(= (fly-cost loc6 loc3) 32)
	(= (fly-cost loc6 loc4) 57)
	(= (fly-cost loc6 loc5) 31)
	(= (fly-cost loc6 loc7) 42)
	(= (fly-cost loc6 loc8) 96)
)
	(= (fly-cost loc7 depot) 142)
	(= (fly-cost loc7 loc1) 78)
	(= (fly-cost loc7 loc2) 130)
	(= (fly-cost loc7 loc3) 12)
	(= (fly-cost loc7 loc4) 74)
	(= (fly-cost loc7 loc5) 24)
	(= (fly-cost loc7 loc6) 42)
	(= (fly-cost loc7 loc8) 61)
)
	(= (fly-cost loc8 depot) 82)
	(= (fly-cost loc8 loc1) 138)
	(= (fly-cost loc8 loc2) 96)
	(= (fly-cost loc8 loc3) 66)
	(= (fly-cost loc8 loc4) 95)
	(= (fly-cost loc8 loc5) 66)
	(= (fly-cost loc8 loc6) 96)
	(= (fly-cost loc8 loc7) 61)
)
(:goal (and
	(at-drone drone1 depot)
	(has person1 food)
	(has person2 food)
	(has person2 medicine)
	(has person3 food)
	(has person5 food)
	(has person6 food)
	(has person7 food)
	(has person8 food)
	))
)
(:metric minimize (total-cost))
)
