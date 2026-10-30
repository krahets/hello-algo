/**
 * File: two_sum.swift
 * Created Time: 2023-01-03
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Method 1: brute-force enumeration */
func twoSumBruteForce(nums: [Int], target: Int) -> [Int] {
    // Two nested loops give a time complexity of O(n^2)
    for i in nums.indices.dropLast() {
        for j in nums.indices.dropFirst(i + 1) {
            if nums[i] + nums[j] == target {
                return [i, j]
            }
        }
    }
    return [0]
}

/* Method 2: auxiliary hash table */
func twoSumHashTable(nums: [Int], target: Int) -> [Int] {
    // The auxiliary hash table uses O(n) space
    var dic: [Int: Int] = [:]
    // A single loop gives a time complexity of O(n)
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
    /* Driver code */
    static func main() {
        // ======= Test case =======
        let nums = [2, 7, 11, 15]
        let target = 13
        // ====== Driver code ======
        // Method 1
        var res = twoSumBruteForce(nums: nums, target: target)
        print("Method 1: res = \(res)")
        // Method 2
        res = twoSumHashTable(nums: nums, target: target)
        print("Method 2: res = \(res)")
    }
}
