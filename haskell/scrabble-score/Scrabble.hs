module Scrabble
( scoreLetter
, scoreWord
) where

import Data.Char (toLower)
import Data.Map (findWithDefault, fromList)

scoreLetter :: Char -> Int
scoreLetter letter = findWithDefault 0 (toLower letter) scores where
    scores = fromList $ concat
        [ repeatZip 1 "aeilnorstu"
        , repeatZip 2 "dg"
        , repeatZip 3 "bcmp"
        , repeatZip 4 "fhvwy"
        , repeatZip 5 "k"
        , repeatZip 8 "jx"
        , repeatZip 10 "qz"
        ]
    repeatZip score letters = zip letters (repeat score)

scoreWord :: String -> Int
scoreWord letters = sum $ map scoreLetter letters
