module Gigasecond
( fromDay
) where

import Data.Time.Calendar (Day, addDays)

fromDay :: Day -> Day
fromDay = addDays (floor $ 10 ^ 9 / 60 / 60 / 24)
