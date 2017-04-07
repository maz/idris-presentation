module Vectors

data Vect : Nat -> Type -> Type where
  Nil  : Vect Z a
  (::) : a -> Vect k a  -> Vect (S k) a

data Fin : (n : Nat) -> Type where
  FZ : Fin (S k)
  FS : Fin k -> Fin (S k)



