module Luhn
( addends
, checkDigit
, checksum
, create
, isValid
) where

addends :: Integral a => a -> [a]
addends n = reverse (zipWith f [1 ..] (stigid n)) where
  f i x
    | odd i = x
    | x >= 5 = 2 * x - 9
    | otherwise = 2 * x

stigid :: Integral a => a -> [a]
stigid 0 = []
stigid n = r : stigid q where
    (q, r) = n `divMod` 10

checkDigit :: Integral a => a -> a
checkDigit = (`mod` 10)

checksum :: Integral a => a -> a
checksum = (`mod` 10) . sum . addends

create :: Integral a => a -> a
create n = n' + c where
    n' = n * 10
    c = (10 - checksum n') `mod` 10

isValid :: Integral a => a -> Bool
isValid = (== 0) . checksum
