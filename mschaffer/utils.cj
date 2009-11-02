(defn pow [n e]
  (loop [n n e e acc 1]
    (if (zero? e)
      acc
      (recur n (dec e) (* n acc)))))