def triple (n : Nat) : Nat := 3 * n

#eval s!"three fives is {triple 5}"
-- three fives is 15
#eval s!"three fives is {triple}"
--                       ^^^^^^
-- failed to synthesize instance of type class
--   ToString (Nat → Nat)

-- Hint: Type class instance resolution failures can be inspected with the
-- `set_option trace.Meta.synthInstance true` command.
