/**
 * File: binary_search_edge.swift
 * Created Time: 2023-08-06
 * Author: nuomi1 (nuomi1@qq.com)
 */

import binary_search_insertion_target

/* 用二分搜尋找最左邊的 target */
func binarySearchLeftEdge(nums: [Int], target: Int) -> Int {
    // 等同於搜尋 target 的插入點
    let i = binarySearchInsertion(nums: nums, target: target)
    // 找不到 target，回傳 -1
    if i == nums.endIndex || nums[i] != target {
        return -1
    }
    // 找到 target，回傳索引 i
    return i
}

/* 用二分搜尋找最右邊的 target */
func binarySearchRightEdge(nums: [Int], target: Int) -> Int {
    // 改為搜尋 target + 1 的最左插入位置
    let i = binarySearchInsertion(nums: nums, target: target + 1)
    // j 指向最右邊的 target，i 指向第一個大於 target 的元素
    let j = i - 1
    // 找不到 target，回傳 -1
    if j == -1 || nums[j] != target {
        return -1
    }
    // 找到 target，回傳索引 j
    return j
}

@main
enum BinarySearchEdge {
    /* 主程式 */
    static func main() {
        // 含有重複元素的陣列
        let nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
        print("\n陣列 nums = \(nums)")

        // 用二分搜尋找左界和右界
        for target in [6, 7] {
            var index = binarySearchLeftEdge(nums: nums, target: target)
            print("最左邊的元素 \(target) 的索引為 \(index)")
            index = binarySearchRightEdge(nums: nums, target: target)
            print("最右邊的元素 \(target) 的索引為 \(index)")
        }
    }
}
