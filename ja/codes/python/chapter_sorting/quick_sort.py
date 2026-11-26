"""
File: quick_sort.py
Created Time: 2022-11-25
Author: timi (xisunyy@163.com)
"""


class QuickSort:
    """クイックソートクラス"""

    def partition(self, nums: list[int], left: int, right: int) -> int:
        """左右から走査して分割"""
        # nums[left] をピボットとする
        i, j = left, right
        while i < j:
            while i < j and nums[j] >= nums[left]:
                j -= 1  # 右から左へ走査し、ピボットより小さい最初の要素を探す
            while i < j and nums[i] <= nums[left]:
                i += 1  # 左から右へ走査し、ピボットより大きい最初の要素を探す
            # 要素を交換
            nums[i], nums[j] = nums[j], nums[i]
        # ピボットを交換して左右の部分配列の境界に移す
        nums[i], nums[left] = nums[left], nums[i]
        return i  # ピボットのインデックスを返す

    def quick_sort(self, nums: list[int], left: int, right: int):
        """クイックソート"""
        # 部分配列の長さが 1 になったら再帰を終了
        if left >= right:
            return
        # 左右から走査して分割
        pivot = self.partition(nums, left, right)
        # 左右の部分配列を再帰的に処理
        self.quick_sort(nums, left, pivot - 1)
        self.quick_sort(nums, pivot + 1, right)


class QuickSortMedian:
    """クイックソートクラス（中央値をピボットに使用）"""

    def median_three(self, nums: list[int], left: int, mid: int, right: int) -> int:
        """3 つの候補の中央値を選ぶ"""
        l, m, r = nums[left], nums[mid], nums[right]
        if (l <= m <= r) or (r <= m <= l):
            return mid  # m の値は l と r の値の間にある
        if (m <= l <= r) or (r <= l <= m):
            return left  # l の値は m と r の値の間にある
        return right

    def partition(self, nums: list[int], left: int, right: int) -> int:
        """左右から走査して分割（3 要素の中央値を使用）"""
        # nums[left] をピボットとする
        med = self.median_three(nums, left, (left + right) // 2, right)
        # 中央値の要素を配列の左端に移す
        nums[left], nums[med] = nums[med], nums[left]
        # nums[left] をピボットとする
        i, j = left, right
        while i < j:
            while i < j and nums[j] >= nums[left]:
                j -= 1  # 右から左へ走査し、ピボットより小さい最初の要素を探す
            while i < j and nums[i] <= nums[left]:
                i += 1  # 左から右へ走査し、ピボットより大きい最初の要素を探す
            # 要素を交換
            nums[i], nums[j] = nums[j], nums[i]
        # ピボットを交換して左右の部分配列の境界に移す
        nums[i], nums[left] = nums[left], nums[i]
        return i  # ピボットのインデックスを返す

    def quick_sort(self, nums: list[int], left: int, right: int):
        """クイックソート"""
        # 部分配列の長さが 1 になったら再帰を終了
        if left >= right:
            return
        # 左右から走査して分割
        pivot = self.partition(nums, left, right)
        # 左右の部分配列を再帰的に処理
        self.quick_sort(nums, left, pivot - 1)
        self.quick_sort(nums, pivot + 1, right)


class QuickSortTailCall:
    """クイックソートクラス（再帰の深さを最適化）"""

    def partition(self, nums: list[int], left: int, right: int) -> int:
        """左右から走査して分割"""
        # nums[left] をピボットとする
        i, j = left, right
        while i < j:
            while i < j and nums[j] >= nums[left]:
                j -= 1  # 右から左へ走査し、ピボットより小さい最初の要素を探す
            while i < j and nums[i] <= nums[left]:
                i += 1  # 左から右へ走査し、ピボットより大きい最初の要素を探す
            # 要素を交換
            nums[i], nums[j] = nums[j], nums[i]
        # ピボットを交換して左右の部分配列の境界に移す
        nums[i], nums[left] = nums[left], nums[i]
        return i  # ピボットのインデックスを返す

    def quick_sort(self, nums: list[int], left: int, right: int):
        """クイックソート（再帰の深さを最適化）"""
        # 部分配列の長さが 1 になったら終了
        while left < right:
            # 左右から走査して分割
            pivot = self.partition(nums, left, right)
            # 短いほうの部分配列にクイックソートを適用
            if pivot - left < right - pivot:
                self.quick_sort(nums, left, pivot - 1)  # 左の部分配列を再帰的にソート
                left = pivot + 1  # 残りの未整列区間は [pivot + 1, right]
            else:
                self.quick_sort(nums, pivot + 1, right)  # 右の部分配列を再帰的にソート
                right = pivot - 1  # 残りの未整列区間は [left, pivot - 1]


"""Driver Code"""
if __name__ == "__main__":
    # クイックソート
    nums = [2, 4, 1, 0, 3, 5]
    QuickSort().quick_sort(nums, 0, len(nums) - 1)
    print("クイックソート後の nums =", nums)

    # クイックソート（中央値をピボットに使用）
    nums1 = [2, 4, 1, 0, 3, 5]
    QuickSortMedian().quick_sort(nums1, 0, len(nums1) - 1)
    print("クイックソート（中央値をピボットに使用）後の nums =", nums1)

    # クイックソート（再帰の深さを最適化）
    nums2 = [2, 4, 1, 0, 3, 5]
    QuickSortTailCall().quick_sort(nums2, 0, len(nums2) - 1)
    print("クイックソート（再帰の深さを最適化）後の nums =", nums2)
