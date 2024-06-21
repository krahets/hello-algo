/**
 * File: time_complexity.swift
 * Created Time: 2022-12-26
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 常数阶 */
func constant(n: Int) -> Int {
    var count = 0
    let size = 100_000
    for _ in 0 ..< size {
        count += 1
    }
    return count
}

/* 线性阶 */
func linear(n: Int) -> Int {
    var count = 0
    for _ in 0 ..< n {
        count += 1
    }
    return count
}

/* 线性阶（遍历数组） */
func arrayTraversal(nums: [Int]) -> Int {
    var count = 0
    // 循环次数与数组长度成正比
    for _ in nums {
        count += 1
    }
    return count
}

/* 平方阶 */
func quadratic(n: Int) -> Int {
    var count = 0
    // 循环次数与数据大小 n 成平方关系
    for _ in 0 ..< n {
        for _ in 0 ..< n {
            count += 1
        }
    }
    return count
}

/* 平方阶（冒泡排序） */
func bubbleSort(nums: inout [Int]) -> Int {
    var count = 0 // 计数器
    // 外循环：未排序区间为 [0, i]
    for i in nums.indices.dropFirst().reversed() {
        // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
        for j in 0 ..< i {
            if nums[j] > nums[j + 1] {
                // 交换 nums[j] 与 nums[j + 1]
                let tmp = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = tmp
                count += 3 // 元素交换包含 3 个单元操作
            }
        }
    }
    return count
}

/* 指数阶（循环实现） */
func exponential(n: Int) -> Int {
    var count = 0
    var base = 1
    // 细胞每轮一分为二，形成数列 1, 2, 4, 8, ..., 2^(n-1)
    for _ in 0 ..< n {
        for _ in 0 ..< base {
            count += 1
        }
        base *= 2
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count
}

/* 指数阶（递归实现） */
func expRecur(n: Int) -> Int {
    if n == 1 {
        return 1
    }
    return expRecur(n: n - 1) + expRecur(n: n - 1) + 1
}

/* 对数阶（循环实现） */
func logarithmic(n: Int) -> Int {
    var count = 0
    var n = n
    while n > 1 {
        n = n / 2
        count += 1
    }
    return count
}

/* 对数阶（递归实现） */
func logRecur(n: Int) -> Int {
    if n <= 1 {
        return 0
    }
    return logRecur(n: n / 2) + 1
}

/* 线性对数阶 */
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

/* 阶乘阶（递归实现） */
func factorialRecur(n: Int) -> Int {
    if n == 0 {
        return 1
    }
    var count = 0
    // 从 1 个分裂出 n 个
    for _ in 0 ..< n {
        count += factorialRecur(n: n - 1)
    }
    return count
}

@main
enum TimeComplexity {
    /* Driver Code */
    static func main() {
        // 可以修改 n 运行，体会一下各种复杂度的操作数量变化趋势
        let n = 8
        print("输入数据大小 n = \(n)")

        var count = constant(n: n)
        print("常数阶的操作数量 = \(count)")

        count = linear(n: n)
        print("线性阶的操作数量 = \(count)")
        count = arrayTraversal(nums: Array(repeating: 0, count: n))
        print("线性阶（遍历数组）的操作数量 = \(count)")

        count = quadratic(n: n)
        print("平方阶的操作数量 = \(count)")
        var nums = Array(stride(from: n, to: 0, by: -1)) // [n,n-1,...,2,1]
        count = bubbleSort(nums: &nums)
        print("平方阶（冒泡排序）的操作数量 = \(count)")

        count = exponential(n: n)
        print("指数阶（循环实现）的操作数量 = \(count)")
        count = expRecur(n: n)
        print("指数阶（递归实现）的操作数量 = \(count)")

        count = logarithmic(n: n)
        print("对数阶（循环实现）的操作数量 = \(count)")
        count = logRecur(n: n)
        print("对数阶（递归实现）的操作数量 = \(count)")

        count = linearLogRecur(n: n)
        print("线性对数阶（递归实现）的操作数量 = \(count)")

        count = factorialRecur(n: n)
        print("阶乘阶（递归实现）的操作数量 = \(count)")
    }
}
