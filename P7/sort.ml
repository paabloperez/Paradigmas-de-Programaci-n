let rec insert x = function
	[] -> [x]
	| h::t -> if x <= h 
		  then x :: h :: t
		  else h :: insert x t ;;

let rec isort = function
	[] -> []
	| h::t -> insert h (isort t) ;;
	

let insert_t x l =
    let rec aux prev = function 
        [] -> List.rev_append prev [x]
      | h::t-> if h < x then aux (h::prev) t
               else  List.rev_append prev (x::h::t)
    in aux [] l;;

let isort_t l =
	let rec aux prov = function 
	[] -> prov
	| h::t -> aux (insert_t h prov) t
	in aux [] l ;;
	
let rec rlist n = List.init n (fun _ -> Random.int (2 * n));;

let bigl = rlist 200_000;;

let crono f x =
	let t = Sys.time () in
	let _ = f x in
	Sys.time () -. t ;;
	
let rec creciente n = 
	if n <= 0 then [] else creciente (n-1) @ [n] ;;
	
let creciente n = List.init n succ;;

let decreciente n = List.init n (fun i -> n - i);;
	
let rec decreciente n =
	if n <= 0 then [] else n :: decreciente (n-1) ;;
	
let lc1 = creciente 10_000 ;;
let lc2 = creciente 20_000 ;;

let ld1 = decreciente 10_000 ;;
let ld2 = decreciente 20_000 ;;

let lr1 = rlist 10_000 ;;
let lr2 = rlist 20_000 ;;

(* 
crono isort lc1;; - : float = 0.000599000000001126409	crono isort_t lc1;; - : float = 1.489611 
crono isort lc2;; - : float = 0.00227999999999894953	crono isort_t lc2;; - : float = 6.43089699999999809

isort lc1 = isort_t lc1;; - : bool = true 
En el caso de las ordenación isort, encontrarse un vector creciente es su mejor caso porque va insertando por la cabeza asique va muy rápido.

crono isort ld1;; - : float = 0.882039999999999935	crono isort_t ld1;; - : float = 0.0009840000000025384
crono isort ld2;; - : float = 4.27737000000000478	crono isort_t ld2;; - : float = 0.00233599999999967167

isort ld1 = isort_t ld1;; - : bool = true 
Cuando el vector se vuelve decreciente, la complejidad del algoritmo es cuadrático por lo que al pasar de ld1 a ld2, el tiempo se cuadriplica. 

crono isort lr1;; - : float = 0.44326600000000127	crono isort_t lr1;; - : float = 0.593386999999992781
crono isort lr2;; - : float = 2.0390029999999939	crono isort_t lr2;; - : float = 2.83955699999999922

isort lr1 = isort_t lr1;; - : bool = true
Este sería el caso medio por así decir ya que inserta en donde le va haciendo falta.

*)
let insert_g ord x l =
    let rec aux prev = function 
        [] -> List.rev_append prev [x]
      | h::t-> if ord h x then aux (h::prev) t
               else  List.rev_append prev (x::h::t)
    in aux [] l;;

let isort_g ord l =
	let rec aux prov = function 
	[] -> prov
	| h::t -> aux (insert_g ord h prov) t
	in aux [] l ;;

let rec split l = match l with
	h1::h2::t -> let t1, t2 = split t
		in h1::t1, h2::t2
	| _ -> l, [] ;;
	
let rec merge (l1,l2) = match l1, l2 with
	[], l | l, [] -> l
	| h1::t1, h2::t2 -> if h1 <= h2 then h1 :: merge (t1, l2)
				else h2 :: merge (l1, t2);;

let rec msort l = match l with
	[] | [_] -> l
	| _ -> let l1, l2 = split l
	in merge (msort l1, msort l2) ;;
	
(*

msort lc1 = isort lc1 ;;  - : bool = true
msort lc2 = isort lc2 ;;  - : bool = true
msort ld1 = isort ld1 ;;  - : bool = true
msort ld2 = isort ld2 ;;  - : bool = true
msort lr1 = isort lr1 ;;  - : bool = true
msort lr2 = isort lr2 ;;  - : bool = true

*)

let bigl2 = rlist 105_000;;

let split_t l =
    let rec aux (l1,l2) = function 
            h1::h2::t -> aux (h1::l1, h2::l2) t
          | [h] -> (h::l1, l2)
          | [] -> (l1,l2)
     in aux ([], []) l ;;

let merge_t (l1, l2) =
	let rec aux l (r1, r2)= match (r1, r2) with
            (r, []) | ([], r) -> List.rev_append l  r
	   | (h1::t1, h2::t2) -> if h1 <= h2 then aux (h1::l) (t1, r2)
	                         else aux (h2::l) (r1, t2)
	 in aux [] (l1,l2) ;;

let rec msort' l = match l with
	| [] | [_] -> l
	| _ -> let l1, l2 = split_t l 
	in merge_t (msort' l1, msort' l2);;
         
let bigl3 = [] ;; 
(*No puede dar stack overflow porque cada vez que se llama a la función se va reduciendo la lista a la mitad asique no va a dar stack overlow a no ser que se le pase una cantidad desproporcionadamente grande.*)

(*

# crono msort' lc1;;
- : float = 0.00995000000000001439
# crono msort' lc2;;
- : float = 0.0199910000000000088
# crono msort' ld1;;
- : float = 0.011031000000000013
# crono msort' ld2;;
- : float = 0.0178000000000000103
# crono msort' lr1;;
- : float = 0.0114060000000000272
# crono msort' lr2;;
- : float = 0.0221799999999999775


# crono msort lc1;;
- : float = 0.00973699999999999566
# crono msort lc2;;
- : float = 0.0170219999999999816
# crono msort ld1;;
- : float = 0.0125219999999999776
# crono msort ld2;;
- : float = 0.0175590000000000468
# crono msort lr1;;
- : float = 0.0101470000000000171
# crono msort lr2;;
- : float = 0.0189139999999999864

lc1: Tardan prácticamente lo mismo en ordenarlas.
lc2: Tardan prácticamente lo mismo en ordenarlas.
ld1: Tardan prácticamente lo mismo en ordenarlas.
ld2: Tardan prácticamente lo mismo en ordenarlas.
lr1: Tardan prácticamente lo mismo en ordenarlas.
lr2: Tardan prácticamente lo mismo en ordenarlas pero esta es en la que más diferencia se aprecia.

*)

let rec merge_g ord (l1,l2) = match l1, l2 with
	[], l | l, [] -> l
	| h1::t1, h2::t2 -> if ord h1 h2 then h1 :: merge (t1, l2)
				else h2 :: merge (l1, t2);;

let rec msort_g ord l = match l with
	[] | [_] -> l
	| _ -> let l1, l2 = split l
	in merge_g ord (msort_g ord l1, msort_g ord l2) ;;
