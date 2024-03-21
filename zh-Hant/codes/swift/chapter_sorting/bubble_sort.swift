/**
 * File: bubble_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 泡沫排序 */
func bubbleSort(nums: inout [Int]) {
    // 外迴圈：未排序區間為 [0, i]
    for i in nums.indices.dropFirst().reversed() {
        // 內迴圈：將未排序區間 [0, i] 中的最大元素交換至該區間的最右端
        for j in 0 ..< i {
            if nums[j] > nums[j + 1] {
                // 交換 nums[j] 與 nums[j + 1]
                nums.swapAt(j, j + 1)
            }
        }
    }
}

/* 泡沫排序（標誌最佳化）*/
func bubbleSortWithFlag(nums: inout [Int]) {
    // 外迴圈：未排序區間為 [0, i]
    for i in nums.indices.dropFirst().reversed() {
        var flag = false // 初始化標誌位
        for j in 0 ..< i {
            if nums[j] > nums[j + 1] {
                // 交換 nums[j] 與 nums[j + 1]
                nums.swapAt(j, j + 1)
                flag = true // 記錄交換元素
            }
        }
        if !flag { // 此輪“冒泡”未交換任何元素，直接跳出
            break
        }
    }
}

@main
enum BubbleSort {
    /* Driver Code */
    static func main() {
        var nums = [4, 1, 3, 1, 5, 2]
        bubbleSort(nums: &nums)
        print("泡沫排序完成後 nums = \(nums)")

        var nums1 = [4, 1, 3, 1, 5, 2]
        bubbleSortWithFlag(nums: &nums1)
        print("泡沫排序完成後 nums1 = \(nums1)")
    }
}
