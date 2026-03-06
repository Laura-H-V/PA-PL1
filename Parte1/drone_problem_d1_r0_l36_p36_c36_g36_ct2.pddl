(define (problem drone_problem_d1_r0_l36_p36_c36_g36_ct2)
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
	loc21 - location
	loc22 - location
	loc23 - location
	loc24 - location
	loc25 - location
	loc26 - location
	loc27 - location
	loc28 - location
	loc29 - location
	loc30 - location
	loc31 - location
	loc32 - location
	loc33 - location
	loc34 - location
	loc35 - location
	loc36 - location
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
	crate21 - crate
	crate22 - crate
	crate23 - crate
	crate24 - crate
	crate25 - crate
	crate26 - crate
	crate27 - crate
	crate28 - crate
	crate29 - crate
	crate30 - crate
	crate31 - crate
	crate32 - crate
	crate33 - crate
	crate34 - crate
	crate35 - crate
	crate36 - crate
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
	person21 - person
	person22 - person
	person23 - person
	person24 - person
	person25 - person
	person26 - person
	person27 - person
	person28 - person
	person29 - person
	person30 - person
	person31 - person
	person32 - person
	person33 - person
	person34 - person
	person35 - person
	person36 - person
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
	(at-crate crate21 depot)
	(available crate21)
	(at-crate crate22 depot)
	(available crate22)
	(at-crate crate23 depot)
	(available crate23)
	(at-crate crate24 depot)
	(available crate24)
	(at-crate crate25 depot)
	(available crate25)
	(at-crate crate26 depot)
	(available crate26)
	(at-crate crate27 depot)
	(available crate27)
	(at-crate crate28 depot)
	(available crate28)
	(at-crate crate29 depot)
	(available crate29)
	(at-crate crate30 depot)
	(available crate30)
	(at-crate crate31 depot)
	(available crate31)
	(at-crate crate32 depot)
	(available crate32)
	(at-crate crate33 depot)
	(available crate33)
	(at-crate crate34 depot)
	(available crate34)
	(at-crate crate35 depot)
	(available crate35)
	(at-crate crate36 depot)
	(available crate36)
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
	(has-content crate14 food)
	(has-content crate15 food)
	(has-content crate16 food)
	(has-content crate17 food)
	(has-content crate18 food)
	(has-content crate19 food)
	(has-content crate20 food)
	(has-content crate21 food)
	(has-content crate22 food)
	(has-content crate23 food)
	(has-content crate24 food)
	(has-content crate25 food)
	(has-content crate26 medicine)
	(has-content crate27 medicine)
	(has-content crate28 medicine)
	(has-content crate29 medicine)
	(has-content crate30 medicine)
	(has-content crate31 medicine)
	(has-content crate32 medicine)
	(has-content crate33 medicine)
	(has-content crate34 medicine)
	(has-content crate35 medicine)
	(has-content crate36 medicine)
	(at-person person1 loc11)
	(at-person person2 loc29)
	(at-person person3 loc5)
	(at-person person4 loc17)
	(at-person person5 loc11)
	(at-person person6 loc29)
	(at-person person7 loc34)
	(at-person person8 loc32)
	(at-person person9 loc36)
	(at-person person10 loc1)
	(at-person person11 loc3)
	(at-person person12 loc32)
	(at-person person13 loc21)
	(at-person person14 loc20)
	(at-person person15 loc30)
	(at-person person16 loc4)
	(at-person person17 loc27)
	(at-person person18 loc13)
	(at-person person19 loc36)
	(at-person person20 loc6)
	(at-person person21 loc9)
	(at-person person22 loc1)
	(at-person person23 loc26)
	(at-person person24 loc27)
	(at-person person25 loc21)
	(at-person person26 loc1)
	(at-person person27 loc14)
	(at-person person28 loc1)
	(at-person person29 loc1)
	(at-person person30 loc34)
	(at-person person31 loc7)
	(at-person person32 loc13)
	(at-person person33 loc8)
	(at-person person34 loc13)
	(at-person person35 loc20)
	(at-person person36 loc18)
)
(:goal (and
	(at-drone drone1 depot)
	(has person2 food)
	(has person3 food)
	(has person5 food)
	(has person6 food)
	(has person7 food)
	(has person7 medicine)
	(has person8 medicine)
	(has person9 food)
	(has person11 food)
	(has person12 food)
	(has person13 food)
	(has person14 food)
	(has person14 medicine)
	(has person15 food)
	(has person16 food)
	(has person16 medicine)
	(has person17 food)
	(has person17 medicine)
	(has person18 food)
	(has person18 medicine)
	(has person22 food)
	(has person24 food)
	(has person25 medicine)
	(has person26 food)
	(has person27 food)
	(has person28 food)
	(has person29 food)
	(has person30 food)
	(has person31 food)
	(has person33 medicine)
	(has person34 food)
	(has person34 medicine)
	(has person35 food)
	(has person35 medicine)
	(has person36 food)
	(has person36 medicine)
	))
)
