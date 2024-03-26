"""
File: quick_sort.py
Created Time: 2022-11-25
Author: timi (xisunyy@163.com)
"""


class QuickSort:
    """快速排序類別"""

    def partition(self, nums: list[int], left: int, right: int) -> int:
        """哨兵劃分"""
        # 以 nums[left] 為基準數
        i, j = left, right
        while i < j:
            while i < j and nums[j] >= nums[left]:
                j -= 1  # 從右向左找首個小於基準數的元素
            while i < j and nums[i] <= nums[left]:
                i += 1  # 從左向右找首個大於基準數的元素
            # 元素交換
            nums[i], nums[j] = nums[j], nums[i]
        # 將基準數交換至兩子陣列的分界線
        nums[i], nums[left] = nums[left], nums[i]
        return i  # 返回基準數的索引

    def quick_sort(self, nums: list[int], left: int, right: int):
        """快速排序"""
        # 子陣列長度為 1 時終止遞迴
        if left >= right:
            return
        # 哨兵劃分
        pivot = self.partition(nums, left, right)
        # 遞迴左子陣列、右子陣列
        self.quick_sort(nums, left, pivot - 1)
        self.quick_sort(nums, pivot + 1, right)


class QuickSortMedian:
    """快速排序類別（中位基準數最佳化）"""

    def median_three(self, nums: list[int], left: int, mid: int, right: int) -> int:
        """選取三個候選元素的中位數"""
        l, m, r = nums[left], nums[mid], nums[right]
        if (l <= m <= r) or (r <= m <= l):
            return mid  # m 在 l 和 r 之間
        if (m <= l <= r) or (r <= l <= m):
            return left  # l 在 m 和 r 之間
        return right

    def partition(self, nums: list[int], left: int, right: int) -> int:
        """哨兵劃分（三數取中值）"""
        # 以 nums[left] 為基準數
        med = self.median_three(nums, left, (left + right) // 2, right)
        # 將中位數交換至陣列最左端
        nums[left], nums[med] = nums[med], nums[left]
        # 以 nums[left] 為基準數
        i, j = left, right
        while i < j:
            while i < j and nums[j] >= nums[left]:
                j -= 1  # 從右向左找首個小於基準數的元素
            while i < j and nums[i] <= nums[left]:
                i += 1  # 從左向右找首個大於基準數的元素
            # 元素交換
            nums[i], nums[j] = nums[j], nums[i]
        # 將基準數交換至兩子陣列的分界線
        nums[i], nums[left] = nums[left], nums[i]
        return i  # 返回基準數的索引

    def quick_sort(self, nums: list[int], left: int, right: int):
        """快速排序"""
        # 子陣列長度為 1 時終止遞迴
        if left >= right:
            return
        # 哨兵劃分
        pivot = self.partition(nums, left, right)
        # 遞迴左子陣列、右子陣列
        self.quick_sort(nums, left, pivot - 1)
        self.quick_sort(nums, pivot + 1, right)


class QuickSortTailCall:
    """快速排序類別（尾遞迴最佳化）"""

    def partition(self, nums: list[int], left: int, right: int) -> int:
        """哨兵劃分"""
        # 以 nums[left] 為基準數
        i, j = left, right
        while i < j:
            while i < j and nums[j] >= nums[left]:
                j -= 1  # 從右向左找首個小於基準數的元素
            while i < j and nums[i] <= nums[left]:
                i += 1  # 從左向右找首個大於基準數的元素
            # 元素交換
            nums[i], nums[j] = nums[j], nums[i]
        # 將基準數交換至兩子陣列的分界線
        nums[i], nums[left] = nums[left], nums[i]
        return i  # 返回基準數的索引

    def quick_sort(self, nums: list[int], left: int, right: int):
        """快速排序（尾遞迴最佳化）"""
        # 子陣列長度為 1 時終止
        while left < right:
            # 哨兵劃分操作
            pivot = self.partition(nums, left, right)
            # 對兩個子陣列中較短的那個執行快速排序
            if pivot - left < right - pivot:
                self.quick_sort(nums, left, pivot - 1)  # 遞迴排序左子陣列
                left = pivot + 1  # 剩餘未排序區間為 [pivot + 1, right]
            else:
                self.quick_sort(nums, pivot + 1, right)  # 遞迴排序右子陣列
                right = pivot - 1  # 剩餘未排序區間為 [left, pivot - 1]


"""Driver Code"""
if __name__ == "__main__":
    # 快速排序
    nums = [2, 4, 1, 0, 3, 5]
    QuickSort().quick_sort(nums, 0, len(nums) - 1)
    print("快速排序完成後 nums =", nums)

    # 快速排序（中位基準數最佳化）
    nums1 = [2, 4, 1, 0, 3, 5]
    QuickSortMedian().quick_sort(nums1, 0, len(nums1) - 1)
    print("快速排序（中位基準數最佳化）完成後 nums =", nums1)

    # 快速排序（尾遞迴最佳化）
    nums2 = [2, 4, 1, 0, 3, 5]
    QuickSortTailCall().quick_sort(nums2, 0, len(nums2) - 1)
    print("快速排序（尾遞迴最佳化）完成後 nums =", nums2)
