module Proofs

twoPlusTwo : 2 + 2 = 4
twoPlusTwo = Refl

{-
data (=) : a -> b -> Type where
   Refl : x = x
-}

-- notTwoPlusTwo : 2 + 2 = 5
-- notTwoPlusTwo = Refl

plus_identity : (n:Nat) -> (m:Nat) -> (n+0 = n)
plus_identity = ?plus_identity

data Parity : Nat -> Type where
   Even : Parity (n + n)
   Odd  : Parity (S (n + n))

helpEven : (j : Nat) -> Parity (S j + S j) -> Parity (S (S (plus j j)))
helpEven j p = rewrite plusSuccRightSucc j j in p

helpOdd : (j : Nat) -> Parity (S (S (j + S j))) -> Parity (S (S (S (j + j))))
helpOdd j p = rewrite plusSuccRightSucc j j in p

parity : (n:Nat) -> Parity n
parity Z     = Even {n=Z}
parity (S Z) = Odd {n=Z}
parity (S (S k)) with (parity k)
  parity (S (S (j + j)))     | Even = helpEven j (Even {n = S j})
  parity (S (S (S (j + j)))) | Odd  = helpOdd j (Odd {n = S j})


