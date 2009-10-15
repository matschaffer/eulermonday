;Solves the square of sums - the sum of squares for all of
;the natural numbers up to num
(define (euler-6 num)
  (let loop ((n num)
             (sum-squares 0)
             (sum 0))
    (if (= n 0)
        (- (* sum sum) sum-squares)
        (loop (- n 1) (+ sum-squares (* n n))
              (+ sum n)))))

; Solve Euler problem 6
(euler-6 100)