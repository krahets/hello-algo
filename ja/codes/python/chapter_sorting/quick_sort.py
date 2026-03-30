"""
File: quick_sort.py
Created Time: 2022-11-25
Author: timi (xisunyy@163.com)
"""


class QuickSort:
    """クイックソートクラス"""

    def partition(self, nums: list[int], left: int, right: int) -> int:
        """番兵分割"""
        # nums[left] を基準値とする
        i, j = left, right
        while i < j:
            while i < j and nums[j] >= nums[left]:
                j -= 1  # 右から左へ基準値未満の最初の要素を探す
            while i < j and nums[i] <= nums[left]:
                i += 1  # 左から右へ基準値より大きい最初の要素を探す
            # 要素の交換
            nums[i], nums[j] = nums[j], nums[i]
        # 基準値を 2 つの部分配列の境界へ交換する
        nums[i], nums[left] = nums[left], nums[i]
        return i  # 基準値のインデックスを返す

    def quick_sort(self, nums: list[int], left: int, right: int):
        """クイックソート"""
        # 部分配列の長さが 1 なら再帰を終了する
        if left >= right:
            return
        # 番兵分割
        pivot = self.partition(nums, left, right)
        # 左右の部分配列を再帰処理
        self.quick_sort(nums, left, pivot - 1)
        self.quick_sort(nums, pivot + 1, right)


class QuickSortMedian:
    """クイックソートクラス（中央値ピボット最適化）"""

    def median_three(self, nums: list[int], left: int, mid: int, right: int) -> int:
        """3つの候補要素の中央値を選ぶ"""
        l, m, r = nums[left], nums[mid], nums[right]
        if (l <= m <= r) or (r <= m <= l):
            return mid  # m は l と r の間
        if (m <= l <= r) or (r <= l <= m):
            return left  # l は m と r の間
        return right

    def partition(self, nums: list[int], left: int, right: int) -> int:
        """番兵による分割処理（3 点中央値）"""
        # nums[left] を基準値とする
        med = self.median_three(nums, left, (left + right) // 2, right)
        # 中央値を配列の最左端に交換する
        nums[left], nums[med] = nums[med], nums[left]
        # nums[left] を基準値とする
        i, j = left, right
        while i < j:
            while i < j and nums[j] >= nums[left]:
                j -= 1  # 右から左へ基準値未満の最初の要素を探す
            while i < j and nums[i] <= nums[left]:
                i += 1  # 左から右へ基準値より大きい最初の要素を探す
            # 要素の交換
            nums[i], nums[j] = nums[j], nums[i]
        # 基準値を 2 つの部分配列の境界へ交換する
        nums[i], nums[left] = nums[left], nums[i]
        return i  # 基準値のインデックスを返す

    def quick_sort(self, nums: list[int], left: int, right: int):
        """クイックソート"""
        # 部分配列の長さが 1 なら再帰を終了する
        if left >= right:
            return
        # 番兵分割
        pivot = self.partition(nums, left, right)
        # 左右の部分配列を再帰処理
        self.quick_sort(nums, left, pivot - 1)
        self.quick_sort(nums, pivot + 1, right)


class QuickSortTailCall:
    """クイックソートクラス（再帰深度最適化）"""

    def partition(self, nums: list[int], left: int, right: int) -> int:
        """番兵分割"""
        # nums[left] を基準値とする
        i, j = left, right
        while i < j:
            while i < j and nums[j] >= nums[left]:
                j -= 1  # 右から左へ基準値未満の最初の要素を探す
            while i < j and nums[i] <= nums[left]:
                i += 1  # 左から右へ基準値より大きい最初の要素を探す
            # 要素の交換
            nums[i], nums[j] = nums[j], nums[i]
        # 基準値を 2 つの部分配列の境界へ交換する
        nums[i], nums[left] = nums[left], nums[i]
        return i  # 基準値のインデックスを返す

    def quick_sort(self, nums: list[int], left: int, right: int):
        """クイックソート（再帰深度最適化）"""
        # 部分配列の長さが 1 なら終了
        while left < right:
            # 番兵による分割処理
            pivot = self.partition(nums, left, right)
            # 2 つの部分配列のうち短いほうにクイックソートを適用する
            if pivot - left < right - pivot:
                self.quick_sort(nums, left, pivot - 1)  # 左部分配列を再帰的にソート
                left = pivot + 1  # 未ソート区間の残りは [pivot + 1, right]
            else:
                self.quick_sort(nums, pivot + 1, right)  # 右部分配列を再帰的にソート
                right = pivot - 1  # 未ソート区間の残りは [left, pivot - 1]


"""Driver Code"""
if __name__ == "__main__":
    # クイックソート
    nums = [2, 4, 1, 0, 3, 5]
    QuickSort().quick_sort(nums, 0, len(nums) - 1)
    print("クイックソート完了後 nums =", nums)

    # クイックソート（中央値の基準値で最適化）
    nums1 = [2, 4, 1, 0, 3, 5]
    QuickSortMedian().quick_sort(nums1, 0, len(nums1) - 1)
    print("クイックソート（中央値ピボット最適化）完了後 nums =", nums1)

    # クイックソート（再帰深度最適化）
    nums2 = [2, 4, 1, 0, 3, 5]
    QuickSortTailCall().quick_sort(nums2, 0, len(nums2) - 1)
    print("クイックソート（再帰深度最適化）完了後 nums =", nums2)
