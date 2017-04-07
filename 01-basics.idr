module Basics

------- GLOBAL CONSTANTS -------

aNumber : Int
aNumber = 666

aString : String
aString = "hi"

------- DATA TYPES ------
data Soul = Satan Int | HeartOfGold

-- data Nat = Z | S Nat


------ FUNCTIONS ------
total
showSoul : Soul -> String
showSoul (Satan num) = "Satan with " ++ (show num) ++ " souls"
showSoul HeartOfGold = "definitely not satan"

------ INTERFACES -----
interface MyMonoid a where
  mempty : a
  -- Let's assume that this is associative, without proof
  mappend : a -> a -> a

MyMonoid String where
  mempty = ""
  mappend a b = a ++ b 

total
mconcat : MyMonoid m => List m -> m
mconcat = foldl mappend mempty

----- NAMED INTERFACES -----

[IntAddition] MyMonoid Int where
  mempty = 0
  mappend a b = a + b

[IntMult] MyMonoid Int where
  mempty = 1
  mappend a b = a * b


