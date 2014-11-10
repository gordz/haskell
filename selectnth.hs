--Select the nth element of a list using recursio n (also possible with tail and drop).
import Prelude hiding ((!!))
(!!) :: [a] -> Int -> a
(x:xs) !! 0 = x 
(x:xs) !! n = xs !! (n - 1)
 
