/**
 * File: time_complexity.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_computational_complexity.time_complexity

/* Constant order */
fun constant(n: Int): Int {
    var count = 0
    val size = 100000
    for (i in 0..<size)
        count++
    return count
}

/* Linear order */
fun linear(n: Int): Int {
    var count = 0
    for (i in 0..<n)
        count++
    return count
}

/* Linear order (traversing array) */
fun arrayTraversal(nums: IntArray): Int {
    var count = 0
    // Number of iterations is proportional to the array length
    for (num in nums) {
        count++
    }
    return count
}

/* Exponential order */
fun quadratic(n: Int): Int {
    var count = 0
    // Number of iterations is quadratically related to the data size n
    for (i in 0..<n) {
        for (j in 0..<n) {
            count++
        }
    }
    return count
}

/* Quadratic order (bubble sort) */
fun bubbleSort(nums: IntArray): Int {
    var count = 0 // Counter
    // Outer loop: unsorted range is [0, i]
    for (i in nums.size - 1 downTo 1) {
        // Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
        for (j in 0..<i) {
            if (nums[j] > nums[j + 1]) {
                // Swap nums[j] and nums[j + 1]
                val temp = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = temp
                count += 3 // Element swap includes 3 unit operations
            }
        }
    }
    return count
}

/* Exponential order (loop implementation) */
fun exponential(n: Int): Int {
    var count = 0
    var base = 1
    // Cells divide into two every round, forming sequence 1, 2, 4, 8, ..., 2^(n-1)
    for (i in 0..<n) {
        for (j in 0..<base) {
            count++
        }
        base *= 2
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count
}

/* Exponential order (recursive implementation) */
fun expRecur(n: Int): Int {
    if (n == 1) {
        return 1
    }
    return expRecur(n - 1) + expRecur(n - 1) + 1
}

/* Logarithmic order (loop implementation) */
fun logarithmic(n: Int): Int {
    var n1 = n
    var count = 0
    while (n1 > 1) {
        n1 /= 2
        count++
    }
    return count
}

/* Logarithmic order (recursive implementation) */
fun logRecur(n: Int): Int {
    if (n <= 1)
        return 0
    return logRecur(n / 2) + 1
}

/* Linearithmic order */
fun linearLogRecur(n: Int): Int {
    if (n <= 1)
        return 1
    var count = linearLogRecur(n / 2) + linearLogRecur(n / 2)
    for (i in 0..<n) {
        count++
    }
    return count
}

/* Factorial order (recursive implementation) */
fun factorialRecur(n: Int): Int {
    if (n == 0)
        return 1
    var count = 0
    // Split from 1 into n
    for (i in 0..<n) {
        count += factorialRecur(n - 1)
    }
    return count
}

/* Driver Code */
fun main() {
    // You can modify n to run and observe the trend of the number of operations for various complexities
    val n = 8
    println("Input data size n = $n")

    var count = constant(n)
    println("Constant-time operations count = $count")

    count = linear(n)
    println("Linear-time operations count = $count")
    count = arrayTraversal(IntArray(n))
    println("Linear-time (array traversal) operations count = $count")

    count = quadratic(n)
    println("Quadratic-time operations count = $count")
    val nums = IntArray(n)
    for (i in 0..<n)
        nums[i] = n - i // [n,n-1,...,2,1]
    count = bubbleSort(nums)
    println("Quadratic-time (bubble sort) operations count = $count")

    count = exponential(n)
    println("Exponential-time (iterative) operations count = $count")
    count = expRecur(n)
    println("Exponential-time (recursive) operations count = $count")

    count = logarithmic(n)
    println("Logarithmic-time (iterative) operations count = $count")
    count = logRecur(n)
    println("Logarithmic-time (recursive) operations count = $count")

    count = linearLogRecur(n)
    println("Linearithmic-time (recursive) operations count = $count")

    count = factorialRecur(n)
    println("Factorial-time (recursive) operations count = $count")
}