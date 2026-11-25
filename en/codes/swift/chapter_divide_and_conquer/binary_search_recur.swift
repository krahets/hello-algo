/**
 * File: binary_search_recur.swift
 * Created Time: 2023-09-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Binary search: problem f(i, j) */
func dfs(nums: [Int], target: Int, i: Int, j: Int) -> Int {
    // An empty interval contains no target, so return -1
    if i > j {
        return -1
    }
    // Compute the middle index m
    let m = (i + j) / 2
    if nums[m] < target {
        // Recursively solve f(m+1, j)
        return dfs(nums: nums, target: target, i: m + 1, j: j)
    } else if nums[m] > target {
        // Recursively solve f(i, m-1)
        return dfs(nums: nums, target: target, i: i, j: m - 1)
    } else {
        // Target found: return its index
        return m
    }
}

/* Binary search */
func binarySearch(nums: [Int], target: Int) -> Int {
    // Solve f(0, n-1)
    dfs(nums: nums, target: target, i: nums.startIndex, j: nums.endIndex - 1)
}

@main
enum BinarySearchRecur {
    /* Driver code */
    static func main() {
        let target = 6
        let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]

        // Binary search (closed interval)
        let index = binarySearch(nums: nums, target: target)
        print("Index of target 6 = \(index)")
    }
}
