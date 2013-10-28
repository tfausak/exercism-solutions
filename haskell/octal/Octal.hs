module Octal
( readOct
, showOct
) where

readOct :: (Integral a) => String -> a
readOct = foldl f 0 where
    f n c = n * 8 + (fromIntegral (fromEnum c - 48))

showOct :: (Integral a) => a -> String
showOct = reverse . showOct' where
    showOct' 0 = ""
    showOct' n = toEnum ((fromIntegral r) + 48) : showOct' q where
        (q, r) = n `quotRem` 8
