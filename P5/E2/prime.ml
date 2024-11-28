let is_prime n =
	let rec check_from i =
		i >= n ||
		(n mod i <> 0 && check_from (i+1))
		in check_from 2;;
		
let rec next_prime n =
	if n<2 
	then next_prime 2
	else    if is_prime (n+1)
		then n+1
		else next_prime (n + 1) ;;
		
let rec last_prime_to n =
	if n<=2
	then 2
	else    if is_prime n
		then n
		else last_prime_to (n - 1);;
		
let rec is_prime2 n =
	let rec check_from i =
		i*i > n ||
		(n mod i <> 0 && check_from (i+2))
		in (n mod 2 <> 0) && check_from 3;;
		
