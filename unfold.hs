-- Unfold - taken from week 6 homework
-- Unfolds whilst p is false
-- h is applied to x to generate the head of the list
-- t x is use to generate the 'seed' for the next unfold operation
unfold :: (b -> Bool) -> (b -> a) -> (b -> b) -> b -> [a]
unfold p h t x 
	| p x = []
	| otherwise = h x : unfold p h t (t x)

type Bit = Int

int2bin :: Int -> [Bit]
int2bin 0 = []
int2bin n = n `mod` 2 : int2bin ( n `div` 2)


int2bin' :: Int -> [Bit]
int2bin' = unfold (==0) (`mod` 2) (`div` 2)

-- Takes a list of bits and chops into lists of at most 8 bits
chop8 :: [Bit] -> [[Bit]]
chop8 [] = []
chop8 bits = take 8 bits : chop8 (drop 8 bits)


-- Implementation of chop8 using unfold
chop8' :: [Bit] -> [[Bit]]
chop8' = unfold (null) (take 8) (drop 8)

-- Implementation of map using unfold
map' :: (a -> b) -> [a] -> [b]
map' f = unfold (null) (f . head) (tail)

-- Implementation of iterate using unfold
iterate' :: (a -> a) -> a -> [a]
iterate' f = unfold (const False) id f
