(define (problem drone_problem_d1_r1_l7_p7_c7_g7_ct2_tc4)
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
	crate1 - crate
	crate2 - crate
	crate3 - crate
	crate4 - crate
	crate5 - crate
	crate6 - crate
	crate7 - crate
	food - content
	medicine - content
	person1 - person
	person2 - person
	person3 - person
	person4 - person
	person5 - person
	person6 - person
	person7 - person
	transporter1 - transporter
	n0 - num
	n1 - num
	n2 - num
	n3 - num
	n4 - num
)
(:init
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
	(has-content crate1 food)
	(has-content crate2 food)
	(has-content crate3 food)
	(has-content crate4 food)
	(has-content crate5 medicine)
	(has-content crate6 medicine)
	(has-content crate7 medicine)
	(at-person person1 loc3)
	(at-person person2 loc5)
	(at-person person3 loc6)
	(at-person person4 loc2)
	(at-person person5 loc5)
	(at-person person6 loc4)
	(at-person person7 loc4)
)
(:goal (and
	(at-drone drone1 depot)
	(has person3 food)
	(has person3 medicine)
	(has person5 food)
	(has person5 medicine)
	(has person6 food)
	(has person7 food)
	(has person7 medicine)
	))
)
