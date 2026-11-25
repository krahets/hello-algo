/**
 * File: time_complexity.swift
 * Created Time: 2022-12-26
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 常數階 */
func constant(n: Int) -> Int {
    var count = 0
    let size = 100_000
    for _ in 0 ..< size {
        count += 1
    }
    return count
}

/* 線性階 */
func linear(n: Int) -> Int {
    var count = 0
    for _ in 0 ..< n {
        count += 1
    }
    return count
}

/* 線性階（走訪陣列） */
func arrayTraversal(nums: [Int]) -> Int {
    var count = 0
    // 迴圈次數與陣列長度成正比
    for _ in nums {
        count += 1
    }
    return count
}

/* 平方階 */
func quadratic(n: Int) -> Int {
    var count = 0
    // 迴圈次數正比於資料大小 n 的平方
    for _ in 0 ..< n {
        for _ in 0 ..< n {
            count += 1
        }
    }
    return count
}

/* 平方階（氣泡排序） */
func bubbleSort(nums: inout [Int]) -> Int {
    var count = 0 // 計數器
    // 外層迴圈：未排序區間為 [0, i]
    for i in nums.indices.dropFirst().reversed() {
        // 內層迴圈：藉由交換，將未排序區間 [0, i] 的最大元素移至最右端
        for j in 0 ..< i {
            if nums[j] > nums[j + 1] {
                // 交換 nums[j] 與 nums[j + 1]
                let tmp = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = tmp
                count += 3 // 交換元素需 3 個基本操作
            }
        }
    }
    return count
}

/* 指數階（迴圈實作） */
func exponential(n: Int) -> Int {
    var count = 0
    var base = 1
    // 細胞每輪一分為二，形成數列 1, 2, 4, 8, ..., 2^(n-1)
    for _ in 0 ..< n {
        for _ in 0 ..< base {
            count += 1
        }
        base *= 2
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count
}

/* 指數階（遞迴實作） */
func expRecur(n: Int) -> Int {
    if n == 1 {
        return 1
    }
    return expRecur(n: n - 1) + expRecur(n: n - 1) + 1
}

/* 對數階（迴圈實作） */
func logarithmic(n: Int) -> Int {
    var count = 0
    var n = n
    while n > 1 {
        n = n / 2
        count += 1
    }
    return count
}

/* 對數階（遞迴實作） */
func logRecur(n: Int) -> Int {
    if n <= 1 {
        return 0
    }
    return logRecur(n: n / 2) + 1
}

/* 線性對數階 */
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

/* 階乘階（遞迴實作） */
func factorialRecur(n: Int) -> Int {
    if n == 0 {
        return 1
    }
    var count = 0
    // 1 個呼叫分為 n 個
    for _ in 0 ..< n {
        count += factorialRecur(n: n - 1)
    }
    return count
}

@main
enum TimeComplexity {
    /* 主程式 */
    static func main() {
        // 試著修改 n 再執行，觀察各種複雜度的操作次數如何變化
        let n = 8
        print("輸入規模 n = \(n)")

        var count = constant(n: n)
        print("常數階的操作次數 = \(count)")

        count = linear(n: n)
        print("線性階的操作次數 = \(count)")
        count = arrayTraversal(nums: Array(repeating: 0, count: n))
        print("線性階（走訪陣列）的操作次數 = \(count)")

        count = quadratic(n: n)
        print("平方階的操作次數 = \(count)")
        var nums = Array(stride(from: n, to: 0, by: -1)) // [n,n-1,...,2,1]
        count = bubbleSort(nums: &nums)
        print("平方階（氣泡排序）的操作次數 = \(count)")

        count = exponential(n: n)
        print("指數階（迴圈實作）的操作次數 = \(count)")
        count = expRecur(n: n)
        print("指數階（遞迴實作）的操作次數 = \(count)")

        count = logarithmic(n: n)
        print("對數階（迴圈實作）的操作次數 = \(count)")
        count = logRecur(n: n)
        print("對數階（遞迴實作）的操作次數 = \(count)")

        count = linearLogRecur(n: n)
        print("線性對數階（遞迴實作）的操作次數 = \(count)")

        count = factorialRecur(n: n)
        print("階乘階（遞迴實作）的操作次數 = \(count)")
    }
}
