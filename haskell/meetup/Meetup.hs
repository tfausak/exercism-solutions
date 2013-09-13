module Meetup
( Schedule(..)
, Weekday(..)
, meetupDay
) where

import Data.Time.Calendar (Day, addDays, fromGregorian, toModifiedJulianDay)

data Schedule = First
              | Second
              | Third
              | Fourth
              | Last
              | Teenth
              deriving (Enum)

data Weekday = Monday
             | Tuesday
             | Wednesday
             | Thursday
             | Friday
             | Saturday
             | Sunday
             deriving (Enum)

type Year = Integer
type Month = Int

meetupDay :: Schedule -> Weekday -> Year -> Month -> Day
meetupDay schedule weekday year month =
    let fromGregorian' = fromGregorian year month
        offset' day = toInteger $ offset (toWeekday day) weekday
    in  case schedule of
        Teenth -> addDays days day where
            day = fromGregorian' 13
            days = offset' day
        Last -> addDays days day where
            day = addDays (-6) (fromGregorian' 31)
            days = offset' day
        _ -> addDays days day where
            day = fromGregorian' 1
            days = offset' day + 7 * toInteger (fromEnum schedule)

offset :: Weekday -> Weekday -> Int
offset from to = delta `mod` 7 where
    delta = fromEnum to - fromEnum from

toWeekday :: Day -> Weekday
toWeekday day = toEnum $ fromInteger $
    (toModifiedJulianDay day + 2) `rem` 7
