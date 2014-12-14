# Lazy Evaluation
Everything in haskell uses lazy evaluation -> haskell is a lazy functional language.

Haskell is lazy, and avoids unecessary evaluation. This allows us to work with infinite data structures.

Lazy evaluation combines outermost reduction and sharing - it never requires more steps than innermost reduction.

Lazy evaluation allows programming with infinite lists.

e.g

ones :: [Int]
ones = 1 : ones

Reducing this gives
1:1:1:ones  etc...

With innermost reduction, 'head ones' will continue forever.

Using lazy evaluation, expressions are only evaluated as much as required to produce the final result.

## Reduction Strategies
redex = a reducible sub expression

### Innermost Reduction
### Outermost Reduction


## Sieve of Eratosthenes
An algorithm to generate primes.

	primes :: [Int]
	prives = sieve [2..]

	sieve :: [Int] -> [Int]
	sieve (p:xs) = p : sieve [x | x<- xs, x `mod` p /= 0]


e.g 
take 10 primes
takeWhile (<15) primes


