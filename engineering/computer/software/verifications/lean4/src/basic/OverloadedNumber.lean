def NaturalNumber := Nat
def overloaded1 : NaturalNumber := 10
--                                 ^^
-- failed to synthesize instance of type class
--   OfNat NaturalNumber 10
-- numerals are polymorphic in Lean, but the numeral `10` cannot be used in a context
-- where the expected type is
--   NaturalNumber
-- due to the absence of the instance above

-- Hint: Type class instance resolution failures can be inspected with the
-- `set_option trace.Meta.synthInstance true` command.
-- Error code: lean.synthInstanceFailed

def overloaded2 : NaturalNumber := (10 : Nat)

abbrev AbbrevNatural : Type := Nat
def overloaded3 : AbbrevNatural := 10
