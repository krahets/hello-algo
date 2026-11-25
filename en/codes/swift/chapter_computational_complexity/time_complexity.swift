/**
 * File: time_complexity.swift
 * Created Time: 2022-12-26
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Constant time */
func constant(n: Int) -> Int {
    var count = 0
    let size = 100_000
    for _ in 0 ..< size {
        count += 1
    }
    return count
}

/* Linear time */
func linear(n: Int) -> Int {
    var count = 0
    for _ in 0 ..< n {
        count += 1
    }
    return count
}

/* Linear time (array traversal) */
func arrayTraversal(nums: [Int]) -> Int {
    var count = 0
    // The iteration count is proportional to the array length
    for _ in nums {
        count += 1
    }
    return count
}

/* Quadratic time */
func quadratic(n: Int) -> Int {
    var count = 0
    // The iteration count grows quadratically with input size n
    for _ in 0 ..< n {
        for _ in 0 ..< n {
            count += 1
        }
    }
    return count
}

/* Quadratic time (bubble sort) */
func bubbleSort(nums: inout [Int]) -> Int {
    var count = 0 // Counter
    // Outer loop: the unsorted range is the closed interval [0, i]
    for i in nums.indices.dropFirst().reversed() {
        // Inner loop: swap adjacent elements to move the largest in [0, i] to index i
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

/* Exponential time (iterative) */
func exponential(n: Int) -> Int {
    var count = 0
    var base = 1
    // Each cell divides in two per round, giving 1, 2, 4, 8, ..., 2^(n-1)
    for _ in 0 ..< n {
        for _ in 0 ..< base {
            count += 1
        }
        base *= 2
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count
}

/* Exponential time (recursive) */
func expRecur(n: Int) -> Int {
    if n == 1 {
        return 1
    }
    return expRecur(n: n - 1) + expRecur(n: n - 1) + 1
}

/* Logarithmic time (iterative) */
func logarithmic(n: Int) -> Int {
    var count = 0
    var n = n
    while n > 1 {
        n = n / 2
        count += 1
    }
    return count
}

/* Logarithmic time (recursive) */
func logRecur(n: Int) -> Int {
    if n <= 1 {
        return 0
    }
    return logRecur(n: n / 2) + 1
}

/* Linearithmic time */
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

/* Factorial time (recursive) */
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
    /* Driver Code */
    static func main() {
        // Try different values of n to see how the operation count grows for each complexity
        let n = 8
        print("Input size n = \(n)")

        var count = constant(n: n)
        print("Constant operation count = \(count)")

        count = linear(n: n)
        print("Linear operation count = \(count)")
        count = arrayTraversal(nums: Array(repeating: 0, count: n))
        print("Linear operation count (array traversal) = \(count)")

        count = quadratic(n: n)
        print("Quadratic operation count = \(count)")
        var nums = Array(stride(from: n, to: 0, by: -1)) // [n,n-1,...,2,1]
        count = bubbleSort(nums: &nums)
        print("Quadratic operation count (bubble sort) = \(count)")

        count = exponential(n: n)
        print("Exponential operation count (iterative) = \(count)")
        count = expRecur(n: n)
        print("Exponential operation count (recursive) = \(count)")

        count = logarithmic(n: n)
        print("Logarithmic operation count (iterative) = \(count)")
        count = logRecur(n: n)
        print("Logarithmic operation count (recursive) = \(count)")

        count = linearLogRecur(n: n)
        print("Linearithmic operation count (recursive) = \(count)")

        count = factorialRecur(n: n)
        print("Factorial operation count (recursive) = \(count)")
    }
}
