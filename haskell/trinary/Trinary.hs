module Trinary
( readTri
, showTri
) where

import Data.List (foldl')

readTri :: (Integral a) => String -> a
readTri = readIntegral fromBase 3 where
    fromBase = subtract 48 . fromIntegral . fromEnum

readIntegral :: (Integral a) => (Char -> a) -> a -> String -> a
readIntegral fromBase radix string = foldl' accumulate 0 values where
    accumulate number digit = number * radix + digit
    values = map fromBase string

showTri :: (Integral a) => a -> String
showTri = showIntegral toBase 3 where
    toBase = toEnum . (48 +) . fromIntegral

showIntegral :: (Integral a) => (a -> Char) -> a -> a -> String
showIntegral = ((reverse .) .) . showIntegral'

showIntegral' :: (Integral a) => (a -> Char) -> a -> a -> String
showIntegral' _ _ 0 = ""
showIntegral' toBase radix number =
    toBase remainder : showIntegral' toBase radix quotient where
        (quotient, remainder) = number `quotRem` radix
