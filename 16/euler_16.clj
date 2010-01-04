(println (apply + (map #(Integer/parseInt (str %1)) (str (bit-shift-left 2 999)))))
