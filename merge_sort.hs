-- Merges 2 sorted lists in ascending order, returnng a single sorted list in ascending order
merge :: Ord a => [a] -> [a] -> [a]
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys) = if x <= y then x : merge xs (y : ys) else y : merge (x : xs) ys

-- Split list in 2
halve :: [a] -> ([a], [a])
halve xs = splitAt (length xs `div` 2) xs

-- Merge sort
msort :: Ord a => [a] -> [a]
msort [] = []
msort [x] = [x]
msort xs = merge (msort ys) (msort zs)
	where (ys, zs) = halve xs

