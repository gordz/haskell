# Functional Programming
- Reduce time and cost of development
- Deliver correct software and be confident that they work
- We want fast development / delivery
- Functional languages allow you to write code at a high level of abstraction

- Functional programming - expressions are more important that using statements - compose programs using expressions
- Expressions return values
- Avoid mutating global state - as per using statements
- Functional programming encourages writing code using expressions

- Imperative style programming - we have statements and mutable state, we imperatively execute statement after statement



# Lambda Calculus

# Haskell Compiler
GHC - Glasgow Haskell Compiler
$ghci - start up
$ghci filename.hs	// Loads file - functions become available.

:reload		// reload file, as GHCi does not detect file changes.
:load name
:edit name
:edit
:?   // all commands
:quit
:type expr  // show type of expression

# Haskell
- lazy, pure functional language
.hs file extension

# Haskell
sum [1..10]
sqrt 9

# Conventions
- functions begin with lower case
- list arguments normally have an s suffix, e.g ns - list of n, nss - list of ns, xs, list of x's
- types are in uppercase


# Function Application
- In haskell function application is denoted using space
- Function applicatin has higher priority that other operators
f (a, b) + c * d
f a b + c * d

e.g 
f(x) = f x
f(x,y) = f x y
f(g(x)) = f (g x)
f(x, g(y)) = f x (g y)
f(x)g(y) = f x * g y

## Booleans
True
False

## Boolean Operators
not
||
&&


e.g 
>not False
True


# Math functions
negate
sqrt
odd 
even
mod
n ^ x : n to power of x

# Strings
Strings are in double quotes "

# Characters
- Chars are in single quotes '
- Can have esacpe characters e.g \n

## Pattern matching
[]	// Match an empty list
(x:xs)	// Match a list with at least one element, binding x to the first elment and xs to the rest/tail of the list)
(_:xs)	// underscore matches anything


## Types

:type functioname 	// return type information about a function from within ghci

TypeA -> TypeB		// a function that maps TypeA to TypeB
[a] -> Int		// a function that maps a list to an Int


## Built in Types
Int  : fixed precicion (32 or 64 bit)
Integer : arbitrary precision
Float
Char
Bool


:type [False,True,False] :: [Bool]

## Defining Types (type synonyms)
type MyType = [char]		// define a type called MyType consisiting of a list of Char
type Person = (Name, Address)



type Parser = String -> [(Tree,String)]

## Sequences 
[1, 3..]	// infinite sequence using a step of 2

## Strings
- Strings are simple a list of charaters
- All list functions can be used on strings, including concatenation etc.

e.g
Prelude> :type "help"
"help" :: [Char]


## Defining functions
e.g, define a recursive function called length that takes a list and returns its length.
length :: [a] -> Integer
legnth [] = 0
length (x:xs) = 1 + length xs

e.g
head :: [a] -> a
head (x:xs) = x

# Polymorphic functions
- can be applied to any type


## List Expressions
- A sequence of values of the same type
- [t] indicates a list of elements of type t
- A list [1, 2, 3] is shorthand for 1:2:3:[] .
- Lists must contain the same type.
- Lists of lists are allowed, e.g [['a'], ['b', 'c']]  :: [[Char]]

[] // An empty list
[1..10]  
head [1, 2, 3, 4, 5]    // return the first element
tail [1, 2, 3, 4, 5]    // return everything except the first element
take 2 [1, 2, 3, 4, 5]  // take first 2 elements - return the first "n" elements
[1, 2, 3, 4, 5] !! 2    // return the nth element, 0 based - linear and poor performance
drop 3 [1, 2, 3, 4, 5]  // remove first 3 elements and return the remaining
length [1, 2, 3]	// linear time operation to calculate the length of the list
sum [1..10]
product [1, 2, 3]
product [1..n]
[1, 2, 3] ++ [4, 5]   // Append 2 lists
reverse [1, 2, 3]     // Reverse a list
init [1, 2, 3, 4]  	// removes last element, returning [1, 2, 3]
last [1, 2, 3, 4] 	// removes last element from non empty list, = [1, 2, 3]
[1, 2] !! 1  		// take the nth element (0 based)
x `elem` [1, 2, 3]	// is x an element of the list?
replicate n x		// build a list by repeating an element n times
replicate 3 True = [True, True, True]
concat	: Takes a list of list, and concatenates all elements so that it forms a single list
e.g 
>concat ["abc", "123", "zyx"]
"abc123zyx"

>concat [[1,2,3], [4,5], [10]]
[1,2,3,4,5,10]


1 : [2, 3]	// append the element to the start of a list (cons operator). Cons is right associative (evaluates from right to left).

zip [1,2] [a,b]  [(1,a), (2,b)]	// zips 2 lists together, pairing up elements with the same index

splitAt 2 [1,2,3,4] = ([1,2], [3,4])	- Splits a list into two, with the first list of length n

++ : Append two lists - linear time
== 	: Equality operatior works for lists.


- A list in form [1,2,3], in syntactic sugar for 1:(2:(3:[]))

# Strings
Strings are just list of characters.

e.g
>"hey" == 'h':'e':'y':[]
True

# Booleans
not //maps false to true, and true to false

## Functions
double x = x + x
quadruple x = double (double x)
factorial n = product [1..n]

# Division
`div` : Division for integerals / integers
/ 	: Division with remainder (Fractional)

e.g A function to return length of a boolean.
lengthBools :: [Bool] -> Int
lengthBools [] = 0
lengthBools xs = length xs

## Recursion

product [] = 0
product (x : xs) = x * product xs

## Functions and backquotes
- using ` ` around a function name converts it to an infix operator
e.g x 'f' y  = f x y


# Type Inference 
- compiler can infer type for you - write a function and compiler can infer type

## Generalized ( computer science)



# General
- wax on / wax off - you need to drill! But in order to learn something you have to go
through a lot of exercises because there's a lot of muscle memory or, in
case of programming you have to have the muscle memory in your fingers.

# Static Typing
- Compiler can detect type errors early on

# Dynamic Typing
- type errors detected at run time



# Types
- A collection of related values, that have similar properties.
- Type names must always be uppercase

To indicate an expression e returns a type t, use the notation
e :: t	

Haskell does type inference.


:type   // return the type of an expression or a function
e.g > :type not False
not False :: Bool

Prelude> :type not
not :: Bool -> Bool

> :type True:False:[]
True:False:[] :: [Bool]


# Type Variables
- type variables are in lower case - similar to generics - they facilitate polymorphic functions, functions that can accept any type.
e.g f :: a -> a   // a function that takes an argumentof any type 'a' and returns any type 'b'.

Checking type will not evaluate an expression, it will just calculate its type.

## Tuples
- Allowing storing mixed data in a single value - mixed types. They consist of a fixed number of elements.
- Tuples are immutable.
- Tuples can be nested.
- You can have lists of tuples, and tuples containing lists.

(True, 1, "abc")
((2,3), True, ["a", "b"])

e.g a function that returns the head and tail of a list in a tuple:
Prelude> let tupleize xs = (head xs, tail xs)
Prelude> tupleize [1, 3, 4, 5, 6, 9]
(1,[3,4,5,6,9])
Prelude> :type tupleize
tupleize :: [a] -> (a, [a])

# Functions
- A function is a mapping of values of one type to values of another type.
t1 -> t2 is a function that maps values of type t1 to t2
t1 is the domain of the function
t2 is the range of the function


e.g A function that takes an integer n, and returns a list of integers 0 to n.
zeroto	:: Int -> [Int]
zeroto n = [0..n]

e.g A function that adds a 2 tuple consisting of Int's
add :: (Int, Int) -> Int
add (x, y) = x + y


# Polymorphic Functions
- its type contains one or more type variables
- defined using type variables (type parameters in Java)
- type variables are lower case to distinguish from types
- use a, b, c, etc

# Overloaded Functions
- a polymorphoc function is overloaded if its type contains one or more class constraints
- in haskell, overloaded functions means we are restricting the types of parameters
- we add contraints to type variables
e.g
sum :: Num a => [a] -> a

# Type Classes
Num: Numeric types
Eq: Equality Types
Ord: Ordered Types
Integeral: Whole (integer) numbers
Show: Can be displayed as a string

# Conditional Expressions ( if then else)
- in haskell, conditions are expressions and not statements. You always need the if then and else.

if / then / else
- You can have nested if / then / elses
- It is an expression, so you always need the else
abs n = if n > 0 then n else -n

# Guarded Equations
abs :: Int -> Int
abs n   | n >= 0    = n
	| otherwise = -n

- allow for multiple conditions, and easier to read then if then else. Prefer brevity/concise version.
- more concise

e.g
hello :: Int -> [Char]
hello x	 | x < 10 = "hello"
	 | x >= 10 && x <= 100 = "world"
	 | otherwise = "other"

- otherwise condition / clause is optional


# Pattern Matching
- can match against an argument directly
- you can match against a variable / argument directly, or use patterns
- _   : wildcard pattern to match anything - we dont care about the variable. Wildcard pattern, matching anything.
e.g _ && _ = False
- patterns are matched in order
- repeated patterns will cause a compiler error
- (x:xs) // match a list, with x as the head and xs as the tail. Head tail form.
- (x:xs) patterns only match on a non empty list
- (x:xs) patterns must be parenthesised as application has priority over the cons : operator
- patterns are matched in order

e.g Pattern matching using exact value.
not :: Bool -> Bool
not False = True
not True = False

e.g Pattern matching on a list, a function return the first element
head :: [a] -> a
head (x:_) = x

tail :: [a] -> a
tail (_:xs) = xs

- [x] : Match a singleton list


(_:xs) : Pattern that discards the head element.

# Lambda Expressions
- allow anonymous functions (nameless function). An expression that denotes a function.
\x -> x + x
(\x -> x * 2)

e.g
odds n = map f [0..n-1]
	where
	   f x = x * 2 + 1

odds n = map (\x -> x*2 + 1) [0..n-1]

Lambdas allow you to avoid naming the function. Useful to avoid naming a function that is used only once.

# Sections
- Use () to convert an infix function/ operator into a curried function
e.g (+) 1 2 

(1+)	- successor function
(1/) 	- reciprocation function
(*2)	- doubling function
(/2)	- halving function

- Sections allow you to partially apply an infix operator, and the resulting function can be passed around.

# Map
- map a function over a list



e.g
Prelude> :type (<)
(<) :: Ord a => a -> a -> Bool


Prelude>  :t (/)
(/) :: Fractional a => a -> a -> a

Prelude> :t (+)
(+) :: Num a => a -> a -> a

# Closures versus lamdba expressions
A Closure closes over variables in the outer scope - what??

# Type Casting
You can force a type on an expression by typing

<expression> :: <type_you_want>

This can be useful for checking if something will break.


So for instance, to find out if ["True"] has type [[Char]], you type

:type ["True"] :: [[Char]]


# Overriding Infix Operators

import Prelude hiding ((||))

(||) :: Bool -> Bool -> Bool
b || c
	| b == c = b
	| otherwise = True


(||) :: Bool -> Bool -> Bool
False || False = False
_ || _ = True


- Prefer guarded equations over condition expressions.

# Currying and Lamdbas
The follwing two functions are the same:

>add x y = x + y
>add = \x -> \y -> x + y

>mult x y z = x * y * z
>mult  = \x -> (\y -> (\z -> x * y * z))

# Function Application
f x g y  is the equivalent of ((f x) g) y

Using lambdas gives a formal meaning to functions defined using currying.

-- Remove the element at index n (0 based) from a list
remove :: Int -> [a] -> [a]
remove n xs = take n xs ++ drop (n + 1) xs

# General
Really the only place where you want to name something, is when you use it more than once, or if it becomes clear, 

- Arrays offer constant time indexing

-  A prime number has factors of 1 and itself.



- Mathematics have sets as collections
- Halting problem?
- Haskell allows you to decompose lists recursively
- You can, as you have seen, if we have a list that's composed out of a head and a
tail
you can decompose that list recursively by just picking off the first element
one by one.
And that's very convenient and that puts
very few restrictions on the collection type.

# Null Lists
use the null function to check if a list is empty


# Safe Tail
safetail :: [a] -> [a] 
safetail xs
	| null xs = []
	| otherwise = tail xs

f x g y in Haskell means (((f x) g) y) and a -> b -> c means (a -> (b -> c)).


## List Comprehensions
- A mechanism that allows you to write code that maniupulates collections.
- uses idea from set theory in mathematics - set comprehension
- Set comprehensions can be used to construct new sets from old sets
- A list comprehension : 

	[ x^2 | x <- [1..5] ]

	{ generator function | 

x <-  [1..5]  : is a generator . x is taken from...
- You can have multiple generators, comma separated. 
e.g [ (x, y) | x <- [1,2,3], y <- [4, 5]]
- Changing the order of generators change the order of elements in the final list
- Multiple generators are list nested loops - later generators are more deeply nested loops who variables change more frequently.


e.g [x < y | x <- [1..10], y <- [7]] 

### Dependant Generators
- generators can depend on each other. The latter generator can depending on variables introduced by earlier variables 
e.g Return a list of Bool
[(x, y) | x <- [1..3], y <- [x..3]]

e.g

concat :: [[a]] -> [a]
concat xss = [x | xs <- xss, x <- xs]	

### Guards
Allow filters / guards to restrict values produced by a generator.
e.g [x | x <- [1..10], even x]

factors :: Int -> [Int]
factors n = [ x | x <- [1..n], n `mod` x == 0]

## Zip
- A function that combines 2 lists into a single list consisting of 2-tuples with their corresponding elements.
- zip stops when one of the lists is exhausted

## String Comprehensions
All list functions work on strings.
e,g
Prelude> zip "abc" [1,2,3,4]
[('a',1),('b',2),('c',3)]

e.g Count lower case chars in a string
lowers :: String -> Int
lowers xs = length [x | x <- xs, isLower x]





# And
and :: [Bool] -> Bool
- given a list of bools, returns true if all elements are true



# List Comprehensions
- Dependent generators

e.g > [x | x <- [1, 2, 3], y <- [1..x]]
[1,2,2,3,3,3]


# Recursion
- Haskell has tail call elimination to prevent stack over flows when doing recursion.
- Recursive functions are functions that are defined in terms of themselves.
- Many functions can be naturally defined in terms of themselves.



e.g Factorial using recursion.
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n - 1)


## Recursion over a list
- can be achieved using (x:xs) pattern matching
- we have seen
how to define recursive functions over lists
by taking the list, checking whether it is the
empty list or whether it is the head followed by the tail.

e.g
product :: [Int] -> Int
product [] = 1
product (n:ns) = n * product ns 

- we can take this function and
abstract the pattern into a higher-order function, that just does the recursion
and then we can plug in
the times and the 1

e.g

length :: [a] -> Int
length [] = 0
length (_:xs) = 1 + length xs

e.g 
reverse :: [a] -> [a]
reverse [] = []
reverse (x:xs) = reverse xs ++ [x]  


# Misc
(x:xs) pattern splits the head from the tail of a list

- Recursion is often a natural way to define functions.


e.g
scalarproduct :: [ Int ] -> [ Int ] -> Int
scalarproduct xs ys = sum [ x * y | (x, y) <- zip xs ys]

# Higer Order Functions
Higher-order functions are the ultimate solution to DRY.

A higher order function is a function that takes a function as an argument, or returns a function as a result

e.g Twice takes a function as an argument and applies it twice to x.
twice :: (a -> a) -> a -> a
twice f x = f (f x)

- Higher order functions as useful for DRY - repition can be extracted into a higher order function -> common programming idioms can be encoded as functions.

- Higher order functions allow you to create rich API / DSLs


## Map
A higher order library function that applies a function to every element of a list.

e.g 
map (+1) [1,3,5,7]

e.g map defined as a list comprehensions
map :: (a -> b) -> [a] -> [b]
map f xs = [f x | x <- xs]

e.g recursive
map :: (a -> b) -> [a] -> [b]
map f [] = []
map f (x:xs) = f x : map f xs

e.g
[f x | x <- xs, p x]  =  map f (filter p xs)


## Filter
Selects every element from a list that satisfies a predicate. Removes items from a list based on a predicate.
e.g filter even [1..10]

FIlter can be defined in 2 ways
e.g 
filter p xs = [x | x <- xs, p x]

e.g 
filter p [] = []
filter p (x:xs)
	| p x = x : filter p xs
	| otherwise = filter p xs

## Foldr (Reduce function)
- captures recursively descending over the structure of a list
- captures the essence of recursing over a list -> encapsulates the pattern of recusrion over a list
- foldr - fold from the right

e.g All the below functions are instance of foldr with a particular 'v' and 'funny plus'
sum = foldr (+) 0
product = foldr (*) 1
or = foldr (||) False
and = foldr (&&) True

Foldr can be defined with recursion as as:

foldr :: (a -> b -> b) -> b -> [a] -> b
foldr f v [] = v
foldr f v (x:xs) = f x (foldr f v xs)

foldr maps the empty list to some value v, and any non empty list to some function applied to its head
and foldr of its tail.

e.g sum [1,2,3] = foldr (+) 0 [1,2,3]
		= foldr (+) 0 (1:(2:(3:[])))

foldr essentially replaces cons with the function, and [] with v

foldr is a homomorphism over lists -> similar to the visitor pattern.

foldr abstracts the pattern of recursing over a list

e.g
length :: [a] -> Int
length [] = 0
length (_:xs) = 1 + length xs

As foldr this would be:

length = foldr (\_ n -> 1 + n) 0


e.g Reverse
reverse :: [a] -> [a]
reverse [] = []
reverse (x:xs) = reverse xs ++ [x]

As foldr

foldr (\x xs -> xs ++ [x]) [] [1,2,3]

e.g Nice variation of the append function ++
(++ ys) = foldr (:) ys

foldr can enable advanced program optimisations if foldr is used in place of explicit recursion 

## Function Composition ( . operator )
Returns the composition of 2 functions as a single function
(.) :: (b -> c) -> (a -> b) -> a -> c
f . g = \x -> f (g x)

e.g 
odd :: Int - > Bool
odd = not . even

Like any other function, the '.' function can be passed as arguments to other functions. e.g

compose :: [a -> a] -> (a -> a)
compose = foldr (.) id


## Other Functions

### all
Checks if every element in a list satisfies a predicate.

all :: (a -> Bool) -> [a] -> Bool
all p xs = and [p x | x <- xs]

### any
Chekcs if any element in a list satisfies a predicate.

any :: (a -> Bool) -> [a] -> Bool
any p xs = or [p x | x <- xs]


e.g 
any isSpace "abc def"

### takeWhile
Selects elements from a list while predicate is true. The recusrion terminates once the predicate is false by returning an empty list.
If the predicate is true.

e.g
takeWhile isAlpha "abc def"

e.g takeWhile with a guard
takeWhile :: (a -> Bool) -> [a] -> [a]
takeWhile _ [] = []
takeWhile f (x:xs)
	| f x = x : takeWhile f xs
	| otherwise = []



### dropWhile
Remove elements while a predicate is true.




TODO cons operator associativity?
TODO fusion?
TODO bannana split rule?
TODO function composition associativity


TODO implement map and filter using foldr
TODO implment takewhile
TODO implement dropWhile

## id
Identity function -> returns the value passed in.

# Parsing
A parser analyses a piece of text to determine its syntactic structure. A software component that takes input data and builds
a data structure or performs some sort of analysis.

e.g
type Parser = String -> Tree
type Parser a = String -> [(a, String)]


# Haskell and Maybe / List
- It is common to use a use in place of a Maybe - return [] for none, and single list for the maybe

# Type Synonyms
Allow an alias to be assigned to a type, e.g

type Phonebook = [(String,String)]

The type can be used throughout code.

Type synonmyns can be parameterized, e.g

type AssocList k v = [(k,v)] 
type Parser a = String -> [(a, String)]

# Case
case expression of pattern -> result
	           pattern -> result

Whereas pattern matching on function parameters can only be done when defining functions, case expressions can be used pretty much anywhere

e.g Simple parser that returns the first character and the rest of a string.

item :: Parser Char
item = \inp -> case inp of
		[] -> []
		(x:xs) -> [(x, xs)]


item :: Parser Char
item = \inp -> case (someFunctionThatReturns) of
		[] -> []
		(x:xs) -> [(x, xs)]

# Do Syntax
do is use with mondaic types


# Map
A definition of map:

   map         :: (a -> b) -> [a] -> [b]
   map f []     = []
   map f (x:xs) = f x : map f xs

# Using Maybe
e.g
   safediv     :: Int -> Int -> Maybe Int
   safediv n m =  if m == 0 then Nothing else Just (n `div` m)


# Sequencing
do allows sequential composition - imperitive style



HOme Work
evens :: [Integer] -> [Integer]
evens xs = [x | x <- xs, even x] 

sum . evens $ [827305 .. 927104] = 43772529500


e.g Other examples, filter and mapping:
filter even (map (+1) [1..5])
