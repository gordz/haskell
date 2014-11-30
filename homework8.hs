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

