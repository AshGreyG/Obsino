package concept

objects: {
  content: """
    The entities R operates on are technically known as *objects*. Vectors of
    numeric or complex values, vectors of logical values and vectors of
    character strings. These are known as *atomic structures* since their
    components are all of the same type, or mode, namely *numeric, complex, 
    logical, character and raw*.

    *Vectors must have their values all of the same mode*. Thus any given vector
    must be unambiguously either logical, numeric, complex, character or raw.
    (The only apparent exception to this rule is the special value listed as
    `NA` for quantities not available, but actually there are several types of
    `NA` like `NA_character_`, `NA_complex_` etc). *Note that a vector can be
    empty and still have a mode. For example the empty character string vector
    is listed as `character(0)` and the empty numeric vector as `numeric(0)`*.

    \(code_part_objects)

    - By the *mode* of an object we mean the basic type of its fundamental
      constituents. This is a special case of a property of an object. We can
      use `mode()` function to check the mode of an object;
    - Another property of every object is its `length`;

    R caters for changes of mode almost anywhere. There is a large collection
    of functions of the form `as.<something>()` for either coercion from one
    mode to another.
  """
  code_part_objects: #"""
    #raw-block-file(
      "src/basic/objects.R",
      "r"
    )
  """#
}