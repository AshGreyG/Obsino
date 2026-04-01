package phenomenon

input_growth: {
  content: #"""
    - When input size $n$ becomes very large, the actual runtime / resource usage of
      an algorithm grows in some pattern;
    - Constants and lower-order terms become negligible compared to the dominant
      term;
    - Different algorithms behave differently as $n$ scales;
    - We care more about trend than exact time.
    """#
  driven: [
    "concept.asymptotic_notation"
  ]
}
