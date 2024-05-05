/**
 * File: two_sum.swift
 * Created Time: 2023-01-03
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Method one: Brute force enumeration */
func twoSumBruteForce(nums: [Int], target: Int) -> [Int] {
    // Two-layer loop, time complexity is O(n^2)
    for i in nums.indices.dropLast() {
        for j in nums.indices.dropFirst(i + 1) {
            if nums[i] + nums[j] == target {
                return [i, j]
            }
        }
    }
    return [0]
}

/* Method two: Auxiliary hash table */
func twoSumHashTable(nums: [Int], target: Int) -> [Int] {
    // Auxiliary hash table, space complexity is O(n)
    var dic: [Int: Int] = [:]
    // Single-layer loop, time complexity is O(n)
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
        // Method one
        var res = twoSumBruteForce(nums: nums, target: target)
        print("Method one res = \(res)")
        // Method two
        res = twoSumHashTable(nums: nums, target: target)
        print("Method two res = \(res)")
    }
}
