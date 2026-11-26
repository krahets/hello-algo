/**
 * File: binary_search_recur.swift
 * Created Time: 2023-09-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 二分搜尋：問題 f(i, j) */
func dfs(nums: [Int], target: Int, i: Int, j: Int) -> Int {
    // 若區間為空，表示沒有目標元素，回傳 -1
    if i > j {
        return -1
    }
    // 計算中點索引 m
    let m = (i + j) / 2
    if nums[m] < target {
        // 遞迴求解子問題 f(m+1, j)
        return dfs(nums: nums, target: target, i: m + 1, j: j)
    } else if nums[m] > target {
        // 遞迴求解子問題 f(i, m-1)
        return dfs(nums: nums, target: target, i: i, j: m - 1)
    } else {
        // 找到目標元素，回傳其索引
        return m
    }
}

/* 二分搜尋 */
func binarySearch(nums: [Int], target: Int) -> Int {
    // 求解問題 f(0, n-1)
    dfs(nums: nums, target: target, i: nums.startIndex, j: nums.endIndex - 1)
}

@main
enum BinarySearchRecur {
    /* 主程式 */
    static func main() {
        let target = 6
        let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]

        // 二分搜尋（兩端皆含的閉區間）
        let index = binarySearch(nums: nums, target: target)
        print("目標元素 6 的索引 = \(index)")
    }
}
