(define (problem drone_problem_d3_r2_l5_p5_c5_g5_ct2_tc4)
(:domain emergencia)
(:objects
	drone1 - drone
	drone2 - drone
	drone3 - drone
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
	transporter1 - transporter
	transporter2 - transporter
	n0 - num
	n1 - num
	n2 - num
	n3 - num
	n4 - num
)
(:init
	(at-drone drone1 depot)
	(free-arm drone1)
	(drone-free drone1)
	(at-drone drone2 depot)
	(free-arm drone2)
	(drone-free drone2)
	(at-drone drone3 depot)
	(free-arm drone3)
	(drone-free drone3)
	(at-transporter transporter1 depot)
	(load transporter1 n0)
	(transporter-free transporter1)
	(at-transporter transporter2 depot)
	(load transporter2 n0)
	(transporter-free transporter2)
	(next n0 n1)
	(next n1 n2)
	(next n2 n3)
	(next n3 n4)
	(at-crate crate1 depot)
	(available crate1)
	(crate-free crate1)
	(at-crate crate2 depot)
	(available crate2)
	(crate-free crate2)
	(at-crate crate3 depot)
	(available crate3)
	(crate-free crate3)
	(at-crate crate4 depot)
	(available crate4)
	(crate-free crate4)
	(at-crate crate5 depot)
	(available crate5)
	(crate-free crate5)
	(has-content crate1 food)
	(has-content crate2 food)
	(has-content crate3 food)
	(has-content crate4 food)
	(has-content crate5 medicine)
	(at-person person1 loc1)
	(person-free person1)
	(at-person person2 loc4)
	(person-free person2)
	(at-person person3 loc1)
	(person-free person3)
	(at-person person4 loc5)
	(person-free person4)
	(at-person person5 loc4)
	(person-free person5)
	(= (fly-cost depot depot) 0)
	(= (fly-cost depot loc1) 223)
	(= (fly-cost depot loc2) 68)
	(= (fly-cost depot loc3) 182)
	(= (fly-cost depot loc4) 131)
	(= (fly-cost depot loc5) 154)
	(= (fly-cost loc1 depot) 223)
	(= (fly-cost loc1 loc1) 0)
	(= (fly-cost loc1 loc2) 189)
	(= (fly-cost loc1 loc3) 67)
	(= (fly-cost loc1 loc4) 96)
	(= (fly-cost loc1 loc5) 74)
	(= (fly-cost loc2 depot) 68)
	(= (fly-cost loc2 loc1) 189)
	(= (fly-cost loc2 loc2) 0)
	(= (fly-cost loc2 loc3) 134)
	(= (fly-cost loc2 loc4) 94)
	(= (fly-cost loc2 loc5) 115)
	(= (fly-cost loc3 depot) 182)
	(= (fly-cost loc3 loc1) 67)
	(= (fly-cost loc3 loc2) 134)
	(= (fly-cost loc3 loc3) 0)
	(= (fly-cost loc3 loc4) 55)
	(= (fly-cost loc3 loc5) 34)
	(= (fly-cost loc4 depot) 131)
	(= (fly-cost loc4 loc1) 96)
	(= (fly-cost loc4 loc2) 94)
	(= (fly-cost loc4 loc3) 55)
	(= (fly-cost loc4 loc4) 0)
	(= (fly-cost loc4 loc5) 24)
	(= (fly-cost loc5 depot) 154)
	(= (fly-cost loc5 loc1) 74)
	(= (fly-cost loc5 loc2) 115)
	(= (fly-cost loc5 loc3) 34)
	(= (fly-cost loc5 loc4) 24)
	(= (fly-cost loc5 loc5) 0)
)
(:goal (and
	(at-drone drone1 depot)
	(at-drone drone2 depot)
	(at-drone drone3 depot)
	(has person1 food)
	(has person1 medicine)
	(has person3 food)
	(has person4 food)
	(has person5 food)
	))
(:metric minimize (total-time))
)