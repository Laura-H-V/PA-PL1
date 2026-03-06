(define (problem drone_problem_d1_r0_l14_p14_c14_g14_ct2)
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
	(has-content crate1 food)
	(has-content crate2 food)
	(has-content crate3 food)
	(has-content crate4 food)
	(has-content crate5 food)
	(has-content crate6 food)
	(has-content crate7 food)
	(has-content crate8 medicine)
	(has-content crate9 medicine)
	(has-content crate10 medicine)
	(has-content crate11 medicine)
	(has-content crate12 medicine)
	(has-content crate13 medicine)
	(has-content crate14 medicine)
	(at-person person1 loc13)
	(at-person person2 loc10)
	(at-person person3 loc9)
	(at-person person4 loc10)
	(at-person person5 loc5)
	(at-person person6 loc8)
	(at-person person7 loc2)
	(at-person person8 loc10)
	(at-person person9 loc13)
	(at-person person10 loc7)
	(at-person person11 loc6)
	(at-person person12 loc10)
	(at-person person13 loc4)
	(at-person person14 loc5)
)
(:goal (and
	(at-drone drone1 depot)
	(has person1 food)
	(has person2 food)
	(has person2 medicine)
	(has person4 food)
	(has person4 medicine)
	(has person6 food)
	(has person6 medicine)
	(has person8 food)
	(has person8 medicine)
	(has person9 medicine)
	(has person10 medicine)
	(has person12 food)
	(has person14 food)
	(has person14 medicine)
	))
)
