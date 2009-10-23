;Extract the last digits number of digits from num
;return the digits as a list and the value without the digits
(define (list-last digits num)
  (if (= digits 0) 
      (values '() num)
      (let-values (((digit-list val) (list-last (- digits 1) (quotient num 10))))
        (values (cons (remainder num 10) digit-list) val))))

;Take a list of digits and add the provided number to it
;getting the product at the same time.
(define (build-new-list-and-product digits new-digit)
  (if (null? digits)
      (values (list new-digit) new-digit)
      (let-values (((digit-list product) (build-new-list-and-product (cdr digits) new-digit)))
        (values (cons (car digits) digit-list) (* (car digits) product)))))

;Loop through the moving window of digits, always keeping the
;greatest product.
(define (euler-8 digits num)
  (let-values (((initial-digits initial-value) (list-last digits num)))
    (let loop ((digit-list initial-digits)
               (value initial-value)
               (highest-product (apply * initial-digits)))
      (if (= value 0) highest-product
        (let-values (((new-digits product) (build-new-list-and-product (cdr digit-list) (remainder value 10))))
          (loop new-digits
                (quotient value 10)
                (max product highest-product)))))))

;Calculate the solution
(euler-8 5 731671765313306249192251196744265747423553491949349698352031277450632239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450)

          