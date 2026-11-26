"""
File: quick_sort.py
Created Time: 2022-11-25
Author: timi (xisunyy@163.com)
"""


class QuickSort:
    """快速排序類別"""

    def partition(self, nums: list[int], left: int, right: int) -> int:
        """哨兵分割"""
        # 以 nums[left] 為基準值
        i, j = left, right
        while i < j:
            while i < j and nums[j] >= nums[left]:
                j -= 1  # 從右向左尋找第一個小於基準值的元素
            while i < j and nums[i] <= nums[left]:
                i += 1  # 從左向右尋找第一個大於基準值的元素
            # 交換元素
            nums[i], nums[j] = nums[j], nums[i]
        # 交換元素，將基準值移到兩個子陣列的交界處
        nums[i], nums[left] = nums[left], nums[i]
        return i  # 回傳基準值的索引

    def quick_sort(self, nums: list[int], left: int, right: int):
        """快速排序"""
        # 子陣列長度為 1 時終止遞迴
        if left >= right:
            return
        # 哨兵分割
        pivot = self.partition(nums, left, right)
        # 遞迴處理左、右子陣列
        self.quick_sort(nums, left, pivot - 1)
        self.quick_sort(nums, pivot + 1, right)


class QuickSortMedian:
    """快速排序類別（以中位數作為基準值的最佳化）"""

    def median_three(self, nums: list[int], left: int, mid: int, right: int) -> int:
        """取三個候選元素的中位數"""
        l, m, r = nums[left], nums[mid], nums[right]
        if (l <= m <= r) or (r <= m <= l):
            return mid  # m 介於 l 和 r 之間
        if (m <= l <= r) or (r <= l <= m):
            return left  # l 介於 m 和 r 之間
        return right

    def partition(self, nums: list[int], left: int, right: int) -> int:
        """哨兵分割（三數取中）"""
        # 以 nums[left] 為基準值
        med = self.median_three(nums, left, (left + right) // 2, right)
        # 將中位數與陣列最左端的元素交換
        nums[left], nums[med] = nums[med], nums[left]
        # 以 nums[left] 為基準值
        i, j = left, right
        while i < j:
            while i < j and nums[j] >= nums[left]:
                j -= 1  # 從右向左尋找第一個小於基準值的元素
            while i < j and nums[i] <= nums[left]:
                i += 1  # 從左向右尋找第一個大於基準值的元素
            # 交換元素
            nums[i], nums[j] = nums[j], nums[i]
        # 交換元素，將基準值移到兩個子陣列的交界處
        nums[i], nums[left] = nums[left], nums[i]
        return i  # 回傳基準值的索引

    def quick_sort(self, nums: list[int], left: int, right: int):
        """快速排序"""
        # 子陣列長度為 1 時終止遞迴
        if left >= right:
            return
        # 哨兵分割
        pivot = self.partition(nums, left, right)
        # 遞迴處理左、右子陣列
        self.quick_sort(nums, left, pivot - 1)
        self.quick_sort(nums, pivot + 1, right)


class QuickSortTailCall:
    """快速排序類別（遞迴深度最佳化）"""

    def partition(self, nums: list[int], left: int, right: int) -> int:
        """哨兵分割"""
        # 以 nums[left] 為基準值
        i, j = left, right
        while i < j:
            while i < j and nums[j] >= nums[left]:
                j -= 1  # 從右向左尋找第一個小於基準值的元素
            while i < j and nums[i] <= nums[left]:
                i += 1  # 從左向右尋找第一個大於基準值的元素
            # 交換元素
            nums[i], nums[j] = nums[j], nums[i]
        # 交換元素，將基準值移到兩個子陣列的交界處
        nums[i], nums[left] = nums[left], nums[i]
        return i  # 回傳基準值的索引

    def quick_sort(self, nums: list[int], left: int, right: int):
        """快速排序（遞迴深度最佳化）"""
        # 子陣列長度為 1 時終止
        while left < right:
            # 執行哨兵分割
            pivot = self.partition(nums, left, right)
            # 對兩個子陣列中較短的一個執行快速排序
            if pivot - left < right - pivot:
                self.quick_sort(nums, left, pivot - 1)  # 遞迴排序左子陣列
                left = pivot + 1  # 剩餘的未排序區間為 [pivot + 1, right]
            else:
                self.quick_sort(nums, pivot + 1, right)  # 遞迴排序右子陣列
                right = pivot - 1  # 剩餘的未排序區間為 [left, pivot - 1]


"""Driver Code"""
if __name__ == "__main__":
    # 快速排序
    nums = [2, 4, 1, 0, 3, 5]
    QuickSort().quick_sort(nums, 0, len(nums) - 1)
    print("快速排序完成後 nums =", nums)

    # 快速排序（以中位數作為基準值的最佳化）
    nums1 = [2, 4, 1, 0, 3, 5]
    QuickSortMedian().quick_sort(nums1, 0, len(nums1) - 1)
    print("快速排序（以中位數作為基準值的最佳化）完成後 nums =", nums1)

    # 快速排序（遞迴深度最佳化）
    nums2 = [2, 4, 1, 0, 3, 5]
    QuickSortTailCall().quick_sort(nums2, 0, len(nums2) - 1)
    print("快速排序（遞迴深度最佳化）完成後 nums =", nums2)
