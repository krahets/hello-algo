/**
 * File: worst_best_time_complexity.cj
 * Created Time: 2025-06-21
 * Author: jan_huber (jan_huber@163.com)
 */

package cangjie.chapter_computational_complexity

import std.random.Random
import std.math.abs

/* 生成一个数组，元素为 { 1, 2, ..., n }，顺序被打乱 */
func randomNumbers(n: Int64): Array<Int64> {
    // 生成数组 nums = { 1, 2, 3, ..., n }
    var nums = Array<Int64>(n, {i => i + 1})
    // 随机打乱数组元素
    for (i in (n - 1)..0 : -1) {
        var j = abs(Random().nextInt64()) % (i + 1)
        var temp = nums[i]
        nums[i] = nums[j]
        nums[j] = temp
    }
    return nums
}

/* 查找数组 nums 中数字 1 所在索引 */
func findOne(nums: Array<Int64>): Int64 {
    for (i in 0..nums.size) {
        // 当元素 1 在数组头部时，达到最佳时间复杂度 O(1)
        // 当元素 1 在数组尾部时，达到最差时间复杂度 O(n)
        if (nums[i] == 1) {
            return i
        }
    }
    return -1
}
