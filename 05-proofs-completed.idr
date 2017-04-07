module Proofs

twoPlusTwo : 2 + 2 = 4
twoPlusTwo = Refl

{-
data (=) : a -> b -> Type where
   Refl : x = x
-}

-- notTwoPlusTwo : 2 + 2 = 5
-- notTwoPlusTwo = Refl

total
plus_identity : (n:Nat) -> (n+0 = n)
plus_identity Z = Refl
plus_identity (S k) = cong (plus_identity k)

