/**
 * File: worst_best_time_complexity.swift
 * Created Time: 2022-12-26
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 建立含有 { 1, 2, ..., n } 的陣列，並打亂順序 */
func randomNumbers(n: Int) -> [Int] {
    // 建立陣列 nums = { 1, 2, 3, ..., n }
    var nums = Array(1 ... n)
    // 隨機打亂陣列元素
    nums.shuffle()
    return nums
}

/* 在陣列 nums 中尋找數字 1 的索引 */
func findOne(nums: [Int]) -> Int {
    for i in nums.indices {
        // 若 1 在陣列開頭，最佳時間複雜度為 O(1)
        // 若 1 在陣列末端，最差時間複雜度為 O(n)
        if nums[i] == 1 {
            return i
        }
    }
    return -1
}

@main
enum WorstBestTimeComplexity {
    /* 主程式 */
    static func main() {
        for _ in 0 ..< 10 {
            let n = 100
            let nums = randomNumbers(n: n)
            let index = findOne(nums: nums)
            print("陣列 [ 1, 2, ..., n ] 打亂順序後 = \(nums)")
            print("數字 1 的索引為 \(index)")
        }
    }
}
