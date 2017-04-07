module Vectors

data Vect : Nat -> Type -> Type where
  Nil  : Vect Z a
  (::) : a -> Vect k a  -> Vect (S k) a

data Fin : (n : Nat) -> Type where
  FZ : Fin (S k)
  FS : Fin k -> Fin (S k)

total
append : Vect n a -> Vect n' a -> Vect (n + n') a
append [] y = y
append (x :: z) y = x :: append z y

total
vApp : Vect n (a -> b) -> Vect n a -> Vect n b
vApp [] [] = []
vApp (x :: y) (z :: w) = x z :: vApp y w

total
vindex : Vect n a -> Fin n -> a
vindex [] FZ impossible
vindex [] (FS _) impossible
vindex (x :: y) FZ = x
vindex (x :: y) (FS z) = vindex y z

