import Data.List
import Data.Char
import Unsafe.Coerce

data Nat = Zero	
	 | Succ Nat
	 deriving Show

-- Works
natToInteger1 :: Nat -> Integer
natToInteger1 Zero = 0
natToInteger1 (Succ n) = natToInteger1 n + 1

-- Works
natToInteger2 :: Nat -> Integer
natToInteger2 (Succ n) = natToInteger1 n + 1
natToInteger2 Zero = 0

-- Broken - infinite recursion
natToInteger3 :: Nat -> Integer
natToInteger3 n = natToInteger3 n

-- Works
natToInteger4 :: Nat -> Integer
natToInteger4 (Succ n) = 1 + natToInteger4 n
natToInteger4 Zero = 0

-- Broken, incorrect output
natToInteger5 :: Nat -> Integer
natToInteger5 Zero = 1
natToInteger5 (Succ n) = (1 + natToInteger5 n) - 1


-- Works - uses recursion within the list comprehension!
natToInteger6 :: Nat -> Integer
natToInteger6 = head . m
	where m Zero = [0]
	      m (Succ n) = [sum [x | x <- (1 : m n)]]

-- Works - converts type to string and counts the number of S characters
natToInteger7 :: Nat -> Integer
natToInteger7 = \ n -> genericLength [ c | c <- show n, c == 'S']

-- Doesnt work, due to use of length
--natToInteger8 :: Nat -> Integer
--natToInteger8 = \ n -> length [ c | c <- show n, c == 'S']

-- Works
integerToNat1 :: Integer -> Nat
integerToNat1 0 = Zero
integerToNat1 (n+1) = Succ (integerToNat1 n)

-- Broken
--integerToNat2 :: Integer -> Nat
--integerToNat2 0 = Succ Zero
--integerToNat2 n = (Succ (integerToNat2 n))

-- Wrong return type
--integerToNat3 :: Integer -> Nat
-- integerToNat3 n = product [(unsafeCoerce c) :: Integer | c <- show n]

-- Works
integerToNat5 :: Integer -> Nat
integerToNat5 (n+1) = Succ (integerToNat5 n)
integerToNat5 0 = Zero

-- Works
integerToNat6 :: Integer -> Nat
integerToNat6 (n+1) = let m = integerToNat6 n in Succ m
integerToNat6 0 = Zero

-- Doesnt compile
--integerToNat7 :: Integer -> Nat
--integerToNat7 = head . m
--	where {
--             ; m 0 = [0]
--              ; m (n+1) = [sum [x | x <- (1 : m n)]]
--	      }

-- Doesnt compile
-- integerToNat8 :: Integer -> Nat
-- integerToNat8 = \ n -> genericLength [c | c <- show n, isDigit c]

-- Works
add1 :: Nat -> Nat -> Nat
add1 Zero n = n
add1 (Succ m) n = Succ (add1 n m)

-- Works
add2 :: Nat -> Nat -> Nat
add2 (Succ m) n = Succ (add2 n m)
add2 Zero n = n

-- Doesnt work - incorrect output
add3 :: Nat -> Nat -> Nat
add3 Zero n = Zero
add3 (Succ m) n = Succ (add3 m n)

-- Doesnt work - incorrect output
add4 :: Nat -> Nat -> Nat
add4 (Succ m) n = Succ (add4 m n)
add4 Zero n = Zero

-- Works
add7 :: Nat -> Nat -> Nat
add7 n Zero = n
add7 n (Succ m) = Succ (add7 m n)

-- Works
add8 :: Nat -> Nat -> Nat
add8 n (Succ m) = Succ (add7 m n)
add8 n Zero = n


add :: Nat -> Nat -> Nat
add Zero n = n
add (Succ m) n = Succ (add1 n m)


mult :: Nat -> Nat -> Nat
mult m Zero = Zero
mult m (Succ n) = add m (mult m n)


data Tree = Leaf Integer
	  | Node Tree Integer Tree

occurs :: Integer -> Tree -> Bool
occurs m (Leaf n) = m == n
occurs m (Node l n r) =
	case compare m n of
		LT -> occurs m l
		EQ -> True
		GT -> occurs m r





