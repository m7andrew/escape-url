
(def- chars "0123456789abcdef")

(defn- unreserved? [b]
  (or (<= (chr "a") b (chr "z"))
      (<= (chr "A") b (chr "Z"))
      (<= (chr "0") b (chr "9"))
      (some (partial = b) [(chr "-") (chr "_") (chr ".") (chr "~")])))

(defn- decode [b] 
  (cond (<= (chr "0") b (chr "9")) (- b (chr "0"))
        (<= (chr "a") b (chr "f")) (- (+ 10 b) (chr "a"))
        (<= (chr "A") b (chr "F")) (- (+ 10 b) (chr "A"))
        0))

(defn unescape [str]
  (var i 0) 
  (def out @"")
  (def size (length str))
  (while (< i size) 
    (def b (str i))
    (if (not= b 37)
      (buffer/push-byte out b)
      (buffer/push-byte out (bor (blshift (decode (str (++ i))) 4) (decode (str (++ i)))))) 
    (++ i))
  (string out)) 

(defn escape [str]
  (var i 0) 
  (def out @"")
  (def size (length str))
  (while (< i size) 
    (def b (str i))
    (if (unreserved? b)
      (buffer/push-byte out b)
      (buffer/push-byte out (chr "%") (chars (brshift (band b 0xf0) 4)) (chars (band b 0x0f))))
    (++ i))
  (string out))
