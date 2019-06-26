# Bugs

* Grading puede dar fail si el poset no es homogeneo, incluso cuando admite un grading!


# Colorings

falta la parte de spanning collapsible subposets

# Homotopy 

falta traducir MinWeakCore, IsCollapsible y QCCores

# Deformations

falta la parte de random reductions

# Traducir https://github.com/ximenafernandez/Finite-Spaces/Morse.sage

# Funciones hechas por Kevin

* Más cosas de posets de subgrupos

* Más cosas de fences?

# Homotopy Colimits de posets

* Decidir como construir diagramas de posets.

# Más Funciones de posets (por ejemplo posets en n puntos)
[http://doc.sagemath.org/html/en/reference/combinat/sage/combinat/posets/posets.html]

# Más cosas del libro de Jonathan

# Ejemplos de artículos (posiblemente como casos de prueba)

# Pregunta: es razonable que las QC y QCop se llamen UpQC y DownQC? Lo mismo con las Middle y MiddleOp reductions.

# Optimizar cosas

* PosetFromCoveringRelations: hacer Floyd-Warshall a mano

* FixedPointProperty

* HomPosets

* Optimizar todavía más AutomorphismGroup, IsomorphismPosets. Es conveniente usar el paquete GRAPE para esto? Calculando el diagrama de hasse y pensandolo como grafo dirigido.

* Algunas construcciones (por ejemplo cociente y producto) tienen nombres que permiten recuperar los nombres originales de los puntos.
Esto hace que al iterar muchas veces las construcciones los nombres se vuelvan muy complejos, por ejemplo
```
gap> Set(UpOsakiCore(TheWallet()));
[ [ 2, 
      [ [ 1, [ 1, [ 1, [ 1, 11 ] ] ] ], 
          [ 2, 
              [ [ 1, [ 1, [ 1, 9 ] ] ], 
                  [ 2, 
                      [ [ 1, [ 1, 3 ] ], [ 1, [ 1, 6 ] ], [ 1, [ 1, 8 ] ], 
                          [ 1, [ 1, 10 ] ], 
                          [ 2, [ [ 1, 4 ], [ 1, 7 ], [ 2, [ 1, 2, 5 ] ] ] ] ] 
                     ] ] ] ] ] ]
```
El UpOsakiCore es un poset de un punto con un nombre muy complejo.

# Preordenes, T_0-ificación

Muchas cosas se pueden hacer directamente en preórdenes. Por ahí es conveniente hacer un tipo preorden y que poset sea subtipo de preorden. Hay que pensarlo pero parece tener sentido.


# Armar bien la ayuda. Chequear que aparezcan los InstallOtherMethod que no se documentan automaticamente con #!.
