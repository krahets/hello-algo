/**
 * File: worst_best_time_complexity.swift
 * Created Time: 2022-12-26
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 要素が { 1, 2, ..., n } で、順序をシャッフルした配列を生成する */
func randomNumbers(n: Int) -> [Int] {
    // 配列 nums = { 1, 2, 3, ..., n } を生成する
    var nums = Array(1 ... n)
    // 配列の要素をランダムに並べ替える
    nums.shuffle()
    return nums
}

/* 配列 nums 内で数値 1 のインデックスを探索する */
func findOne(nums: [Int]) -> Int {
    for i in nums.indices {
        // 要素 1 が配列の先頭にある場合、最良時間計算量 O(1) となる
        // 要素 1 が配列の末尾にある場合、最悪時間計算量 O(n) となる
        if nums[i] == 1 {
            return i
        }
    }
    return -1
}

@main
enum WorstBestTimeComplexity {
    /* 実行用コード */
    static func main() {
        for _ in 0 ..< 10 {
            let n = 100
            let nums = randomNumbers(n: n)
            let index = findOne(nums: nums)
            print("配列 [ 1, 2, ..., n ] をシャッフルした結果 = \(nums)")
            print("数値 1 のインデックスは \(index)")
        }
    }
}
