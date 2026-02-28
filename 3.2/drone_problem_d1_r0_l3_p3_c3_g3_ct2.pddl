(define (problem drone_problem_d1_r0_l3_p3_c3_g3_ct2)
(:domain emergencia)
(:objects
	drone1 - drone
	depot - location
	loc1 - location
	loc2 - location
	loc3 - location
	crate1 - crate
	crate2 - crate
	crate3 - crate
	food - content
	medicine - content
	person1 - person
	person2 - person
	person3 - person
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
	(has-content crate1 food)
	(has-content crate2 food)
	(has-content crate3 medicine)
	(at-person person1 loc1)
	(at-person person2 loc3)
	(at-person person3 loc2)
)
(:goal (and
	(at-drone drone1 depot)
	(has person2 food)
	(has person2 medicine)
	(has person3 food)
	))
)
