module SpaceAge
( Planet(..)
, ageOn
) where

data Planet = Earth
            | Jupiter
            | Mars
            | Mercury
            | Neptune
            | Saturn
            | Uranus
            | Venus

ageOn :: Planet -> Integer -> Float
ageOn planet seconds = fromInteger seconds / orbitalPeriod planet

orbitalPeriod :: Planet -> Float
orbitalPeriod planet = 31557600 * scale where
    scale = case planet of
        Earth   ->   1.0
        Jupiter ->  11.862615
        Mars    ->   1.8808158
        Mercury ->   0.2408467
        Neptune -> 164.79132
        Saturn  ->  29.447498
        Uranus  ->  84.016846
        Venus   ->   0.61519726
