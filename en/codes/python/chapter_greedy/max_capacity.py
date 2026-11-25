"""
File: max_capacity.py
Created Time: 2023-07-21
Author: krahets (krahets@163.com)
"""


def max_capacity(ht: list[int]) -> int:
    """Greedy maximum capacity algorithm"""
    # Start i and j at opposite ends of the array
    i, j = 0, len(ht) - 1
    # The initial maximum capacity is 0
    res = 0
    # Make greedy choices until the two pointers meet
    while i < j:
        # Update the maximum capacity
        cap = min(ht[i], ht[j]) * (j - i)
        res = max(res, cap)
        # Move the pointer at the shorter board inward
        if ht[i] < ht[j]:
            i += 1
        else:
            j -= 1
    return res


"""Driver Code"""
if __name__ == "__main__":
    ht = [3, 8, 5, 2, 7, 7, 3, 4]

    # Greedy algorithm
    res = max_capacity(ht)
    print(f"The maximum capacity is {res}")
