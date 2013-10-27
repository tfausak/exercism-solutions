module OCR
( convert
) where

import Prelude hiding (lookup)
import Data.List (intercalate)
import Data.List.Split (chunksOf)
import Data.Map (Map, fromList, lookup)
import Data.Maybe (fromMaybe)

convert :: String -> String
convert s = intercalate "," (map (map lookupDigit) (tokenize s))

-- Convert a 3x4 string into the digit it represents, or '?' if it's garbled.
lookupDigit :: String -> Char
lookupDigit s = fromMaybe '?' (lookup s digits)

-- Convert a string into a list of lists of 3x4 strings. Each inner list
-- represents one "line" of input.
tokenize :: String -> [[String]]
tokenize s = map (map unlines . transpose) (chunksOf 4 (map (chunksOf 3) (lines s)))

-- Transpose a list of lists as if they were a matrix.
transpose :: [[a]] -> [[a]]
transpose xs
    | any (not . null) xs = map head xs : transpose (map tail xs)
    | otherwise = []

-- Grid of 3x4 strings mapped to their corresponding digits.
digits :: Map String Char
digits = fromList
    [ (" _ \n| |\n|_|\n   \n", '0')
    , ("   \n  |\n  |\n   \n", '1')
    , (" _ \n _|\n|_ \n   \n", '2')
    , (" _ \n _|\n _|\n   \n", '3')
    , ("   \n|_|\n  |\n   \n", '4')
    , (" _ \n|_ \n _|\n   \n", '5')
    , (" _ \n|_ \n|_|\n   \n", '6')
    , (" _ \n  |\n  |\n   \n", '7')
    , (" _ \n|_|\n|_|\n   \n", '8')
    , (" _ \n|_|\n _|\n   \n", '9')
    ]