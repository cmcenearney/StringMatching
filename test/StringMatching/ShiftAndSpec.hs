module StringMatching.ShiftAndSpec  (main, spec) where

import Data.Bits
import Data.Char
import Data.List 
import Test.Hspec
import Test.QuickCheck
import StringMatching.ShiftAnd

{-
quickcheck zone
-}
agreesWithListIsInfixOf :: String -> String -> Bool
agreesWithListIsInfixOf s t = shiftAnd s t == Data.List.isInfixOf s t



{-
spec runner
-}
main :: IO ()
main = hspec spec

spec :: Spec
spec = do

  describe "ShiftAnd" $ do
  
    context "QuickCheck assertions" $ do
      it "shiftAnd agrees with isInfixOf" $ do
        quickCheck agreesWithListIsInfixOf




