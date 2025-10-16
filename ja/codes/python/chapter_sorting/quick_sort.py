"""
File: quick_sort.py
Created Time: 2022-11-25
Author: timi (xisunyy@163.com)
"""


class QuickSort:
    """クイックソートクラス"""

    def partition(self, nums: list[int], left: int, right: int) -> int:
        """分割"""
        # nums[left] をピボットとして使用
        i, j = left, right
        while i < j:
            while i < j and nums[j] >= nums[left]:
                j -= 1  # 右から左へピボットより小さい最初の要素を探す
            while i < j and nums[i] <= nums[left]:
                i += 1  # 左から右へピボットより大きい最初の要素を探す
            # 要素を交換
            nums[i], nums[j] = nums[j], nums[i]
        # ピボットを2つのサブ配列の境界に交換
        nums[i], nums[left] = nums[left], nums[i]
        return i  # ピボットのインデックスを返す

    def quick_sort(self, nums: list[int], left: int, right: int):
        """クイックソート"""
        # サブ配列の長さが1のときに再帰を終了
        if left >= right:
            return
        # 分割
        pivot = self.partition(nums, left, right)
        # 左サブ配列と右サブ配列を再帰的に処理
        self.quick_sort(nums, left, pivot - 1)
        self.quick_sort(nums, pivot + 1, right)


class QuickSortMedian:
    """クイックソートクラス（中央値ピボット最適化）"""

    def median_three(self, nums: list[int], left: int, mid: int, right: int) -> int:
        """3つの候補要素の中央値を選択"""
        l, m, r = nums[left], nums[mid], nums[right]
        if (l <= m <= r) or (r <= m <= l):
            return mid  # m は l と r の間
        if (m <= l <= r) or (r <= l <= m):
            return left  # l は m と r の間
        return right

    def partition(self, nums: list[int], left: int, right: int) -> int:
        """分割（三点中央値）"""
        # nums[left] をピボットとして使用
        med = self.median_three(nums, left, (left + right) // 2, right)
        # 中央値を配列の最左端に交換
        nums[left], nums[med] = nums[med], nums[left]
        # nums[left] をピボットとして使用
        i, j = left, right
        while i < j:
            while i < j and nums[j] >= nums[left]:
                j -= 1  # 右から左へピボットより小さい最初の要素を探す
            while i < j and nums[i] <= nums[left]:
                i += 1  # 左から右へピボットより大きい最初の要素を探す
            # 要素を交換
            nums[i], nums[j] = nums[j], nums[i]
        # ピボットを2つのサブ配列の境界に交換
        nums[i], nums[left] = nums[left], nums[i]
        return i  # ピボットのインデックスを返す

    def quick_sort(self, nums: list[int], left: int, right: int):
        """クイックソート"""
        # サブ配列の長さが1のときに再帰を終了
        if left >= right:
            return
        # 分割
        pivot = self.partition(nums, left, right)
        # 左サブ配列と右サブ配列を再帰的に処理
        self.quick_sort(nums, left, pivot - 1)
        self.quick_sort(nums, pivot + 1, right)


class QuickSortTailCall:
    """クイックソートクラス（末尾再帰最適化）"""

    def partition(self, nums: list[int], left: int, right: int) -> int:
        """分割"""
        # nums[left] をピボットとして使用
        i, j = left, right
        while i < j:
            while i < j and nums[j] >= nums[left]:
                j -= 1  # 右から左へピボットより小さい最初の要素を探す
            while i < j and nums[i] <= nums[left]:
                i += 1  # 左から右へピボットより大きい最初の要素を探す
            # 要素を交換
            nums[i], nums[j] = nums[j], nums[i]
        # ピボットを2つのサブ配列の境界に交換
        nums[i], nums[left] = nums[left], nums[i]
        return i  # ピボットのインデックスを返す

    def quick_sort(self, nums: list[int], left: int, right: int):
        """クイックソート（末尾再帰最適化）"""
        # サブ配列の長さが1のときに終了
        while left < right:
            # 分割操作
            pivot = self.partition(nums, left, right)
            # 2つのサブ配列のうち短い方に対してクイックソートを実行
            if pivot - left < right - pivot:
                self.quick_sort(nums, left, pivot - 1)  # 左サブ配列を再帰的にソート
                left = pivot + 1  # 残りの未ソート区間は [pivot + 1, right]
            else:
                self.quick_sort(nums, pivot + 1, right)  # 右サブ配列を再帰的にソート
                right = pivot - 1  # 残りの未ソート区間は [left, pivot - 1]


"""ドライバーコード"""
if __name__ == "__main__":
    # クイックソート
    nums = [2, 4, 1, 0, 3, 5]
    QuickSort().quick_sort(nums, 0, len(nums) - 1)
    print("クイックソート完了 nums =", nums)

    # クイックソート（中央値ピボット最適化）
    nums1 = [2, 4, 1, 0, 3, 5]
    QuickSortMedian().quick_sort(nums1, 0, len(nums1) - 1)
    print("クイックソート（中央値ピボット最適化）完了 nums =", nums1)

    # クイックソート（末尾再帰最適化）
    nums2 = [2, 4, 1, 0, 3, 5]
    QuickSortTailCall().quick_sort(nums2, 0, len(nums2) - 1)
    print("クイックソート（末尾再帰最適化）完了 nums =", nums2)