/**
 * File: radix_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 要素 num の第 k 桁を取得する。exp = 10^(k-1) とする */
func digit(num: Int, exp: Int) -> Int {
    // k ではなく exp を渡すことで、ここで高コストのべき乗計算を繰り返すのを避ける
    (num / exp) % 10
}

/* カウントソート（nums の第 k 桁に基づくソート） */
func countingSortDigit(nums: inout [Int], exp: Int) {
    // 十進数の各桁の範囲は 0~9 なので、長さ 10 のバケット配列が必要
    var counter = Array(repeating: 0, count: 10)
    // 0~9 の各数字の出現回数を数える
    for i in nums.indices {
        let d = digit(num: nums[i], exp: exp) // nums[i] の第 k 桁を取得し、d とする
        counter[d] += 1 // 数字 d の出現回数を数える
    }
    // 累積和を求め、「出現回数」を「配列のインデックス」に変換する
    for i in 1 ..< 10 {
        counter[i] += counter[i - 1]
    }
    // 逆順に走査し、バケット内の集計結果に基づいて各要素を res に入れる
    var res = Array(repeating: 0, count: nums.count)
    for i in nums.indices.reversed() {
        let d = digit(num: nums[i], exp: exp)
        let j = counter[d] - 1 // 配列内での d のインデックス j を取得する
        res[j] = nums[i] // 現在の要素をインデックス j に入れる
        counter[d] -= 1 // d の個数を 1 減らす
    }
    // 結果で元の配列 nums を上書きする
    for i in nums.indices {
        nums[i] = res[i]
    }
}

/* 基数ソート */
func radixSort(nums: inout [Int]) {
    // 最大桁数を判定するため、配列の最大要素を取得する
    var m = Int.min
    for num in nums {
        if num > m {
            m = num
        }
    }
    // 下位の桁から上位の桁へ順に走査する
    for exp in sequence(first: 1, next: { m >= ($0 * 10) ? $0 * 10 : nil }) {
        // 配列の要素の第 k 桁に対してカウントソートを行う
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // つまり exp = 10^(k-1)
        countingSortDigit(nums: &nums, exp: exp)
    }
}

@main
enum RadixSort {
    /* 実行用コード */
    static func main() {
        // 基数ソート
        var nums = [
            10_546_151,
            35_663_510,
            42_865_989,
            34_862_445,
            81_883_077,
            88_906_420,
            72_429_244,
            30_524_779,
            82_060_337,
            63_832_996,
        ]
        radixSort(nums: &nums)
        print("基数ソート完了後 nums = \(nums)")
    }
}
