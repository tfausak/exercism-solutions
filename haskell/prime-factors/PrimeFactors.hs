module PrimeFactors
( primeFactors
) where

primeFactors :: (Integral a) => a -> [a]
primeFactors = f 2 where
    f d n
        | n <= 1 || n < d = []
        | otherwise = if r == 0
            then d : f d q
            else f (d + 1) n
            where
                (q, r) = quotRem n d
