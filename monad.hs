type Parser a = String -> [(a, String)]



item :: Parser a
item = \inp -> case inp of
		[] -> []
		(x:xs) -> [(x,xs)]

failure :: Parser a
failure = \_ -> []

return' :: a -> Parser a
return' a = \inp -> [(a, inp)]



f :: Parser Char
f = do
	x <- item
	return x


p :: Parser (Char,Char)
p = do  x <- item
	item
	y <- item
	return (x,y)



