module LeapYear (isLeapYear) where

isLeapYear :: Int -> Bool
isLeapYear year
  | year `rem` 400 == 0 = True
  | year `rem` 100 == 0 = False
  | year `rem`   4 == 0 = True
  | otherwise           = False
