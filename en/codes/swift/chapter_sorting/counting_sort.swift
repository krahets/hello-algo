/**
 * File: counting_sort.swift
 * Created Time: 2023-03-22
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Counting sort */
// Simple implementation; cannot be used to sort objects
func countingSortNaive(nums: inout [Int]) {
    // 1. Find the maximum array element m
    let m = nums.max()!
    // 2. Count the occurrences of each number
    // counter[num] is the number of occurrences of num
    var counter = Array(repeating: 0, count: m + 1)
    for num in nums {
        counter[num] += 1
    }
    // 3. Traverse counter and fill the original array nums with the elements
    var i = 0
    for num in 0 ..< m + 1 {
        for _ in 0 ..< counter[num] {
            nums[i] = num
            i += 1
        }
    }
}

/* Counting sort */
// Full implementation; stable and adaptable to sorting objects
func countingSort(nums: inout [Int]) {
    // 1. Find the maximum array element m
    let m = nums.max()!
    // 2. Count the occurrences of each number
    // counter[num] is the number of occurrences of num
    var counter = Array(repeating: 0, count: m + 1)
    for num in nums {
        counter[num] += 1
    }
    // 3. Compute prefix sums of counter to convert occurrence counts into end positions
    // That is, counter[num]-1 is the index of the last occurrence of num in res
    for i in 0 ..< m {
        counter[i + 1] += counter[i]
    }
    // 4. Traverse nums in reverse and place each element in the result array res
    // Initialize array res to store the result
    var res = Array(repeating: 0, count: nums.count)
    for i in nums.indices.reversed() {
        let num = nums[i]
        res[counter[num] - 1] = num // Place num at the corresponding index
        counter[num] -= 1 // Decrement the prefix sum by 1 to determine where to place the next occurrence of num
    }
    // Overwrite the original array nums with the result array res
    for i in nums.indices {
        nums[i] = res[i]
    }
}

@main
enum CountingSort {
    /* Driver code */
    static func main() {
        var nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]
        countingSortNaive(nums: &nums)
        print("After counting sort (cannot sort objects), nums = \(nums)")

        var nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]
        countingSort(nums: &nums1)
        print("After counting sort, nums1 = \(nums1)")
    }
}
