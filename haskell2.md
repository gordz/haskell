# Haskell

## Defining Functions
myFun x y = x + y
f x y = x + y


## Infix
- to use a function as an infix operator, call it using backticks `
Prelude>let add x y = x + y
Prelude>10 `add` 20
20

## Math Functions
x `mod` 5		// take modulus of x
odd x			// is x odd
even x			// is x even

## Lists
[]			// an empty list
take 2 [1..30] 		// return first 2 items. Take n items from a list.
drop 2 [1..30]  	// remove first 2 items. Remove n items and return the updated list.
[40, 50, 60] !! 1	// take the nth element (0 based) - runs in linear time
1 : [40, 50, 60]        // cons operator - append item to the list - constant time
cycle [1, 2, 3] 	// cycles list into an infinite list
repeat 5 		// returns a infinite list containing the specified element
[1, 2] ++ [3, 4]	// combine 2 lists - linear time
init [1, 2, 4, 5]       // returns everything except the last element. [1, 2, 4]
length ns		// retuns the length of a list
reverse ns		// reverse a list
null ns			// is the list empty
minimum ns		// return the minimum entry
maximum ns		// return the maximum entry
sum ns			// return the sum of all items
product ns		// return the product of all items
4 `elem` [1, 2, 3, 4]	// does the element exist in the list- linear time
a `elem` [A..Z]	 //false
A `elem` [A..Z]  // true
take 50 [1,3..]		// take first 50 elements of the range
[1,3..]			// infinite list, using step size of 2. Infinit lists are lazy.
head ns			// return the first item
head ['U'..'Z']		// returns U

elementAt [1,2,3] 2	// return element of a list at index



## Ranges
[1..10]
[1..]		// 1 to infinit
[0,5..100] 	// 0 to 100 in steps of 5
['a'..'z']	// a to z lower case

## List Comprehensions
[x + 100 | x <- [1..10], x < 5]

[output function | input set, optional predicate]


## If statement
- always requires an else

double x = if x > 10 
	then x
	else x*2
	   

## Filtering
filter even [1..10]	// filter out even numbers, returning a new list

Syntax: filter function list

## Map
Prelude> map (\x -> 2*x) [1..10]   // applies a function to each element, returning a new list
[2,4,6,8,10,12,14,16,18,20]

## Lambda Expressions (anonymous functions)
- use the \ operator
e.g \x y -> x*y
\x = 100*x

e.g> (\x -> x + 1) 10
11

e.g> map (\x -> x^2) [1..100] 


\ is shorthand for the Lambda symbol.


# Expressions
An expression in a programming language is a combination of explicit values, constants, variables, operators, and functions that are interpreted according to the particular rules of precedence and of association for a particular programming language, which computes and then produces (returns, in a stateful environment) another value. 


# Map / Filter Homework Examples
filter p (map f xs) = [f x|x <- xs, p (f x)]

take 10 $ iterate (*10) 1


# Monads

## >>= (bind) operator


# Do blocks

do 
	statement1
	statement2
	statement3


Within a do block, you can :
1. Bind the result of something do a value, x <- getChar
2. Ignore the result of something
3. A let expression






