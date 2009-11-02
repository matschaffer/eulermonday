(defn sqrt [x]
  (int (Math/sqrt x)))

(defn get-smallest-prime-factor [n]
  (loop [n n d 2]
    (cond (> d (sqrt n)) n
      (= n d) n
      (= 0 (rem n d)) d
      true (recur n (inc d)))))

(def get-nth-prime
  (lazy-cat '(2 3)
    (filter
      #(= % (get-smallest-prime-factor %))
      (filter
        #(or (= 1 (rem % 6)) (= 5 (rem % 6)))
        (take-nth 2 (iterate inc 3))))))

(println (nth get-nth-prime 10000))
