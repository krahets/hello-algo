"""
File: quick_sort.py
Created Time: 2022-11-25
Author: timi (xisunyy@163.com)
"""


class QuickSort:
    """Quick sort class"""

    def partition(self, nums: list[int], left: int, right: int) -> int:
        """Two-pointer partitioning"""
        # Use nums[left] as the pivot
        i, j = left, right
        while i < j:
            while i < j and nums[j] >= nums[left]:
                j -= 1  # Scan from right to left for the first element smaller than the pivot
            while i < j and nums[i] <= nums[left]:
                i += 1  # Scan from left to right for the first element larger than the pivot
            # Swap the elements
            nums[i], nums[j] = nums[j], nums[i]
        # Swap the pivot into the boundary position between the two subarrays
        nums[i], nums[left] = nums[left], nums[i]
        return i  # Return the pivot index

    def quick_sort(self, nums: list[int], left: int, right: int):
        """Quick sort"""
        # Stop recursing when the subarray has at most one element
        if left >= right:
            return
        # Two-pointer partitioning
        pivot = self.partition(nums, left, right)
        # Recurse on the left and right subarrays
        self.quick_sort(nums, left, pivot - 1)
        self.quick_sort(nums, pivot + 1, right)


class QuickSortMedian:
    """Quick sort class (median pivot optimization)"""

    def median_three(self, nums: list[int], left: int, mid: int, right: int) -> int:
        """Select the median of three candidate elements"""
        l, m, r = nums[left], nums[mid], nums[right]
        if (l <= m <= r) or (r <= m <= l):
            return mid  # m lies between l and r
        if (m <= l <= r) or (r <= l <= m):
            return left  # l lies between m and r
        return right

    def partition(self, nums: list[int], left: int, right: int) -> int:
        """Two-pointer partitioning (median of three)"""
        # Select the median of the leftmost, middle, and rightmost elements as the pivot
        med = self.median_three(nums, left, (left + right) // 2, right)
        # Swap the median into the leftmost position of the current subarray
        nums[left], nums[med] = nums[med], nums[left]
        # Use nums[left] as the pivot
        i, j = left, right
        while i < j:
            while i < j and nums[j] >= nums[left]:
                j -= 1  # Scan from right to left for the first element smaller than the pivot
            while i < j and nums[i] <= nums[left]:
                i += 1  # Scan from left to right for the first element larger than the pivot
            # Swap the elements
            nums[i], nums[j] = nums[j], nums[i]
        # Swap the pivot into the boundary position between the two subarrays
        nums[i], nums[left] = nums[left], nums[i]
        return i  # Return the pivot index

    def quick_sort(self, nums: list[int], left: int, right: int):
        """Quick sort"""
        # Stop recursing when the subarray has at most one element
        if left >= right:
            return
        # Two-pointer partitioning
        pivot = self.partition(nums, left, right)
        # Recurse on the left and right subarrays
        self.quick_sort(nums, left, pivot - 1)
        self.quick_sort(nums, pivot + 1, right)


class QuickSortTailCall:
    """Quick sort class (recursion depth optimization)"""

    def partition(self, nums: list[int], left: int, right: int) -> int:
        """Two-pointer partitioning"""
        # Use nums[left] as the pivot
        i, j = left, right
        while i < j:
            while i < j and nums[j] >= nums[left]:
                j -= 1  # Scan from right to left for the first element smaller than the pivot
            while i < j and nums[i] <= nums[left]:
                i += 1  # Scan from left to right for the first element larger than the pivot
            # Swap the elements
            nums[i], nums[j] = nums[j], nums[i]
        # Swap the pivot into the boundary position between the two subarrays
        nums[i], nums[left] = nums[left], nums[i]
        return i  # Return the pivot index

    def quick_sort(self, nums: list[int], left: int, right: int):
        """Quick sort (recursion depth optimization)"""
        # Stop when the subarray has at most one element
        while left < right:
            # Perform two-pointer partitioning
            pivot = self.partition(nums, left, right)
            # Apply quick sort to the shorter of the two subarrays
            if pivot - left < right - pivot:
                self.quick_sort(nums, left, pivot - 1)  # Recursively sort the left subarray
                left = pivot + 1  # The remaining unsorted range is [pivot + 1, right]
            else:
                self.quick_sort(nums, pivot + 1, right)  # Recursively sort the right subarray
                right = pivot - 1  # The remaining unsorted range is [left, pivot - 1]


"""Driver code"""
if __name__ == "__main__":
    # Quick sort
    nums = [2, 4, 1, 0, 3, 5]
    QuickSort().quick_sort(nums, 0, len(nums) - 1)
    print("After quick sort, nums =", nums)

    # Quick sort (median pivot optimization)
    nums1 = [2, 4, 1, 0, 3, 5]
    QuickSortMedian().quick_sort(nums1, 0, len(nums1) - 1)
    print("After quick sort (median pivot optimization), nums1 =", nums1)

    # Quick sort (recursion depth optimization)
    nums2 = [2, 4, 1, 0, 3, 5]
    QuickSortTailCall().quick_sort(nums2, 0, len(nums2) - 1)
    print("After quick sort (recursion depth optimization), nums2 =", nums2)
