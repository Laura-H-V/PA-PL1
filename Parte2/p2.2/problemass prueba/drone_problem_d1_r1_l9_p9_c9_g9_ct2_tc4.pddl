(define (problem drone_problem_d1_r1_l9_p9_c9_g9_ct2_tc4)
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
	loc9 - location
	crate1 - crate
	crate2 - crate
	crate3 - crate
	crate4 - crate
	crate5 - crate
	crate6 - crate
	crate7 - crate
	crate8 - crate
	crate9 - crate
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
	person9 - person
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
	(at-crate crate9 depot)
	(available crate9)
	(has-content crate1 food)
	(has-content crate2 food)
	(has-content crate3 food)
	(has-content crate4 food)
	(has-content crate5 food)
	(has-content crate6 food)
	(has-content crate7 food)
	(has-content crate8 medicine)
	(has-content crate9 medicine)
	(at-person person1 loc9)
	(at-person person2 loc5)
	(at-person person3 loc8)
	(at-person person4 loc2)
	(at-person person5 loc7)
	(at-person person6 loc6)
	(at-person person7 loc4)
	(at-person person8 loc5)
	(at-person person9 loc3)
	(= (fly-cost depot loc1) 223)
	(= (fly-cost depot loc2) 68)
	(= (fly-cost depot loc3) 182)
	(= (fly-cost depot loc4) 131)
	(= (fly-cost depot loc5) 154)
	(= (fly-cost depot loc6) 161)
	(= (fly-cost depot loc7) 135)
	(= (fly-cost depot loc8) 82)
	(= (fly-cost depot loc9) 196)
)
	(= (fly-cost loc1 depot) 223)
	(= (fly-cost loc1 loc2) 189)
	(= (fly-cost loc1 loc3) 67)
	(= (fly-cost loc1 loc4) 96)
	(= (fly-cost loc1 loc5) 74)
	(= (fly-cost loc1 loc6) 69)
	(= (fly-cost loc1 loc7) 98)
	(= (fly-cost loc1 loc8) 142)
	(= (fly-cost loc1 loc9) 84)
)
	(= (fly-cost loc2 depot) 68)
	(= (fly-cost loc2 loc1) 189)
	(= (fly-cost loc2 loc3) 134)
	(= (fly-cost loc2 loc4) 94)
	(= (fly-cost loc2 loc5) 115)
	(= (fly-cost loc2 loc6) 140)
	(= (fly-cost loc2 loc7) 123)
	(= (fly-cost loc2 loc8) 70)
	(= (fly-cost loc2 loc9) 188)
)
	(= (fly-cost loc3 depot) 182)
	(= (fly-cost loc3 loc1) 67)
	(= (fly-cost loc3 loc2) 134)
	(= (fly-cost loc3 loc4) 55)
	(= (fly-cost loc3 loc5) 34)
	(= (fly-cost loc3 loc6) 72)
	(= (fly-cost loc3 loc7) 90)
	(= (fly-cost loc3 loc8) 107)
	(= (fly-cost loc3 loc9) 119)
)
	(= (fly-cost loc4 depot) 131)
	(= (fly-cost loc4 loc1) 96)
	(= (fly-cost loc4 loc2) 94)
	(= (fly-cost loc4 loc3) 55)
	(= (fly-cost loc4 loc5) 24)
	(= (fly-cost loc4 loc6) 51)
	(= (fly-cost loc4 loc7) 50)
	(= (fly-cost loc4 loc8) 53)
	(= (fly-cost loc4 loc9) 105)
)
	(= (fly-cost loc5 depot) 154)
	(= (fly-cost loc5 loc1) 74)
	(= (fly-cost loc5 loc2) 115)
	(= (fly-cost loc5 loc3) 34)
	(= (fly-cost loc5 loc4) 24)
	(= (fly-cost loc5 loc6) 46)
	(= (fly-cost loc5 loc7) 57)
	(= (fly-cost loc5 loc8) 76)
	(= (fly-cost loc5 loc9) 98)
)
	(= (fly-cost loc6 depot) 161)
	(= (fly-cost loc6 loc1) 69)
	(= (fly-cost loc6 loc2) 140)
	(= (fly-cost loc6 loc3) 72)
	(= (fly-cost loc6 loc4) 51)
	(= (fly-cost loc6 loc5) 46)
	(= (fly-cost loc6 loc7) 29)
	(= (fly-cost loc6 loc8) 80)
	(= (fly-cost loc6 loc9) 54)
)
	(= (fly-cost loc7 depot) 135)
	(= (fly-cost loc7 loc1) 98)
	(= (fly-cost loc7 loc2) 123)
	(= (fly-cost loc7 loc3) 90)
	(= (fly-cost loc7 loc4) 50)
	(= (fly-cost loc7 loc5) 57)
	(= (fly-cost loc7 loc6) 29)
	(= (fly-cost loc7 loc8) 58)
	(= (fly-cost loc7 loc9) 65)
)
	(= (fly-cost loc8 depot) 82)
	(= (fly-cost loc8 loc1) 142)
	(= (fly-cost loc8 loc2) 70)
	(= (fly-cost loc8 loc3) 107)
	(= (fly-cost loc8 loc4) 53)
	(= (fly-cost loc8 loc5) 76)
	(= (fly-cost loc8 loc6) 80)
	(= (fly-cost loc8 loc7) 58)
	(= (fly-cost loc8 loc9) 122)
)
	(= (fly-cost loc9 depot) 196)
	(= (fly-cost loc9 loc1) 84)
	(= (fly-cost loc9 loc2) 188)
	(= (fly-cost loc9 loc3) 119)
	(= (fly-cost loc9 loc4) 105)
	(= (fly-cost loc9 loc5) 98)
	(= (fly-cost loc9 loc6) 54)
	(= (fly-cost loc9 loc7) 65)
	(= (fly-cost loc9 loc8) 122)
)
(:goal (and
	(at-drone drone1 depot)
	(has person1 food)
	(has person2 food)
	(has person2 medicine)
	(has person4 food)
	(has person5 food)
	(has person6 food)
	(has person6 medicine)
	(has person8 food)
	(has person9 food)
	))
)
(:metric minimize (total-cost))
)
