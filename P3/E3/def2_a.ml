let pi = (2. *. asin 1.) ;;
let p x = 2. *. pi *. x ;;

let area x = pi *. x *. x ;;

let absf x = if ( x < 0.) then x else -. x;;

let even x = (x mod 2) = 0;;

let next3 x = if (x mod 3) = 0 then x else x + 3 - (x mod 3);;

let is_a_letter x = (x >= 'a' && x<= 'z') || (x >= 'A' && x <= 'Z');;

let string_of_bool x = if x = true then "verdadero" else "falso";;
