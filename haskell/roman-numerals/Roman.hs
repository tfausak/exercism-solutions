module Roman
( numerals
) where

import Data.Map (fromList, lookupLE)
import Data.Maybe (maybe)

numerals :: Int -> String
numerals n = maybe "" numerals' pair where
    numerals' (value, symbol) = symbol ++ numerals (n - value)
    pair = lookupLE n values
    values = fromList
        [ (1000,  "M")
        , ( 900, "CM")
        , ( 500,  "D")
        , ( 400, "CD")
        , ( 100,  "C")
        , (  90, "XC")
        , (  50,  "L")
        , (  40, "XL")
        , (  10,  "X")
        , (   9, "IX")
        , (   5,  "V")
        , (   4, "IV")
        , (   1,  "I")
        ]
