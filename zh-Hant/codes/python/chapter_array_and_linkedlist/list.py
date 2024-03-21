"""
File: list.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""

"""Driver Code"""
if __name__ == "__main__":
    # 初始化串列
    nums: list[int] = [1, 3, 2, 5, 4]
    print("\n串列 nums =", nums)

    # 訪問元素
    x: int = nums[1]
    print("\n訪問索引 1 處的元素，得到 x =", x)

    # 更新元素
    nums[1] = 0
    print("\n將索引 1 處的元素更新為 0 ，得到 nums =", nums)

    # 清空串列
    nums.clear()
    print("\n清空串列後 nums =", nums)

    # 在尾部新增元素
    nums.append(1)
    nums.append(3)
    nums.append(2)
    nums.append(5)
    nums.append(4)
    print("\n新增元素後 nums =", nums)

    # 在中間插入元素
    nums.insert(3, 6)
    print("\n在索引 3 處插入數字 6 ，得到 nums =", nums)

    # 刪除元素
    nums.pop(3)
    print("\n刪除索引 3 處的元素，得到 nums =", nums)

    # 透過索引走訪串列
    count = 0
    for i in range(len(nums)):
        count += nums[i]
    # 直接走訪串列元素
    for num in nums:
        count += num

    # 拼接兩個串列
    nums1 = [6, 8, 7, 10, 9]
    nums += nums1
    print("\n將串列 nums1 拼接到 nums 之後，得到 nums =", nums)

    # 排序串列
    nums.sort()
    print("\n排序串列後 nums =", nums)
