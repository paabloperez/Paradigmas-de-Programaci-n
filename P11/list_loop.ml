let length = List.length ;;

let rec last = function
   [] -> failwith "last"
 | h ::[] -> h
 | _ :: t -> last t ;;

let nth = List.nth ;;

let rev = List.rev ;;

let append = List.append ;;

let concat = List.concat ;;

let for_all = List.for_all

let exists = List.exists ;;

let find_opt = List.find_opt ;;

let iter = List.iter ;;

let fold_left = List.fold_left ;;

let length = function
  while length l <> \0
