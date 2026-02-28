(define (problem drone_problem_d1_r0_l5_p5_c5_g5_ct2)
(:domain emergencia)
(:objects
	drone1 - drone
	depot - location
	loc1 - location
	loc2 - location
	loc3 - location
	loc4 - location
	loc5 - location
	crate1 - crate
	crate2 - crate
	crate3 - crate
	crate4 - crate
	crate5 - crate
	food - content
	medicine - content
	person1 - person
	person2 - person
	person3 - person
	person4 - person
	person5 - person
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
	(has-content crate1 food)
	(has-content crate2 food)
	(has-content crate3 food)
	(has-content crate4 food)
	(has-content crate5 medicine)
	(at-person person1 loc1)
	(at-person person2 loc4)
	(at-person person3 loc1)
	(at-person person4 loc5)
	(at-person person5 loc4)
)
(:goal (and
	(at-drone drone1 depot)
	(has person1 food)
	(has person1 medicine)
	(has person3 food)
	(has person4 food)
	(has person5 food)
	))
)
