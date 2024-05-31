"""
File: quick_sort.py
Created Time: 2022-11-25
Author: timi (xisunyy@163.com)
"""


class QuickSort:
    """Quick sort class"""

    def partition(self, nums: list[int], left: int, right: int) -> int:
        """Partition"""
        # Use nums[left] as the pivot
        i, j = left, right
        while i < j:
            while i < j and nums[j] >= nums[left]:
                j -= 1  # Search from right to left for the first element smaller than the pivot
            while i < j and nums[i] <= nums[left]:
                i += 1  # Search from left to right for the first element greater than the pivot
            # Swap elements
            nums[i], nums[j] = nums[j], nums[i]
        # Swap the pivot to the boundary between the two subarrays
        nums[i], nums[left] = nums[left], nums[i]
        return i  # Return the index of the pivot

    def quick_sort(self, nums: list[int], left: int, right: int):
        """Quick sort"""
        # Terminate recursion when subarray length is 1
        if left >= right:
            return
        # Partition
        pivot = self.partition(nums, left, right)
        # Recursively process the left subarray and right subarray
        self.quick_sort(nums, left, pivot - 1)
        self.quick_sort(nums, pivot + 1, right)


class QuickSortMedian:
    """Quick sort class (median pivot optimization)"""

    def median_three(self, nums: list[int], left: int, mid: int, right: int) -> int:
        """Select the median of three candidate elements"""
        l, m, r = nums[left], nums[mid], nums[right]
        if (l <= m <= r) or (r <= m <= l):
            return mid  # m is between l and r
        if (m <= l <= r) or (r <= l <= m):
            return left  # l is between m and r
        return right

    def partition(self, nums: list[int], left: int, right: int) -> int:
        """Partition (median of three)"""
        # Use nums[left] as the pivot
        med = self.median_three(nums, left, (left + right) // 2, right)
        # Swap the median to the array's leftmost position
        nums[left], nums[med] = nums[med], nums[left]
        # Use nums[left] as the pivot
        i, j = left, right
        while i < j:
            while i < j and nums[j] >= nums[left]:
                j -= 1  # Search from right to left for the first element smaller than the pivot
            while i < j and nums[i] <= nums[left]:
                i += 1  # Search from left to right for the first element greater than the pivot
            # Swap elements
            nums[i], nums[j] = nums[j], nums[i]
        # Swap the pivot to the boundary between the two subarrays
        nums[i], nums[left] = nums[left], nums[i]
        return i  # Return the index of the pivot

    def quick_sort(self, nums: list[int], left: int, right: int):
        """Quick sort"""
        # Terminate recursion when subarray length is 1
        if left >= right:
            return
        # Partition
        pivot = self.partition(nums, left, right)
        # Recursively process the left subarray and right subarray
        self.quick_sort(nums, left, pivot - 1)
        self.quick_sort(nums, pivot + 1, right)


class QuickSortTailCall:
    """Quick sort class (tail recursion optimization)"""

    def partition(self, nums: list[int], left: int, right: int) -> int:
        """Partition"""
        # Use nums[left] as the pivot
        i, j = left, right
        while i < j:
            while i < j and nums[j] >= nums[left]:
                j -= 1  # Search from right to left for the first element smaller than the pivot
            while i < j and nums[i] <= nums[left]:
                i += 1  # Search from left to right for the first element greater than the pivot
            # Swap elements
            nums[i], nums[j] = nums[j], nums[i]
        # Swap the pivot to the boundary between the two subarrays
        nums[i], nums[left] = nums[left], nums[i]
        return i  # Return the index of the pivot

    def quick_sort(self, nums: list[int], left: int, right: int):
        """Quick sort (tail recursion optimization)"""
        # Terminate when subarray length is 1
        while left < right:
            # Partition operation
            pivot = self.partition(nums, left, right)
            # Perform quick sort on the shorter of the two subarrays
            if pivot - left < right - pivot:
                self.quick_sort(nums, left, pivot - 1)  # Recursively sort the left subarray
                left = pivot + 1  # Remaining unsorted interval is [pivot + 1, right]
            else:
                self.quick_sort(nums, pivot + 1, right)  # Recursively sort the right subarray
                right = pivot - 1  # Remaining unsorted interval is [left, pivot - 1]


"""Driver Code"""
if __name__ == "__main__":
    # Quick sort
    nums = [2, 4, 1, 0, 3, 5]
    QuickSort().quick_sort(nums, 0, len(nums) - 1)
    print("Quick sort completed nums =", nums)

    # Quick sort (median pivot optimization)
    nums1 = [2, 4, 1, 0, 3, 5]
    QuickSortMedian().quick_sort(nums1, 0, len(nums1) - 1)
    print("Quick sort (median pivot optimization) completed nums =", nums1)

    # Quick sort (tail recursion optimization)
    nums2 = [2, 4, 1, 0, 3, 5]
    QuickSortTailCall().quick_sort(nums2, 0, len(nums2) - 1)
    print("Quick sort (tail recursion optimization) completed nums =", nums2)
