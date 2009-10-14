(define (naturals low high)
  (if (= low high)
      (list high)
      (cons low (naturals (+ low 1) high))))

(define (euler-1 num)
  (apply + (filter (lambda (x) 
                     (or 
                      (= 0 (remainder x 3))
                      (= 0 (remainder x 5))))
                   (naturals 3 (- num 1)))))

(euler-1 1000)