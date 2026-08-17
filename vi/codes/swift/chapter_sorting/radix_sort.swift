/**
 * File: radix_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Get the k-th digit of element num, where exp = 10^(k-1) */
func digit(num: Int, exp: Int) -> Int {
    // Passing exp instead of k can avoid repeated expensive exponentiation here
    (num / exp) % 10
}

/* Counting sort (based on nums k-th digit) */
func countingSortDigit(nums: inout [Int], exp: Int) {
    // Decimal digit range is 0~9, therefore need a bucket array of length 10
    var counter = Array(repeating: 0, count: 10)
    // Count the occurrence of digits 0~9
    for i in nums.indices {
        let d = digit(num: nums[i], exp: exp) // Get the k-th digit of nums[i], noted as d
        counter[d] += 1 // Count the occurrence of digit d
    }
    // Calculate prefix sum, converting "occurrence count" into "array index"
    for i in 1 ..< 10 {
        counter[i] += counter[i - 1]
    }
    // Traverse in reverse, based on bucket statistics, place each element into res
    var res = Array(repeating: 0, count: nums.count)
    for i in nums.indices.reversed() {
        let d = digit(num: nums[i], exp: exp)
        let j = counter[d] - 1 // Get the index j for d in the array
        res[j] = nums[i] // Place the current element at index j
        counter[d] -= 1 // Decrease the count of d by 1
    }
    // Use result to overwrite the original array nums
    for i in nums.indices {
        nums[i] = res[i]
    }
}

/* Radix sort */
func radixSort(nums: inout [Int]) {
    // Get the maximum element of the array, used to determine the maximum number of digits
    var m = Int.min
    for num in nums {
        if num > m {
            m = num
        }
    }
    // Traverse from the lowest to the highest digit
    for exp in sequence(first: 1, next: { m >= ($0 * 10) ? $0 * 10 : nil }) {
        // Perform counting sort on the k-th digit of array elements
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // i.e., exp = 10^(k-1)
        countingSortDigit(nums: &nums, exp: exp)
    }
}

@main
enum RadixSort {
    /* Driver Code */
    static func main() {
        // Radix sort
        var nums = [
            10_546_151,
            35_663_510,
            42_865_989,
            34_862_445,
            81_883_077,
            88_906_420,
            72_429_244,
            30_524_779,
            82_060_337,
            63_832_996,
        ]
        radixSort(nums: &nums)
        print("After radix sort, nums = \(nums)")
    }
}
