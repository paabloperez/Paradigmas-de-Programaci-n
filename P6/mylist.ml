(* HD *)
let hd l = match l with
	| h::_ -> h
	| [] -> raise (Failure "hd") ;;

(* TL *)
let tl l = match l with
	| _::t-> t
	| [] -> raise (Failure "tl") ;;

(* LENGTH *)
let rec length = function
	[] -> 0
	| _::t -> 1 + length t ;;

(* COMPARE_LENGTHS *)
let rec compare_lengths l1 l2 =
	match l1,l2 with
	([],[]) -> 0 (* las dos iguales, valor 0 *)
	|(_,[]) -> 1 (* al ser la segunda vacía, la primera es más larga entonces valor 1 *)
	|([],_) -> -1 (* la primera vacía asique la segunda es más grande, valor -1 *)
	|(_::t1,_::t2) -> compare_lengths t1 t2 ;;

(*  COMPARE_LENGTH_WITH *)
let compare_length_with f (a, b) (c, d) =
	compare (f a b) (f c d) ;;
	
(* INIT *)
let init n f=
	if n<0 
	then raise (Invalid_argument "init")
	else let rec aux acc i=
		if i=n 
		then rev acc
		else aux (f i::acc) (i+1) in aux[] 0 ;;
		
(* NTH *)
let nth l n =
	if n<0 
	then raise (Invalid_argument "nth")
	else let rec aux = function
		([], _) -> raise(Failure "uth")
		|(h::_, 0) -> h
		|(_::t, i) -> aux(t, i-1) in aux(l, n) ;;

(* APPEND *)
let rec append a b =
	if a = [] 
	then b
	else (hd a)::(append(tl a) b) ;;
	
(* REV_APPEND *)
let rev_append a b =
	if a=[] 
	then []
	else append (rev a) b ;;
	
(* REV *)
let rec rev = function
	[] -> []
	| h::t -> append (rev t) [h] ;;

(* CONCAT *)
let rec concat = function
	[] -> []
	| h::t -> append h (concat t) ;;
	
(* FLATTEN *)
let flatten = concat ;;

(* SPLIT *)
let rec split = function
	[] -> ([],[])
	| (h1,h2)::t -> let t1,t2 = split t in
	h1::t1,h2::t2 ;;
	
(* COMBINE *)
let rec combine a b =
	match (a, b) with
	[], [] -> []
	| h1::t1, h2::t2 -> (h1,h2) :: (combine (t1) (t2))
	| _ -> raise (Invalid_argument "combine") ;;

(* ASSOC *)
let rec assoc a = function
	| [] -> raise Not_found
	| (k, v)::t ->  if k = a 
			then v 
			else assoc a t ;;
			
(* MEM_ASSOC *)
let rec mem_assoc key = function
	| [] -> false
	| (k, _)::t -> k = key || mem_assoc key t ;;

(* REMOVE_ASSOC *)
let rec remove_assoc key = function
	| [] -> []
	| (k, v)::t ->  if k = key 
			then t 
			else (k, v) :: remove_assoc key t ;;

(* FIND *)
let rec find x = function
	[] -> raise Not_found
	| h::t -> if x h 
		  then h 
		  else find x t ;;
		  
(* FOR_ALL *)
let rec for_all x = function
	[] -> true
	| h::t -> (x h) && (for_all x t) ;;

(* EXISTS *)
let rec exists x = function
	[] -> false
	| h::t -> (x h) || (exists x t) ;;

(* MEM *)
let rec mem x = function
	[] -> false
	| h::t -> if (x = h) 
		  then true
		  else (mem x t) ;;

(* FILTER *)
let rec filter x = function
	[] -> []
	| h::t -> if (x h) 
		  then h::(filter x t)
		  else (filter x t) ;;
		  
(* FIND_ALL *)
let find_all = filter ;;

(* PARTITIOM *)
let rec partition x = function
	[] -> ([],[])
	| h::t -> let (si,no) = partition x t in 
		if (x h) 
		then (h::si,no)
		else (si,h::no) ;;

(* MAP *)
let rec map f = function
	[] -> []
	| h::t -> (f h) :: (map f t) ;;
	
(* REV_MAP *)
let rev_map f l =
	rev (map f l) ;;
	
(* MAP2 *)
let rec map2 f l1 l2 =
	if (length l1 != length l2)
	then raise (Invalid_argument"map2")
	else    if (length l1 == 0) 
		then []
		else (f(hd l1)(hd l2))::map2 f (tl l1)(tl l2)  ;;

(* FOLD_LEFT *)
let rec fold_left f a = function
	[] -> a
	| h::t -> fold_left f (f a h) t ;;

(* FOLD_LEFT *)
let rec fold_right f l a =
	match l with
	[] -> a
	| h::t -> f h (fold_right f t a) ;;
