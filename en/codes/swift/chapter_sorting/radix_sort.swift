/**
 * File: radix_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Get the k-th digit of num, where exp = 10^(k-1) */
func digit(num: Int, exp: Int) -> Int {
    // Passing exp instead of k avoids repeatedly performing expensive exponentiation here
    (num / exp) % 10
}

/* Counting sort (sort nums by the k-th digit) */
func countingSortDigit(nums: inout [Int], exp: Int) {
    // Decimal digits range from 0 to 9, so the bucket array needs length 10
    var counter = Array(repeating: 0, count: 10)
    // Count the occurrences of each digit from 0 to 9
    for i in nums.indices {
        let d = digit(num: nums[i], exp: exp) // Get the k-th digit of nums[i] and store it in d
        counter[d] += 1 // Count the occurrences of digit d
    }
    // Compute prefix sums to convert occurrence counts into array positions
    for i in 1 ..< 10 {
        counter[i] += counter[i - 1]
    }
    // Traverse in reverse and place each element into res according to the bucket counts
    var res = Array(repeating: 0, count: nums.count)
    for i in nums.indices.reversed() {
        let d = digit(num: nums[i], exp: exp)
        let j = counter[d] - 1 // Get the destination index j for digit d in the array
        res[j] = nums[i] // Place the current element at index j
        counter[d] -= 1 // Decrease the count for d by 1
    }
    // Overwrite the original array nums with the result
    for i in nums.indices {
        nums[i] = res[i]
    }
}

/* Radix sort */
func radixSort(nums: inout [Int]) {
    // Get the largest array element to determine the maximum number of digits
    var m = Int.min
    for num in nums {
        if num > m {
            m = num
        }
    }
    // Process digits from least significant to most significant
    for exp in sequence(first: 1, next: { m >= ($0 * 10) ? $0 * 10 : nil }) {
        // Apply counting sort to the k-th digit of the array elements
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // That is, exp = 10^(k-1)
        countingSortDigit(nums: &nums, exp: exp)
    }
}

@main
enum RadixSort {
    /* Driver code */
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
