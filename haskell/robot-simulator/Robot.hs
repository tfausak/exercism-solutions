module Robot
( Bearing(..)
, Robot
, bearing
, coordinates
, mkRobot
, simulate
, turnLeft
, turnRight
) where

import Data.List (foldl')

type Point = (Int, Int)

data Bearing = North
             | East
             | South
             | West
             deriving (Bounded, Enum, Eq, Show)

data Robot = Robot
    { bearing :: Bearing
    , coordinates :: Point
    } deriving (Eq, Show)

mkRobot :: Bearing -> Point -> Robot
mkRobot = Robot

simulate :: Robot -> String -> Robot
simulate = foldl' simulate' where
    simulate' r i = case i of
        'A' -> advance r
        'L' -> left r
        'R' -> right r
    advance r = mkRobot b c where
        b = bearing r
        (x, y) = coordinates r
        c = case b of
            North -> (x, y + 1)
            East  -> (x + 1, y)
            South -> (x, y - 1)
            West  -> (x - 1, y)
    left r = mkRobot (turnLeft (bearing r)) (coordinates r)
    right r = mkRobot (turnRight (bearing r)) (coordinates r)

turn :: Int -> Bearing -> Bearing
turn x b = toEnum $ a `mod` n where
    a = x + fromEnum b
    n = 1 + fromEnum (maxBound :: Bearing)

turnLeft :: Bearing -> Bearing
turnLeft = turn (-1)

turnRight :: Bearing -> Bearing
turnRight = turn 1
