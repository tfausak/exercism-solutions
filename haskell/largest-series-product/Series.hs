module Series
( digits
, largestProduct
, slices
) where

import Data.Char (digitToInt)

digits :: String -> [Int]
digits = map digitToInt

largestProduct :: Int -> String -> Int
largestProduct n xs
  | n < 1 || n > length xs = 1
  | otherwise = maximum (map product (slices n xs))

slices :: Int -> String -> [[Int]]
slices n xs = slices' n (digits xs)

slices' :: Int -> [a] -> [[a]]
slices' n xs
  | n > length xs = []
  | otherwise = take n xs : slices' n (tail xs)
