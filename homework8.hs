-- Writes its param to standard output
putStr' :: String -> IO ()
putStr' [] = return ()
putStr' (x:xs) = putChar x >> putStr' xs


-- Take a string and write it to stdout, followed by a newline.
putStrLn1 :: String -> IO ()
putStrLn1 [] = putChar '\n'
putStrLn1 xs = putStr' xs >> putStrLn1 ""

putStrLn2 :: String -> IO ()
putStrLn2 [] = putChar '\n'
putStrLn2 xs = putStr' xs >> putChar '\n'

putStrLn3 :: String -> IO ()
putStrLn3 [] = putChar '\n'
putStrLn3 xs = putStr' xs >>= \x -> putChar '\n'

putStrLn5 :: String -> IO ()
putStrLn5 [] = putChar '\n'
putStrLn5 xs = putStr' xs >> putStr' "\n"


-- 1, 2, 3, 5


--getLine' :: IO String
--getLine' = get []

--get :: String -> IO String
--get xs = do x <- getChar
--	case x of 
--		'\n' -> return xs
--		_ -> get (xs ++ [x])

-- Function that takes as its argument a function of type String -> String, and reads a line from the standard input, and passes it to this function, and then prints the resulting output followed by a newline on the standard output
--interact' :: (String -> String) -> IO ()
--interact' f = 
--	do input <- getLine'
--		putStrLn' (f input)

-- TODO exercise 5, 

--sequence_1 :: Monad m => [m a] -> m ()
--sequence_1 [] = return []
--sequence_1 (m:ms) = m >> \_ -> sequence_1 ms

sequence_2 :: Monad m => [m a] -> m ()
sequence_2 [] = return ()
sequence_2 (m:ms) = (foldl (>>) m ms) >> return ()

--sequence_3 :: Monad m => [m a] -> m ()
-- sequence_3 ms = foldl (>>) (return ()) ms

sequence_4 :: Monad m => [m a] -> m ()
sequence_4 [] = return ()
sequence_4 (m:ms) = m >> sequence_4 ms

sequence_5 :: Monad m => [m a] -> m ()
sequence_5 (m:ms) = m >>= \_ -> sequence_5 ms

sequence_7 :: Monad m => [m a] -> m ()
sequence_7 ms = foldr (>>) (return ()) ms


-- sequence_2 :: Monad m => [m a] -> m ()


dup :: a -> (a, a)
dup a = (a,a)


--sequence1 :: Monad m => [m a] -> m [a]
--sequence1 [] = return []
--sequence1 (m:ms) 
--	= m >>= 
--           \ a ->
--	      do as <- sequence1 ms
--	         return (a:as)
  --		as <- sequence1 ms

--sequence5 :: Monad m => [m a] -> m [a]
--sequence5 ms = foldr func (return []) ms
--	where func :: (Monad m) => m a -> m [a] -> m[a]
--	      func m acc 
--			= do x <- m
--			     xs <- acc
--			     return (x:xs)



sequence8 :: Monad m => [m a] -> m [a]
sequence8 [] = return []
sequence8 (m:ms)
	= do a <- m
	     as <- sequence8 ms
	     return (a:as)


sequence_' :: Monad m => [m a] -> m ()
sequence_' ms = foldr (>>) (return ()) ms

-- mapM' :: Monad m => (a -> m b) -> [a] -> m [b]


-- Works
mapM1 :: Monad m => (a -> m b) -> [a] -> m [b]
mapM1 f as = sequence8 (map f as)

-- Works
mapM2 :: Monad m => (a -> m b) -> [a] -> m [b]
mapM2 f [] = return []
mapM2 f (a : as)
	= f a >>= \ b -> mapM2 f as >>= \ bs -> return (b : bs)

-- Incorrect return type
--mapM3 :: Monad m => (a -> m b) -> [a] -> m [b]
--mapM3 f as = sequence_' (map f as)

-- Incorrect
--mapM4 :: Monad m => (a -> m b) -> [a] -> m [b]
--mapM4 f [] = return []
--mapM4 f (a : as) = f a >> \b -> mapM4 f as >> \bs -> return (b:bs)

-- INcorrect syntax
--mapM5 :: Monad m => (a -> m b) -> [a] -> m [b]
--mapM5 f [] = return []
--mapM5 f (a : as) = 
 -- do
 --    f a -> b
  --   mapM5 f as -> bs
   --  return (b : bs)


-- Works
mapM6 :: Monad m => (a -> m b) -> [a] -> m [b]
mapM6 f [] = return []
mapM6 f (a:as)
  = do b <- f a
       bs <- mapM6 f as
       return (b : bs)

-- Works
mapM7 :: Monad m => (a -> m b) -> [a] -> m [b]
mapM7 f [] = return []
mapM7 f (a :as)
  = f a >>=
      \ b ->
        do bs <- mapM7 f as
           return (b : bs)

-- Doesnt work, in wrong order
--mapM8 :: Monad m => (a -> m b) -> [a] -> m [b]
--mapM8 f [] = return []
--mapM8 f (a :as)
--  = f a >>=
--      \ b ->
 --       do bs <- mapM8 f as
--           return (bs ++ [b])




-- Correct
filterM2 :: Monad m => (a -> m Bool) -> [a] -> m [a]
filterM2 _ [] = return []
filterM2 p (x : xs) = do flag <- p x
                         ys <- filterM2 p xs
                         if flag then return (x : ys) else return ys

--e.g 
--foldl (+) 0 [] = 0
--foldl (+) 0 [1] = 0 + 1)
--foldl (+) 0 [1,2] = 0 + 1 + 2

-- Example of recurisve foldl
foldl' :: (a -> b -> a) -> a -> [b] -> a
foldl' f a [] = a
foldl' f a (x:xs) = foldl' f (f a x) xs

-- Example of recursive foldr
--foldr' :: (a -> b -> a) -> a -> [b] -> a
--foldr' f a [] = a
--foldr' f a (x:xs) = f x (foldr' f a xs) 


-- foldLeftM f a (x:xs) = foldLeftM f (... f ... a ... (>>=) ...) xs 

-- takes an accumulation function a -> b -> m a, and a seed of type a and left folds a finite, non-partial list of non-bottom elements of type b into a single result of type m a
--foldLeftM :: Monad m => (a -> b -> m a) -> a -> [b] -> m a
--foldLeftM f a [] = return a
--foldLeftM f a (x : xs) = foldLeftM f ((f a x) (>>=) id) xs

foldLeftM :: Monad m => (a -> b -> m a) -> a -> [b] -> m a
foldLeftM f a [] = return a
foldLeftM f a (x : xs) = do y <- (f a x)
                            foldLeftM f y xs



foldRightM :: Monad m => (a -> b -> m b) -> b -> [a] -> m b
foldRightM f a [] = return a
foldRightM f a (x : xs) = do y <- foldRightM f a xs
                             f x y
-- Works
liftM1 :: Monad m => (a -> b) -> m a -> m b
liftM1 f m = do x <- m
                return (f x)

-- Doesnt work
--liftM2 :: Monad m => (a -> b) -> m a -> m b
--liftM2 f m = m >>= \ a -> f a



-- Works
liftM3 :: Monad m => (a -> b) -> m a -> m b
liftM3 f m = m >>= \ a -> return (f a)

--liftM4 :: Monad m => (a -> b) -> m a -> m b
--liftM4 f m = return (f m)

-- Works - wrong answer - too many side effects
-- liftM5 :: Monad m => (a -> b) -> m a -> m b
-- liftM5 f m = m >>= \ a -> m >>= \ b -> return (f a)

-- Wrong - too much sequencing
-- liftM6 :: Monad m => (a -> b) -> m a -> m b
-- liftM6 f m = m >>= \ a -> m >>= \ b -> return (f b)

--liftM7 :: Monad m => (a -> b) -> m a -> m b
--liftM7 f m = mapM f [m]


-- liftM8 :: Monad m => (a -> b) -> m a -> m b
-- liftM8 f m = m >> \ a -> return (f a)


