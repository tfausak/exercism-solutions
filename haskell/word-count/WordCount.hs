module WordCount (wordCount) where

import Data.Char (isAlphaNum, isSpace, toLower)
import Data.Map (Map, fromListWith)

wordCount :: String -> Map String Int
wordCount s = fromListWith (+) $ zip (tokenize s) (repeat 1)

tokenize :: String -> [String]
tokenize s = words $ map toLower $ replace s

replace :: String -> String
replace s = [if isAllowed c then c else ' ' | c <- s]

isAllowed :: Char -> Bool
isAllowed c = isAlphaNum c || isSpace c
