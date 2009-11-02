(* if f(n-1) = x^2 - y
   where x = 1 + 2 + ... + (n-1)
   and y = 1^2 + 2^2 + ... + (n-1)^2
   then f(n) = (x+n)^2 - (y + n^2)
             = x^2 + 2xn + n^2 - y - n^2
             = x^2 + 2xn - y = x^2 - y + 2xn
             = f(n-1) + 2xn
             = f(n-1) + 2 * n * (n(n-1)/2)
	     = f(n-1) + n * n * (n-1)
	     = f(n-1) + n^3 - n^2 *)
let rec f n = match n with
  1 -> 0
| n -> (f (n-1)) + n * n * (n-1);;

(* tail recursive version *)
let f_tail n =
  let rec help n acc = match n with
    1 -> acc
  | n -> help (n-1) (acc + n * n * (n-1)) in
  help n 0;;

Printf.printf "%d\n" (f 100);;
Printf.printf "%d\n" (f_tail 100);;
