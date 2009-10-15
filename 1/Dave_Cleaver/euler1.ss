;Create a list of all of the natural values between low and high
(define (naturals low high)
  (if (= low high)
      (list high)
      (cons low (naturals (+ low 1) high))))

;Filter out the matching natural numbers, then sum the list
(define (euler-1 num)
  (apply + (filter (lambda (x) 
                     (or 
                      (= 0 (remainder x 3))
                      (= 0 (remainder x 5))))
                   (naturals 3 (- num 1)))))

;Solve the Project Euler question
(euler-1 1000)