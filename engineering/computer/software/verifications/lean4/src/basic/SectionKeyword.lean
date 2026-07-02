section useful
  variable (α β γ : Type)
  variable (g : β → γ)
  variable (f : α → β)
  variable (h : α → α)
  variable (x : α)

  def compose := g (f x)
  def doTwice := h (h x)
  def doThrice := h (h (h x))

  #eval doThrice Nat (fun (x : Nat) => x * 2) 2 -- 16

  section
    variable (anonymous : Nat := 3)
  end
end useful
