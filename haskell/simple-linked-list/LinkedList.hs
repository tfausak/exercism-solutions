module LinkedList
( datum
, fromList
, isNil
, new
, next
, nil
, reverseLinkedList
, toList
) where

data List a = Nil
            | Node { datum :: a
                   , next :: List a
                   }

fromList :: [a] -> List a
fromList = foldr new nil

isNil :: List a -> Bool
isNil Nil = True
isNil _ = False

nil :: List a
nil = Nil

new :: a -> List a -> List a
new = Node

reverseLinkedList :: List a -> List a
reverseLinkedList = go nil
  where go a Nil = a
        go a (Node x xs) = go (new x a) xs

toList :: List a -> [a]
toList Nil = []
toList (Node x xs) = x : toList xs
