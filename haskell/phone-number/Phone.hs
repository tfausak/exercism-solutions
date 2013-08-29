module Phone (areaCode, number, prettyPrint) where

import Data.Char (isDigit)

areaCode :: String -> String
areaCode s = a
  where (a, _, _) = parts s

number :: String -> String
number s
  | length s' == 10 = s'
  | length s' == 11 && head s' == '1' = tail s'
  | otherwise = "0000000000"
  where s' = filter isDigit s

prettyPrint :: String -> String
prettyPrint s = concat ["(", a, ") ", b, "-", c]
  where (a, b, c) = parts s

parts :: String -> (String, String, String)
parts s = (a, b, c)
  where (a, bc) = splitAt 3 $ number s
        (b, c) = splitAt 3 bc
