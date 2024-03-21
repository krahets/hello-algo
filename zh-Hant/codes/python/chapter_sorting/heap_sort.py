"""
File: heap_sort.py
Created Time: 2023-05-24
Author: krahets (krahets@163.com)
"""


def sift_down(nums: list[int], n: int, i: int):
    """堆積的長度為 n ，從節點 i 開始，從頂至底堆積化"""
    while True:
        # 判斷節點 i, l, r 中值最大的節點，記為 ma
        l = 2 * i + 1
        r = 2 * i + 2
        ma = i
        if l < n and nums[l] > nums[ma]:
            ma = l
        if r < n and nums[r] > nums[ma]:
            ma = r
        # 若節點 i 最大或索引 l, r 越界，則無須繼續堆積化，跳出
        if ma == i:
            break
        # 交換兩節點
        nums[i], nums[ma] = nums[ma], nums[i]
        # 迴圈向下堆積化
        i = ma


def heap_sort(nums: list[int]):
    """堆積排序"""
    # 建堆積操作：堆積化除葉節點以外的其他所有節點
    for i in range(len(nums) // 2 - 1, -1, -1):
        sift_down(nums, len(nums), i)
    # 從堆積中提取最大元素，迴圈 n-1 輪
    for i in range(len(nums) - 1, 0, -1):
        # 交換根節點與最右葉節點（交換首元素與尾元素）
        nums[0], nums[i] = nums[i], nums[0]
        # 以根節點為起點，從頂至底進行堆積化
        sift_down(nums, i, 0)


"""Driver Code"""
if __name__ == "__main__":
    nums = [4, 1, 3, 1, 5, 2]
    heap_sort(nums)
    print("堆積排序完成後 nums =", nums)
