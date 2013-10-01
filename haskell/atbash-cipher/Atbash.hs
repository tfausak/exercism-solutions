module Atbash
( encode
) where

import Data.Char (toLower)
import Data.List.Split (chunksOf)
import Data.Map (Map (..), fromList, member, (!))

encode :: String -> String
encode = unwords . split . convert . clean . lower where
    lower = map toLower
    clean = filter (`member` table)
    convert = map (table !)
    split = chunksOf 5

    table = fromList $ zip plain cipher
    plain = ['0'..'9'] ++ ['a'..'z']
    cipher = ['0'..'9'] ++ ['z','y'..'a']
