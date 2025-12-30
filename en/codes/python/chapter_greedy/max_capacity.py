"""
File: max_capacity.py
Created Time: 2023-07-21
Author: krahets (krahets@163.com)
"""


def max_capacity(ht: list[int]) -> int:
    """Max capacity: Greedy algorithm"""
    # Initialize i, j to be at both ends of the array
    i, j = 0, len(ht) - 1
    # Initial max capacity is 0
    res = 0
    # Loop for greedy selection until the two boards meet
    while i < j:
        # Update max capacity
        cap = min(ht[i], ht[j]) * (j - i)
        res = max(res, cap)
        # Move the shorter board inward
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
    print(f"Max capacity is {res}")
