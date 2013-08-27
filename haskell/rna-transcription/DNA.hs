module DNA (toRNA) where

toRNA :: String -> String
toRNA = map toRNA'

toRNA' :: Char -> Char
toRNA' 'T' = 'U'
toRNA' nucleotide = nucleotide
