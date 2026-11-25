/**
 * File: radix_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Get digit k of num, where exp = 10^(k-1) */
func digit(num: Int, exp: Int) -> Int {
    // Passing exp instead of k avoids repeating the costly exponentiation here
    (num / exp) % 10
}

/* Counting sort by digit k of each element in nums */
func countingSortDigit(nums: inout [Int], exp: Int) {
    // Decimal digits range from 0 to 9, so the bucket array needs 10 entries
    var counter = Array(repeating: 0, count: 10)
    // Count the occurrences of digits 0 through 9
    for i in nums.indices {
        let d = digit(num: nums[i], exp: exp) // Let d be digit k of nums[i]
        counter[d] += 1 // Count this occurrence of digit d
    }
    // Compute prefix sums to convert counts into array positions
    for i in 1 ..< 10 {
        counter[i] += counter[i - 1]
    }
    // Traverse backward and use the bucket counts to place each element in res
    var res = Array(repeating: 0, count: nums.count)
    for i in nums.indices.reversed() {
        let d = digit(num: nums[i], exp: exp)
        let j = counter[d] - 1 // Get the array index j for d
        res[j] = nums[i] // Place the current element at index j
        counter[d] -= 1 // Decrement the count for d by 1
    }
    // Copy the result back into nums
    for i in nums.indices {
        nums[i] = res[i]
    }
}

/* Radix sort */
func radixSort(nums: inout [Int]) {
    // Find the largest element to determine the maximum number of digits
    var m = Int.min
    for num in nums {
        if num > m {
            m = num
        }
    }
    // Work from the least significant digit to the most significant
    for exp in sequence(first: 1, next: { m >= ($0 * 10) ? $0 * 10 : nil }) {
        // Apply counting sort to the array elements by digit k
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // Here exp = 10^(k-1)
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
