module ETL (transform) where

import Data.Char (toLower)
import Data.Map (Map, empty, foldrWithKey, insert)

transform :: Map Int [String] -> Map String Int
transform = foldrWithKey f empty where
  f score letters m = foldl g m (zip letters (repeat score))
  g m (letter, score) = insert (map toLower letter) score m
