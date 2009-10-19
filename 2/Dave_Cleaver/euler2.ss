;Simply sums the provided values
(define (next-fib f1 f2)
  (+ f1 f2))

;Generic function for the fun of it that sums all fibonacci values
;that match the include? function
(define (sum-fibs include? up-to)
  (let loop ((f1 1)
             (f2 1))
    (if (> f1 up-to)
        0
        (if (include? f1)
            (+ f1 (loop (next-fib f1 f2) f1))
            (loop (next-fib f1 f2) f1)))))

;Euler 2 requires summing only the even fibonacci values
(define (euler-2 up-to)
  (sum-fibs even? up-to))

;Solve the Project Euler question
(euler-2 4000000)
