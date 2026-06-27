/**
 * File: counting_sort.swift
 * Created Time: 2023-03-22
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Counting sort */
// Simple implementation, cannot be used for sorting objects
func countingSortNaive(nums: inout [Int]) {
    // 1. Count the maximum element m in the array
    let m = nums.max()!
    // 2. Count the occurrence of each number
    // counter[num] represents the occurrence of num
    var counter = Array(repeating: 0, count: m + 1)
    for num in nums {
        counter[num] += 1
    }
    // 3. Traverse counter, filling each element back into the original array nums
    var i = 0
    for num in 0 ..< m + 1 {
        for _ in 0 ..< counter[num] {
            nums[i] = num
            i += 1
        }
    }
}

/* Counting sort */
// Complete implementation, can sort objects and is a stable sort
func countingSort(nums: inout [Int]) {
    // 1. Count the maximum element m in the array
    let m = nums.max()!
    // 2. Count the occurrence of each number
    // counter[num] represents the occurrence of num
    var counter = Array(repeating: 0, count: m + 1)
    for num in nums {
        counter[num] += 1
    }
    // 3. Calculate the prefix sum of counter, converting "occurrence count" to "tail index"
    // counter[num]-1 is the last index where num appears in res
    for i in 0 ..< m {
        counter[i + 1] += counter[i]
    }
    // 4. Traverse nums in reverse order, placing each element into the result array res
    // Initialize the array res to record results
    var res = Array(repeating: 0, count: nums.count)
    for i in nums.indices.reversed() {
        let num = nums[i]
        res[counter[num] - 1] = num // Place num at the corresponding index
        counter[num] -= 1 // Decrement the prefix sum by 1, getting the next index to place num
    }
    // Use result array res to overwrite the original array nums
    for i in nums.indices {
        nums[i] = res[i]
    }
}

@main
enum CountingSort {
    /* Driver Code */
    static func main() {
        var nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]
        countingSortNaive(nums: &nums)
        print("After counting sort (cannot sort objects), nums = \(nums)")

        var nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]
        countingSort(nums: &nums1)
        print("After counting sort, nums1 = \(nums1)")
    }
}
