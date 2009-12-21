;Finds the number of paths from the point to 
;the origin
(define (paths-to-origin x y)
  (cond 
    ((or 
      (= x 0)
      (= y 0))
     1)
    (else
     (+ (paths-to-origin (- x 1) y)
        (paths-to-origin x (- y 1))))))

;Find all the paths by taking the paths from a point 
;in the diagonal starting in the lower left corner 
;and moving to the upper right corner to the origin,
;excluding the two points on the end. The total paths
;is the sum of the squares of these paths + the two 
;paths excluded on the outside
(define (paths width height)
  (+ 2 (let loop ((x 1)
             (y (- height 1)))
         (if (and (= x width)
                  (= y 0))
             0
             (let ((paths (paths-to-origin x y)))
               (+ (* paths paths)
                  (loop (+ x 1) (- y 1))))))))
       
;Solve the problem
(paths 20 20)