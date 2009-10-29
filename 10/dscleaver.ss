(define (generate-odd-nums start end)
  (let loop ((val (if (odd? end) end (- end 1)))
             (lst '()))
    (cond
      ((= val start) (cons val lst))
      ((< val start) lst)
      (#t
       (loop (- val 2) (cons val lst))))))

(define (no-multiples-of n)
  (let ((square (expt n 2)))
    (lambda (x)
      (or (< x square)
          (not (= (remainder x n) 0))))))

(define (fold-primes-under n func start-value)
  (let loop ((nums (generate-odd-nums 3 n))
             (current-value (func 2 start-value)))
    (let ((square (expt (car nums) 2)))
      (if (> square n) (foldl func current-value nums)
        (loop (filter (no-multiples-of (car nums)) (cdr nums)) (func (car nums) current-value))))))