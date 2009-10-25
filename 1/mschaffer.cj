(defn div3or5 [n] (or (zero? (rem n 3)) (zero? (rem n 5))))
(reduce + (filter div3or5 (range 1000)))