


def binary_search_rotation(nums: list[int]) -> int:
    """二分查找左边界（双闭区间）"""
    # 初始化双闭区间 [0, n-1] ，即 i, j 分别指向数组首元素、尾元素
    i, j = 0, len(nums) - 1
    while True:
        m = (i + j) // 2  # 计算中点索引 m
        if nums[m] < nums[j]:
            j = m  # 此情况说明 target 在区间 [m+1, j] 中
        elif nums[m] > nums[j]:
            i = m + 1  # 此情况说明 target 在区间 [i, m-1] 中
        else:
            return i  # 此情况说明 i == j == m ，找到旋转点


"""Driver Code"""
if __name__ == "__main__":
    nums: list[int] = [23, 67, 70, 92, 1, 3, 6, 8, 12, 15]

    # 二分查找左边界
    index_left = binary_search_rotation(nums)
    print("数组旋转点的索引 = ", index_left)
