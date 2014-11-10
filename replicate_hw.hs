replicate3 :: Int -> a -> [a]
replicate3 1 _ = []
replicate3 n x = replicate (n - 1) x ++ [x]

replicate4 :: Int -> a -> [a]
replicate4 0 _ = []
replicate4 n x = x : replicate (n-1) x

