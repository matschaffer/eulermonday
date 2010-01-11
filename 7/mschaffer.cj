(defn new-prime-generator []
  (def primes '(2))
  (defn prime? [n]
    (loop [divs primes]
      (cond (empty? divs) true
            (zero? (rem n (first divs))) false
            :else (recur (rest divs)))))
  (defn next-prime []
    (loop [potential (inc (last primes))]
      (if (prime? potential)
        (def primes (concat primes (list potential)))
        (recur (inc potential))))
    (last primes))
  (fn [] (next-prime)))

(def generator (new-prime-generator))
(dotimes [x (- 10001 2)] (generator))
(generator)