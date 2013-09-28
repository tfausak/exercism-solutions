module Raindrops
( convert
) where

convert :: Int -> String
convert n
    | null drops = show n
    | otherwise = drops
    where
        divisibleBy d = n `rem` d == 0
        drops = concat
            [ if divisibleBy 3 then "Pling" else ""
            , if divisibleBy 5 then "Plang" else ""
            , if divisibleBy 7 then "Plong" else ""
            ]
