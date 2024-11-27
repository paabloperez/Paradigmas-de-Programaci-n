2 + 5 * 3;;
(*Es una operación que va a dar como resultado un valor de tipo int, en este caso 17.*)

1.25 *. 2.0;;
(*Es una operación que va a dar como resultado unn valor de tipo float, en este caso 5.0 .*)

(*2-2.0;;*)
(*En este caso, va a dar error dado que estamos intentando restarle un float a un int. Error de tipo.*)

(*3.0 + 2.0;;*)
(*Error de tipo porque no se puede sumar dos valores de tipo float con la suma "+", para enteros, debe ser "+.", para float.*)

5 / 3;;
(*- : int = 1 || Da este resultado dado que en este tipo de división nos devuelve la parte entera del cociente de la división.*)

5 mod 3;;
(*- : int = 2 || Nos devuelve 2 dado que al realizar esta operación lo que nos escribe el programa es el resto de la división.*)

2.0 *. 3.0 ** 2.0;;
(*- : float = 18 || El resultado que nos escribirá en la terminal es el float 18, al principio calcula la potencia de la derecha, 3.o (float) al cuadrado y luego la multiplicará por el float 2.0 mediante el multiplicador de floats.*)

2.0 ** 3.0 ** 2.0;;
(*- : float = 64. || En principio debería escribir el resultado de 2 elevado a 2 y eso elevado a 3, que por propiedades de las potencias es lo mismo que 2 elevado a 9.*)

sqrt;;
(*Es una funcion en la cual un float pasa a otro float, donde la operacion que se realiza es hallar la raíz cuadrada del número en cuestión, sin embargo al  no haber número lo que nos devolverá la función será la definición de la misma. - : float -> float = <fun>.*)

(*sqrt 4;;*)
(*Debe dar error de tipo dado que la operacion de raíz cuadrada se realiza sobre floats y en este casso el 4 está escrito como int.*)

int_of_float;;
(*La inversa de la anterior*)

float_of_int;;
(*Es la función inversa a la anterior, en este caso, a partir de un número escrito en su forma de int nos aporta su forma float.*)

3.0 = float_of_int 3;;
(*Nos devuelve el valor booleano true dado que el 3.0 es la versión float del 3 (int).*)

(*int_of_float -2.9;;*)
(*Error sintáctico dado que al poner el número negativo sin paréntesis, lo que el programa entiende es que estás restándole 2.9 a la función.*)

int_of_float 2.1 + int_of_float (-2.9);;
(*Al quedarse con la parte entera de los float, la operación que se realizaría es +2 + (-2)*)

truncate;;
(*Es simplemente una función asique nos aporta su definición.*)

truncate 2.1 + truncate (-2.9);;
(*En este caso al igual que sucede dos lineas antes, al quedarse con la parte entera simplemente de los números, la operación que se realiza da como resultado 0.*)

floor;;
(* - : float -> float = <fun>*)

(*floor 2.1 + floor (-2.9);;*)
(*Error sintáctico, no se puede realizar una suma de floats con el sumador de int, para solucionarlo habría que poner un punto tras el signo de sumar.*)

ceil;;
(* - : float -> float = <fun>* | *El menor entero mayor o igual al argumento*)

ceil 2.1 +. ceil (-2.9);;
(*NO LO SE EXPLICAR*)

int_of_char;;
(* - : char -> float = <fun> | Nos da el número en código ASCII de la letra que le pedimos.*)

int_of_char 'A';;
(* - : int = 65 *)

char_of_int;;
(*Nos da la letra asignada al número que escribimos, a través del código ASCII.*)

char_of_int 66;;
(* - : char = 'B'*)

Char.code;;
(*Int dado el código ASCII devuelve el caracter.*)

Char.code 'B';;
(* - : int = numero del codigo ASCII correspondiente a la B mayúscula.*)

Char.chr;;
(*Char dado el código ASCII devuelve el caracter.*)

Char.chr 67;;
(* - : char = 'letra  que en código ASCII corresponda con el 67'*)

'\067';;
(* - : char = 'C' || Devolverá el caracter correpondiente al número 67 en código ASCII.*)

Char.chr (Char.code 'a' - Char.code 'A' + Char.code 'M');;
(* Devolverá el char correspondiente al número que resulte de la suma de dentro del paréntesis asique será algo como || - : char = 'algo'*)

Char.lowercase_ascii;;
(*ES simplemente el nombre de la función asique devolverá su definición. || - : char -> char = <fun>*)

Char.lowercase_ascii 'M';;
(*Devuelve la letra del caracter que le hemos escrito, pero en minúscula || - : char = 'm'*)

Char.uppercase_ascii;;
(*ES simplemente el nombre de la función asique devolverá su definición. || - : char -> char = <fun>*)

Char.uppercase_ascii 'm';;
(* - : char = 'M' *)

"this is a string";;
(* - : string = "this is a string"*)

String.length;;
(*Es simplemente la definición de la función asique creo que va a devolver lo siguiente: - : string -> int = <fun>*)

String.length "longitud";;
(*Devolverá el int que represente la longitud en caracteres del string, algo así:  - : int = algo*)

(*"1999" + "1";;*)
(*Va a dar error de tipo porque no se pueden sumar strings, con esta suma solo se pueden sumar enteros.*)

"1999" ^ "1";;
(*va a devolver - : string = "19991" porque mediante esta operación se añade un string al final del otro string.*)

int_of_string;;
(* - : string -> int = <fun>*)

int_of_string "1999" + 1;;
(*- : int = 2000*)

"\065\066";;
(*Va a devolver - : string = "AB"*)

string_of_int;;
(* - : int -> string = <fun>*)

string_of_int 010;;
(* - : string = "10"*)

not true;;
(*Va a devolver el valor booleano false de la siguiente forma: - : bool = false*)

true && false;;
(* - : bool = false *)

true || false;;
(* - : bool = true *)

(1<2) = false;;
(* - : bool = false *)

"1" < "2";;
(* - : bool = true *)

2 < 12;;
(* - : bool = true*)

"2" < "12";;
(* - : bool = false *)

"uno" < "dos";;
(* - : bool = false *)

if 3 = 4 then 0 else 4;;
(* - : int = 4*)

if 3 = 4 then "0" else "4";;
(* - : string = "4"*)

(*if 3 = 4 then 0 else "4";;*)
(*Error porque la información debe de ser del mismo tipo a ambos lados.*)

(if 3 < 5 then 8 else 10) + 4;;
(* - : int = 12*)
