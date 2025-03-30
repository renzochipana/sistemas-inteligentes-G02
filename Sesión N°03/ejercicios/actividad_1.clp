(deffacts valores-prueba(lista 10 50 28 30 15))

(defrule min_encontrar(lista $?valores)
   =>
   (bind ?minimo (nth$ 1 $?valores))
   (bind ?resto (rest$ $?valores))

   (if (eq (length$ ?resto) 0) then
      (printout t "el minimo elemento es " ?minimo crlf)
   else
      (foreach ?valor ?resto
         (if (< ?valor ?minimo) then
            (bind ?minimo ?valor)))
      (printout t "el minimo elemento es " ?minimo crlf))
)
