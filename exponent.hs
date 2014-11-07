import Prelude hiding ((^))

(^) :: (Num t, Eq t) => t -> t -> t
_ ^ 0 = 1
x ^ y = x * (x ^ (y - 1))
 


