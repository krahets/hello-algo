/**
 * File: binary_search_recur.swift
 * Created Time: 2023-09-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Binary search: problem f(i, j) */
func dfs(nums: [Int], target: Int, i: Int, j: Int) -> Int {
    // If the interval is empty, the target is absent; return -1
    if i > j {
        return -1
    }
    // Calculate the midpoint index m
    let m = (i + j) / 2
    if nums[m] < target {
        // Recurse on subproblem f(m+1, j)
        return dfs(nums: nums, target: target, i: m + 1, j: j)
    } else if nums[m] > target {
        // Recurse on subproblem f(i, m-1)
        return dfs(nums: nums, target: target, i: i, j: m - 1)
    } else {
        // The target element was found; return its index
        return m
    }
}

/* Binary search */
func binarySearch(nums: [Int], target: Int) -> Int {
    // Solve problem f(0, n-1)
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
        print("Index of target element 6 = \(index)")
    }
}
