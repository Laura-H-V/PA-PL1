(define (problem drone_problem_d1_r0_l20_p20_c20_g20_ct2)
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
	loc10 - location
	loc11 - location
	loc12 - location
	loc13 - location
	loc14 - location
	loc15 - location
	loc16 - location
	loc17 - location
	loc18 - location
	loc19 - location
	loc20 - location
	crate1 - crate
	crate2 - crate
	crate3 - crate
	crate4 - crate
	crate5 - crate
	crate6 - crate
	crate7 - crate
	crate8 - crate
	crate9 - crate
	crate10 - crate
	crate11 - crate
	crate12 - crate
	crate13 - crate
	crate14 - crate
	crate15 - crate
	crate16 - crate
	crate17 - crate
	crate18 - crate
	crate19 - crate
	crate20 - crate
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
	person10 - person
	person11 - person
	person12 - person
	person13 - person
	person14 - person
	person15 - person
	person16 - person
	person17 - person
	person18 - person
	person19 - person
	person20 - person
)
(:init
	(at-drone drone1 depot)
	(free-arm1 drone1)
	(free-arm2 drone1)
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
	(at-crate crate10 depot)
	(available crate10)
	(at-crate crate11 depot)
	(available crate11)
	(at-crate crate12 depot)
	(available crate12)
	(at-crate crate13 depot)
	(available crate13)
	(at-crate crate14 depot)
	(available crate14)
	(at-crate crate15 depot)
	(available crate15)
	(at-crate crate16 depot)
	(available crate16)
	(at-crate crate17 depot)
	(available crate17)
	(at-crate crate18 depot)
	(available crate18)
	(at-crate crate19 depot)
	(available crate19)
	(at-crate crate20 depot)
	(available crate20)
	(has-content crate1 food)
	(has-content crate2 food)
	(has-content crate3 food)
	(has-content crate4 food)
	(has-content crate5 food)
	(has-content crate6 food)
	(has-content crate7 food)
	(has-content crate8 food)
	(has-content crate9 food)
	(has-content crate10 food)
	(has-content crate11 food)
	(has-content crate12 food)
	(has-content crate13 food)
	(has-content crate14 medicine)
	(has-content crate15 medicine)
	(has-content crate16 medicine)
	(has-content crate17 medicine)
	(has-content crate18 medicine)
	(has-content crate19 medicine)
	(has-content crate20 medicine)
	(at-person person1 loc12)
	(at-person person2 loc6)
	(at-person person3 loc11)
	(at-person person4 loc14)
	(at-person person5 loc2)
	(at-person person6 loc4)
	(at-person person7 loc5)
	(at-person person8 loc8)
	(at-person person9 loc2)
	(at-person person10 loc19)
	(at-person person11 loc18)
	(at-person person12 loc20)
	(at-person person13 loc3)
	(at-person person14 loc1)
	(at-person person15 loc4)
	(at-person person16 loc7)
	(at-person person17 loc20)
	(at-person person18 loc19)
	(at-person person19 loc4)
	(at-person person20 loc13)
)
(:goal (and
	(at-drone drone1 depot)
	(has person1 medicine)
	(has person2 food)
	(has person3 food)
	(has person3 medicine)
	(has person4 food)
	(has person4 medicine)
	(has person5 food)
	(has person7 food)
	(has person8 food)
	(has person10 food)
	(has person11 food)
	(has person11 medicine)
	(has person12 food)
	(has person15 food)
	(has person16 food)
	(has person16 medicine)
	(has person17 food)
	(has person17 medicine)
	(has person18 food)
	(has person18 medicine)
	))
)
