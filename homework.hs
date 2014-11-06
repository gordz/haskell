-- Given an element, and a list of pairs. 
find :: (Eq a) => a -> [(a,b)] -> [b]
find k t = [ v | (k', v) <- t, k == k']
	
-- Find the positions of a given element in a list.
positions :: (Eq a) => a -> [a] -> [Int]
positions _ [] = []
positions x xs = find x (zip xs [0..(length xs - 1)])
 
positions' :: (Eq a) => a -> [a] -> [Int]
positions' x xs = find x (zip xs [0..n])
 	where n = length xs - 1

 	
-- Return the scalar product of 2 lists. Scalar product is the sum of the products of corresponding integers in the list. 	
scalarproduct :: [ Int ] -> [ Int ] -> Int
scalarproduct xs ys = sum [ x * y | (x, y) <- zip xs ys]