(define (domain emergencia)
  (:requirements :strips :typing)
  
  (:types
    location
    person crate content - object
    drone
  )
  
  (:predicates
    (at ?x - object ?l - location)
    (has-content ?c - crate ?con - content)
    (has ?p - person ?con - content)
    (free-arm1 ?d - drone)
    (free-arm2 ?d - drone)
    (carrying-arm1 ?d - drone ?c - crate)
    (carrying-arm2 ?d - drone ?c - crate)
  )
  
  ; Acción: volar entre localizaciones (transporta lo que lleva)
  (:action fly
    :parameters (?d - drone ?from ?to - location)
    :precondition (at ?d ?from)
    :effect
      (and
        (not (at ?d ?from))
        (at ?d ?to)
      )
  )
  
  ; Coger caja con brazo 1
  (:action pickup-arm1
    :parameters (?d - drone ?c - crate ?l - location)
    :precondition
      (and
        (at ?d ?l)
        (at ?c ?l)
        (free-arm1 ?d)
      )
    :effect
      (and
        (not (at ?c ?l))
        (not (free-arm1 ?d))
        (carrying-arm1 ?d ?c)
      )
  )
  
  ; Coger caja con brazo 2
  (:action pickup-arm2
    :parameters (?d - drone ?c - crate ?l - location)
    :precondition
      (and
        (at ?d ?l)
        (at ?c ?l)
        (free-arm2 ?d)
      )
    :effect
      (and
        (not (at ?c ?l))
        (not (free-arm2 ?d))
        (carrying-arm2 ?d ?c)
      )
  )
  
  ; Entregar caja de brazo 1 a persona
  (:action deliver-arm1
    :parameters (?d - drone ?c - crate ?p - person ?con - content ?l - location)
    :precondition
      (and
        (at ?d ?l)
        (at ?p ?l)
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
  
  ; Entregar caja de brazo 2 a persona
  (:action deliver-arm2
    :parameters (?d - drone ?c - crate ?p - person ?con - content ?l - location)
    :precondition
      (and
        (at ?d ?l)
        (at ?p ?l)
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
