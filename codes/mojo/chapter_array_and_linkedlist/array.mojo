"""
File: array.mojo
Created Time: 2024-03-15
Author: codingonion (coderonion@gmail.com)
"""

import random

fn print_array[size: Int](arr: StaticTuple[size, Int]):
    print_no_newline("[")
    for i in range(len(arr)):
        print_no_newline(arr[i])
        if i != len(arr) - 1:
            print_no_newline(", ")
    print("]")

fn random_access(nums: StaticIntTuple) -> Int:
    """随机访问元素."""
    # 在区间 [0, len(nums)-1] 中随机抽取一个数字
    random.seed()
    var random_index = random.random_si64(0, len(nums) - 1)
    # 获取并返回随机元素
    var random_num = nums[random_index]
    return random_num

fn extend[enlarge: Int](nums: StaticIntTuple) -> StaticIntTuple[enlarge] :
    """扩展数组长度."""
    # 初始化一个扩展长度后的数组
    var res = StaticIntTuple[enlarge]()
    # 将原数组中的所有元素复制到新数组
    for i in range(len(nums)):
        res[i] = nums[i]
    # 返回扩展后的新数组
    return res

fn insert(inout nums: StaticIntTuple, num: Int, index: Int):
    """在数组的索引 index 处插入元素 num."""
    # 把索引 index 以及之后的所有元素向后移动一位
    for i in range(len(nums) - 1, index, -1):
        nums[i] = nums[i - 1]
    # 将 num 赋给 index 处的元素
    nums[index] = num

fn remove(inout nums: StaticIntTuple, index: Int):
    """删除索引 index 处的元素."""
    # 把索引 index 之后的所有元素向前移动一位
    for i in range(index, len(nums) - 1):
        nums[i] = nums[i + 1]

fn traverse(nums: StaticIntTuple):
    """遍历数组."""
    var count = 0
    # 通过索引遍历数组
    for i in range(len(nums)):
        count += nums[i]

fn find(nums: StaticIntTuple, target: Int) -> Int:
    """在数组中查找指定元素."""
    for i in range(len(nums)):
        if nums[i] == target:
            return i
    return -1

"""Driver Code"""
fn main() raises:
    # 初始化数组
    alias arr = StaticIntTuple[5](0)
    print("数组 arr = ", arr)
    alias nums = StaticIntTuple[5](1, 3, 2, 5, 4)
    print("数组 nums =", nums)

    # 随机访问
    var random_num = random_access(nums)
    print("在 nums 中获取随机元素", random_num)

    # 长度扩展
    var nums_new = extend[len(nums)+3](nums)
    print("将数组长度扩展至 8 ，得到 nums =", nums_new)

    # 插入元素
    insert(nums_new, 6, 3)
    print("在索引 3 处插入数字 6 ，得到 nums =", nums_new)

    # 删除元素
    remove(nums_new, 2)
    print("删除索引 2 处的元素，得到 nums =", nums_new)

    # 遍历数组
    traverse(nums)

    # 查找元素
    var index = find(nums, 3)
    print("在 nums 中查找元素 3 ，得到索引 =", index)
