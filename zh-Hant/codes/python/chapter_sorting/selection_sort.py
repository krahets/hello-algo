"""
File: selection_sort.py
Created Time: 2023-05-22
Author: krahets (krahets@163.com)
"""


def selection_sort(nums: list[int]):
    """選擇排序"""
    n = len(nums)
    # 外迴圈：未排序區間為 [i, n-1]
    for i in range(n - 1):
        # 內迴圈：找到未排序區間內的最小元素
        k = i
        for j in range(i + 1, n):
            if nums[j] < nums[k]:
                k = j  # 記錄最小元素的索引
        # 將該最小元素與未排序區間的首個元素交換
        nums[i], nums[k] = nums[k], nums[i]


"""Driver Code"""
if __name__ == "__main__":
    nums = [4, 1, 3, 1, 5, 2]
    selection_sort(nums)
    print("選擇排序完成後 nums =", nums)
