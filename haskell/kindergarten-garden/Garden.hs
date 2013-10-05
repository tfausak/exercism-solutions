module Garden
( Plant(..)
, defaultGarden
, garden
, lookupPlants
) where

import Data.List (sort, transpose)
import Data.List.Split (chunksOf)
import Data.Map (Map, findWithDefault, fromList)

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
garden students grid = fromList (zip (sort students) (transform grid)) where
    transform = map (map plant . concat) . transpose . map (chunksOf 2) . lines
    plant letter = case letter of
        'C' -> Clover
        'G' -> Grass
        'R' -> Radishes
        'V' -> Violets

lookupPlants :: String -> Garden -> [Plant]
lookupPlants = findWithDefault []
