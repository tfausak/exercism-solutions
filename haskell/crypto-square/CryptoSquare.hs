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
    f segments = map head segments' ++ f (map tail segments') where
        segments' = filter (not . null) segments

normalizeCiphertext :: String -> String
normalizeCiphertext = unwords . chunksOf 5 . ciphertext

normalizePlaintext :: String -> String
normalizePlaintext = map toLower . filter isAlphaNum

plaintextSegments :: String -> [String]
plaintextSegments = (chunksOf =<< squareSize) . normalizePlaintext

squareSize :: String -> Int
squareSize = ceiling . sqrt . fromIntegral . length
