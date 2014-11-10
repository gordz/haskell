-- Recursive version of elem. Alternatives are to filter, use list expressions etc.
import Prelude hiding (elem)
elem :: Eq a => a -> [a] -> Bool
elem _ [] = False
elem e (x:xs) = if e == x then True else elem e xs


elem' :: Eq a => a -> [a] -> Bool
elem' _ [] = False
elem' e (x:xs)
	| e == x = True
	| otherwise = elem e xs

-- Version using list expression
elem'' :: Eq a => a -> [a] -> Bool
elem'' _ [] = False
elem'' e xs = head [ x | x <- xs, e == x] == e


