/**
 * File: array.swift
 * Created Time: 2023-01-05
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 随机访问元素 */
func randomAccess(nums: [Int]) -> Int {
    // 在区间 [0, nums.count) 中随机抽取一个数字
    let randomIndex = nums.indices.randomElement()!
    // 获取并返回随机元素
    let randomNum = nums[randomIndex]
    return randomNum
}

/* 扩展数组长度 */
func extend(nums: [Int], enlarge: Int) -> [Int] {
    // 初始化一个扩展长度后的数组
    var res = Array(repeating: 0, count: nums.count + enlarge)
    // 将原数组中的所有元素复制到新数组
    for i in nums.indices {
        res[i] = nums[i]
    }
    // 返回扩展后的新数组
    return res
}

/* 在数组的索引 index 处插入元素 num */
func insert(nums: inout [Int], num: Int, index: Int) {
    // 把索引 index 以及之后的所有元素向后移动一位
    for i in nums.indices.dropFirst(index).reversed() {
        nums[i] = nums[i - 1]
    }
    // 将 num 赋给 index 处的元素
    nums[index] = num
}

/* 删除索引 index 处的元素 */
func remove(nums: inout [Int], index: Int) {
    // 把索引 index 之后的所有元素向前移动一位
    for i in nums.indices.dropFirst(index).dropLast() {
        nums[i] = nums[i + 1]
    }
}

/* 遍历数组 */
func traverse(nums: [Int]) {
    var count = 0
    // 通过索引遍历数组
    for i in nums.indices {
        count += nums[i]
    }
    // 直接遍历数组元素
    for num in nums {
        count += num
    }
    // 同时遍历数据索引和元素
    for (i, num) in nums.enumerated() {
        count += nums[i]
        count += num
    }
}

/* 在数组中查找指定元素 */
func find(nums: [Int], target: Int) -> Int {
    for i in nums.indices {
        if nums[i] == target {
            return i
        }
    }
    return -1
}

@main
enum _Array {
    /* Driver Code */
    static func main() {
        /* 初始化数组 */
        let arr = Array(repeating: 0, count: 5)
        print("数组 arr = \(arr)")
        var nums = [1, 3, 2, 5, 4]
        print("数组 nums = \(nums)")

        /* 随机访问 */
        let randomNum = randomAccess(nums: nums)
        print("在 nums 中获取随机元素 \(randomNum)")

        /* 长度扩展 */
        nums = extend(nums: nums, enlarge: 3)
        print("将数组长度扩展至 8 ，得到 nums = \(nums)")

        /* 插入元素 */
        insert(nums: &nums, num: 6, index: 3)
        print("在索引 3 处插入数字 6 ，得到 nums = \(nums)")

        /* 删除元素 */
        remove(nums: &nums, index: 2)
        print("删除索引 2 处的元素，得到 nums = \(nums)")

        /* 遍历数组 */
        traverse(nums: nums)

        /* 查找元素 */
        let index = find(nums: nums, target: 3)
        print("在 nums 中查找元素 3 ，得到索引 = \(index)")
    }
}
