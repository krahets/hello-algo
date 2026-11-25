/**
 * File: radix_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 要素 num の下から k 桁目を取得。ここで exp = 10^(k-1) */
func digit(num: Int, exp: Int) -> Int {
    // k ではなく exp を渡し、負荷の高いべき乗計算の繰り返しを避ける
    (num / exp) % 10
}

/* カウントソート（nums の下から k 桁目でソート） */
func countingSortDigit(nums: inout [Int], exp: Int) {
    // 十進数の各桁は 0～9 なので、長さ 10 のバケット配列を用意
    var counter = Array(repeating: 0, count: 10)
    // 0～9 の各数字の出現回数を数える
    for i in nums.indices {
        let d = digit(num: nums[i], exp: exp) // nums[i] の下から k 桁目を d とする
        counter[d] += 1 // 数字 d の出現回数を数える
    }
    // 累積和を求め、出現回数を配列のインデックスに対応する値に変換
    for i in 1 ..< 10 {
        counter[i] += counter[i - 1]
    }
    // 配列を逆順に走査し、バケットの集計値を使って各要素を res に書き込む
    var res = Array(repeating: 0, count: nums.count)
    for i in nums.indices.reversed() {
        let d = digit(num: nums[i], exp: exp)
        let j = counter[d] - 1 // 配列内での d のインデックス j を求める
        res[j] = nums[i] // 現在の要素をインデックス j に書き込む
        counter[d] -= 1 // d の個数を 1 減らす
    }
    // 結果で元の配列 nums を上書き
    for i in nums.indices {
        nums[i] = res[i]
    }
}

/* 基数ソート */
func radixSort(nums: inout [Int]) {
    // 配列の最大値から最大桁数を求める
    var m = Int.min
    for num in nums {
        if num > m {
            m = num
        }
    }
    // 下位桁から上位桁へ順に走査
    for exp in sequence(first: 1, next: { m >= ($0 * 10) ? $0 * 10 : nil }) {
        // 配列要素の下から k 桁目にカウントソートを適用
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // すなわち exp = 10^(k-1)
        countingSortDigit(nums: &nums, exp: exp)
    }
}

@main
enum RadixSort {
    /* 実行例 */
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
        print("基数ソート後の nums = \(nums)")
    }
}
