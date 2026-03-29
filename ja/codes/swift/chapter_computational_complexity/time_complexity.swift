/**
 * File: time_complexity.swift
 * Created Time: 2022-12-26
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 定数階 */
func constant(n: Int) -> Int {
    var count = 0
    let size = 100_000
    for _ in 0 ..< size {
        count += 1
    }
    return count
}

/* 線形階 */
func linear(n: Int) -> Int {
    var count = 0
    for _ in 0 ..< n {
        count += 1
    }
    return count
}

/* 線形時間（配列を走査） */
func arrayTraversal(nums: [Int]) -> Int {
    var count = 0
    // ループ回数は配列長に比例する
    for _ in nums {
        count += 1
    }
    return count
}

/* 二乗階 */
func quadratic(n: Int) -> Int {
    var count = 0
    // ループ回数はデータサイズ n の二乗に比例する
    for _ in 0 ..< n {
        for _ in 0 ..< n {
            count += 1
        }
    }
    return count
}

/* 二次時間（バブルソート） */
func bubbleSort(nums: inout [Int]) -> Int {
    var count = 0 // カウンタ
    // 外側のループ：未ソート区間は [0, i]
    for i in nums.indices.dropFirst().reversed() {
        // 内側のループ：未ソート区間 [0, i] の最大要素をその区間の最右端へ交換
        for j in 0 ..< i {
            if nums[j] > nums[j + 1] {
                // nums[j] と nums[j + 1] を交換
                let tmp = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = tmp
                count += 3 // 要素交換には 3 回の単位操作が含まれる
            }
        }
    }
    return count
}

/* 指数時間（ループ実装） */
func exponential(n: Int) -> Int {
    var count = 0
    var base = 1
    // 細胞は各ラウンドで 2 つに分裂し、数列 1, 2, 4, 8, ..., 2^(n-1) を形成する
    for _ in 0 ..< n {
        for _ in 0 ..< base {
            count += 1
        }
        base *= 2
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count
}

/* 指数時間（再帰実装） */
func expRecur(n: Int) -> Int {
    if n == 1 {
        return 1
    }
    return expRecur(n: n - 1) + expRecur(n: n - 1) + 1
}

/* 対数時間（ループ実装） */
func logarithmic(n: Int) -> Int {
    var count = 0
    var n = n
    while n > 1 {
        n = n / 2
        count += 1
    }
    return count
}

/* 対数時間（再帰実装） */
func logRecur(n: Int) -> Int {
    if n <= 1 {
        return 0
    }
    return logRecur(n: n / 2) + 1
}

/* 線形対数時間 */
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

/* 階乗時間（再帰実装） */
func factorialRecur(n: Int) -> Int {
    if n == 0 {
        return 1
    }
    var count = 0
    // 1個から n 個に分裂
    for _ in 0 ..< n {
        count += factorialRecur(n: n - 1)
    }
    return count
}

@main
enum TimeComplexity {
    /* Driver Code */
    static func main() {
        // n を変えて実行し、各計算量で操作回数がどう変化するかを確認できる
        let n = 8
        print("入力データサイズ n = \(n)")

        var count = constant(n: n)
        print("定数時間の操作回数 = \(count)")

        count = linear(n: n)
        print("線形時間の操作回数 = \(count)")
        count = arrayTraversal(nums: Array(repeating: 0, count: n))
        print("線形時間（配列の走査）の操作回数 = \(count)")

        count = quadratic(n: n)
        print("二乗時間の操作回数 = \(count)")
        var nums = Array(stride(from: n, to: 0, by: -1)) // [n,n-1,...,2,1]
        count = bubbleSort(nums: &nums)
        print("二乗時間（バブルソート）の操作回数 = \(count)")

        count = exponential(n: n)
        print("指数時間（ループ実装）の操作回数 = \(count)")
        count = expRecur(n: n)
        print("指数時間（再帰実装）の操作回数 = \(count)")

        count = logarithmic(n: n)
        print("対数時間（ループ実装）の操作回数 = \(count)")
        count = logRecur(n: n)
        print("対数時間（再帰実装）の操作回数 = \(count)")

        count = linearLogRecur(n: n)
        print("線形対数時間（再帰実装）の操作回数 = \(count)")

        count = factorialRecur(n: n)
        print("階乗時間（再帰実装）の操作回数 = \(count)")
    }
}
