-- Generate fibonnaci numbers.
fibs :: [Integer]
fibs = 0 : 1 : [x + y | (x, y) <- zip fibs (tail fibs)]

-- Returns the n-th Fibonnaci number (counting from zero).
fib :: Int -> Integer
fib n = fibs !! n

-- uses fibs from the previous exercises to calculate the first Fibonacci number greater than 1000.
largeFib :: Integer
largeFib = head (dropWhile (<=1000) fibs)

-- a Tree where nodes have 2 subtrees and a value. Leaf nodes have no value stored within.
data Tree a = Leaf
	    | Node (Tree a) a (Tree a)
     deriving Show

repeatTree :: a -> Tree a
repeatTree x = Node t x t
	where t = repeatTree x

