module BST
( bstLeft
, bstRight
, bstValue
, fromList
, insert
, singleton
, toList
) where

import Data.List (foldl')
import Data.Maybe (fromJust)

data Tree a = Node { bstValue :: a
                   , bstLeft  :: Maybe (Tree a)
                   , bstRight :: Maybe (Tree a)
                   } deriving (Show)

fromList :: Ord a => [a] -> Tree a
fromList [] = undefined
fromList (x:xs) = foldl' (flip insert) (singleton x) xs

insert :: Ord a => a -> Tree a -> Tree a
insert x t = insert' x (Just t) where
  insert' x Nothing = singleton x
  insert' x (Just (Node y l r))
    | x > y     = Node y l (Just (insert' x r))
    | otherwise = Node y (Just (insert' x l)) r

singleton :: a -> Tree a
singleton x = Node x Nothing Nothing

toList :: Tree a -> [a]
toList t = toList' (Just t) where
  toList' Nothing = []
  toList' (Just (Node x l r)) = toList' l ++ [x] ++ toList' r
