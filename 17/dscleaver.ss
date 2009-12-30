; The length of all the single digits spelled out
(define single-digits (apply + (map string-length '("one" "two" "three" "four" "five" "six" "seven" "eight" "nine"))))

; The length of all the teen numbers
(define teens (apply + (map string-length '("ten" "eleven" "twelve" "thirteen" "fourteen" "fifteen" "sixteen" "seventeen" "eighteen" "nineteen"))))

; The length of all of the tens columns spelled out
(define tens-column (apply + (map string-length '("twenty" "thirty" "forty" "fifty" "sixty" "seventy" "eighty" "ninety"))))

;solution to the problem
(define (euler17)
  (+ (* (+ (* single-digits 9)
           teens
           (* tens-column 10))
        10)
     (* (* (string-length "hundred") 100)
        9)
     (* single-digits 100)
     (* (* (string-length "and")
           99)
        9)
     (string-length "onethousand")))