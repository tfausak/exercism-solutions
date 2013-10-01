module Allergies
( Allergen(..)
, allergies
, isAllergicTo
) where

import Data.Bits (testBit)

data Allergen = Eggs
              | Peanuts
              | Shellfish
              | Strawberries
              | Tomatoes
              | Chocolate
              | Pollen
              | Cats
              deriving (Bounded, Enum, Eq, Show)

allergies :: Int -> [Allergen]
allergies score = filter isAllergicTo' allergens where
    isAllergicTo' = flip isAllergicTo score
    allergens = [minBound..]

isAllergicTo :: Allergen -> Int -> Bool
isAllergicTo allergen score = testBit score $ fromEnum allergen
