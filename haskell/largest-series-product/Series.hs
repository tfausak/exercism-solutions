module Series
( digits
, largestProduct
, slices
) where

import Data.Char (digitToInt)
import Data.List (tails)

digits :: String -> [Int]
digits = map digitToInt

largestProduct :: Int -> String -> Int
largestProduct n xs = if null xs'
    then 1
    else maximum xs'
    where xs' = map product (slices n xs)

slices :: Int -> String -> [[Int]]
slices n xs = slices' n (digits xs)

slices' :: Int -> [a] -> [[a]]
slices' n xs = take (1 + length xs - n) (map (take n) (tails xs))
