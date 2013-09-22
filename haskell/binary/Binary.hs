module Binary
( toDecimal
) where

import Data.Map (findWithDefault, fromList)

toDecimal :: String -> Int
toDecimal = convert "01"

convert :: String -> String -> Int
convert digits string = sum parts where
    radix = length digits
    digitValues = fromList $ zip digits [0..]
    values = map getValue string
    getValue digit = findWithDefault 0 digit digitValues
    pairs = zip (reverse values) [0..]
    parts = map exponentiate pairs
    exponentiate (value, position) = value * radix ^ position
