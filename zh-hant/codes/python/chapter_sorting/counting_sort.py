"""
File: counting_sort.py
Created Time: 2023-03-21
Author: krahets (krahets@163.com)
"""


def counting_sort_naive(nums: list[int]):
    """計數排序"""
    # 簡單實現，無法用於排序物件
    # 1. 統計陣列最大元素 m
    m = max(nums)
    # 2. 統計各數字的出現次數
    # counter[num] 代表 num 的出現次數
    counter = [0] * (m + 1)
    for num in nums:
        counter[num] += 1
    # 3. 走訪 counter ，將各元素填入原陣列 nums
    i = 0
    for num in range(m + 1):
        for _ in range(counter[num]):
            nums[i] = num
            i += 1


def counting_sort(nums: list[int]):
    """計數排序"""
    # 完整實現，可排序物件，並且是穩定排序
    # 1. 統計陣列最大元素 m
    m = max(nums)
    # 2. 統計各數字的出現次數
    # counter[num] 代表 num 的出現次數
    counter = [0] * (m + 1)
    for num in nums:
        counter[num] += 1
    # 3. 求 counter 的前綴和，將“出現次數”轉換為“尾索引”
    # 即 counter[num]-1 是 num 在 res 中最後一次出現的索引
    for i in range(m):
        counter[i + 1] += counter[i]
    # 4. 倒序走訪 nums ，將各元素填入結果陣列 res
    # 初始化陣列 res 用於記錄結果
    n = len(nums)
    res = [0] * n
    for i in range(n - 1, -1, -1):
        num = nums[i]
        res[counter[num] - 1] = num  # 將 num 放置到對應索引處
        counter[num] -= 1  # 令前綴和自減 1 ，得到下次放置 num 的索引
    # 使用結果陣列 res 覆蓋原陣列 nums
    for i in range(n):
        nums[i] = res[i]


"""Driver Code"""
if __name__ == "__main__":
    nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]

    counting_sort_naive(nums)
    print(f"計數排序（無法排序物件）完成後 nums = {nums}")

    nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]
    counting_sort(nums1)
    print(f"計數排序完成後 nums1 = {nums1}")
