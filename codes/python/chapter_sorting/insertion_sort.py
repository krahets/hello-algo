from typing import List

def insertion_sort(nums: List[int]):
    """Insertion sort"""
    for i in range(1, len(nums)):
        current_value = nums[i]
        j = i - 1
        while j >= 0 and nums[j] > current_value:
            nums[j + 1] = nums[j]
            j -= 1
        nums[j + 1] = current_value

if __name__ == "__main__":
    nums = [4, 1, 3, 1, 5, 2]
    insertion_sort(nums)
    print("After insertion sort, nums =", nums)
