module Squares
( difference
, squareOfSums
, sumOfSquares
) where

difference :: Integral a => a -> a
difference n = squareOfSums n - sumOfSquares n

squareOfSums :: Integral a => a -> a
squareOfSums = (^ 2) . sum . enumFromTo 1

sumOfSquares :: Integral a => a -> a
sumOfSquares = sum . map (^ 2) . enumFromTo 1
