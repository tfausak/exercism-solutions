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

data Tree a = Empty | Node a (Tree a) (Tree a)
  deriving (Show)

bstLeft :: Tree a -> Maybe (Tree a)
bstLeft Empty = Nothing
bstLeft (Node _ l _) = Just l

bstRight :: Tree a -> Maybe (Tree a)
bstRight Empty = Nothing
bstRight (Node _ _ r) = Just r

bstValue :: Tree a -> a
bstValue Empty = undefined
bstValue (Node n _ _) = n

fromList :: Ord a => [a] -> Tree a
fromList = foldl' (flip insert) Empty

insert :: Ord a => a -> Tree a -> Tree a
insert x Empty = singleton x
insert x (Node n l r)
  | x > n = Node n l (insert x r)
  | otherwise = Node n (insert x l) r

singleton :: a -> Tree a
singleton x = Node x Empty Empty

toList :: Tree a -> [a]
toList Empty = []
toList (Node n l r) = toList l ++ [n] ++ toList r
