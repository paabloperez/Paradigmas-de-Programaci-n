let come (i1,j1) (i2,j2) =
	i1 = i2 || j1 = j2 || abs (i1-i2) = abs (j1-j2);;
	
let compatible p l =
	not (List.exists (come p) l);;
	
let queens n =
  let rec compatible (i, j) path =
	List.for_all (fun (x, y) -> i <> x && j <> y && abs (i - x) <> abs (j - y)) path
	in let rec completa path i j =
    if i > n then [path]
    else if j > n then []
    else if compatible (i, j) path 
    then completa ((i, j) :: path) (i + 1) 1 @ completa path i (j + 1)
    else completa path i (j + 1)
  in completa [] 1 1 ;;
  
let is_queens_sol n sol =
  let compatible (i, j) path =
    List.for_all (fun (x, y) -> i <> x && j <> y && abs (i - x) <> abs (j - y)) path
  in let rec check path = function
    | [] -> true
    | (i, j) :: rest -> compatible (i, j) path && check ((i, j) :: path) rest
  in check [] sol ;;
