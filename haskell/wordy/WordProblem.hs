{-# LANGUAGE OverloadedStrings #-}

module WordProblem
( answer
) where

import Control.Applicative
import Data.Attoparsec.Text
import Data.List (foldl')
import Data.Text (pack)

answer :: String -> Maybe Int
answer = maybeResult . parse parser . pack

parser :: Parser Int
parser = do
    n <- "What is " .*> signed decimal
    operations <- many1' $ space *> operation
    "?" .*> pure (foldl' (flip ($)) n operations)

operation :: Parser (Int -> Int)
operation = (flip <$> operator) <* space <*> signed decimal

operator :: Parser (Int -> Int -> Int)
operator = "plus"          .*> pure (+)
       <|> "minus"         .*> pure (-)
       <|> "multiplied by" .*> pure (*)
       <|> "divided by"    .*> pure div
