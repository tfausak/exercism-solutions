module Hexadecimal
( hexToInt
) where

import Data.Char (isHexDigit, toLower)
import Data.List (foldl')

hexToInt :: String -> Int
hexToInt string
    | any (not . isHexDigit) string = 0
    | otherwise = convert fromHex 16 string' where
        fromHex digit = fromEnum digit - offset digit
        offset digit =
          if digit <= '9'
          then fromEnum '0'
          else fromEnum 'a' - 10
        string' = map toLower string

convert :: (Char -> Int) -> Int -> String -> Int
convert fromBase radix string = foldl' accumulate 0 values where
    values = map fromBase string
    accumulate number digit = number * radix + digit
