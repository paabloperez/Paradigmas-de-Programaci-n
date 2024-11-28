let f n = if n mod 2 = 0 then n / 2 else 3 * n + 1;;


(* ÓRBITA *)
let rec orbit n =
	if n = 1 
	then "1"
	else (string_of_int n) ^ (", ") ^ (orbit (f n)) ;;

(* LENGTH *)
let rec length n =
	if n = 1
	then 0
	else 1 + length (f n) ;;

(* TOP *)
let rec top n =
	if n = 1
	then 0
	else max n (top(f n)) ;;

(* LENGTH'N'TOP *)
let rec length'n'top n =
	if n = 1 
	then (0,1)
	else let l,t = length'n'top (f n)
	in (l+1, max n t) ;;

(* LONGEST_IN *)
let rec longest_in m n =
	let rec aux (imax, lmax) i=
		if i > n then (imax, lmax) 
		else let l = length i in 
			if l > lmax then aux (i, l) (i + 1)
				else aux (imax, lmax) (i + 1)
				in aux (m, length m) (m + 1) ;;

(* HIGHEST IN *)
let rec highest_in m n =
	let rec aux (imax, lmax) i=
	if i > n 
	then (imax, lmax) 
	else let l = top i in 
		if l > lmax 
		then aux (i, l) (i + 1)
		else aux (imax, lmax) (i + 1) in 
		     aux (m, top m) (m + 1) ;;
