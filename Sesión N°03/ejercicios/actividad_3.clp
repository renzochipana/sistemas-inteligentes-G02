(deffacts vectores
   (cadena1 B C A D E E B C E) 
   (cadena2 E E B C A F E))  

(defrule calcular-union
   (cadena1 $?vector1) 
   (cadena2 $?vector2) 
   =>
   (bind ?union (create$)) 
   (foreach ?elemento $?vector1
      (if (and (member$ ?elemento $?vector2) 
               (not (member$ ?elemento ?union))) 
          then
          (bind ?union (create$ ?union ?elemento)))) 
   (printout t "(union " ?union ")" crlf)) 