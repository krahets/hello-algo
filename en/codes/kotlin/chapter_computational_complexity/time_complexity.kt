/**
 * File: time_complexity.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_computational_complexity.time_complexity

/* Constant time */
fun constant(n: Int): Int {
    var count = 0
    val size = 100000
    for (i in 0..<size)
        count++
    return count
}

/* Linear time */
fun linear(n: Int): Int {
    var count = 0
    for (i in 0..<n)
        count++
    return count
}

/* Linear time (array traversal) */
fun arrayTraversal(nums: IntArray): Int {
    var count = 0
    // The iteration count is proportional to the array length
    for (num in nums) {
        count++
    }
    return count
}

/* Quadratic time */
fun quadratic(n: Int): Int {
    var count = 0
    // The iteration count grows quadratically with input size n
    for (i in 0..<n) {
        for (j in 0..<n) {
            count++
        }
    }
    return count
}

/* Quadratic time (bubble sort) */
fun bubbleSort(nums: IntArray): Int {
    var count = 0 // Counter
    // Outer loop: the unsorted range is the closed interval [0, i]
    for (i in nums.size - 1 downTo 1) {
        // Inner loop: swap adjacent elements to move the largest in [0, i] to index i
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

/* Exponential time (iterative) */
fun exponential(n: Int): Int {
    var count = 0
    var base = 1
    // Each cell divides in two per round, giving 1, 2, 4, 8, ..., 2^(n-1)
    for (i in 0..<n) {
        for (j in 0..<base) {
            count++
        }
        base *= 2
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count
}

/* Exponential time (recursive) */
fun expRecur(n: Int): Int {
    if (n == 1) {
        return 1
    }
    return expRecur(n - 1) + expRecur(n - 1) + 1
}

/* Logarithmic time (iterative) */
fun logarithmic(n: Int): Int {
    var n1 = n
    var count = 0
    while (n1 > 1) {
        n1 /= 2
        count++
    }
    return count
}

/* Logarithmic time (recursive) */
fun logRecur(n: Int): Int {
    if (n <= 1)
        return 0
    return logRecur(n / 2) + 1
}

/* Linearithmic time */
fun linearLogRecur(n: Int): Int {
    if (n <= 1)
        return 1
    var count = linearLogRecur(n / 2) + linearLogRecur(n / 2)
    for (i in 0..<n) {
        count++
    }
    return count
}

/* Factorial time (recursive) */
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

/* Driver Code */
fun main() {
    // Try different values of n to see how the operation count grows for each complexity
    val n = 8
    println("Input size n = $n")

    var count = constant(n)
    println("Constant operation count = $count")

    count = linear(n)
    println("Linear operation count = $count")
    count = arrayTraversal(IntArray(n))
    println("Linear operation count (array traversal) = $count")

    count = quadratic(n)
    println("Quadratic operation count = $count")
    val nums = IntArray(n)
    for (i in 0..<n)
        nums[i] = n - i // [n,n-1,...,2,1]
    count = bubbleSort(nums)
    println("Quadratic operation count (bubble sort) = $count")

    count = exponential(n)
    println("Exponential operation count (iterative) = $count")
    count = expRecur(n)
    println("Exponential operation count (recursive) = $count")

    count = logarithmic(n)
    println("Logarithmic operation count (iterative) = $count")
    count = logRecur(n)
    println("Logarithmic operation count (recursive) = $count")

    count = linearLogRecur(n)
    println("Linearithmic operation count (recursive) = $count")

    count = factorialRecur(n)
    println("Factorial operation count (recursive) = $count")
}