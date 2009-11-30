(require 'clojure.contrib.math)

(defn primes-below [n]
  (let [limit (sqrt n)]
    (loop [primes () siv (range 2 (inc n))]
      (let [prime (first siv)
            possible-prime (fn [n] (not (zero? (rem n prime))))]
        (if (> prime limit)
          (concat primes siv)
          (recur (concat primes (list prime))
                 (filter possible-prime (rest siv))))))))

(do (primes-below 100000000) nil)

(defn euler3 [n]
  (loop [remainder n primes (primes-below n)]
    (let [current (first primes)]
      (if (= (/ remainder current) 1)
        current
        (if (zero? (rem remainder current))
          (loop ))
         
(def x 0)
(while (> x 3) (def x (inc x)) (println x))
x
(euler3 13195)
(euler3 600851475143)
