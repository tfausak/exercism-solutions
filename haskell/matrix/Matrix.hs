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

import Data.Vector (Vector)

data Matrix a = Matrix a
    deriving (Eq, Show)

cols :: Matrix a -> Int
cols _ = undefined

column :: Int -> Matrix a -> Vector a
column _ _ = undefined

flatten :: Matrix a -> Vector a
flatten _ = undefined

fromList :: [[a]] -> Matrix a
fromList _ = undefined

fromString :: String -> Matrix a
fromString _ = undefined

reshape :: (Int, Int) -> Matrix a -> Matrix a
reshape _ _ = undefined

row :: Int -> Matrix a -> Vector a
row _ _ = undefined

rows :: Matrix a -> Int
rows _ = undefined

shape :: Matrix a -> (Int, Int)
shape _ = undefined

transpose :: Matrix a -> Matrix a
transpose _ = undefined
