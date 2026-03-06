(define (domain emergencia)

  (:requirements :strips :typing)

  (:types
    location
    person
    crate
    content
    drone
    transporter
    num
  )

  (:predicates

    (at-drone ?d - drone ?l - location)
    (at-person ?p - person ?l - location)
    (at-crate ?c - crate ?l - location)
    (at-transporter ?t - transporter ?l - location)

    (has-content ?c - crate ?con - content)
    (has ?p - person ?con - content)

    (free-arm ?d - drone)
    (carrying ?d - drone ?c - crate)

    (available ?c - crate)

    (in ?c - crate ?t - transporter)
    (from-transporter ?c - crate)

    (load ?t - transporter ?n - num)

    (next ?n1 - num ?n2 - num)
  )



  (:action fly
    :parameters (?d - drone ?from - location ?to - location)
    :precondition
      (and
        (at-drone ?d ?from)
        (free-arm ?d)
      )
    :effect
      (and
        (not (at-drone ?d ?from))
        (at-drone ?d ?to)
      )
  )



  (:action pickup
    :parameters (?d - drone ?c - crate ?l - location)
    :precondition
      (and
        (at-drone ?d ?l)
        (at-crate ?c ?l)
        (free-arm ?d)
        (available ?c)
      )
    :effect
      (and
        (not (at-crate ?c ?l))
        (not (free-arm ?d))
        (not (available ?c))
        (carrying ?d ?c)
      )
  )



  (:action put-in-transporter
    :parameters (?d - drone ?c - crate ?t - transporter ?l - location ?n1 - num ?n2 - num)
    :precondition
      (and
        (at-drone ?d ?l)
        (at-transporter ?t ?l)
        (carrying ?d ?c)
        (load ?t ?n1)
        (next ?n1 ?n2)
      )
    :effect
      (and
        (not (carrying ?d ?c))
        (free-arm ?d)
        (in ?c ?t)
        (not (load ?t ?n1))
        (load ?t ?n2)
      )
  )



  (:action move-transporter
    :parameters (?d - drone ?t - transporter ?from - location ?to - location)
    :precondition
      (and
        (at-drone ?d ?from)
        (at-transporter ?t ?from)
        (free-arm ?d)
      )
    :effect
      (and
        (not (at-drone ?d ?from))
        (at-drone ?d ?to)
        (not (at-transporter ?t ?from))
        (at-transporter ?t ?to)
      )
  )



  (:action take-from-transporter
    :parameters (?d - drone ?c - crate ?t - transporter ?l - location ?n1 - num ?n2 - num)
    :precondition
      (and
        (at-drone ?d ?l)
        (at-transporter ?t ?l)
        (in ?c ?t)
        (load ?t ?n2)
        (next ?n1 ?n2)
        (free-arm ?d)
      )
    :effect
      (and
        (not (in ?c ?t))
        (carrying ?d ?c)
        (from-transporter ?c)
        (not (load ?t ?n2))
        (load ?t ?n1)
        (not (free-arm ?d))
      )
  )



  (:action deliver
    :parameters (?d - drone ?c - crate ?p - person ?con - content ?l - location)
    :precondition
      (and
        (at-drone ?d ?l)
        (at-person ?p ?l)
        (carrying ?d ?c)
        (has-content ?c ?con)
        (from-transporter ?c)
      )
    :effect
      (and
        (not (carrying ?d ?c))
        (not (from-transporter ?c))
        (free-arm ?d)
        (has ?p ?con)
      )
)

)