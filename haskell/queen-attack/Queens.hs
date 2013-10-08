module Queens
( boardString
, canAttack
) where

import Data.List (intercalate, intersperse)

type Board = [[Char]]
type Point = (Int, Int)

board :: Board
board = replicate 8 $ replicate 8 'O'

render :: Board -> String
render b = intercalate "\n" (map (intersperse ' ') b) ++ "\n"

place :: Char -> Point -> Board -> Board
place c (x, y) b = zipWith (curry f) b [0 ..] where
    f (row, i)
        | i == x = zipWith (curry g) row [0 ..]
        | otherwise = row
    g (cell, i)
        | i == y = c
        | otherwise = cell

boardString :: Maybe Point -> Maybe Point -> String
boardString Nothing Nothing = render board
boardString (Just p1) Nothing = render $ place 'W' p1 board
boardString Nothing (Just p2) = render $ place 'B' p2 board
boardString (Just p1) (Just p2) = render $ place 'B' p2 $ place 'W' p1 board

canAttack :: Point -> Point -> Bool
canAttack (x1, y1) (x2, y2) = abs slope `elem` [0.0, 1.0, infinity] where
    slope = fromIntegral dy / fromIntegral dx
    dy = y2 - y1
    dx = x2 - x1
    infinity = 1 / 0
