;Euler Problem 4
;A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91  99.
;Find the largest palindrome made from the product of two 3-digit numbers.

;Find the highest n digit number
(define (highest-value n)
  (if (= n 1)
      9
      (+ (* 9 (expt 10 (- n 1))) (highest-value (- n 1)))))

;Find the lowest n digit number
(define (lowest-value n) (expt 10 (- n 1)))

;Check a palindrome by reversing the number and checking it against
;the original
(define (palindrome? n)
  (eq? n (reverse-num n)))

;Reverse a number. Is this faster than my dumb method?
(define (reverse-num n)
  (let loop ((num n)
             (rev 0))
    (if (= num 0)
        rev
        (loop (quotient num 10) (+ (* rev 10) (remainder num 10))))))
  
;easy palindrome
;(define (palindrome? n)
;  (let ((string-list (string->list (number->string n))))
;    (equal? string-list (reverse string-list))))

;Problem solution
(define (euler-4 n) 
  (let ((start (highest-value n))
        (end (lowest-value n)))
    (let loop ((i start)
               (sum (+ start start)))
      (let ((j (- sum i)))
        (cond
          ((< sum (+ end end)) #f)
          ((< i j) (loop start (- sum 1)))
          ((palindrome? (* i j)) (values (* i j) i j))
          (#t (loop (- i 1) sum)))))))