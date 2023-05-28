/**
 * File: binary_search_edge.swift
 * Created Time: 2023-05-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 二分查找最左一个元素 */
func binarySearchLeftEdge(nums: [Int], target: Int) -> Int {
    // 初始化双闭区间 [0, n-1]
    var i = 0
    var j = nums.count - 1
    while i <= j {
        let m = i + (j - 1) / 2 // 计算中点索引 m
        if nums[m] < target {
            i = m + 1 // target 在区间 [m+1, j] 中
        } else if nums[m] > target {
            j = m - 1 // target 在区间 [i, m-1] 中
        } else {
            j = m - 1 // 首个小于 target 的元素在区间 [i, m-1] 中
        }
    }
    if i == nums.count || nums[i] != target {
        return -1 // 未找到目标元素，返回 -1
    }
    return i
}

/* 二分查找最右一个元素 */
func binarySearchRightEdge(nums: [Int], target: Int) -> Int {
    // 初始化双闭区间 [0, n-1]
    var i = 0
    var j = nums.count - 1
    while i <= j {
        let m = i + (j - i) / 2 // 计算中点索引 m
        if nums[m] < target {
            i = m + 1 // target 在区间 [m+1, j] 中
        } else if nums[m] > target {
            j = m - 1 // target 在区间 [i, m-1] 中
        } else {
            i = m + 1 // 首个大于 target 的元素在区间 [m+1, j] 中
        }
    }
    if j < 0 || nums[j] != target {
        return -1 // 未找到目标元素，返回 -1
    }
    return j
}

@main
enum BinarySearchEdge {
    /* Driver Code */
    static func main() {
        let target = 6
        let nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]

        // 二分查找最左一个元素
        let indexLeft = binarySearchLeftEdge(nums: nums, target: target)
        print("数组中最左一个元素 6 的索引 = \(indexLeft)")

        // 二分查找最右一个元素
        let indexRight = binarySearchRightEdge(nums: nums, target: target)
        print("数组中最右一个元素 6 的索引 = \(indexRight)")
    }
}
