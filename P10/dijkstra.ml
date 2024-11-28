
let v = [|[|None; Some 2; Some 1; Some 3|];
          [|None; Some 3; None; None|];
          [|None; None; None; Some 1|];
          [|Some 1; None; None; None|]|];;
          
          
let cuadrada v = 
    let n = Array.length v in
    Array.for_all (fun r -> Array.length r = n) v;;
    
let noneg = function 
    None -> true
  | Some n -> n >= 0;;
  
  
let valida m = 
    let n = Array.length v in
    Array.for_all (fun r -> Array.length r = n &&
                            Array.for_all noneg r) v;;
             

let dijkstra w = 
        let rec min = function 
            [] -> None
            | (nodo, peso) :: [] -> Some (nodo, peso)
            | (nodo, peso) :: t -> let Some (nodo2, peso2) = min t in
                                   if peso < peso2 then Some (nodo,peso)
                                   else Some (nodo2,peso2) in
        let elimina nodo l = List.filter (fun (n,p) -> n <> nodo) l  in                           
	if (valida w) 
	then (let n = Array.length w in
	      let last_node = n - 1 in
	      let def = Array.make (n) false in
	      let min_w = Array.make_matrix n n None in
	      let q = ref [] in
	      let rec search_from ini  = 
	          match min !q with
	                None -> ()
	              | Some (n,p) -> (def.(n) <- true;
	                              q := (elimina n !q);    
	                              min_w.(ini).(n) <- Some p;
	                              for k = 0 to last_node do
	                                  if def.(k) then () else
	                                  match w.(n).(k) with
	                                        None -> ()
	                                      | Some p' -> match min_w.(n).(k) with
	                                                   None -> (min_w.(n).(k) <- Some (p+p');
	                                                             q := (k, p + p') :: !q)
	                                                 | Some pv -> if p + p' < pv then
	                                                              (min_w.(n).(k) <- Some (p+p');
	                                                               q := (k, p + p') :: !q)
	                                                              else ()
	                              done;
	                              search_from ini)
	      in    
	      for ini = 0 to last_node do
	          Array.fill def 0 n false;
	          q :=[ini,0];
	          search_from ini
	      done;
	      min_w
	) else raise (Invalid_argument "dijkstra");;
	
	
	
	
