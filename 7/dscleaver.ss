;Detect prime by looping over all previous prime values
;to check if the target number is divisible by any of them.
;Stop when you reach the square root of the target number
(define (prime? list-of-primes num)
  (let loop ((primes list-of-primes)
             (limit (sqrt num)))
    (cond 
      ((> (car primes) limit) #t)
      ((= (remainder num (car primes)) 0) #f)
      (#t (loop (cdr primes) limit)))))

;Solve Euler Problem 7 by incrementing through the odd values
;and gathering the primes until the target number of primes is
;reached.
(define (euler-7 target)
  (let loop ((primes '(2))
             (value 3)
             (num 1))
    (cond
      ((= num target) 
       (if (= num 1)
           2
           (- value 2)))
      ((prime? primes value)
       (loop (append primes (list value)) (+ value 2) (+ num 1)))
      (#t (loop primes (+ value 2) num)))))

(euler-7 10001)