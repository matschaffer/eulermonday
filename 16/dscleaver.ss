;Turns a character into the number that the character represents
(define (char->number char)
  (- (char->integer char) 48))

;Turns a number into a list
(define (number->list num)
  (map char->number (string->list (number->string num))))

;Add all of the digits in 2^pow
(define (euler16 pow)
  (apply + (number->list (expt 2 pow))))

;Solve the problem
(euler16 1000)