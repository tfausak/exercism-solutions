module Scrabble
( scoreLetter
, scoreWord
) where

import Data.Char (toLower)

scoreLetter :: Char -> Int
scoreLetter letter
    | isIn "dg"    = 2
    | isIn "bcmp"  = 3
    | isIn "fhvwy" = 4
    | isIn "k"     = 5
    | isIn "jx"    = 8
    | isIn "qz"    = 10
    | otherwise    = 1
    where isIn x = toLower letter `elem` x

scoreWord :: String -> Int
scoreWord letters = sum $ map scoreLetter letters
