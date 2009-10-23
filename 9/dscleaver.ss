;This solution is built off of solving a + b + c = sum for c
;and plugging the value for c into the pythogorean theorem
;solving for a yields a = ((sum*sum)/2 - sum*b)/(sum - b)

;If we've found a solution, plugging b into the equation will
;yield no remainder
(define (create-test-function sum)
  (let ((half-square (/ (expt sum 2) 2)))
    (lambda (b)
      (= (remainder (- half-square (* sum b))
                    (- sum b)) 0))))

;Now plug b into the equation to get a
(define (calculate-a sum b)
  (/ (- (/ (expt sum 2) 2) (* sum b))
     (- sum b)))

;Search starting at sum/3 because one of a or b must be less than
;that. Search proceeds down, so that I don't explore the unlikely
;low numbers.
(define (euler-9 sum)
  (let ((answer? (create-test-function sum)))
    (let loop ((b (quotient sum 3)))
      (if (answer? b)
          (let ((a (calculate-a sum b)))
            (* a b 
                  (- sum a b)))
          (loop (- b 1))))))

;solve it
(euler-9 1000)