"""
File: max_capacity.py
Created Time: 2023-07-21
Author: krahets (krahets@163.com)
"""


def max_capacity(ht: list[int]) -> int:
    """Maximum capacity: Greedy"""
    # Initialize i, j, making them split the array at both ends
    i, j = 0, len(ht) - 1
    # Initial maximum capacity is 0
    res = 0
    # Loop for greedy selection until the two boards meet
    while i < j:
        # Update maximum capacity
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
    print(f"Maximum capacity is {res}")
