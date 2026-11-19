"""
File: list.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""

"""Driver Code"""
if __name__ == "__main__":
    # [region]{init_list}
    # 初始化串列
    # 無初始值
    empty_nums: list[int] = []
    # 有初始值
    nums: list[int] = [1, 3, 2, 5, 4]
    # [endregion]{init_list}
    print("\n串列 nums =", nums)
    print("\n串列 empty_nums =", empty_nums)

    # [region]{access_element}
    # 訪問元素
    x: int = nums[1]  # 訪問索引 1 處的元素
    # [endregion]{access_element}
    print("\n訪問索引 1 處的元素，得到 x =", x)

    # [region]{update_element}
    # 更新元素
    nums[1] = 0  # 將索引 1 處的元素更新為 0
    # [endregion]{update_element}
    print("\n將索引 1 處的元素更新為 0 ，得到 nums =", nums)

    # [region]{clear_list}
    # 清空串列
    nums.clear()
    # [endregion]{clear_list}
    print("\n清空串列後 nums =", nums)

    # [region]{append_element}
    # 在尾部新增元素
    nums.append(1)
    nums.append(3)
    nums.append(2)
    nums.append(5)
    nums.append(4)
    # [endregion]{append_element}
    print("\n新增元素後 nums =", nums)

    # [region]{insert_element}
    # 在中間插入元素
    nums.insert(3, 6)  # 在索引 3 處插入數字 6
    # [endregion]{insert_element}
    print("\n在索引 3 處插入數字 6 ，得到 nums =", nums)

    # [region]{remove_element}
    # 刪除元素
    nums.pop(3)  # 刪除索引 3 處的元素
    # [endregion]{remove_element}
    print("\n刪除索引 3 處的元素，得到 nums =", nums)

    # [region]{iterate_list}
    # 透過索引走訪串列
    count = 0
    for i in range(len(nums)):
        count += nums[i]

    # 直接走訪串列元素
    for num in nums:
        count += num
    # [endregion]{iterate_list}

    # [region]{concat_list}
    # 拼接兩個串列
    nums1 = [6, 8, 7, 10, 9]
    nums += nums1  # 將串列 nums1 拼接到 nums 之後
    # [endregion]{concat_list}
    print("\n將串列 nums1 拼接到 nums 之後，得到 nums =", nums)

    # [region]{sort_list}
    # 排序串列
    nums.sort()  # 排序後，串列元素從小到大排列
    # [endregion]{sort_list}
    print("\n排序串列後 nums =", nums)
