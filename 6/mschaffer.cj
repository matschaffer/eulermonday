(load-file "../mschaffer/utils.cj")

(defn sum-of-squares [n]
  (reduce + (map #(pow % 2) (range 1 (inc n)))))

(defn square-of-sums [n]
  (pow (reduce + (range 1 (inc n))) 2))

(defn euler6 [n]
  (- (square-of-sums n) (sum-of-squares n)))

(euler6 100)
