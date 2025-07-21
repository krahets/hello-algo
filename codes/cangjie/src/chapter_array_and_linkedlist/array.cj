/**
 * File: array.cj
 * Created Time: 2025-06-23
 * Author: jan_huber (jan_huber@163.com)
 */

package cangjie.chapter_array_and_linkedlist

import std.random.Random

/* 随机访问元素 */
func randomAccess(nums: Array<Int64>): Int64 {
    // 在区间 [0, nums.size) 中随机抽取一个数字
    let randomIndex = Int64(Random().nextUInt64() % UInt64(nums.size))
    // 获取并返回随机元素
    let randomNum = nums[randomIndex]
    return randomNum
}

/* 在数组的索引 index 处插入元素 num */
func insert(nums: Array<Int64>, num: Int64, index: Int64): Unit {
    // 把索引 index 以及之后的所有元素向后移动一位
    for (i in (nums.size - 1)..index : -1) {
        nums[i] = nums[i - 1]
    }
    // 将 num 赋给 index 处的元素
    nums[index] = num
}

/* 删除索引 index 处的元素 */
func remove(nums: Array<Int64>, index: Int64): Unit {
    // 把索引 index 之后的所有元素向前移动一位
    for (i in index..(nums.size - 1)) {
        nums[i] = nums[i + 1]
    }
}

/* 遍历数组 */
func traverse(nums: Array<Int64>): Unit {
    var count = 0
    // 通过索引遍历数组
    for (i in 0..nums.size) {
        count += nums[i]
    }
    // 直接遍历数组元素
    for (num in nums) {
        count += num
    }
}

/* 在数组中查找指定元素 */
func find(nums: Array<Int64>, target: Int64): Int64 {
    for (i in 0..nums.size) {
        if (nums[i] == target) {
            return i
        }
    }
    return -1
}

/* 扩展数组长度 */
func `extend`(nums: Array<Int64>, enlarge: Int64): Array<Int64> {
    // 初始化一个扩展长度后的数组
    let res = Array<Int64>(nums.size + enlarge, repeat: 0)
    // 将原数组中的所有元素复制到新数组
    for (i in 0..nums.size) {
        res[i] = nums[i]
    }
    // 返回扩展后的新数组
    return res
}
