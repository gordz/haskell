-- Check if a number is divisible by another into equal parts.
divides :: Int -> Int -> Bool
divides n x = n `mod` x == 0

-- Return the divisors of a natural number
divisors :: Int -> [Int]
divisors x = [ d | d <- [1..x], x `divides` d]

