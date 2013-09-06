module Robot
( mkRobot
, resetName
, robotName
) where

import GHC.Conc (TVar, atomically, newTVar, readTVar, writeTVar)
import System.Random (randomRIO)

data Robot = Robot (TVar String)

mkRobot :: IO Robot
mkRobot = do
  var <- atomically $ newTVar ""
  let robot = Robot var
  resetName robot
  return robot

resetName :: Robot -> IO ()
resetName (Robot var) = do
  a <- randomRIO ('A', 'Z')
  b <- randomRIO ('A', 'Z')
  c <- randomRIO ('0', '9')
  d <- randomRIO ('0', '9')
  e <- randomRIO ('0', '9')
  atomically $ writeTVar var [a, b, c, d, e]

robotName :: Robot -> IO String
robotName (Robot var) = atomically $ readTVar var
