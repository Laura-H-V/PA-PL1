(define (domain emergencia)

  (:requirements :strips :typing :negative-preconditions :durative-actions :fluents)

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
    (crate-free ?c - crate)

    (in ?c - crate ?t - transporter)
    (from-transporter ?c - crate)

    (load ?t - transporter ?n - num)
    (next ?n1 - num ?n2 - num)

    (drone-free ?d - drone)
    (transporter-free ?t - transporter)
    (person-free ?p - person)
  )

  (:functions
    (fly-cost ?from - location ?to - location)
  )

  (:durative-action fly
    :parameters (?d - drone ?from - location ?to - location)
    :duration (= ?duration (fly-cost ?from ?to))
    :condition
      (and
        (at start (at-drone ?d ?from))
        (at start (free-arm ?d))
        (at start (drone-free ?d))
      )
    :effect
      (and
        (at start (not (at-drone ?d ?from)))
        (at start (not (drone-free ?d)))
        (at end (at-drone ?d ?to))
        (at end (drone-free ?d))
      )
  )

  (:durative-action pickup
    :parameters (?d - drone ?c - crate ?l - location)
    :duration (= ?duration 5)
    :condition
      (and
        (at start (at-drone ?d ?l))
        (at start (at-crate ?c ?l))
        (at start (free-arm ?d))
        (at start (available ?c))
        (at start (crate-free ?c))
        (at start (drone-free ?d))
      )
    :effect
      (and
        (at start (not (at-crate ?c ?l)))
        (at start (not (available ?c)))
        (at start (not (crate-free ?c)))
        (at start (not (drone-free ?d)))
        (at end (not (free-arm ?d)))
        (at end (carrying ?d ?c))
        (at end (crate-free ?c))
        (at end (drone-free ?d))
      )
  )

  (:durative-action put-in-transporter
    :parameters (?d - drone ?c - crate ?t - transporter ?l - location ?n1 - num ?n2 - num)
    :duration (= ?duration 5)
    :condition
      (and
        (at start (at-drone ?d ?l))
        (at start (at-transporter ?t ?l))
        (at start (carrying ?d ?c))
        (at start (load ?t ?n1))
        (at start (next ?n1 ?n2))
        (at start (drone-free ?d))
        (at start (transporter-free ?t))
      )
    :effect
      (and
        (at start (not (drone-free ?d)))
        (at start (not (transporter-free ?t)))
        (at end (not (carrying ?d ?c)))
        (at end (free-arm ?d))
        (at end (in ?c ?t))
        (at end (not (load ?t ?n1)))
        (at end (load ?t ?n2))
        (at end (drone-free ?d))
        (at end (transporter-free ?t))
      )
  )

  (:durative-action move-transporter
    :parameters (?d - drone ?t - transporter ?from - location ?to - location)
    :duration (= ?duration (fly-cost ?from ?to))
    :condition
      (and
        (at start (at-drone ?d ?from))
        (at start (at-transporter ?t ?from))
        (at start (free-arm ?d))
        (at start (drone-free ?d))
        (at start (transporter-free ?t))
      )
    :effect
      (and
        (at start (not (at-drone ?d ?from)))
        (at start (not (at-transporter ?t ?from)))
        (at start (not (drone-free ?d)))
        (at start (not (transporter-free ?t)))
        (at end (at-drone ?d ?to))
        (at end (at-transporter ?t ?to))
        (at end (drone-free ?d))
        (at end (transporter-free ?t))
      )
  )

  (:durative-action take-from-transporter
    :parameters (?d - drone ?c - crate ?t - transporter ?l - location ?n1 - num ?n2 - num)
    :duration (= ?duration 5)
    :condition
      (and
        (at start (at-drone ?d ?l))
        (at start (at-transporter ?t ?l))
        (at start (in ?c ?t))
        (at start (load ?t ?n2))
        (at start (next ?n1 ?n2))
        (at start (free-arm ?d))
        (at start (crate-free ?c))
        (at start (drone-free ?d))
        (at start (transporter-free ?t))
      )
    :effect
      (and
        (at start (not (crate-free ?c)))
        (at start (not (drone-free ?d)))
        (at start (not (transporter-free ?t)))
        (at end (not (in ?c ?t)))
        (at end (carrying ?d ?c))
        (at end (from-transporter ?c))
        (at end (not (load ?t ?n2)))
        (at end (load ?t ?n1))
        (at end (not (free-arm ?d)))
        (at end (crate-free ?c))
        (at end (drone-free ?d))
        (at end (transporter-free ?t))
      )
  )

  (:durative-action deliver
    :parameters (?d - drone ?c - crate ?p - person ?con - content ?l - location)
    :duration (= ?duration 5)
    :condition
      (and
        (at start (at-drone ?d ?l))
        (at start (at-person ?p ?l))
        (at start (carrying ?d ?c))
        (at start (has-content ?c ?con))
        (at start (from-transporter ?c))
        (at start (drone-free ?d))
        (at start (person-free ?p))
      )
    :effect
      (and
        (at start (not (drone-free ?d)))
        (at start (not (person-free ?p)))
        (at end (not (carrying ?d ?c)))
        (at end (not (from-transporter ?c)))
        (at end (free-arm ?d))
        (at end (has ?p ?con))
        (at end (drone-free ?d))
        (at end (person-free ?p))
      )
  )
)
