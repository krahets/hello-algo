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

    # 访问元素
    x: int = nums[1]
    print("\n访问索引 1 处的元素，得到 x =", x)

    # 更新元素
    nums[1] = 0
    print("\n将索引 1 处的元素更新为 0 ，得到 nums =", nums)

    # 清空列表
    nums.clear()
    print("\n清空列表后 nums =", nums)

    # 在尾部添加元素
    nums.append(1)
    nums.append(3)
    nums.append(2)
    nums.append(5)
    nums.append(4)
    print("\n添加元素后 nums =", nums)

    # 在中间插入元素
    nums.insert(3, 6)
    print("\n在索引 3 处插入数字 6 ，得到 nums =", nums)

    # 删除元素
    nums.pop(3)
    print("\n删除索引 3 处的元素，得到 nums =", nums)

    # 通过索引遍历列表
    count = 0
    for i in range(len(nums)):
        count += nums[i]
    # 直接遍历列表元素
    for num in nums:
        count += num

    # 拼接两个列表
    nums1 = [6, 8, 7, 10, 9]
    nums += nums1
    print("\n将列表 nums1 拼接到 nums 之后，得到 nums =", nums)

    # 排序列表
    nums.sort()
    print("\n排序列表后 nums =", nums)
