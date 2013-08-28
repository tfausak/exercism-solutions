module DNA (count, nucleotideCounts) where

import Data.Map (Map, fromList)

count :: Char -> String -> Int
count c s = if c `elem` "ACGTU"
    then count' c s
    else error ("invalid nucleotide '" ++ [c] ++ "'")

count' :: Char -> String -> Int
count' c s = length $ filter (== c) s

nucleotideCounts :: String -> Map Char Int
nucleotideCounts s = fromList [(c, count c s) | c <- "ACGT"]
