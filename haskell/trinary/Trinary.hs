module Trinary
( readTri
, showTri
) where

import Data.List (foldl')

offset :: (Integral a) => a
offset = fromIntegral $ fromEnum '0'

readTri :: (Integral a) => String -> a
readTri = readIntegral fromBase 3 where
    fromBase = subtract offset . fromIntegral . fromEnum

showTri :: (Integral a) => a -> String
showTri = showIntegral toBase 3 where
    toBase = toEnum . (offset +) . fromIntegral

readIntegral :: (Integral a) => (Char -> a) -> a -> String -> a
readIntegral fromBase radix string = foldl' accumulate 0 values where
    accumulate number digit = number * radix + digit
    values = map fromBase string

showIntegral :: (Integral a) => (a -> Char) -> a -> a -> String
showIntegral = ((reverse .) .) . showIntegral'

showIntegral' :: (Integral a) => (a -> Char) -> a -> a -> String
showIntegral' _ _ 0 = ""
showIntegral' toBase radix number =
    toBase remainder : showIntegral' toBase radix quotient where
        (quotient, remainder) = number `quotRem` radix
