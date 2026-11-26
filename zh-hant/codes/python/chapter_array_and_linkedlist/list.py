"""
File: list.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""

"""Driver Code"""
if __name__ == "__main__":
    # 初始化列表
    nums: list[int] = [1, 3, 2, 5, 4]
    print("\n列表 nums =", nums)

    # 存取元素
    x: int = nums[1]
    print("\n存取索引 1 處的元素，得到 x =", x)

    # 更新元素
    nums[1] = 0
    print("\n將索引 1 處的元素更新為 0，得到 nums =", nums)

    # 清空列表
    nums.clear()
    print("\n清空列表後，nums =", nums)

    # 在尾端加入元素
    nums.append(1)
    nums.append(3)
    nums.append(2)
    nums.append(5)
    nums.append(4)
    print("\n加入元素後，nums =", nums)

    # 在中間插入元素
    nums.insert(3, 6)
    print("\n在索引 3 處插入數字 6，得到 nums =", nums)

    # 刪除元素
    nums.pop(3)
    print("\n刪除索引 3 處的元素，得到 nums =", nums)

    # 依索引走訪列表
    count = 0
    for i in range(len(nums)):
        count += nums[i]
    # 直接走訪列表中的元素
    for num in nums:
        count += num

    # 串接兩個列表
    nums1 = [6, 8, 7, 10, 9]
    nums += nums1
    print("\n將列表 nums1 接在 nums 之後，得到 nums =", nums)

    # 排序列表
    nums.sort()
    print("\n列表排序後，nums =", nums)
