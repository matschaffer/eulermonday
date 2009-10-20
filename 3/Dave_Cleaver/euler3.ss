;Solution to Problem 3, Done after discussion of solution at
;Project Euler Monday.
(define (euler-3 num)
  (let loop ((factor 2)
             (n num))
    (cond
      ((= factor n)
       factor)
      ((= (remainder n factor) 0)
       (loop factor (quotient n factor)))
      (#t (loop (+ factor 1) n)))))

;Run the problem
(euler-3 600851475143)