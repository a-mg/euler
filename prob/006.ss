((lambda (nums)
   (- (square (apply + nums))
      (apply + (map square nums))))
 (iota 100 1))
