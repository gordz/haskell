-- Merges 2 sorted lists in ascending order, returnng a single sorted list in ascending order
merge :: Ord a => [a] -> [a] -> [a]
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys) = if x <= y then x : merge xs (y : ys) else y : merge (x : xs) ys

