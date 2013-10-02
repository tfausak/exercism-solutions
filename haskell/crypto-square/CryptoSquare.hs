module CryptoSquare
( ciphertext
, normalizeCiphertext
, normalizePlaintext
, plaintextSegments
, squareSize
) where

import Data.Char (isAlphaNum, toLower)
import Data.List.Split (chunksOf)

ciphertext :: String -> String
ciphertext = f . plaintextSegments where
    f [] = []
    f xs = map head xs' ++ f (map tail xs') where
        xs' = filter (not . null) xs

normalizeCiphertext :: String -> String
normalizeCiphertext = unwords . segments . ciphertext

normalizePlaintext :: String -> String
normalizePlaintext = map toLower . filter isAlphaNum

plaintextSegments :: String -> [String]
plaintextSegments = segments . normalizePlaintext

segments :: String -> [String]
segments = chunksOf =<< squareSize

squareSize :: String -> Int
squareSize = ceiling . sqrt . fromIntegral . length
