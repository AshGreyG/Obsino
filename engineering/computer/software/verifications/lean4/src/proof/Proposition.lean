section proposition
  variable (p q r : Prop)
  #check p ∧ q  -- And
  #check p ∨ q  -- Or
  #check p → q  -- Implies
  #check ¬q     -- Not
  #check (p ∧ q) ∨ ¬r
  #check (p ∧ q) → (q ∧ p)
  -- All of them are Prop type
end proposition
