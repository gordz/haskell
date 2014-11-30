module Lab3 where

-----------------------------------------------------------------------------------------------------------------------------
-- LIST COMPREHENSIONS
------------------------------------------------------------------------------------------------------------------------------

-- ===================================
-- Ex. 0 - 2
-- ===================================
-- Select all even numbers from a list using list comprehensions.
evens :: [Integer] -> [Integer]
evens xs = [x | x <- xs, even x] 

-- sum . evens $ [827305 .. 927104] = 43772529500

-- ===================================
-- Ex. 3 - 4 
-- ===================================

-- complete the following line with the correct type signature for this function
-- squares :: ... 
squares :: Integer -> [Integer]
squares n = [x ^ 2 | x <- [1..n]]

sumSquares :: Integer -> Integer
sumSquares n = sum (squares n)

-- ===================================
-- Ex. 5 - 7
-- ===================================

-- complete the following line with the correct type signature for this function
-- squares' :: ...
squares' :: Integer -> Integer -> [Integer]
squares' m n = [x ^ 2 | x <- [(n + 1)..(n+m)]]

sumSquares' :: Integer -> Integer
sumSquares' x = sum . uncurry squares' $ (x, x)

-- ===================================
-- Ex. 8
-- ===================================
-- returns a list of all coordinate pairs on an [0..m] × [0..n] rectangular grid, where m and n are non-bottom Integers >= 0.
coords :: Integer -> Integer -> [(Integer,Integer)]
coords m n = [ (x, y) | x <- [0..m], y <- [0..n]]

