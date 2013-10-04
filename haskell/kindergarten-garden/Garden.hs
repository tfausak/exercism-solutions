module Garden
( Plant(..)
, defaultGarden
, garden
, lookupPlants
) where

import Data.List (sort)
import Data.Map (Map, findWithDefault, fromListWith)

data Plant = Clover
           | Grass
           | Radishes
           | Violets
           deriving (Eq, Show)

type Garden = Map String [Plant]

defaultGarden :: String -> Garden
defaultGarden = garden
    [ "Alice"
    , "Bob"
    , "Charlie"
    , "David"
    , "Eve"
    , "Fred"
    , "Ginny"
    , "Harriet"
    , "Ileana"
    , "Joseph"
    , "Kincaid"
    , "Larry"
    ]

garden :: [String] -> String -> Garden
garden students grid =
    fromListWith
        (flip (++))
        [(student, [plant (row !! (index + offset))]) |
            row <- lines grid,
            (index, student) <- zip [0,2..] (sort students),
            offset <- [0, 1]] where
                plant c
                    | c == 'C' = Clover
                    | c == 'G' = Grass
                    | c == 'R' = Radishes
                    | c == 'V' = Violets

lookupPlants :: String -> Garden -> [Plant]
lookupPlants = findWithDefault []
