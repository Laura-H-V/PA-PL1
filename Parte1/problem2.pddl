(define (problem problema2)
  (:domain emergencia)
  
  (:objects
    deposito loc1 loc2 - location
    dron1 - drone
    persona1 persona2 - person
    caja1 caja2 caja3 - crate
    comida medicina - content
  )
  
  (:init
    (at dron1 deposito)
    (at caja1 deposito)
    (at caja2 deposito)
    (at caja3 deposito)
    (at persona1 loc1)
    (at persona2 loc2)
    (has-content caja1 comida)
    (has-content caja2 comida)
    (has-content caja3 medicina)
    (free-arm1 dron1)
    (free-arm2 dron1)
  )
  
  (:goal
    (and
      (has persona1 comida)
      (has persona2 medicina)
    )
  )
)