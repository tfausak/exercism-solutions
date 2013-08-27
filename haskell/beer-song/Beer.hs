module Beer (sing, verse) where

import Data.Char (toTitle)

sing :: Int -> Int -> String
sing start stop
  | stop > start = ""
  | otherwise = verse start ++ "\n" ++ sing (start - 1) stop

verse :: Int -> String
verse n = line1 n ++ "\n" ++ line2 n ++ "\n"

line1 :: Int -> String
line1 n = title (wall n) ++ ", " ++ beer n ++ "." where
  title (x:xs) = toTitle x : xs

line2 :: Int -> String
line2 0 = "Go to the store and buy some more, " ++ wall 99 ++ "."
line2 n = "Take " ++ one n ++ " down and pass it around, " ++ wall (n - 1) ++ "." where
  one n = if n == 1 then "it" else "one"

wall :: Int -> String
wall n = beer n ++ " on the wall"

beer :: Int -> String
beer n = bottles n ++ " of beer" where
  bottles n
    | n == 0 = "no more bottles"
    | n == 1 = "1 bottle"
    | otherwise = show n ++ " bottles"
