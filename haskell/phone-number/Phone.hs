module Phone (areaCode, number, prettyPrint) where

import Data.Char (isDigit)

areaCode :: String -> String
areaCode s = fst $ parts s

number :: String -> String
number s =
  let s' = filter isDigit s
  in
    if length s' == 10
    then s'
    else
      if length s' == 11 && head s' == '1'
      then tail s'
      else "0000000000"

prettyPrint :: String -> String
prettyPrint s =
  let s' = parts s
  in concat ["(", fst s', ") ", fst (snd s'), "-", snd (snd s')]

parts :: String -> (String, (String, String))
parts s =
  let s' = number s
  in (take 3 s', splitAt 3 (drop 3 s'))
