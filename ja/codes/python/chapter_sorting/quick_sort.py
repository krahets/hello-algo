"""
File: quick_sort.py
Created Time: 2022-11-25
Author: timi (xisunyy@163.com)
"""


class QuickSort:
    """クイックソートクラス"""

    def partition(self, nums: list[int], left: int, right: int) -> int:
        """番兵を用いた分割"""
        # nums[left] をピボットとする
        i, j = left, right
        while i < j:
            while i < j and nums[j] >= nums[left]:
                j -= 1  # 右から左へ、ピボットより小さい最初の要素を探す
            while i < j and nums[i] <= nums[left]:
                i += 1  # 左から右へ、ピボットより大きい最初の要素を探す
            # 要素の交換
            nums[i], nums[j] = nums[j], nums[i]
        # ピボットを 2 つの部分配列の境界に移す
        nums[i], nums[left] = nums[left], nums[i]
        return i  # ピボットのインデックスを返す

    def quick_sort(self, nums: list[int], left: int, right: int):
        """クイックソート"""
        # 部分配列の長さが 1 になったら再帰を終了する
        if left >= right:
            return
        # 番兵を用いた分割
        pivot = self.partition(nums, left, right)
        # 左部分配列と右部分配列を再帰的に処理する
        self.quick_sort(nums, left, pivot - 1)
        self.quick_sort(nums, pivot + 1, right)


class QuickSortMedian:
    """クイックソートクラス（中央値ピボットによる最適化）"""

    def median_three(self, nums: list[int], left: int, mid: int, right: int) -> int:
        """候補となる 3 要素の中央値を選ぶ"""
        l, m, r = nums[left], nums[mid], nums[right]
        if (l <= m <= r) or (r <= m <= l):
            return mid  # m が l と r の間にある
        if (m <= l <= r) or (r <= l <= m):
            return left  # l が m と r の間にある
        return right

    def partition(self, nums: list[int], left: int, right: int) -> int:
        """番兵を用いた分割（3 値の中央値を選択）"""
        # nums[left] をピボットとする
        med = self.median_three(nums, left, (left + right) // 2, right)
        # 中央値を配列の左端に移す
        nums[left], nums[med] = nums[med], nums[left]
        # nums[left] をピボットとする
        i, j = left, right
        while i < j:
            while i < j and nums[j] >= nums[left]:
                j -= 1  # 右から左へ、ピボットより小さい最初の要素を探す
            while i < j and nums[i] <= nums[left]:
                i += 1  # 左から右へ、ピボットより大きい最初の要素を探す
            # 要素の交換
            nums[i], nums[j] = nums[j], nums[i]
        # ピボットを 2 つの部分配列の境界に移す
        nums[i], nums[left] = nums[left], nums[i]
        return i  # ピボットのインデックスを返す

    def quick_sort(self, nums: list[int], left: int, right: int):
        """クイックソート"""
        # 部分配列の長さが 1 になったら再帰を終了する
        if left >= right:
            return
        # 番兵を用いた分割
        pivot = self.partition(nums, left, right)
        # 左部分配列と右部分配列を再帰的に処理する
        self.quick_sort(nums, left, pivot - 1)
        self.quick_sort(nums, pivot + 1, right)


class QuickSortTailCall:
    """クイックソートクラス（再帰の深さの最適化）"""

    def partition(self, nums: list[int], left: int, right: int) -> int:
        """番兵を用いた分割"""
        # nums[left] をピボットとする
        i, j = left, right
        while i < j:
            while i < j and nums[j] >= nums[left]:
                j -= 1  # 右から左へ、ピボットより小さい最初の要素を探す
            while i < j and nums[i] <= nums[left]:
                i += 1  # 左から右へ、ピボットより大きい最初の要素を探す
            # 要素の交換
            nums[i], nums[j] = nums[j], nums[i]
        # ピボットを 2 つの部分配列の境界に移す
        nums[i], nums[left] = nums[left], nums[i]
        return i  # ピボットのインデックスを返す

    def quick_sort(self, nums: list[int], left: int, right: int):
        """クイックソート（再帰の深さの最適化）"""
        # 部分配列の長さが 1 になったら終了する
        while left < right:
            # 番兵を用いた分割操作
            pivot = self.partition(nums, left, right)
            # 2 つの部分配列のうち短いほうにクイックソートを適用する
            if pivot - left < right - pivot:
                self.quick_sort(nums, left, pivot - 1)  # 左部分配列を再帰的にソートする
                left = pivot + 1  # 残りの未ソート区間は [pivot + 1, right]
            else:
                self.quick_sort(nums, pivot + 1, right)  # 右部分配列を再帰的にソートする
                right = pivot - 1  # 残りの未ソート区間は [left, pivot - 1]


"""実行用コード"""
if __name__ == "__main__":
    # クイックソート
    nums = [2, 4, 1, 0, 3, 5]
    QuickSort().quick_sort(nums, 0, len(nums) - 1)
    print("クイックソート完了後 nums =", nums)

    # クイックソート（中央値ピボットによる最適化）
    nums1 = [2, 4, 1, 0, 3, 5]
    QuickSortMedian().quick_sort(nums1, 0, len(nums1) - 1)
    print("クイックソート（中央値ピボットによる最適化）の完了後 nums =", nums1)

    # クイックソート（再帰の深さの最適化）
    nums2 = [2, 4, 1, 0, 3, 5]
    QuickSortTailCall().quick_sort(nums2, 0, len(nums2) - 1)
    print("クイックソート（再帰の深さの最適化）の完了後 nums =", nums2)
