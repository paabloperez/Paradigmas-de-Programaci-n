let pi = (2. *. asin 1.) ;;
let p = function x -> 2. *. pi *. x ;; 

let area = function x -> pi *. x *. x ;;

let absf = function x -> if ( x < 0.) then x else -. x;;

let even = function x -> (x mod 2) = 0;;

(*let rec next3 = function x -> if (x mod 3) = 0 then x else next3 (x+1);;*)

let next3 = function x -> if (x mod 3) = 0 then x else x + 3 - (x mod 3) ;;

let is_a_letter = function x -> (x >= 'a' && x<= 'z') || (x >= 'A' && x <= 'Z');;

let string_of_bool = function x -> if x = true then "verdadero" else "falso";;
