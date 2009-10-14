(define (next-fib f1 f2)
  (+ f1 f2))

(define (sum-fibs include? up-to)
  (let loop ((f1 1)
             (f2 1))
    (if (> f1 up-to)
        0
        (if (include? f1)
            (+ f1 (loop (next-fib f1 f2) f1))
            (loop (next-fib f1 f2) f1)))))

(define (euler-2 up-to)
  (sum-fibs even? up-to))

(euler-2 4000000)
