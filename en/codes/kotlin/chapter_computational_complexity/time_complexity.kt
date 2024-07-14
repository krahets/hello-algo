/**
 * File: time_complexity.kt
 * Created Time: 2024-07-14
 * Author: eyedol
 */
package chapter_computational_complexity.time_complexity

/* Constant complexity */
fun constant(n: Int): Int {
    var count = 0
    val size = 100000
    for (i in 0 until size) count++
    return count
}

/* Linear complexity */
fun linear(n: Int): Int {
    var count = 0
    for (i in 0 until n) count++
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
    for (i in 0 until n) {
        for (j in 0 until n) {
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
        for (j in 0 until i) {
            if (nums[j] > nums[j + 1]) {
                // Swap nums[j] and nums[j + 1]
                val tmp = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = tmp
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
    for (i in 0 until n) {
        for (j in 0 until base) {
            count++
        }
        base *= 2
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count
}

/* Exponential complexity (recursive implementation) */
fun expRecur(n: Int): Int {
    if (n == 1) return 1
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
    if (n <= 1) return 0
    return logRecur(n / 2) + 1
}

/* Linear logarithmic complexity */
fun linearLogRecur(n: Int): Int {
    if (n <= 1) return 1
    var count = linearLogRecur(n / 2) + linearLogRecur(n / 2)
    for (i in 0 until n) {
        count++
    }
    return count
}

/* Factorial complexity (recursive implementation) */
fun factorialRecur(n: Int): Int {
    if (n == 0) return 1
    var count = 0
    // From 1 split into n
    for (i in 0 until n) {
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
    println("Number of constant complexity operations = $count")

    count = linear(n)
    println("Number of linear complexity operations = $count")
    count = arrayTraversal(IntArray(n))
    println("Number of linear complexity operations (traversing the array) = $count")

    count = quadratic(n)
    println("Number of quadratic order operations = $count")
    val nums = IntArray(n)
    for (i in 0 until n) nums[i] = n - i // [n,n-1,...,2,1]

    count = bubbleSort(nums)
    println("Number of quadratic order operations (bubble sort) = $count")

    count = exponential(n)
    println("Number of exponential complexity operations (implemented by loop) = $count")
    count = expRecur(n)
    println("Number of exponential complexity operations (implemented by recursion) = $count")

    count = logarithmic(n)
    println("Number of logarithmic complexity operations (implemented by loop) = $count")
    count = logRecur(n)
    println("Number of logarithmic complexity operations (implemented by recursion) = $count")

    count = linearLogRecur(n)
    println("Number of linear logarithmic complexity operations (implemented by recursion) = $count")

    count = factorialRecur(n)
    println("Number of factorial complexity operations (implemented by recursion) = $count")
}