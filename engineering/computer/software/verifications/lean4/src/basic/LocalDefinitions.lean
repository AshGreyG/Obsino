def unzipNoLocal : List (α × β) → List α × List β
  | [] => ([], [])
  | (x, y) :: rest =>
    (x :: (unzipNoLocal rest).fst, y :: (unzipNoLocal rest).snd)
-- This function computes `unzipNoLocal rest` twice

#eval unzipNoLocal [(1, "first"), (3, "third")]
-- [(1, 3), ("first, third")]

def unzipLocal : List (α × β) → List α × List β
  | [] => ([], [])
  | (x, y) :: rest =>
    let unzipped : List α × List β := unzipLocal rest
    (x :: unzipped.fst, y :: unzipped.snd)
-- This function only computes `unzipLocal rest` once

def unzipLocalPair : List (α × β) → List α × List β
  | [] => ([], [])
  | (x, y) :: rest =>
    let (xs, ys) : List α × List β := unzipLocalPair rest
    (x :: xs, y :: ys)
-- This function uses pair constructor pattern matching

def reverse {α : Type} (list : List α) : List α :=
  let rec helper : List α → List α → List α
    | [], sofar => sofar
    | x :: xs, sofar => helper xs (x :: sofar)
  helper list []

#eval reverse [1, 3, 4] -- [4, 3, 1]
