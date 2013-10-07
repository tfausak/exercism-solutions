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

type Point = (Int, Int)

data Bearing = North
             | East
             | South
             | West
             deriving (Eq, Show)

data Robot = Robot
    { bearing :: Bearing
    , coordinates :: Point
    } deriving (Eq, Show)

mkRobot:: Bearing -> Point -> Robot
mkRobot = Robot

simulate :: Robot -> String -> Robot
simulate r [] = r
simulate r (x:xs) = simulate r' xs where
    r' = case x of
        'A' -> advance
        'L' -> left
        'R' -> right
    advance = mkRobot b c where
        b = bearing r
        (x, y) = coordinates r
        c = case b of
            North -> (x, y + 1)
            East  -> (x + 1, y)
            South -> (x, y - 1)
            West  -> (x - 1, y)
    left = mkRobot (turnLeft (bearing r)) (coordinates r)
    right = mkRobot (turnRight (bearing r)) (coordinates r)

turnLeft :: Bearing -> Bearing
turnLeft b = case b of
    North -> West
    West  -> South
    South -> East
    East  -> North

turnRight :: Bearing -> Bearing
turnRight b = case b of
    North -> East
    East  -> South
    South -> West
    West  -> North
