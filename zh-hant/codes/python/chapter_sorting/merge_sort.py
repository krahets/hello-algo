"""
File: merge_sort.py
Created Time: 2022-11-25
Author: timi (xisunyy@163.com), krahets (krahets@163.com)
"""


def merge(nums: list[int], left: int, mid: int, right: int):
    """合併左、右子陣列"""
    # 左子陣列的區間為 [left, mid]，右子陣列的區間為 [mid+1, right]
    # 建立暫存陣列 tmp，用來存放合併結果
    tmp = [0] * (right - left + 1)
    # 設定左、右子陣列的起始索引
    i, j, k = left, mid + 1, 0
    # 當左、右子陣列都還有元素時，比較兩邊的元素，將較小的元素複製到暫存陣列
    while i <= mid and j <= right:
        if nums[i] <= nums[j]:
            tmp[k] = nums[i]
            i += 1
        else:
            tmp[k] = nums[j]
            j += 1
        k += 1
    # 將左、右子陣列中剩餘的元素複製到暫存陣列
    while i <= mid:
        tmp[k] = nums[i]
        i += 1
        k += 1
    while j <= right:
        tmp[k] = nums[j]
        j += 1
        k += 1
    # 將暫存陣列 tmp 的元素複製回原陣列 nums 的對應區間
    for k in range(0, len(tmp)):
        nums[left + k] = tmp[k]


def merge_sort(nums: list[int], left: int, right: int):
    """合併排序"""
    # 終止條件
    if left >= right:
        return  # 當子陣列的長度為 1 時，終止遞迴
    # 分割階段
    mid = (left + right) // 2 # 計算中點
    merge_sort(nums, left, mid)  # 遞迴處理左子陣列
    merge_sort(nums, mid + 1, right)  # 遞迴處理右子陣列
    # 合併階段
    merge(nums, left, mid, right)


"""Driver Code"""
if __name__ == "__main__":
    nums = [7, 3, 2, 6, 0, 1, 5, 4]
    merge_sort(nums, 0, len(nums) - 1)
    print("合併排序完成後 nums =", nums)
