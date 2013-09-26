module PrimeFactors
( primeFactors
) where

primeFactors :: (Integral a) => a -> [a]
primeFactors = f divisors where
    divisors = 2 : 3 : [x + y | x <- [5, 11 ..], y <- [0, 2]]
    f ds n
        | n < d = []
        | otherwise = if r == 0
            then d : f ds q
            else f ds' n
        where
            d = head ds
            ds' = tail ds
            (q, r) = quotRem n d
