"""
File: quick_sort.py
Created Time: 2022-11-25
Author: timi (xisunyy@163.com)
"""


class QuickSort:
    """Quicksort class"""

    def partition(self, nums: list[int], left: int, right: int) -> int:
        """Partition with two pointers"""
        # Use nums[left] as the pivot
        i, j = left, right
        while i < j:
            while i < j and nums[j] >= nums[left]:
                j -= 1  # Scan from right to left for the first element smaller than the pivot
            while i < j and nums[i] <= nums[left]:
                i += 1  # Scan from left to right for the first element larger than the pivot
            # Swap elements
            nums[i], nums[j] = nums[j], nums[i]
        # Swap the pivot into place between the two subarrays
        nums[i], nums[left] = nums[left], nums[i]
        return i  # Return the pivot index

    def quick_sort(self, nums: list[int], left: int, right: int):
        """Quicksort"""
        # Stop recursing when the subarray has length 1
        if left >= right:
            return
        # Partition with two pointers
        pivot = self.partition(nums, left, right)
        # Recurse on the left and right subarrays
        self.quick_sort(nums, left, pivot - 1)
        self.quick_sort(nums, pivot + 1, right)


class QuickSortMedian:
    """Quicksort class with median-of-three pivot selection"""

    def median_three(self, nums: list[int], left: int, mid: int, right: int) -> int:
        """Select the median of three candidates"""
        l, m, r = nums[left], nums[mid], nums[right]
        if (l <= m <= r) or (r <= m <= l):
            return mid  # m lies between l and r
        if (m <= l <= r) or (r <= l <= m):
            return left  # l lies between m and r
        return right

    def partition(self, nums: list[int], left: int, right: int) -> int:
        """Partition with two pointers (median of three)"""
        # Use nums[left] as the pivot
        med = self.median_three(nums, left, (left + right) // 2, right)
        # Swap the median into the leftmost position
        nums[left], nums[med] = nums[med], nums[left]
        # Use nums[left] as the pivot
        i, j = left, right
        while i < j:
            while i < j and nums[j] >= nums[left]:
                j -= 1  # Scan from right to left for the first element smaller than the pivot
            while i < j and nums[i] <= nums[left]:
                i += 1  # Scan from left to right for the first element larger than the pivot
            # Swap elements
            nums[i], nums[j] = nums[j], nums[i]
        # Swap the pivot into place between the two subarrays
        nums[i], nums[left] = nums[left], nums[i]
        return i  # Return the pivot index

    def quick_sort(self, nums: list[int], left: int, right: int):
        """Quicksort"""
        # Stop recursing when the subarray has length 1
        if left >= right:
            return
        # Partition with two pointers
        pivot = self.partition(nums, left, right)
        # Recurse on the left and right subarrays
        self.quick_sort(nums, left, pivot - 1)
        self.quick_sort(nums, pivot + 1, right)


class QuickSortTailCall:
    """Quicksort class with reduced recursion depth"""

    def partition(self, nums: list[int], left: int, right: int) -> int:
        """Partition with two pointers"""
        # Use nums[left] as the pivot
        i, j = left, right
        while i < j:
            while i < j and nums[j] >= nums[left]:
                j -= 1  # Scan from right to left for the first element smaller than the pivot
            while i < j and nums[i] <= nums[left]:
                i += 1  # Scan from left to right for the first element larger than the pivot
            # Swap elements
            nums[i], nums[j] = nums[j], nums[i]
        # Swap the pivot into place between the two subarrays
        nums[i], nums[left] = nums[left], nums[i]
        return i  # Return the pivot index

    def quick_sort(self, nums: list[int], left: int, right: int):
        """Quicksort with reduced recursion depth"""
        # Stop when the subarray has length 1
        while left < right:
            # Partition with two pointers
            pivot = self.partition(nums, left, right)
            # Apply quicksort to the shorter of the two subarrays
            if pivot - left < right - pivot:
                self.quick_sort(nums, left, pivot - 1)  # Recursively sort the left subarray
                left = pivot + 1  # The remaining unsorted range is [pivot + 1, right]
            else:
                self.quick_sort(nums, pivot + 1, right)  # Recursively sort the right subarray
                right = pivot - 1  # The remaining unsorted range is [left, pivot - 1]


"""Driver Code"""
if __name__ == "__main__":
    # Quicksort
    nums = [2, 4, 1, 0, 3, 5]
    QuickSort().quick_sort(nums, 0, len(nums) - 1)
    print("After quicksort, nums =", nums)

    # Quicksort with median-of-three pivot selection
    nums1 = [2, 4, 1, 0, 3, 5]
    QuickSortMedian().quick_sort(nums1, 0, len(nums1) - 1)
    print("After median-of-three quicksort, nums =", nums1)

    # Quicksort with reduced recursion depth
    nums2 = [2, 4, 1, 0, 3, 5]
    QuickSortTailCall().quick_sort(nums2, 0, len(nums2) - 1)
    print("After quicksort with reduced recursion depth, nums =", nums2)
