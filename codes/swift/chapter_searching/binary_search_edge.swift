/**
 * File: binary_search_edge.swift
 * Created Time: 2023-08-06
 * Author: nuomi1 (nuomi1@qq.com)
 */

import binary_search_insertion_target

/* 二分查找最左一个 target */
func binarySearchLeftEdge(nums: [Int], target: Int) -> Int {
    // 等价于查找 target 的插入点
    let i = binarySearchInsertion(nums: nums, target: target)
    // 未找到 target ，返回 -1
    if i == nums.endIndex || nums[i] != target {
        return -1
    }
    // 找到 target ，返回索引 i
    return i
}

/* 二分查找最右一个 target */
func binarySearchRightEdge(nums: [Int], target: Int) -> Int {
    // 转化为查找最左一个 target + 1
    let i = binarySearchInsertion(nums: nums, target: target + 1)
    // j 指向最右一个 target ，i 指向首个大于 target 的元素
    let j = i - 1
    // 未找到 target ，返回 -1
    if j == -1 || nums[j] != target {
        return -1
    }
    // 找到 target ，返回索引 j
    return j
}

@main
enum BinarySearchEdge {
    /* Driver Code */
    static func main() {
        // 包含重复元素的数组
        let nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
        print("\n数组 nums = \(nums)")

        // 二分查找左边界和右边界
        for target in [6, 7] {
            var index = binarySearchLeftEdge(nums: nums, target: target)
            print("最左一个元素 \(target) 的索引为 \(index)")
            index = binarySearchRightEdge(nums: nums, target: target)
            print("最右一个元素 \(target) 的索引为 \(index)")
        }
    }
}
