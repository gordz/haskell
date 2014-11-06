import Data.Char

let2int :: Char -> Int
let2int c = ord c - ord 'a'

int2let :: Int -> Char
int2let n = chr (ord 'a' + n)

shift :: Int -> Char -> Char
shift n c
	| c = int2let ((let2int c + n) `mod` 26)
	| otherwise = c

-- Encode
encode :: Int -> String -> String
encode n xs = [shift n x | x <- xs]

-- Decode
decode :: Int -> String -> String
decode n xs = [shift (negate n) x | x <- xs]

