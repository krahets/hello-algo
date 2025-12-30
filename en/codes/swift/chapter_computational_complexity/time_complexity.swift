/**
 * File: time_complexity.swift
 * Created Time: 2022-12-26
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Constant order */
func constant(n: Int) -> Int {
    var count = 0
    let size = 100_000
    for _ in 0 ..< size {
        count += 1
    }
    return count
}

/* Linear order */
func linear(n: Int) -> Int {
    var count = 0
    for _ in 0 ..< n {
        count += 1
    }
    return count
}

/* Linear order (traversing array) */
func arrayTraversal(nums: [Int]) -> Int {
    var count = 0
    // Number of iterations is proportional to the array length
    for _ in nums {
        count += 1
    }
    return count
}

/* Exponential order */
func quadratic(n: Int) -> Int {
    var count = 0
    // Number of iterations is quadratically related to the data size n
    for _ in 0 ..< n {
        for _ in 0 ..< n {
            count += 1
        }
    }
    return count
}

/* Quadratic order (bubble sort) */
func bubbleSort(nums: inout [Int]) -> Int {
    var count = 0 // Counter
    // Outer loop: unsorted range is [0, i]
    for i in nums.indices.dropFirst().reversed() {
        // Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
        for j in 0 ..< i {
            if nums[j] > nums[j + 1] {
                // Swap nums[j] and nums[j + 1]
                let tmp = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = tmp
                count += 3 // Element swap includes 3 unit operations
            }
        }
    }
    return count
}

/* Exponential order (loop implementation) */
func exponential(n: Int) -> Int {
    var count = 0
    var base = 1
    // Cells divide into two every round, forming sequence 1, 2, 4, 8, ..., 2^(n-1)
    for _ in 0 ..< n {
        for _ in 0 ..< base {
            count += 1
        }
        base *= 2
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count
}

/* Exponential order (recursive implementation) */
func expRecur(n: Int) -> Int {
    if n == 1 {
        return 1
    }
    return expRecur(n: n - 1) + expRecur(n: n - 1) + 1
}

/* Logarithmic order (loop implementation) */
func logarithmic(n: Int) -> Int {
    var count = 0
    var n = n
    while n > 1 {
        n = n / 2
        count += 1
    }
    return count
}

/* Logarithmic order (recursive implementation) */
func logRecur(n: Int) -> Int {
    if n <= 1 {
        return 0
    }
    return logRecur(n: n / 2) + 1
}

/* Linearithmic order */
func linearLogRecur(n: Int) -> Int {
    if n <= 1 {
        return 1
    }
    var count = linearLogRecur(n: n / 2) + linearLogRecur(n: n / 2)
    for _ in stride(from: 0, to: n, by: 1) {
        count += 1
    }
    return count
}

/* Factorial order (recursive implementation) */
func factorialRecur(n: Int) -> Int {
    if n == 0 {
        return 1
    }
    var count = 0
    // Split from 1 into n
    for _ in 0 ..< n {
        count += factorialRecur(n: n - 1)
    }
    return count
}

@main
enum TimeComplexity {
    /* Driver Code */
    static func main() {
        // You can modify n to run and observe the trend of the number of operations for various complexities
        let n = 8
        print("Input data size n = \(n)")

        var count = constant(n: n)
        print("Constant-time operations count = \(count)")

        count = linear(n: n)
        print("Linear-time operations count = \(count)")
        count = arrayTraversal(nums: Array(repeating: 0, count: n))
        print("Linear-time (array traversal) operations count = \(count)")

        count = quadratic(n: n)
        print("Quadratic-time operations count = \(count)")
        var nums = Array(stride(from: n, to: 0, by: -1)) // [n,n-1,...,2,1]
        count = bubbleSort(nums: &nums)
        print("Quadratic-time (bubble sort) operations count = \(count)")

        count = exponential(n: n)
        print("Exponential-time (iterative) operations count = \(count)")
        count = expRecur(n: n)
        print("Exponential-time (recursive) operations count = \(count)")

        count = logarithmic(n: n)
        print("Logarithmic-time (iterative) operations count = \(count)")
        count = logRecur(n: n)
        print("Logarithmic-time (recursive) operations count = \(count)")

        count = linearLogRecur(n: n)
        print("Linearithmic-time (recursive) operations count = \(count)")

        count = factorialRecur(n: n)
        print("Factorial-time (recursive) operations count = \(count)")
    }
}
