(define (problem problema1)
  (:domain emergencia)

  (:objects
    deposito loc1 - location
    dron1 - drone
    persona1 - person
    caja1 - crate
    comida - content
  )

  (:init
    (at-drone dron1 deposito)
    (at-crate caja1 deposito)
    (at-person persona1 loc1)

    (has-content caja1 comida)

    (free-arm1 dron1)
    (free-arm2 dron1)

    (available caja1)
  )

  (:goal
    (has persona1 comida)
  )
)