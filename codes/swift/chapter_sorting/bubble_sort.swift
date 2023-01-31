/**
 * File: bubble_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 冒泡排序 */
func bubbleSort(nums: inout [Int]) {
    // 外循环：待排序元素数量为 n-1, n-2, ..., 1
    for i in stride(from: nums.count - 1, to: 0, by: -1) {
        // 内循环：冒泡操作
        for j in stride(from: 0, to: i, by: 1) {
            if nums[j] > nums[j + 1] {
                // 交换 nums[j] 与 nums[j + 1]
                let tmp = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = tmp
            }
        }
    }
}

/* 冒泡排序（标志优化）*/
func bubbleSortWithFlag(nums: inout [Int]) {
    // 外循环：待排序元素数量为 n-1, n-2, ..., 1
    for i in stride(from: nums.count - 1, to: 0, by: -1) {
        var flag = false // 初始化标志位
        for j in stride(from: 0, to: i, by: 1) {
            if nums[j] > nums[j + 1] {
                // 交换 nums[j] 与 nums[j + 1]
                let tmp = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = tmp
                flag = true // 记录交换元素
            }
        }
        if !flag { // 此轮冒泡未交换任何元素，直接跳出
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
