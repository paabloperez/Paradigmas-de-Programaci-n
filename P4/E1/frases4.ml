let p = (1 + 1, asin 1.), true;;
(* Se define una función de int * float y eso *bool asique la salida será el valor de la función con los valores calculados y el true. *)

let (x, y), z = p;;
(* Se está cambiando la formulación de la función p. *)

let p1, p2 = p in let p11, _ = p1 in (p2 , 2 * p11);;
(* Se descompone la función p en dos partes, p1 se corresponde con (1 + 1, asin 1.) y p2 adoptará el valor true, y luego, dentro de la función descarta el valor 1.57... y lo convierte en 2 *p11. *)

let f (x, y) = 2 * x + y;;
(* Se está definiendo una función que básicamente va a calcular el doble del primer número que le pases y le suma el segundo, luego devuelve el resultado. Es una función de int * int -> int *)

let f2 x y z = x + 2 * y + 3 * z;;
(* Se define una función en forma curry mediante la cual se calcula la suma del primero + el doble del segundo + el triple del tercero. Función de int -> int -> int -> int . *)

let g x y z = x (y, z);;
(* Para empezar, no sabemos el tipo de nada ya que casi todo puede ser de cualquier tipo, pero sabemos por ejemplo que para que x sea una función que se aplica sobre y, z tiene que ser de un tipo 'a * 'b -> 'c , después de aportarle a "y" y a "z" eses tipos. Por ello, la definición de la función g va a a ser ('a * 'b * 'c) -> 'a * 'b * 'c . *)

g fst 1 "hola";;
(* La salida será 1 ya que aplica la función g y el resultado es int = 1. Esto es porque aplica el fst del par 1 y "hola", el cual es 1. *)

g snd fst true;;
(* La salida será true ya que aplicando g, el segundo del par fst y true es true. *)

g (function (f, x) -> f (f x)) (function x -> x * x) 3;;
(* Primero aplica la función para elevar al cuadrado sobre 3, lo cual da 9 y luego la f pasa a ser la función de elevar al cuadrado, y la x el 9, como la f dio 9, va a elevar 9 al cuadrado. *)

let x, y, z = 1, 2 , 3;;
(* Le aporta los valores a x, y, z. *)

f2 x y z;;
(* La salida será el resultado de 1 + 2*2 + 3*3, el cual es el entero 14. *)

let x, y, z = y, z, x in f2 x y z;;
(* Está modificando el valor asignado a la letras de forma que aquí la z va a valer lo que valía la x, la y pasa a valer lo que valía la y, y la x pasa a valerlo que valía la z, a eso se le aplica la función f2 y da el entero 11. *)

f2 x y z;;
(* La salida volverá a ser el entero 14 ya que en la expresión de antes las definiciones eran locales. *)

let swap (x,y) = y,x;;
(*Se define una función "swap" mediante la que se invierten las tuplas de un par.*)

let p = 1, 2;;
(*Se define un par.*)

f p;;
(* Calcula la función f en ese par, el resultado es el entero 4. *)

let p = swap p in f p;;
(* Calcula f en el par p invertido, el resultado será el entero 5, (2*2 + 1). *)

f p;;
(* Calcula la función f en ese par, el resultado es el entero 4. Es así y no de otra forma ya que en la expresión anterior se hace una definición local. *)


