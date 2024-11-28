let rec fib n =
	if n <= 1
	then n
	else fib (n-1) + fib (n-2)
	
let fibto n =
    let rec loop i = 
        let f = fib i in
        if f <= n then (print_endline (string_of_int f); loop (i+1))
        else ()
    in loop 0;;
    
if Array.length (Sys.argv)<>2
	then print_endline "fibto: invalid number of arguments"
	else fibto (int_of_string Sys.argv.(1));;
