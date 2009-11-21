;;Works like foldl on the list of primes under the provided n
;;Primes are generated using the Sieve of Eratosthenes. 
(define (fold-primes n func start-value)
  (let loop ((nums (odd-nums 3 n))
             (current-value (func 2 start-value)))
    (let ((square (expt (car nums) 2)))
      (if (> square n) 
          (foldl func current-value nums)
          (loop (filter (orf (less-than square)
                                (notf (multiple-of (car nums))))
                        (cdr nums)) 
                (func (car nums) current-value))))))

;;Generate a list of prime numbers from start to end.
(define (odd-nums start end)
  (let iter ((val (if (odd? end) end (- end 1)))
             (lst '()))
    (cond
      ((= val start) (cons val lst))
      ((< val start) lst)
      (#t
       (iter (- val 2) (cons val lst))))))

;;Take two functions int->bool and returns a function
;;int->bool that performs an or on the results of the input
;;functions
(define (orf f g)
  (lambda (x)
    (or (f x) (g x))))

;;Take a function int->bool and convert it to an int->bool
;;function that performs a not on the input function
(define (notf f)
  (lambda (x)
    (not (f x))))

;;Create a function that returns true for all multiples
;;of n
(define (multiple-of n)
    (lambda (x)
      (= (remainder x n) 0)))

;;Create a function that returns true for all numbers
;;less than n
(define (less-than n)
    (lambda (x)
      (< x n)))

(define (euler10)
  (fold-primes 2000000 + 0))