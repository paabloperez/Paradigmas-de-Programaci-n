(*x-y;;*)
(*No le metimos ningún valor ni a x ni a y asique debería de dar error.*)

let  x=1;;
(*Esta es la forma de asignarle un nombre al número 1. La salida fue: val x : int = 1*)

(*x-y;;*)
(*Debería dar error porque no le dimos ningún valor a la y.*)

let y = 2;;
(*Le asignamos la letra y al número 2 y la salida va a ser: val y : int = 2.*)

x-y;;
(*En este caso va a escribir el resultado de hacer la operación x(1) - y(2) = -1. La salida fue - : int = -1.*)

(*let x = y in x - y;; /// *) (function x -> x - y) y;;
(*Hará que tanto x como y valgan lo mismo y realizará la operación.*)

x - y;;
(*Va a realizar la operación de x - y, 1-2 y devuelve - : int = -1.*)

(*z;;*)
(*Va a dar error porque a z no se le ha asignado nada.*)

let z = x + y;;
(*Se le asigna a z el resulrado de la resta de x - y, asique va a escribirnos cual es el valor de z. La salida fue val z : int = 3.*)

z;;
(*Esta vez z ya tiene un valor asignado asique va a escribirnos cual es su valor. La salida fue : - : int = -1*)

let x=5;;
(*Le asignamos a x el valor 5 y devuelve val x : int = 5.*)

x+y;;
(*Va a realizar la suma de x+y, 5+2, la salida será - : int = 7.*)

z;;
(*Pensaba que iba a devolver - : int = 7 pero devuelve el valor 3 asique tomó el valor anterior de x 2 y no el 5.*)

(*let y=5 in x+y;; ///*) (function y -> x+y) 5;;
(*Estamos definiendo y con el valor 5. La salida será val y : int = 5.*)

x+y;;
(*Nos da el valor de sumar x + y, x vale 5 y "y" vale 2, por lo que la suma es 7.*)

(*let x = x + y in let y = x * y in x + y + z;; /// *)(function x -> (function y -> x + y + z) (x * y)) (x + y);;

(*Para empezar, al entrar a la función, la x vale 5, la y vale 2 y la z vale 3, asique al procesar esta expresión, vamos a tener que x pasa a valer 7, y va a valer 14 y la suma va a dar 7 + 14 + 7, devolverá 24.*)

x + y + z;;
(*Va a devolver la suma de x(5) + y(2) + z(3) = - : int = 10.*)

function  x -> 2 * x;;
(*Crea una función que devuelve el doble del numero que le pases asique escribirá int -> int = <fun>*)

(function x -> 2 * x) (2 + 1);;
(*Va a devolver - : int = 6.*)

(function x -> 2 * x) 2 + 1;;
(*Devuelve - : int = 5 porque al no haber paréntesis, aplica la función solo al 2 asique la operación que realiza es 2*2 + 1 = 5.*)

let f = function x -> 2 * x;;
(*Estamos nombrando la función anterior asique dará la definición de la función: val f : int -> int = <fun>*)

f;;
(*Nos devuelve lo mismo que en la anterior orden: int -> int = <fun>*)

f (2+1);;
(*Realiza la operación y devuelve: - : int = 6*)

f 2 + 1;;
(*Va a realizar el doble de 2 y sumarle 1, resultará 5. Devolverá - : int = 5.*)

f x;;
(*Multiplica x por 2 y devuelve el valor, x vale 5 asique devolverá 10. Devolvió - : int = 10.*)

let m = 1000;;
(*Se le asigna la letra m al valor 1000, devuelve val m : int = 1000.*)

let g = function x -> x + m;;
(*Le damos el nombre g a la función que a un número le suma 1000, devuelve val g : int -> int = <fun>*)

g;;
(* - : int -> int = <fun>, simplemente nos tiene que dar la definición de la función.*)

g 3;;
(*Devuelve - : int = 1003. Aplica la función asique hace 1000 + 3 = 1003.*)

(*g 3.0;;*)
(*Error de tipo porque la función es con int asique con float da fallos.*)

let m = 7;;
(*Se le asigna a m el valor 7 asique devuelve val m : int = 7.*)

g 3;;
(*Devuelve - : int = 1003.*)

let istrue = function true -> true;;
(*Crea y nombra la función istrue mediante la cual cuando algo es verdadero, devuelve verdadero, devolverá su definición, val istrue : bool -> bool = <fun>*)

istrue;;
(*- : bool -> bool = <fun> devuelve la definición de la función.*)

istrue (1<2);;
(*Va a devolver el valor booleano true de la siguiente forma - : bool = true.*)

istrue (2<1);;
(*Da error porque no contempla el caso en el que da false asique pone lo siguiente: Exception: Match_failure ("//toplevel//", 1, 13) *)

(*istrue 0;;*)
(*Error de tipo, la función actúa sobre valores booleanos no sobre int.*)

let iscero_v1 = function 0 ->true;;
(*Se crea y se nombra la función iscero_v1 en la cual cuando se le pasa el int 0, devuelve true, y el programa escribirá: val iscero_v1 : int -> bool = <fun>*)

iscero_v1 0;;
(*Ya que le pasamos el int 0, el programa nos devuelve true de la siguiente forma: - : bool = true*)

iscero_v1 1;;
(*Va a dar error ya que esta función solo contempla que el int que le pasamos sea el 0.*)

let iscero_v2 = function 0 -> true | _ -> false;;
(*Creamos y nombramos la función iscero_v2 mediante la cual cuando le pasamos el int 0 devuelve true y en el resto de casos devuelve false. Nos devolverá val iscero_v2 : int -> bool = <fun>*)

iscero_v2 0;;
(* - : bool = true*)

iscero_v2 1;;
(* - : bool = false*)

(*iscero_v2 0.;;*)
(*Error de tipo porque esta función va de int en bool pero en este caso le estamos pasando un float.*)

let all_to_true = function true -> true | false -> true;;
(*Creamos y definimos la función all_to_true mediante sea el valor booleano que sea, la función va a devolver true. Devuelve lo siguiente: val all_to_true : bool -> bool = <fun>*)

all_to_true (1<2);;
(*Va a devolver - : bool = true porque la condición es verdadera entonces el programa devuelve true.*)

all_to_true (2<1);;
(*Va a devolver - : bool = false porque la condición es falsa entonces el programa devuelve false.*)

(*all_to_true 0;;*)
(*Error de tipo porque la función va de bool en bool y aquí le estamos pasando un int.*)

let first_all_to_true = all_to_true;;
(*Estamos renombrando la función all_to_true, nos devolverá la definición.*)

let all_to_true = function x -> true;;
(*Creamos y definimos la función all_to_true de nuevo pero de otra forma, esta vez pasemos lo que le pasemos devuelve un bool*)

all_to_true (1<2);;
(*Devuelve true de la siguiente forma - : bool = true.*)

all_to_true (2<1);;
(*Devuelve true de la siguiente forma - : bool = true.*)

all_to_true 0;;
(*Devuelve true de la siguiente forma - : bool = true.*)

(*first_all_to_true 0;;*)
(*Error de tipo porque la función va de bool en bool y aquí le estamos pasando un int.*)


