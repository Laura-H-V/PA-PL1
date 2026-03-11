(define (problem drone_problem_d1_r1_l2_p2_c2_g2_ct2_tc4)
(:domain emergencia)
(:objects
	drone1 - drone
	depot - location
	loc1 - location
	loc2 - location
	crate1 - crate
	crate2 - crate
	food - content
	medicine - content
	person1 - person
	person2 - person
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
	(has-content crate1 food)
	(has-content crate2 medicine)
	(at-person person1 loc1)
	(at-person person2 loc2)
	(= (fly-cost depot loc1) 223)
	(= (fly-cost depot loc2) 68)
)
	(= (fly-cost loc1 depot) 223)
	(= (fly-cost loc1 loc2) 189)
)
	(= (fly-cost loc2 depot) 68)
	(= (fly-cost loc2 loc1) 189)
)
(:goal (and
	(at-drone drone1 depot)
	(has person2 food)
	(has person2 medicine)
	))
)
(:metric minimize (total-cost))
)
