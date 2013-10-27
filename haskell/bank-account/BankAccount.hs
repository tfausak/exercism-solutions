module BankAccount
( BankAccount
, closeAccount
, getBalance
, incrementBalance
, openAccount
) where

import Control.Concurrent.STM (TVar, atomically, modifyTVar, newTVarIO, readTVarIO, writeTVar)

data BankAccount = BankAccount { balance :: TVar (Maybe Integer) }

openAccount :: IO BankAccount
openAccount = do
    startingBalance <- newTVarIO (Just 0)
    return BankAccount { balance = startingBalance }

getBalance :: BankAccount -> IO (Maybe Integer)
getBalance = readTVarIO . balance

incrementBalance :: BankAccount -> Integer -> IO (Maybe Integer)
incrementBalance account amount = do
    atomically $ modifyTVar (balance account) (fmap (+ amount))
    getBalance account

closeAccount :: BankAccount -> IO ()
closeAccount = atomically . flip writeTVar Nothing . balance
