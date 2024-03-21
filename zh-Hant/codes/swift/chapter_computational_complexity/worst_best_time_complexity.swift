/**
 * File: worst_best_time_complexity.swift
 * Created Time: 2022-12-26
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 生成一个数组，元素为 { 1, 2, ..., n }，顺序被打乱 */
func randomNumbers(n: Int) -> [Int] {
    // 生成数组 nums = { 1, 2, 3, ..., n }
    var nums = Array(1 ... n)
    // 随机打乱数组元素
    nums.shuffle()
    return nums
}

/* 查找数组 nums 中数字 1 所在索引 */
func findOne(nums: [Int]) -> Int {
    for i in nums.indices {
        // 当元素 1 在数组头部时，达到最佳时间复杂度 O(1)
        // 当元素 1 在数组尾部时，达到最差时间复杂度 O(n)
        if nums[i] == 1 {
            return i
        }
    }
    return -1
}

@main
enum WorstBestTimeComplexity {
    /* Driver Code */
    static func main() {
        for _ in 0 ..< 10 {
            let n = 100
            let nums = randomNumbers(n: n)
            let index = findOne(nums: nums)
            print("数组 [ 1, 2, ..., n ] 被打乱后 = \(nums)")
            print("数字 1 的索引为 \(index)")
        }
    }
}
