let rec power x y =
	if y = 0
	then 1
	else x * power x (y-1);;
	
let rec power' x y =
	if y = 0
	then 1
	else	if (y mod 2) = 0
		then power' (x*x) (y/2)
		else x * power' (x*x) (y/2);;
		
(* La segunda función es más eficiente que la segunda porque 
realizará menos llamadas recursivas que la primera y además 
aprovecha la paridad del exponente.
*)

let rec powerf x n =
	if n = 0
	then 1.0
	else x *. powerf x (n-1);;
