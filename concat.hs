concat1 :: [[a]] -> [a]
concat1 [] = []
concat1 (xs:xss) = xs : concat1 xss



