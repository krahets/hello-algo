/**
 * File: binary_search_insertion.swift
 * Created Time: 2023-08-06
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 二分搜尋插入點（無重複元素） */
func binarySearchInsertionSimple(nums: [Int], target: Int) -> Int {
    // 初始化雙閉區間 [0, n-1]
    var i = nums.startIndex
    var j = nums.endIndex - 1
    while i <= j {
        let m = i + (j - i) / 2 // 計算中點索引 m
        if nums[m] < target {
            i = m + 1 // target 在區間 [m+1, j] 中
        } else if nums[m] > target {
            j = m - 1 // target 在區間 [i, m-1] 中
        } else {
            return m // 找到 target ，返回插入點 m
        }
    }
    // 未找到 target ，返回插入點 i
    return i
}

/* 二分搜尋插入點（存在重複元素） */
public func binarySearchInsertion(nums: [Int], target: Int) -> Int {
    // 初始化雙閉區間 [0, n-1]
    var i = nums.startIndex
    var j = nums.endIndex - 1
    while i <= j {
        let m = i + (j - i) / 2 // 計算中點索引 m
        if nums[m] < target {
            i = m + 1 // target 在區間 [m+1, j] 中
        } else if nums[m] > target {
            j = m - 1 // target 在區間 [i, m-1] 中
        } else {
            j = m - 1 // 首個小於 target 的元素在區間 [i, m-1] 中
        }
    }
    // 返回插入點 i
    return i
}

#if !TARGET

@main
enum BinarySearchInsertion {
    /* Driver Code */
    static func main() {
        // 無重複元素的陣列
        var nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]
        print("\n陣列 nums = \(nums)")
        // 二分搜尋插入點
        for target in [6, 9] {
            let index = binarySearchInsertionSimple(nums: nums, target: target)
            print("元素 \(target) 的插入點的索引為 \(index)")
        }

        // 包含重複元素的陣列
        nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
        print("\n陣列 nums = \(nums)")
        // 二分搜尋插入點
        for target in [2, 6, 20] {
            let index = binarySearchInsertion(nums: nums, target: target)
            print("元素 \(target) 的插入點的索引為 \(index)")
        }
    }
}

#endif
