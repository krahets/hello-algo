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

    # [region]{access_element}
    # 访问元素
    x: int = nums[1]  # 访问索引 1 处的元素
    # [endregion]{access_element}
    print("\n访问索引 1 处的元素，得到 x =", x)

    # [region]{update_element}
    # 更新元素
    nums[1] = 0  # 将索引 1 处的元素更新为 0
    # [endregion]{update_element}
    print("\n将索引 1 处的元素更新为 0 ，得到 nums =", nums)

    # [region]{clear_list}
    # 清空列表
    nums.clear()
    # [endregion]{clear_list}
    print("\n清空列表后 nums =", nums)

    # [region]{append_element}
    # 在尾部添加元素
    nums.append(1)
    nums.append(3)
    nums.append(2)
    nums.append(5)
    nums.append(4)
    # [endregion]{append_element}
    print("\n添加元素后 nums =", nums)

    # [region]{insert_element}
    # 在中间插入元素
    nums.insert(3, 6)  # 在索引 3 处插入数字 6
    # [endregion]{insert_element}
    print("\n在索引 3 处插入数字 6 ，得到 nums =", nums)

    # [region]{remove_element}
    # 删除元素
    nums.pop(3)  # 删除索引 3 处的元素
    # [endregion]{remove_element}
    print("\n删除索引 3 处的元素，得到 nums =", nums)

    # [region]{iterate_list}
    # 通过索引遍历列表
    count = 0
    for i in range(len(nums)):
        count += nums[i]

    # 直接遍历列表元素
    for num in nums:
        count += num
    # [endregion]{iterate_list}

    # [region]{concat_list}
    # 拼接两个列表
    nums1 = [6, 8, 7, 10, 9]
    nums += nums1  # 将列表 nums1 拼接到 nums 之后
    # [endregion]{concat_list}
    print("\n将列表 nums1 拼接到 nums 之后，得到 nums =", nums)

    # [region]{sort_list}
    # 排序列表
    nums.sort()  # 排序后，列表元素从小到大排列
    # [endregion]{sort_list}
    print("\n排序列表后 nums =", nums)
