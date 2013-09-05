module Robot
( mkRobot
, resetName
, robotName
) where

import Control.Concurrent.MVar (MVar, newEmptyMVar, putMVar, readMVar, tryTakeMVar)
import System.Random (newStdGen, randomRs)

data Robot = Robot (MVar String)

mkRobot :: IO Robot
mkRobot = do
  var <- newEmptyMVar
  let robot = Robot var
  resetName robot
  return robot

resetName :: Robot -> IO ()
resetName (Robot var) = do
  gen <- newStdGen
  let letters = take 2 (randomRs ('A', 'Z') gen)
  gen <- newStdGen
  let numbers = take 3 (randomRs ('0', '9') gen)
  tryTakeMVar var
  putMVar var $ letters ++ numbers

robotName :: Robot -> IO String
robotName (Robot var) = readMVar var
