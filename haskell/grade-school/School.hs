module School
( School(..)
, add
, empty
, grade
, sorted
) where

import qualified Data.Map as Map
import Data.List (sort)

type School = [(Grade, [Name])]
type Grade = Int
type Name = String

add :: Grade -> Name -> School -> School
add g n s = Map.toList s'' where
  s'' = Map.insertWith (++) g [n] s'
  s' = Map.fromList s

empty :: School
empty = []

grade :: Grade -> School -> [String]
grade g s = Map.findWithDefault [] g s' where
  s' = Map.fromList s

sorted :: School -> School
sorted s = map f s'' where
  f (g, ns) = (g, sort ns)
  s'' = Map.toAscList s'
  s' = Map.fromList s
