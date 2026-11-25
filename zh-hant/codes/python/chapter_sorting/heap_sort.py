"""
File: heap_sort.py
Created Time: 2023-05-24
Author: krahets (krahets@163.com)
"""


def sift_down(nums: list[int], n: int, i: int):
    """堆積的長度為 n，從節點 i 開始由上而下調整堆積"""
    while True:
        # 找出節點 i、l、r 中值最大的節點，記為 ma
        l = 2 * i + 1
        r = 2 * i + 2
        ma = i
        if l < n and nums[l] > nums[ma]:
            ma = l
        if r < n and nums[r] > nums[ma]:
            ma = r
        # 若節點 i 的值最大或索引 l、r 超出範圍，便無須繼續調整堆積，跳出迴圈
        if ma == i:
            break
        # 交換兩個節點
        nums[i], nums[ma] = nums[ma], nums[i]
        # 以迴圈繼續向下調整堆積
        i = ma


def heap_sort(nums: list[int]):
    """堆積排序"""
    # 建立堆積：對所有非葉節點執行堆積調整
    for i in range(len(nums) // 2 - 1, -1, -1):
        sift_down(nums, len(nums), i)
    # 從堆積中取出最大元素，重複 n-1 輪
    for i in range(len(nums) - 1, 0, -1):
        # 交換根節點與最右側的葉節點（即交換首尾元素）
        nums[0], nums[i] = nums[i], nums[0]
        # 從根節點開始，由上而下調整堆積
        sift_down(nums, i, 0)


"""Driver Code"""
if __name__ == "__main__":
    nums = [4, 1, 3, 1, 5, 2]
    heap_sort(nums)
    print("堆積排序完成後 nums =", nums)
