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

;Multiplies a zipped set of numbers to produce a final number
(define (multiply-zipped zipped-nums)
  (apply * (map (lambda (x)
                  (expt (car x) (cdr x)))
                zipped-nums)))

;Mixes two ordered zipped lists keeping the maximum occurances in
;the final list.
(define (mix-factors f1 f2)
  (cond
    ((null? f1) f2)
    ((null? f2) f1)
    ((< (car (car f1))
        (car (car f2)))
     (cons (car f1) (mix-factors (cdr f1) f2)))
    ((> (car (car f1))
        (car (car f2)))
     (cons (car f2) (mix-factors f1 (cdr f2))))
    (#t
     (cons (cons (car (car f1))
                 (max (cdr (car f1)) (cdr (car f2))))
           (mix-factors (cdr f1) (cdr f2))))))

;Solve Euler 5 by looping up to num, and mixing the prime factors
;at each iteration into a list.
(define (euler-5 num)
  (let loop ((factors '())
             (i 2))
    (if (= i num)
        (multiply-zipped factors)
        (loop (mix-factors (prime-factors i)
                           factors)
              (+ i 1)))))

;Solve Euler 5
(euler-5 20)
