from math import inf

def find_max_crossing_subarray(
    array: list[int],
    low: int,
    mid: int,
    high: int
) -> tuple[int, int, int] :
    """This function finds the max crossing midpoint subarray

    Args:
        array: input array in function `find_maximum_subarray`
        low: low boundary of subarray
        mid: midpoint of subarray
        high: high boundary of subarray

    Returns:
        This function finds the max subarray [left_max..mid] and [mid+1..right_max]
        and returns a tuple (left_max, right_max, left_sum + right_sum). Here
        left_max is the low boundary of left max subarray, right_max is the
        high boundary of right max subarray.
    """

    left_sum = -inf
    left_max = 0
    right_sum = -inf
    right_max = 0

    temp_sum = 0
    for i in range(mid, low - 1, -1) :
        temp_sum += array[i]
        if temp_sum > left_sum :
            left_sum = temp_sum
            left_max = i
        # This procedure finds the max subarray whose high boundary is mid

    temp_sum = 0
    for i in range(mid + 1, high + 1) :
        temp_sum += array[i]
        if temp_sum > right_sum :
            right_sum = temp_sum
            right_max = i
        # This procedure finds the max subarray whose low boundary is mid + 1

    return (left_max, right_max, left_sum + right_sum)