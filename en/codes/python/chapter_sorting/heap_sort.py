"""
File: heap_sort.py
Created Time: 2023-05-24
Author: krahets (krahets@163.com)
"""


def sift_down(nums: list[int], n: int, i: int):
    """Sift down from node i in a heap of size n"""
    while True:
        # Let ma be the index of the largest of nodes i, l, and r
        l = 2 * i + 1
        r = 2 * i + 2
        ma = i
        if l < n and nums[l] > nums[ma]:
            ma = l
        if r < n and nums[r] > nums[ma]:
            ma = r
        # Stop if i is the largest or both child indices l and r are out of bounds
        if ma == i:
            break
        # Swap the two nodes
        nums[i], nums[ma] = nums[ma], nums[i]
        # Continue sifting down
        i = ma


def heap_sort(nums: list[int]):
    """Heap sort"""
    # Build the heap by sifting down from each non-leaf node
    for i in range(len(nums) // 2 - 1, -1, -1):
        sift_down(nums, len(nums), i)
    # Extract the maximum from the heap in each of n-1 rounds
    for i in range(len(nums) - 1, 0, -1):
        # Swap the root and rightmost leaf (the first and last elements)
        nums[0], nums[i] = nums[i], nums[0]
        # Sift down from the root
        sift_down(nums, i, 0)


"""Driver Code"""
if __name__ == "__main__":
    nums = [4, 1, 3, 1, 5, 2]
    heap_sort(nums)
    print("After heap sort, nums =", nums)
