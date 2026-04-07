from find_maximum_subarray import find_maximum_subarray

import random

def main() -> None :
    for i in range(100) :
        length = random.randint(10, 20)
        array = [random.randint(-100, 100) for _ in range(length)]
        print(f"Given array {array}")
        L, R, S = find_maximum_subarray(array)
        print(f"  → L: {L}")
        print(f"  → R: {R}")
        print(f"  → S: {S}")

if __name__ == "__main__" :
    main()