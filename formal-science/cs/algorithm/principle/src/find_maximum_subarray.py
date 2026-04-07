from find_max_crossing_subarray import find_max_crossing_subarray

from typing import Optional

def find_maximum_subarray(
    array: list[int],
    low: Optional[int] = None,
    high: Optional[int] = None
) -> tuple[int, int, int] :
    """ This function compares left max subarray, crossing max subarray and
    right max subarray, returns the max one and recursively calls itself to
    find left max subarray and right max subarray.

    Args:
        array: input array reference, stayed unchanged during recursion
        low: modifying low boundary for recursion, when no parameter `low`
            provided, it uses default value `0`
        high: modifying high boundary for recursion, when no parameter `high`
            provided, it uses default value `len(array) - 1`

    Returns:
        The max subarray of `array`
    """

    if low == None :
        low = 0
    if high == None :
        high = len(array) - 1

    if high == low :
        return (low, high, array[low])
        # When input subarray (from low to high) only has one element, then
        # returns the element immediately
    else :
        mid = (high + low) // 2
        left_low, left_high, left_sum = find_maximum_subarray(array, low, mid)
        right_low, right_high, right_sum = find_maximum_subarray(array, mid + 1, high)
        cross_low, cross_high, cross_sum = find_max_crossing_subarray(array, low, mid, high)

        if left_sum >= right_sum and left_sum >= cross_sum :
            return (left_low, left_high, left_sum)
        elif right_sum >= left_sum and right_sum >= cross_sum :
            return (right_low, right_high, right_sum)
        else :
            return (cross_low, cross_high, cross_sum)