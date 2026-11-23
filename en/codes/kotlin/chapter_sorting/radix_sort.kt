/**
 * File: radix_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* Get the k-th digit of num, where exp = 10^(k-1) */
fun digit(num: Int, exp: Int): Int {
    // Passing exp instead of k avoids repeatedly performing expensive exponentiation here
    return (num / exp) % 10
}

/* Counting sort (sort nums by the k-th digit) */
fun countingSortDigit(nums: IntArray, exp: Int) {
    // Decimal digits range from 0 to 9, so the bucket array needs length 10
    val counter = IntArray(10)
    val n = nums.size
    // Count the occurrences of each digit from 0 to 9
    for (i in 0..<n) {
        val d = digit(nums[i], exp) // Get the k-th digit of nums[i] and store it in d
        counter[d]++                // Count the occurrences of digit d
    }
    // Compute prefix sums to convert occurrence counts into array positions
    for (i in 1..9) {
        counter[i] += counter[i - 1]
    }
    // Traverse in reverse and place each element into res according to the bucket counts
    val res = IntArray(n)
    for (i in n - 1 downTo 0) {
        val d = digit(nums[i], exp)
        val j = counter[d] - 1 // Get the destination index j for digit d in the array
        res[j] = nums[i]       // Place the current element at index j
        counter[d]--           // Decrease the count for d by 1
    }
    // Overwrite the original array nums with the result
    for (i in 0..<n)
        nums[i] = res[i]
}

/* Radix sort */
fun radixSort(nums: IntArray) {
    // Get the largest array element to determine the maximum number of digits
    var m = Int.MIN_VALUE
    for (num in nums) if (num > m) m = num
    var exp = 1
    // Process digits from least significant to most significant
    while (exp <= m) {
        // Apply counting sort to the k-th digit of the array elements
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // That is, exp = 10^(k-1)
        countingSortDigit(nums, exp)
        exp *= 10
    }
}

/* Driver code */
fun main() {
    // Radix sort
    val nums = intArrayOf(
        10546151, 35663510, 42865989, 34862445, 81883077,
        88906420, 72429244, 30524779, 82060337, 63832996
    )
    radixSort(nums)
    println("After radix sort: nums = ${nums.contentToString()}")
}