/**
 * File: bubble_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 冒泡排序 */
func bubbleSort(nums: inout [Int]) {
    // 外循环：未排序区间为 [0, i]
    for i in nums.indices.dropFirst().reversed() {
        // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
        for j in 0 ..< i {
            if nums[j] > nums[j + 1] {
                // 交换 nums[j] 与 nums[j + 1]
                nums.swapAt(j, j + 1)
            }
        }
    }
}

/* 冒泡排序（标志优化）*/
func bubbleSortWithFlag(nums: inout [Int]) {
    // 外循环：未排序区间为 [0, i]
    for i in nums.indices.dropFirst().reversed() {
        var flag = false // 初始化标志位
        for j in 0 ..< i {
            if nums[j] > nums[j + 1] {
                // 交换 nums[j] 与 nums[j + 1]
                nums.swapAt(j, j + 1)
                flag = true // 记录交换元素
            }
        }
        if !flag { // 此轮“冒泡”未交换任何元素，直接跳出
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
        print("冒泡排序完成后 nums = \(nums)")

        var nums1 = [4, 1, 3, 1, 5, 2]
        bubbleSortWithFlag(nums: &nums1)
        print("冒泡排序完成后 nums1 = \(nums1)")
    }
}
