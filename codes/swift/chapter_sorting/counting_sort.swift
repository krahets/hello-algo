/**
 * File: counting_sort.swift
 * Created Time: 2023-03-22
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 计数排序 */
// 简单实现，无法用于排序对象
func countingSortNaive(nums: inout [Int]) {
    // 1. 统计数组最大元素 m
    let m = nums.max()!
    // 2. 统计各数字的出现次数
    // counter[num] 代表 num 的出现次数
    var counter = Array(repeating: 0, count: m + 1)
    for num in nums {
        counter[num] += 1
    }
    // 3. 遍历 counter ，将各元素填入原数组 nums
    var i = 0
    for num in 0 ..< m + 1 {
        for _ in 0 ..< counter[num] {
            nums[i] = num
            i += 1
        }
    }
}

/* 计数排序 */
// 完整实现，可排序对象，并且是稳定排序
func countingSort(nums: inout [Int]) {
    // 1. 统计数组最大元素 m
    let m = nums.max()!
    // 2. 统计各数字的出现次数
    // counter[num] 代表 num 的出现次数
    var counter = Array(repeating: 0, count: m + 1)
    for num in nums {
        counter[num] += 1
    }
    // 3. 求 counter 的前缀和，将“出现次数”转换为“尾索引”
    // 即 counter[num]-1 是 num 在 res 中最后一次出现的索引
    for i in 0 ..< m {
        counter[i + 1] += counter[i]
    }
    // 4. 倒序遍历 nums ，将各元素填入结果数组 res
    // 初始化数组 res 用于记录结果
    var res = Array(repeating: 0, count: nums.count)
    for i in nums.indices.reversed() {
        let num = nums[i]
        res[counter[num] - 1] = num // 将 num 放置到对应索引处
        counter[num] -= 1 // 令前缀和自减 1 ，得到下次放置 num 的索引
    }
    // 使用结果数组 res 覆盖原数组 nums
    for i in nums.indices {
        nums[i] = res[i]
    }
}

@main
enum CountingSort {
    /* Driver Code */
    static func main() {
        var nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]
        countingSortNaive(nums: &nums)
        print("计数排序（无法排序对象）完成后 nums = \(nums)")

        var nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]
        countingSort(nums: &nums1)
        print("计数排序完成后 nums1 = \(nums1)")
    }
}
