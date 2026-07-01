variable (α β γ : Type)
variable (g : β → γ)
variable (f : α → β)
variable (h : α → α)
variable (x : α)

def compose := g (f x)
def doTwice := h (h x)
def doThrice := h (h (h x))

#eval doThrice Nat (fun (x : Nat) => x * 2) 2 -- 16
#print compose
-- def compose : (α β γ : Type) → (β → γ) → (α → β) → α → γ :=
-- fun α β γ g f x => g (f x)
