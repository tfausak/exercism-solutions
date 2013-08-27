module Anagram (anagramsFor) where

import Data.Char (toLower)
import Data.List (sort)

anagramsFor :: String -> [String] -> [String]
anagramsFor word = filter (isAnagram word)

isAnagram :: String -> String -> Bool
isAnagram a b = sort (normalize a) == sort (normalize b)

normalize :: String -> String
normalize = map toLower
