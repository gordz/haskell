all1 :: (a -> Bool) -> [a] -> Bool
all1 p xs = and (map p xs)

--all2 :: (a -> Bool) -> [a] -> Bool
--all2 p xs = map p (and xs)

all3 :: (a -> Bool) -> [a] -> Bool
all3 p = and . map p

all4 :: (a -> Bool) -> [a] -> Bool
all4 p = not . any (not . p)

--all5 :: (a -> Bool) -> [a] -> Bool
--all5 p = map p . and

all6 :: (a -> Bool) -> [a] -> Bool
all6 p xs = foldr (&&) True (map p xs)

all7 :: (a -> Bool) -> [a] -> Bool
all7 p xs = foldr (&&) False (map p xs)

all8 :: (a -> Bool) -> [a] -> Bool
all8 p = foldr (&&) True . map p


-- Any
--any1 :: (a -> Bool) -> [a] -> Bool
--any1 p = map p . or

any2 :: (a -> Bool) -> [a] -> Bool
any2 p = or . map p

any3 :: (a -> Bool) -> [a] -> Bool
any3 p xs = length (filter p xs) > 0

any4 :: (a -> Bool) -> [a] -> Bool
any4 p = not . null . dropWhile (not . p)

any5 :: (a -> Bool) -> [a] -> Bool
any5 p = null . filter p

any6 :: (a -> Bool) -> [a] -> Bool
any6 p xs = not (all (\x -> not (p x)) xs)

any7 :: (a -> Bool) -> [a] -> Bool
any7 p xs = foldr (\ x acc -> (p x) || acc) False xs

any8 :: (a -> Bool) -> [a] -> Bool
any8 p xs = foldr (||) True (map p xs)

-- Drop While Implementation
dropWhile' :: (a -> Bool) -> [a] -> [a]
dropWhile' _ [] = []
dropWhile' p (x:xs)
	| p x = dropWhile p xs
	| otherwise = xs

dropWhile'' :: (a -> Bool) -> [a] -> [a]
dropWhile'' _ [] = []
dropWhile'' p (x:xs)
	| p x = dropWhile p xs
	| otherwise = x : xs

-- Map as foldr
-- map1 :: (a -> b) -> [a] -> [b]
-- map1 f = foldr (\x xs -> xs ++ [f x]) []

--map2 :: (a -> b) -> [a] -> [b]
--map2 f = foldr (\x xs -> f x ++ xs) []

--map3 :: (a -> b) -> [a] -> [b]
--map3 f = foldl (\xs x -> f x : xs) []

map4 :: (a -> b) -> [a] -> [b]
map4 f = foldl (\xs x -> xs ++ [f x]) []


-- Filter using folds
filter' :: (a -> Bool) -> [a] -> [a]
filter' p = foldr (\x xs -> if p x then x : xs else xs) []
 

-- dec2int using folds
dec2int :: [Integer] -> Integer
dec2int = foldl (\x y -> (x * 10) + y) 0


-- Compose
compose :: [a -> a] -> (a -> a)
compose = foldr (.) id

-- Curry
curry :: ((a, b) -> c) -> a -> b -> c
curry f 





