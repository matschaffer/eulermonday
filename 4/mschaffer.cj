(defn pow [n e]
  (if (zero? e)
    1
    (* n (pow n (dec e)))))

(defn as-seq [subject] 
  (list* (str subject)))

(defn palendrome? [subject] 
  (= (as-seq subject) (reverse (as-seq subject))))

(defn euler4 [n]
  (let [max (pow 10 n)]
    (def palendromes '())
    (dotimes [i max]
      (dotimes [j max]
        (let [product (* i j)]
          (if (and (palendrome? product) (not (zero? product)))
            (def palendromes (conj palendromes product))))))
    (last (sort palendromes))))

(println (euler4 3))