/**
 * File: worst_best_time_complexity.swift
 * Created Time: 2022-12-26
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 生成一個陣列，元素為 { 1, 2, ..., n }，順序被打亂 */
func randomNumbers(n: Int) -> [Int] {
    // 生成陣列 nums = { 1, 2, 3, ..., n }
    var nums = Array(1 ... n)
    // 隨機打亂陣列元素
    nums.shuffle()
    return nums
}

/* 查詢陣列 nums 中數字 1 所在索引 */
func findOne(nums: [Int]) -> Int {
    for i in nums.indices {
        // 當元素 1 在陣列頭部時，達到最佳時間複雜度 O(1)
        // 當元素 1 在陣列尾部時，達到最差時間複雜度 O(n)
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
            print("陣列 [ 1, 2, ..., n ] 被打亂後 = \(nums)")
            print("數字 1 的索引為 \(index)")
        }
    }
}
