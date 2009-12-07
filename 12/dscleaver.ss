;Zips a list by compressing successive values into a cons of value
;and the number of times it occurs
(define (zip the-list)
  (if (null? the-list) 
      '()
      (let loop ((value (car the-list))
                 (times 1)
                 (rest (cdr the-list)))
        (cond
          ((null? rest) (list (cons value times)))
          ((= value (car rest))
            (loop value (+ times 1) (cdr rest)))
          (#t
            (cons (cons value times)
                  (zip rest)))))))

;Refactored Euler 3 to return all prime factors as a zipped
;list of the form ((2 . 2) (3 . 1))
(define (prime-factors num)
  (zip (let loop ((factor 2)
             (n num))
         (cond
           ((= factor n)
            (list factor))
           ((= (remainder n factor) 0)
            (cons factor (loop factor (/ n factor))))
           (#t (loop (+ factor 1) n))))))

;Calculates the number of divisors by calculating the prime
;factors of n and then finding the product of the occurrences+1
;of each prime factor.
(define (number-of-divisors n)
  (if (= n 1)
      1
      (foldl (lambda (prime y)
               (* (+ (cdr prime) 1) y))
             1 (prime-factors n))))

;Finds the first triangle number with a number of divisors equal to
;or greater than the provided value.
(define (find-triangle-number divisors tri-num next-nat)
  (if (>= (number-of-divisors tri-num) divisors)
      tri-num
      (find-triangle-number divisors (+ tri-num next-nat) (+ next-nat 1))))

;Starts the search
(define (euler12 divisors)
    (find-triangle-number divisors 1 2))

;Solve the problem
(euler12 500)