"""
File: heap_sort.py
Created Time: 2023-05-24
Author: krahets (krahets@163.com)
"""


def sift_down(nums: list[int], n: int, i: int):
    """Heap length is n, start heapifying node i, from top to bottom"""
    while True:
        # Determine the largest node among i, l, r, noted as ma
        l = 2 * i + 1
        r = 2 * i + 2
        ma = i
        if l < n and nums[l] > nums[ma]:
            ma = l
        if r < n and nums[r] > nums[ma]:
            ma = r
        # If node i is the largest or indices l, r are out of bounds, no further heapification needed, break
        if ma == i:
            break
        # Swap two nodes
        nums[i], nums[ma] = nums[ma], nums[i]
        # Loop downwards heapification
        i = ma


def heap_sort(nums: list[int]):
    """Heap sort"""
    # Build heap operation: heapify all nodes except leaves
    for i in range(len(nums) // 2 - 1, -1, -1):
        sift_down(nums, len(nums), i)
    # Extract the largest element from the heap and repeat for n-1 rounds
    for i in range(len(nums) - 1, 0, -1):
        # Swap the root node with the rightmost leaf node (swap the first element with the last element)
        nums[0], nums[i] = nums[i], nums[0]
        # Start heapifying the root node, from top to bottom
        sift_down(nums, i, 0)


"""Driver Code"""
if __name__ == "__main__":
    nums = [4, 1, 3, 1, 5, 2]
    heap_sort(nums)
    print("Heap sort completed nums =", nums)
