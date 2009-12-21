;Calculate the number of steps in the chain starting with n
(define (steps n)
  (cond
    ((<= n 1) 1)
    ((even? n)
     (+ 1 (steps (quotient n 2))))
    (else
     (+ 1 (steps (+ (* 3 n) 1))))))

;Search for the max sequence starting with the first odd number
;under the limit. Search to half the limit, because all numbers
;below half the limit have an even number > than them within
;the range. Even numbers are skipped since the longest chain should
;be odd.
(define (euler14 limit)
  (let loop ((n (if (even? limit) (- limit 1) (- limit 2)))
             (ans-length 0)
             (ans 0))
    (if (< n (/ limit 2))
       ans
       (let ((length (steps n)))
         (if (> length ans-length)
             (loop (- n 2) length n)
             (loop (- n 2) ans-length ans))))))

;Solve the problem
(euler14 1000000)