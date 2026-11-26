"""
File: counting_sort.py
Created Time: 2023-03-21
Author: krahets (krahets@163.com)
"""


def counting_sort_naive(nums: list[int]):
    """計數排序"""
    # 簡易實作，無法用來將物件排序
    # 1. 找出陣列中的最大元素 m
    m = max(nums)
    # 2. 統計各數字出現的次數
    # counter[num] 代表 num 出現的次數
    counter = [0] * (m + 1)
    for num in nums:
        counter[num] += 1
    # 3. 走訪 counter，將各元素填入原陣列 nums
    i = 0
    for num in range(m + 1):
        for _ in range(counter[num]):
            nums[i] = num
            i += 1


def counting_sort(nums: list[int]):
    """計數排序"""
    # 完整實作，可將物件排序，且屬於穩定排序
    # 1. 找出陣列中的最大元素 m
    m = max(nums)
    # 2. 統計各數字出現的次數
    # counter[num] 代表 num 出現的次數
    counter = [0] * (m + 1)
    for num in nums:
        counter[num] += 1
    # 3. 計算 counter 的前綴和，將「出現次數」轉為「結尾索引」
    # 也就是說，counter[num]-1 是 num 在 res 中最後一次出現的索引
    for i in range(m):
        counter[i + 1] += counter[i]
    # 4. 反向走訪 nums，將各元素填入結果陣列 res
    # 初始化陣列 res，用來記錄結果
    n = len(nums)
    res = [0] * n
    for i in range(n - 1, -1, -1):
        num = nums[i]
        res[counter[num] - 1] = num  # 將 num 放到對應索引的位置
        counter[num] -= 1  # 將前綴和減 1，取得下次放置 num 時所需的索引
    # 用結果陣列 res 覆寫原陣列 nums
    for i in range(n):
        nums[i] = res[i]


"""Driver Code"""
if __name__ == "__main__":
    nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]

    counting_sort_naive(nums)
    print(f"計數排序（無法將物件排序）完成後 nums = {nums}")

    nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]
    counting_sort(nums1)
    print(f"計數排序完成後 nums1 = {nums1}")
