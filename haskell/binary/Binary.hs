module Binary
( toDecimal
) where

import Data.List (foldl')

toDecimal :: String -> Int
toDecimal = convert fromBinary 2 where
    fromBinary = fromEnum . ('1' ==)

convert :: (Char -> Int) -> Int -> String -> Int
convert fromBase radix string = foldl' accumulate 0 values where
    values = map fromBase string
    accumulate number digit = number * radix + digit
