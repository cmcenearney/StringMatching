{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module StringMatching.ShiftAnd where
	
import StringMatching.WordSB
import Data.Bits
import qualified Data.Map.Strict as M

type WordTable = M.Map Char WordSB

initTable :: String -> WordTable
initTable s = initTable' s 0 (M.empty :: WordTable)

initTable' :: String -> Int -> WordTable -> WordTable
initTable' [] i t = t
initTable' (c:cs) i t = initTable' cs (i+1) (updateTable i c t)

updateTable :: Int -> Char -> WordTable -> WordTable 
updateTable i c t = M.insertWith (\w1  w2 -> w1 .|. w2) c w t
  where w = WordSB $ bit i

shiftAnd :: String -> String -> Bool
shiftAnd [] [] = True
shiftAnd [] s  = True
shiftAnd s []  = False
shiftAnd p t   = shiftAnd' t (initTable p) (WordSB zeroBits) (WordSB $ bit (length p - 1))

shiftAnd' :: String -> WordTable -> WordSB -> WordSB -> Bool
shiftAnd' s t d c
  | d .&. c /= zeroBits = True
  | s == [] = False
  | otherwise = 
      let 
        (h:ss) = s
        d' = updateD h d t
      in shiftAnd' ss t d' c 


updateD :: Char -> WordSB -> WordTable -> WordSB
updateD c d t = ((shift d 1) .|. (bit 0)) .&. (M.findWithDefault zeroBits c t)





