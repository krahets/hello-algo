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

/* Linear complexity (array traversal) */
fun arrayTraversal(nums: IntArray): Int {
    var count = 0
    // The number of iterations is proportional to the array length
    for (num in nums) {
        count++
    }
    return count
}

/* Quadratic complexity */
fun quadratic(n: Int): Int {
    var count = 0
    // The number of iterations is proportional to the square of the input size n
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
    // Outer loop: the unsorted range is [0, i]
    for (i in nums.size - 1 downTo 1) {
        // Inner loop: move the largest element in the unsorted range [0, i] to its right end through swaps
        for (j in 0..<i) {
            if (nums[j] > nums[j + 1]) {
                // Swap nums[j] and nums[j + 1]
                val temp = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = temp
                count += 3 // Swapping two elements takes 3 elementary operations
            }
        }
    }
    return count
}

/* Exponential complexity (iterative implementation) */
fun exponential(n: Int): Int {
    var count = 0
    var base = 1
    // Each cell divides into two per round, giving the sequence 1, 2, 4, 8, ..., 2^(n-1)
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

/* Logarithmic complexity (iterative implementation) */
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

/* Linearithmic complexity */
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
    // Split one problem into n subproblems
    for (i in 0..<n) {
        count += factorialRecur(n - 1)
    }
    return count
}

/* Driver code */
fun main() {
    // Try different values of n to see how the operation count grows for each complexity
    val n = 8
    println("Input size n = $n")

    var count = constant(n)
    println("Operation count for constant complexity = $count")

    count = linear(n)
    println("Operation count for linear complexity = $count")
    count = arrayTraversal(IntArray(n))
    println("Operation count for linear complexity (array traversal) = $count")

    count = quadratic(n)
    println("Operation count for quadratic complexity = $count")
    val nums = IntArray(n)
    for (i in 0..<n)
        nums[i] = n - i // [n,n-1,...,2,1]
    count = bubbleSort(nums)
    println("Operation count for quadratic complexity (bubble sort) = $count")

    count = exponential(n)
    println("Operation count for exponential complexity (iterative implementation) = $count")
    count = expRecur(n)
    println("Operation count for exponential complexity (recursive implementation) = $count")

    count = logarithmic(n)
    println("Operation count for logarithmic complexity (iterative implementation) = $count")
    count = logRecur(n)
    println("Operation count for logarithmic complexity (recursive implementation) = $count")

    count = linearLogRecur(n)
    println("Operation count for linearithmic complexity (recursive implementation) = $count")

    count = factorialRecur(n)
    println("Operation count for factorial complexity (recursive implementation) = $count")
}