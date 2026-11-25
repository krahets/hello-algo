/**
 * File: counting_sort.swift
 * Created Time: 2023-03-22
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Counting sort */
// Simple implementation that cannot sort objects
func countingSortNaive(nums: inout [Int]) {
    // 1. Find the largest array element m
    let m = nums.max()!
    // 2. Count the occurrences of each number
    // counter[num] holds the number of occurrences of num
    var counter = Array(repeating: 0, count: m + 1)
    for num in nums {
        counter[num] += 1
    }
    // 3. Traverse counter and write each value back into nums
    var i = 0
    for num in 0 ..< m + 1 {
        for _ in 0 ..< counter[num] {
            nums[i] = num
            i += 1
        }
    }
}

/* Counting sort */
// Full implementation that can sort objects and is stable
func countingSort(nums: inout [Int]) {
    // 1. Find the largest array element m
    let m = nums.max()!
    // 2. Count the occurrences of each number
    // counter[num] holds the number of occurrences of num
    var counter = Array(repeating: 0, count: m + 1)
    for num in nums {
        counter[num] += 1
    }
    // 3. Compute prefix sums in counter to locate the last position for each value
    // That is, counter[num]-1 is the last index of num in res
    for i in 0 ..< m {
        counter[i + 1] += counter[i]
    }
    // 4. Traverse nums backward and place each element in the result array res
    // Initialize the result array res
    var res = Array(repeating: 0, count: nums.count)
    for i in nums.indices.reversed() {
        let num = nums[i]
        res[counter[num] - 1] = num // Place num at its corresponding index
        counter[num] -= 1 // Decrement the prefix sum by 1 to find the next index for num
    }
    // Copy res back into the original array nums
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
        print("After counting sort (values only), nums = \(nums)")

        var nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]
        countingSort(nums: &nums1)
        print("After counting sort, nums1 = \(nums1)")
    }
}
