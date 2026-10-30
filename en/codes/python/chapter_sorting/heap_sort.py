"""
File: heap_sort.py
Created Time: 2023-05-24
Author: krahets (krahets@163.com)
"""


def sift_down(nums: list[int], n: int, i: int):
    """Sift down from node i in a heap of size n"""
    while True:
        # Find the node with the largest value among i, l, and r, and store its index in ma
        l = 2 * i + 1
        r = 2 * i + 2
        ma = i
        if l < n and nums[l] > nums[ma]:
            ma = l
        if r < n and nums[r] > nums[ma]:
            ma = r
        # Stop if node i is largest or both child indices l and r are out of bounds
        if ma == i:
            break
        # Swap the two nodes
        nums[i], nums[ma] = nums[ma], nums[i]
        # Continue sifting down
        i = ma


def heap_sort(nums: list[int]):
    """Heap sort"""
    # Build the heap by sifting down from every non-leaf node
    for i in range(len(nums) // 2 - 1, -1, -1):
        sift_down(nums, len(nums), i)
    # Extract the largest element from the heap, repeating for n-1 rounds
    for i in range(len(nums) - 1, 0, -1):
        # Swap the root with the rightmost leaf on the last level (the first and last elements of the current heap)
        nums[0], nums[i] = nums[i], nums[0]
        # Sift down starting at the root
        sift_down(nums, i, 0)


"""Driver code"""
if __name__ == "__main__":
    nums = [4, 1, 3, 1, 5, 2]
    heap_sort(nums)
    print("After heap sort, nums =", nums)
