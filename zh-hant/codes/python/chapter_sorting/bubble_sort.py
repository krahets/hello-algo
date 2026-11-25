"""
File: bubble_sort.py
Created Time: 2022-11-25
Author: timi (xisunyy@163.com)
"""


def bubble_sort(nums: list[int]):
    """氣泡排序"""
    n = len(nums)
    # 外層迴圈：尚未排序的區間為 [0, i]
    for i in range(n - 1, 0, -1):
        # 內層迴圈：逐次交換，將未排序區間 [0, i] 中的最大元素移到區間最右端
        for j in range(i):
            if nums[j] > nums[j + 1]:
                # 交換 nums[j] 與 nums[j + 1]
                nums[j], nums[j + 1] = nums[j + 1], nums[j]


def bubble_sort_with_flag(nums: list[int]):
    """氣泡排序（以旗標最佳化）"""
    n = len(nums)
    # 外層迴圈：尚未排序的區間為 [0, i]
    for i in range(n - 1, 0, -1):
        flag = False  # 初始化旗標
        # 內層迴圈：逐次交換，將未排序區間 [0, i] 中的最大元素移到區間最右端
        for j in range(i):
            if nums[j] > nums[j + 1]:
                # 交換 nums[j] 與 nums[j + 1]
                nums[j], nums[j + 1] = nums[j + 1], nums[j]
                flag = True  # 記錄本輪曾交換元素
        if not flag:
            break  # 這一輪「冒泡」未交換任何元素，直接跳出迴圈


"""Driver Code"""
if __name__ == "__main__":
    nums = [4, 1, 3, 1, 5, 2]
    bubble_sort(nums)
    print("氣泡排序完成後 nums =", nums)

    nums1 = [4, 1, 3, 1, 5, 2]
    bubble_sort_with_flag(nums1)
    print("氣泡排序完成後 nums =", nums1)
