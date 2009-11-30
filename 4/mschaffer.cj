(defn pow [n e]
  (loop [n n e e acc 1]
    (if (zero? e)
      acc
      (recur n (dec e) (* n acc)))))

(defn palendrome? [subject]
  (let [subject (list* (str subject))]
    (= subject (reverse subject))))

(defn euler4 [n]
  (let [min (pow 10 (dec n))
        max (pow 10 n)
        items (range min max)]
    (last (sort
      (for [i items j items]
        (let [product (* i j)]
          (if (palendrome? product) product 0)))))))

(println (euler4 3))