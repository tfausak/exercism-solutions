module Luhn
( addends
, checkDigit
, checksum
, create
, isValid
) where

addends :: Integral a => a -> [a]
addends n = reverse (zipWith (curry f) [1 ..] (digits n)) where
    f (i, x)
        | odd i = x
        | x >= 5 = 2 * x - 9
        | otherwise = 2 * x

digits :: Integral a => a -> [a]
digits 0 = []
digits n = r : digits q where
    (q, r) = n `divMod` 10

checkDigit :: Integral a => a -> a
checkDigit = (`mod` 10)

checksum :: Integral a => a -> a
checksum n = sum (addends n) `mod` 10

create :: Integral a => a -> a
create n = n' + c where
    n' = n * 10
    c = (10 - checksum n') `mod` 10

isValid :: Integral a => a -> Bool
isValid n = checksum n == 0
