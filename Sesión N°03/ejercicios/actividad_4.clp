(deftemplate País
   (slot Nombre) 
   (multislot Bandera))

(deffacts datos-paises
   (País (Nombre España) (Bandera Rojo Amarillo Rojo))
   (País (Nombre Colombia) (Bandera Amarillo Azul Rojo))
   (País (Nombre Venezuela) (Bandera Amarillo Azul Rojo Blanco)) 
   (País (Nombre Ecuador) (Bandera Amarillo Azul Rojo)) 
   (País (Nombre Perú) (Bandera Rojo Blanco Rojo)) 
   (País (Nombre Argentina) (Bandera Celeste Blanco Celeste Amarillo)))

(deftemplate ColoresABuscar(multislot Colores))

(deffacts colores-a-buscar(ColoresABuscar (Colores Blanco Amarillo)))

(defrule buscar-paises
   ?coloresBuscados <- (ColoresABuscar (Colores $?colores)) 
   ?pais <- (País (Nombre ?nombre) (Bandera $?bandera)) 
   =>
   (bind ?todos-presentes TRUE) 
   (foreach ?color $?colores
      (if (not (member$ ?color $?bandera)) 
         then
         (bind ?todos-presentes FALSE))) 
   (if (eq ?todos-presentes TRUE)
      then
      (printout t "pais que cumple con los colores " ?nombre crlf)))