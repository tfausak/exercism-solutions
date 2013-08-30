module School
( School(..)
, add
, empty
, grade
, sorted
) where

import qualified Data.Map as Map
import Data.List (sort)

type School = Map.Map Grade [Name]
type Grade = Int
type Name = String

add :: Grade -> Name -> School -> School
add g n = Map.insertWith (++) g [n]

empty :: School
empty = Map.empty

grade :: Grade -> School -> [String]
grade = Map.findWithDefault []

sorted :: School -> [(Grade, [Name])]
sorted s = map f s' where
  f (g, ns) = (g, sort ns)
  s' = Map.toAscList s
