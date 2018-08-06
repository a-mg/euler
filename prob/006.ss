((lambda (nums)
   (- (square (apply + nums))
      (apply + (map square naturals))))
 (iota 100 1))
