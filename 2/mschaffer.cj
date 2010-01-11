; using closure-encapsulated state
(defn newfibgen []
  (def n1 1)
  (def n2 1)
  (fn [] (do
    (def next (+ n1 n2))
    (def n1 n2)
    (def n2 next)
    next)))

(defn fibsupto [n]
  (def fib (newfibgen))
  (loop [current (fib) collected ()]
    (if (>= current n)
      collected
      (recur (fib) (conj collected current)))))

(reduce + (filter even? (fibsupto 4000000)))

; or using lazy sequences
(defn euler2 [n]
  (def fibs (lazy-cat '(0 1) (map + fibs (rest fibs))))
  (reduce + (filter even? (take-while #(< % n) fibs))))

(euler2 4000000)

; one-liner for good measure
(def fibs (lazy-cat '(0 1) (map + fibs (rest fibs)))) (reduce + (filter even? (take-while #(< % 4000000) fibs)))