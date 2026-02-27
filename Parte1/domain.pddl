(define (domain emergencia)
  (:requirements :strips :typing)

  (:types
    location
    person
    crate
    content
    drone
  )

  (:predicates
    (at-drone ?d - drone ?l - location)
    (at-person ?p - person ?l - location)
    (at-crate ?c - crate ?l - location)

    (has-content ?c - crate ?con - content)
    (has ?p - person ?con - content)

    (free-arm1 ?d - drone)
    (free-arm2 ?d - drone)

    (carrying-arm1 ?d - drone ?c - crate)
    (carrying-arm2 ?d - drone ?c - crate)

    (available ?c - crate)
  )

  (:action fly
    :parameters (?d - drone ?from - location ?to - location)
    :precondition
      (at-drone ?d ?from)
    :effect
      (and
        (not (at-drone ?d ?from))
        (at-drone ?d ?to)
      )
  )

  (:action pickup-arm1
    :parameters (?d - drone ?c - crate ?l - location)
    :precondition
      (and
        (at-drone ?d ?l)
        (at-crate ?c ?l)
        (free-arm1 ?d)
        (available ?c)
      )
    :effect
      (and
        (not (at-crate ?c ?l))
        (not (free-arm1 ?d))
        (not (available ?c))
        (carrying-arm1 ?d ?c)
      )
  )

  (:action pickup-arm2
    :parameters (?d - drone ?c - crate ?l - location)
    :precondition
      (and
        (at-drone ?d ?l)
        (at-crate ?c ?l)
        (free-arm2 ?d)
        (available ?c)
      )
    :effect
      (and
        (not (at-crate ?c ?l))
        (not (free-arm2 ?d))
        (not (available ?c))
        (carrying-arm2 ?d ?c)
      )
  )

  (:action deliver-arm1
    :parameters (?d - drone ?c - crate ?p - person ?con - content ?l - location)
    :precondition
      (and
        (at-drone ?d ?l)
        (at-person ?p ?l)
        (carrying-arm1 ?d ?c)
        (has-content ?c ?con)
      )
    :effect
      (and
        (not (carrying-arm1 ?d ?c))
        (free-arm1 ?d)
        (has ?p ?con)
      )
  )

  (:action deliver-arm2
    :parameters (?d - drone ?c - crate ?p - person ?con - content ?l - location)
    :precondition
      (and
        (at-drone ?d ?l)
        (at-person ?p ?l)
        (carrying-arm2 ?d ?c)
        (has-content ?c ?con)
      )
    :effect
      (and
        (not (carrying-arm2 ?d ?c))
        (free-arm2 ?d)
        (has ?p ?con)
      )
  )
)
