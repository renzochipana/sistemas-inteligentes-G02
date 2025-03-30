(deffacts valores-iniciales(lista 10 5 8 3 15))

(defrule sumar-elementos(lista $?valores)
   =>
   (bind ?suma 0)  
   (foreach ?valor ?valores(bind ?suma (+ ?suma ?valor)))  

   (printout t "la suma es " ?suma crlf))
