"""
File: merge_sort.py
Created Time: 2022-11-25
Author: timi (xisunyy@163.com), krahets (krahets@163.com)
"""


def merge(nums: list[int], left: int, mid: int, right: int):
    """合併左子陣列和右子陣列"""
    # 左子陣列區間為 [left, mid], 右子陣列區間為 [mid+1, right]
    # 建立一個臨時陣列 tmp ，用於存放合併後的結果
    tmp = [0] * (right - left + 1)
    # 初始化左子陣列和右子陣列的起始索引
    i, j, k = left, mid + 1, 0
    # 當左右子陣列都還有元素時，進行比較並將較小的元素複製到臨時陣列中
    while i <= mid and j <= right:
        if nums[i] <= nums[j]:
            tmp[k] = nums[i]
            i += 1
        else:
            tmp[k] = nums[j]
            j += 1
        k += 1
    # 將左子陣列和右子陣列的剩餘元素複製到臨時陣列中
    while i <= mid:
        tmp[k] = nums[i]
        i += 1
        k += 1
    while j <= right:
        tmp[k] = nums[j]
        j += 1
        k += 1
    # 將臨時陣列 tmp 中的元素複製回原陣列 nums 的對應區間
    for k in range(0, len(tmp)):
        nums[left + k] = tmp[k]


def merge_sort(nums: list[int], left: int, right: int):
    """合併排序"""
    # 終止條件
    if left >= right:
        return  # 當子陣列長度為 1 時終止遞迴
    # 劃分階段
    mid = (left + right) // 2 # 計算中點
    merge_sort(nums, left, mid)  # 遞迴左子陣列
    merge_sort(nums, mid + 1, right)  # 遞迴右子陣列
    # 合併階段
    merge(nums, left, mid, right)


"""Driver Code"""
if __name__ == "__main__":
    nums = [7, 3, 2, 6, 0, 1, 5, 4]
    merge_sort(nums, 0, len(nums) - 1)
    print("合併排序完成後 nums =", nums)
