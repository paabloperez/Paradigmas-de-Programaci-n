(* REVERSE *)
	
	let rec exp10 n = if n = 0 then 1 else 10 * exp10 (n - 1) ;;

	let rec num_cifras n = if n < 10 then 1 else 1 + num_cifras (n / 10) ;;

let rec reverse n = 

	if n < 10 
	then n 
	else reverse (n / 10) + (n mod 10) * exp10 ( num_cifras (n/10) ) ;;
    
    
(* PALÍNDROMO *)

let palindromo s = 
    let rec check i j =
        i >= j ||
        (s.[i] = s.[j] && check (i+1) (j-1))
    in check 0 (String.length s - 1) ;;
    
    	(* 0 es la primera posición del string y la longitud - 1 es la última *)
    	(* con s.(i) se accede a la posición i del string *)
    	
 
(*MCD*)
	
let rec mcd (x,y) =
	if y = 0
	then x
	else mcd (y, x mod y) ;;
	
    	
(* let rec es_palindromo s =
	let longitud = String.length s in
	let rec comparar_caracteres inicio fin =
		if inicio >= fin
		then true
		else if s.[inicio] = s.[fin]
		then comparar_caracteres (inicio + 1) (fin - 1)
		else false
		in comparar_caracteres 0 (longitud - 1)
		*)
