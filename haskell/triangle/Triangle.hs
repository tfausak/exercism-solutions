module Triangle
( TriangleType(..)
, triangleType
) where

data TriangleType = Equilateral
                  | Illogical
                  | Isosceles
                  | Scalene
                  deriving (Eq, Show)

triangleType :: Real a => a -> a -> a -> TriangleType
triangleType a b c
    | isIllogical   = Illogical
    | isEquilateral = Equilateral
    | isIsosceles   = Isosceles
    | otherwise     = Scalene where
        isIllogical   = not $ and [a > 0, b > 0, c > 0, a + b > c, b + c > a, a + c > b]
        isEquilateral = a == b && b == c
        isIsosceles   = or [a == b, b == c, a == c]
