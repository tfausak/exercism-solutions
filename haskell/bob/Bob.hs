module Bob (responseFor) where

import Data.Char (isAlpha, isSpace, isUpper)
import Data.List (isSuffixOf)

responseFor :: String -> String
responseFor message
  | isSilence message  = "Fine. Be that way!"
  | isYelling message  = "Woah, chill out!"
  | isQuestion message = "Sure."
  | otherwise          = "Whatever."

isSilence :: String -> Bool
isSilence = all isSpace

isYelling :: String -> Bool
isYelling message =
  let letters = filter isAlpha message
  in not (null letters) && all isUpper letters

isQuestion :: String -> Bool
isQuestion = isSuffixOf "?"
