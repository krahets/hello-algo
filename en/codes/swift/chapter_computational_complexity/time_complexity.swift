/**
 * File: time_complexity.swift
 * Created Time: 2022-12-26
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Constant complexity */
func constant(n: Int) -> Int {
    var count = 0
    let size = 100_000
    for _ in 0 ..< size {
        count += 1
    }
    return count
}

/* Linear complexity */
func linear(n: Int) -> Int {
    var count = 0
    for _ in 0 ..< n {
        count += 1
    }
    return count
}

/* Linear complexity (array traversal) */
func arrayTraversal(nums: [Int]) -> Int {
    var count = 0
    // The number of iterations is proportional to the array length
    for _ in nums {
        count += 1
    }
    return count
}

/* Quadratic complexity */
func quadratic(n: Int) -> Int {
    var count = 0
    // The number of iterations is proportional to the square of the input size n
    for _ in 0 ..< n {
        for _ in 0 ..< n {
            count += 1
        }
    }
    return count
}

/* Quadratic complexity (bubble sort) */
func bubbleSort(nums: inout [Int]) -> Int {
    var count = 0 // Counter
    // Outer loop: the unsorted range is [0, i]
    for i in nums.indices.dropFirst().reversed() {
        // Inner loop: move the largest element in the unsorted range [0, i] to its right end through swaps
        for j in 0 ..< i {
            if nums[j] > nums[j + 1] {
                // Swap nums[j] and nums[j + 1]
                let tmp = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = tmp
                count += 3 // Swapping two elements takes 3 elementary operations
            }
        }
    }
    return count
}

/* Exponential complexity (iterative implementation) */
func exponential(n: Int) -> Int {
    var count = 0
    var base = 1
    // Each cell divides into two per round, giving the sequence 1, 2, 4, 8, ..., 2^(n-1)
    for _ in 0 ..< n {
        for _ in 0 ..< base {
            count += 1
        }
        base *= 2
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count
}

/* Exponential complexity (recursive implementation) */
func expRecur(n: Int) -> Int {
    if n == 1 {
        return 1
    }
    return expRecur(n: n - 1) + expRecur(n: n - 1) + 1
}

/* Logarithmic complexity (iterative implementation) */
func logarithmic(n: Int) -> Int {
    var count = 0
    var n = n
    while n > 1 {
        n = n / 2
        count += 1
    }
    return count
}

/* Logarithmic complexity (recursive implementation) */
func logRecur(n: Int) -> Int {
    if n <= 1 {
        return 0
    }
    return logRecur(n: n / 2) + 1
}

/* Linearithmic complexity */
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

/* Factorial complexity (recursive implementation) */
func factorialRecur(n: Int) -> Int {
    if n == 0 {
        return 1
    }
    var count = 0
    // Split one problem into n subproblems
    for _ in 0 ..< n {
        count += factorialRecur(n: n - 1)
    }
    return count
}

@main
enum TimeComplexity {
    /* Driver code */
    static func main() {
        // Try different values of n to see how the operation count grows for each complexity
        let n = 8
        print("Input size n = \(n)")

        var count = constant(n: n)
        print("Operation count for constant complexity = \(count)")

        count = linear(n: n)
        print("Operation count for linear complexity = \(count)")
        count = arrayTraversal(nums: Array(repeating: 0, count: n))
        print("Operation count for linear complexity (array traversal) = \(count)")

        count = quadratic(n: n)
        print("Operation count for quadratic complexity = \(count)")
        var nums = Array(stride(from: n, to: 0, by: -1)) // [n,n-1,...,2,1]
        count = bubbleSort(nums: &nums)
        print("Operation count for quadratic complexity (bubble sort) = \(count)")

        count = exponential(n: n)
        print("Operation count for exponential complexity (iterative implementation) = \(count)")
        count = expRecur(n: n)
        print("Operation count for exponential complexity (recursive implementation) = \(count)")

        count = logarithmic(n: n)
        print("Operation count for logarithmic complexity (iterative implementation) = \(count)")
        count = logRecur(n: n)
        print("Operation count for logarithmic complexity (recursive implementation) = \(count)")

        count = linearLogRecur(n: n)
        print("Operation count for linearithmic complexity (recursive implementation) = \(count)")

        count = factorialRecur(n: n)
        print("Operation count for factorial complexity (recursive implementation) = \(count)")
    }
}
