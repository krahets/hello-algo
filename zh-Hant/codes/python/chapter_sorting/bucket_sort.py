"""
File: bucket_sort.py
Created Time: 2023-03-30
Author: krahets (krahets@163.com)
"""


def bucket_sort(nums: list[float]):
    """桶排序"""
    # 初始化 k = n/2 個桶，預期向每個桶分配 2 個元素
    k = len(nums) // 2
    buckets = [[] for _ in range(k)]
    # 1. 將陣列元素分配到各個桶中
    for num in nums:
        # 輸入資料範圍為 [0, 1)，使用 num * k 對映到索引範圍 [0, k-1]
        i = int(num * k)
        # 將 num 新增進桶 i
        buckets[i].append(num)
    # 2. 對各個桶執行排序
    for bucket in buckets:
        # 使用內建排序函式，也可以替換成其他排序演算法
        bucket.sort()
    # 3. 走訪桶合併結果
    i = 0
    for bucket in buckets:
        for num in bucket:
            nums[i] = num
            i += 1


if __name__ == "__main__":
    # 設輸入資料為浮點數，範圍為 [0, 1)
    nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37]
    bucket_sort(nums)
    print("桶排序完成後 nums =", nums)
