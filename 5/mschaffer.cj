(defn gcd [a b]
  (if (zero? b)
    a
    (recur b (rem a b))))

(defn lcm [a b]
  (/ (* a b) (gcd a b)))

(reduce lcm (range 2 200000))

;(reduce(fn[a b](/(* a b)((fn[a b](if(= b 0)a(recur b(rem a b))))a b)))(range 2 21))
