(define (domain blocksword)

(:predicates 
(sin_nada_encima ?x)
(encima_mesa ?x)
(brazo_libre)
(sujeto ?x)
(encima_bloque ?x ?y)
)
(:action soltar 
:parameters (?ob) 
:precondition (and (sujeto ?ob)) 
:effect (and (sin_nada_encima ?ob) (brazo_libre) (encima_mesa ?ob) (not (sujeto ?ob)))
)
(:action apilarDesdeMesa
:parameters (?ob ?underob)
:precondition (and (encima_mesa ?ob) (sin_nada_encima ?ob) (sin_nada_encima ?underob))
:effect (and (encima_bloque ?ob ?underob) (not (sin_nada_encima ?underob)) (not (encima_mesa ?ob)))
)
(:action apilarDesdeBloque
:parameters (?ob ?underob_1 ?underob_2)
:precondition (and (sin_nada_encima ?ob) (sin_nada_encima ?underob_2) (encima_bloque ?ob ?underob_1))
:effect (and (sin_nada_encima ?underob_1) (not (encima_bloque ?ob ?underob_1)) (encima_bloque ?ob ?underob_2) (not (sin_nada_encima ?underob_1)))
)
(:action desapilar 
:parameters (?ob ?underob) 
:precondition (and (sin_nada_encima ?ob) (encima_bloque ?ob ?underob)) 
:effect (and (sin_nada_encima ?underob) (encima_mesa ?ob) (not (encima_bloque ?ob ?underob))
))
)