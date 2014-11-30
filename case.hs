type Parser a = String -> [(a, String)]

item :: Parser Char
item = \inp -> case inp of
		[] -> []
		(x:xs) -> [(x,xs)]

-- A parser that always fails
failure :: Parser a
failure = \inp -> []

-- A parser that always succeeds with the specified value
return' :: a -> Parser a
return' v = \inp -> [(v, inp)]

