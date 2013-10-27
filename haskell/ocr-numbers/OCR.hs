module OCR
( convert
) where

import Prelude hiding (lookup)
import Data.List (intercalate, transpose)
import Data.List.Split (chunksOf)
import Data.Map (Map, fromList, lookup)
import Data.Maybe (fromMaybe)

convert :: String -> String
convert = intercalate "," . map lookupDigits . tokenize

tokenize :: String -> [[String]]
tokenize s = map f xs where
    f = map unlines . transpose
    xs = chunksOf 4 $ map (chunksOf 3) (lines s)

lookupDigits :: [String] -> String
lookupDigits = map lookupDigit

lookupDigit :: String -> Char
lookupDigit = fromMaybe '?' . flip lookup digits

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
