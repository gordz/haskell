data Tree = Leaf Integer
          | Node Tree Tree
	  deriving Show

leaves :: Tree -> Integer
leaves (Leaf _) = 1
leaves (Node l r) = leaves l + leaves r

-- We say that a tree is balanced if the number of leaves in the left and right subtree of every node differs by at most one, with leaves themselves being trivially balanced. 
balanced :: Tree -> Bool
balanced (Leaf _) = True
balanced (Node l r) = abs (leaves l - leaves r) <= 1 && balanced l && balanced r

-- converts a finite, non-empty, non-partial, non-bottom list of non-bottom integers into a balanced tree
halve :: [a] -> ([a],[a])
halve xs = splitAt (length xs `div` 2) xs

balance :: [Integer] -> Tree
balance [x] = Leaf x
balance xs = Node (balance l) (balance r)
	     where (l, r) = halve xs
