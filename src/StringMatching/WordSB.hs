{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module StringMatching.WordSB where
	
import Data.Bits
import qualified Data.Map.Strict as M
import Data.Maybe
import Data.Word

bitString :: (FiniteBits a) => a -> String
bitString a = bitString' a 0 b ""
	where b = finiteBitSize a

bitString' :: (FiniteBits a) => a -> Int -> Int -> String -> String
bitString' a i b s 
	| i == b    = s
	| otherwise = bitString' a (i + 1) b ((getBit a i) ++ s)

getBit :: (Bits a) => a -> Int -> String
getBit a i 
	| testBit a i = "1"
	| otherwise   = "0"	

newtype WordSB = WordSB Word32 
	deriving (Eq, Bits)

instance Show WordSB where
	show (WordSB w) = bitString w

