module School
( School(..)
, add
, empty
, grade
, sorted
) where

type School = [(Grade, [Name])]
type Grade = Int
type Name = String

add :: Grade -> Name -> School -> School
add g n s = empty

empty :: School
empty = []

grade :: Grade -> School -> [String]
grade g s = empty

sorted :: School -> School
sorted s = empty
