(*1*)	let rec sumto n = if n = 0 then 0 else n + sumto (n - 1) ;;

(*2*)	let rec exp10 n = if n = 0 then 1 else 10 * exp10 (n - 1) ;;

(*3*)	let rec num_cifras n = if n < 10 then 1 else 1 + num_cifras (n / 10) ;;

(*4*)	let rec sum_cifras n = if n < 10 then n else (n mod 10) + sum_cifras (n / 10) ;;
