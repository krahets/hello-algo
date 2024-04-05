/**
 * File: two_sum.swift
 * Created Time: 2023-01-03
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 方法一：暴力列舉 */
func twoSumBruteForce(nums: [Int], target: Int) -> [Int] {
    // 兩層迴圈，時間複雜度為 O(n^2)
    for i in nums.indices.dropLast() {
        for j in nums.indices.dropFirst(i + 1) {
            if nums[i] + nums[j] == target {
                return [i, j]
            }
        }
    }
    return [0]
}

/* 方法二：輔助雜湊表 */
func twoSumHashTable(nums: [Int], target: Int) -> [Int] {
    // 輔助雜湊表，空間複雜度為 O(n)
    var dic: [Int: Int] = [:]
    // 單層迴圈，時間複雜度為 O(n)
    for i in nums.indices {
        if let j = dic[target - nums[i]] {
            return [j, i]
        }
        dic[nums[i]] = i
    }
    return [0]
}

@main
enum LeetcodeTwoSum {
    /* Driver Code */
    static func main() {
        // ======= Test Case =======
        let nums = [2, 7, 11, 15]
        let target = 13
        // ====== Driver Code ======
        // 方法一
        var res = twoSumBruteForce(nums: nums, target: target)
        print("方法一 res = \(res)")
        // 方法二
        res = twoSumHashTable(nums: nums, target: target)
        print("方法二 res = \(res)")
    }
}
