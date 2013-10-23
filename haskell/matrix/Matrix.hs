module Matrix
( Matrix
, cols
, column
, flatten
, fromList
, fromString
, reshape
, row
, rows
, shape
, transpose
) where

import qualified Data.Vector as V

type Matrix a = V.Vector (V.Vector a)

fromString :: Read a => String -> Matrix a
fromString s = fromList $ map f $ lines s where
    f l = if null r then [] else fst (head r) : f (snd (head r)) where
        r = reads l

fromList :: [[a]] -> Matrix a
fromList = V.fromList . map V.fromList

shape :: Matrix a -> (Int, Int)
shape m = (rows m, cols m)

rows :: Matrix a -> Int
rows = V.length

cols :: Matrix a -> Int
cols m
    | V.null m = 0
    | otherwise = V.length (V.head m)

transpose :: Matrix a -> Matrix a
transpose m = V.fromList $ map (`column` m) [0 .. cols m - 1]

row :: Int -> Matrix a -> V.Vector a
row = flip (V.!)

column :: Int -> Matrix a -> V.Vector a
column = V.map . flip (V.!)

reshape :: (Int, Int) -> Matrix a -> Matrix a
reshape (_, y) m = chunks y $ flatten m

flatten :: Matrix a -> V.Vector a
flatten = V.concat . V.toList

chunks :: Int -> V.Vector a -> V.Vector (V.Vector a)
chunks n xs
    | n < 1 || V.null xs = V.empty
    | otherwise = h `V.cons` chunks n t where
        (h, t) = V.splitAt n xs
