module Robot (mkRobot, resetName, robotName) where

import Control.Concurrent.STM (TVar, atomically, newTVar, readTVar, writeTVar)
import Control.Monad (liftM)
import System.Random (randomRIO)

newtype Robot = Robot (TVar String)

mkName :: IO String
mkName = mapM randomRIO pattern where
  pattern = [letter, letter, number, number, number]
  letter = ('A', 'Z')
  number = ('0', '9')

mkRobot :: IO Robot
mkRobot = liftM Robot $ mkName >>= atomically . newTVar

resetName :: Robot -> IO ()
resetName (Robot var) = mkName >>= atomically . writeTVar var

robotName :: Robot -> IO String
robotName (Robot var) = atomically $ readTVar var
