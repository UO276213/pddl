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
(:action apilar
:parameters (?ob ?underob)
:precondition (and (sin_nada_encima ?ob) (encima_mesa ?ob) (sin_nada_encima ?underob))
:effect (and (encima_mesa ?ob) (encima_bloque ?ob ?underob) (not (sin_nada_encima ?underob)))
)
(:action desapilar 
:parameters (?ob ?underob) 
:precondition (and (sin_nada_encima ?ob) (encima_bloque ?ob ?underob)) 
:effect (and (sin_nada_encima ?underob) (encima_mesa ?ob) (not (encima_bloque ?ob ?underob))
))
)