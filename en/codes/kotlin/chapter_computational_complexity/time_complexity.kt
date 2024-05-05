/**
 * File: time_complexity.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_computational_complexity.time_complexity

/* Constant complexity */
fun constant(n: Int): Int {
    var count = 0
    val size = 100000
    for (i in 0..<size)
        count++
    return count
}

/* Linear complexity */
fun linear(n: Int): Int {
    var count = 0
    for (i in 0..<n)
        count++
    return count
}

/* Linear complexity (traversing an array) */
fun arrayTraversal(nums: IntArray): Int {
    var count = 0
    // Loop count is proportional to the length of the array
    for (num in nums) {
        count++
    }
    return count
}

/* Quadratic complexity */
fun quadratic(n: Int): Int {
    var count = 0
    // Loop count is squared in relation to the data size n
    for (i in 0..<n) {
        for (j in 0..<n) {
            count++
        }
    }
    return count
}

/* Quadratic complexity (bubble sort) */
fun bubbleSort(nums: IntArray): Int {
    var count = 0 // Counter
    // Outer loop: unsorted range is [0, i]
    for (i in nums.size - 1 downTo 1) {
        // Inner loop: swap the largest element in the unsorted range [0, i] to the right end of the range
        for (j in 0..<i) {
            if (nums[j] > nums[j + 1]) {
                // Swap nums[j] and nums[j + 1]
                val temp = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = temp
                count += 3 // Element swap includes 3 individual operations
            }
        }
    }
    return count
}

/* Exponential complexity (loop implementation) */
fun exponential(n: Int): Int {
    var count = 0
    var base = 1
    // Cells split into two every round, forming the sequence 1, 2, 4, 8, ..., 2^(n-1)
    for (i in 0..<n) {
        for (j in 0..<base) {
            count++
        }
        base *= 2
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count
}

/* Exponential complexity (recursive implementation) */
fun expRecur(n: Int): Int {
    if (n == 1) {
        return 1
    }
    return expRecur(n - 1) + expRecur(n - 1) + 1
}

/* Logarithmic complexity (loop implementation) */
fun logarithmic(n: Int): Int {
    var n1 = n
    var count = 0
    while (n1 > 1) {
        n1 /= 2
        count++
    }
    return count
}

/* Logarithmic complexity (recursive implementation) */
fun logRecur(n: Int): Int {
    if (n <= 1)
        return 0
    return logRecur(n / 2) + 1
}

/* Linear logarithmic complexity */
fun linearLogRecur(n: Int): Int {
    if (n <= 1)
        return 1
    var count = linearLogRecur(n / 2) + linearLogRecur(n / 2)
    for (i in 0..<n) {
        count++
    }
    return count
}

/* Factorial complexity (recursive implementation) */
fun factorialRecur(n: Int): Int {
    if (n == 0)
        return 1
    var count = 0
    // From 1 split into n
    for (i in 0..<n) {
        count += factorialRecur(n - 1)
    }
    return count
}

/* Driver Code */
fun main() {
    // Can modify n to experience the trend of operation count changes under various complexities
    val n = 8
    println("Input data size n = $n")

    var count = constant(n)
    println("Constant complexity operation count = $count")

    count = linear(n)
    println("Linear complexity operation count = $count")
    count = arrayTraversal(IntArray(n))
    println("Linear complexity (array traversal) operation count = $count")

    count = quadratic(n)
    println("Quadratic complexity operation count = $count")
    val nums = IntArray(n)
    for (i in 0..<n)
        nums[i] = n - i // [n,n-1,...,2,1]
    count = bubbleSort(nums)
    println("Quadratic complexity (bubble sort) operation count = $count")

    count = exponential(n)
    println("Exponential complexity (loop implementation) operation count = $count")
    count = expRecur(n)
    println("Exponential complexity (recursive implementation) operation count = $count")

    count = logarithmic(n)
    println("Logarithmic complexity (loop implementation) operation count = $count")
    count = logRecur(n)
    println("Logarithmic complexity (recursive implementation) operation count = $count")

    count = linearLogRecur(n)
    println("Linear logarithmic time (recursive implementation) operation count = $count")

    count = factorialRecur(n)
    println("Factorial complexity (recursive implementation) operation count = $count")
}